# MATERI PERTEMUAN 7
## Mata Kuliah Data Warehouse
### Slowly Changing Dimension, Data Integration & Data Quality

---

## 1. Identitas Pertemuan

- **Mata Kuliah:** Data Warehouse
- **Program Studi:** Teknologi Informasi
- **Semester:** 5
- **Pertemuan:** 7
- **Topik Utama:** Slowly Changing Dimension, Data Integration & Data Quality
- **Fase Modul:** DESIGN → BUILD Preparation
- **RTM:** RTM 3 v1.0
- **Computational Thinking:** Evaluation + Abstraction

---

## 2. CPMK dan Sub-CPMK

### CPMK-3
Mahasiswa mampu **merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya**.

### CPMK-4 (Pendukung)
Mahasiswa mulai diarahkan untuk **mengimplementasikan Data Warehouse dan proses ETL/ELT dari berbagai sumber data dengan memperhatikan integrasi dan kualitas data**.

### Sub-CPMK 7
Mahasiswa mampu **menerapkan konsep Slowly Changing Dimension serta merancang aturan integrasi, transformasi, dan kualitas data sebagai dasar implementasi Data Warehouse**.

---

## 3. Posisi Pertemuan 7

P4–P6 menghasilkan dimensional model. P7 menambahkan aturan agar model mampu menangani perubahan, ketidakkonsistenan, dan kualitas data.

Alur:

```text
Dimensional Model
      ↓
Source Changes
      ↓
Historical Requirement
      ↓
SCD Strategy
      ↓
Data Quality Assessment
      ↓
Canonical Standardization
      ↓
Integration Rules
      ↓
Transformation Rules
      ↓
Ready for ETL
```

P7 harus berhenti pada **what should happen**, bukan **how to code it**. Implementasi baru dilakukan pada Modul 3.

---

## 4. RTM 3 Final

RTM 3 berkembang:

```text
P4 → Business Process + Grain + Conceptual Model
P5 → Dimension Design
P6 → Fact + Measure Design
P7 → SCD + Quality + Integration + Transformation
```

Output akhir adalah **Dimensional Design Package v1.0**.

---

# BAGIAN I – HISTORICAL REQUIREMENT DAN SCD

## 5. Mengapa Dimension Berubah?

Contoh perubahan:

- program studi mahasiswa berubah;
- status mahasiswa berubah;
- kota asal diperbaiki;
- label program studi distandardisasi;
- informasi organisasi direstrukturisasi.

Tidak semua perubahan memiliki arti yang sama. Kita harus membedakan:

- koreksi;
- standardisasi;
- perubahan bisnis;
- perubahan historis.

---

## 6. Historical Requirement

Pertanyaan utama:

> **Apakah analisis memerlukan kondisi saat transaksi terjadi atau hanya kondisi terbaru?**

Contoh:

Mahasiswa berada di Prodi A pada 2024 dan pindah ke Prodi B pada 2025.

Jika nilai 2024 dianalisis, apakah nilai tersebut harus mengikuti Prodi A atau Prodi B?

Jika kebutuhan analisis ingin mempertahankan konteks saat event terjadi, histori harus disimpan.

---

## 7. Apa itu Slowly Changing Dimension?

Slowly Changing Dimension adalah teknik untuk menangani perubahan atribut pada Dimension Table.

Tipe yang diperkenalkan:

- Type 0;
- Type 1;
- Type 2;
- Type 3.

Fokus wajib:

> **Type 1 dan Type 2.**

---

## 8. SCD Type 1

Type 1 menimpa nilai lama dengan nilai baru. Histori tidak dipertahankan.

Contoh koreksi typo:

```text
KENDRI → KENDARI
```

Sebelum:

| key | nim | kota_asal |
|---:|---|---|
| 101 | 220001 | Kendri |

Sesudah:

| key | nim | kota_asal |
|---:|---|---|
| 101 | 220001 | Kendari |

Type 1 cocok untuk:

- typo correction;
- standardization;
- perubahan yang tidak memerlukan histori.

---

## 9. SCD Type 2

Type 2 membuat row baru untuk mempertahankan histori.

Contoh:

| key | nim | prodi | valid_from | valid_to | current |
|---:|---|---|---|---|---|
| 101 | 220001 | TI | 2022-08-01 | 2025-01-31 | N |
| 102 | 220001 | SI | 2025-02-01 | 9999-12-31 | Y |

Natural key sama, surrogate key berbeda.

Fact lama dapat menunjuk key 101 dan fact baru menunjuk key 102.

---

## 10. Mengapa Surrogate Key Penting pada Type 2?

Jika natural key tetap sama, sistem membutuhkan key internal yang berbeda untuk membedakan versi historis.

Contoh:

```text
nim = 220001
```

Version lama:

```text
mahasiswa_key = 101
```

Version baru:

```text
mahasiswa_key = 102
```

Surrogate key memungkinkan fact tetap terhubung ke versi dimension yang tepat.

---

## 11. Type 1 vs Type 2 Decision

Decision rule:

```text
Apakah nilai berubah?
      ↓
Apakah hanya koreksi?
   YES → Type 1
      ↓ NO
Apakah histori diperlukan?
   YES → Type 2
      ↓ NO
Type 1 / rule lain
```

Mahasiswa harus menjelaskan alasan bisnis, bukan hanya memilih tipe.

---

## 12. Type 0 dan Type 3 – Pengayaan

### Type 0
Atribut tidak diubah setelah dimuat.

### Type 3
Nilai lama dan baru disimpan pada satu row, misalnya `previous_prodi` dan `current_prodi`.

Kedua konsep ini diperkenalkan sebagai enrichment, bukan outcome inti.

---

# BAGIAN II – DATA QUALITY

## 13. Mengapa Data Quality Penting?

Data Warehouse mengintegrasikan banyak source. Jika data buruk tidak dikendalikan, output analitik dapat menghasilkan keputusan yang salah.

Prinsip:

> **Garbage In → Garbage Out**

Namun dalam Data Warehouse, dampaknya lebih besar karena informasi digunakan untuk pengambilan keputusan.

---

## 14. Dimensi Data Quality

Enam aspek utama:

1. Completeness;
2. Uniqueness;
3. Validity;
4. Consistency;
5. Accuracy;
6. Referential Integrity.

Tambahan:

7. Timeliness.

---

## 15. Completeness

Pertanyaan:

> Apakah data yang dibutuhkan tersedia?

Contoh:

```text
kota_asal = NULL
```

Jika kota asal diperlukan untuk analisis geografis, data tidak lengkap.

Metric:

- missing_count;
- missing_percentage.

---

## 16. Uniqueness

Pertanyaan:

> Apakah record yang seharusnya unik benar-benar unik?

Contoh duplicate NIM dapat menyebabkan:

- double counting;
- duplicate dimension rows;
- ambiguity saat ETL;
- multiple matches.

Duplicate tidak boleh otomatis dihapus sebelum business meaning dipahami.

---

## 17. Validity

Pertanyaan:

> Apakah nilai memenuhi domain/rule?

Contoh:

```text
nilai_angka = 105
```

Jika domain valid adalah 0–100, maka nilai 105 merupakan validity violation.

---

## 18. Consistency

Pertanyaan:

> Apakah data direpresentasikan secara konsisten?

Contoh:

```text
L
Laki-laki
Male
M
```

Jika semua mewakili konsep yang sama, perlu standardization.

---

## 19. Accuracy ≠ Validity

Contoh:

```text
nilai = 95
```

Secara domain valid. Namun apakah benar 95? Tidak dapat ditentukan tanpa source referensi yang authoritative.

Kesimpulan:

> **A value can be valid but inaccurate.**

Accuracy biasanya memerlukan sumber pembanding.

---

## 20. Referential Integrity

Fact harus menunjuk ke dimension yang valid.

Contoh:

```text
Fact_Nilai.mahasiswa_key = 9999
```

namun key tersebut tidak ada di `Dim_Mahasiswa`.

Ini menghasilkan orphan fact.

---

## 21. Timeliness – Pengayaan

Data dapat valid dan konsisten tetapi terlambat tersedia.

Contoh:

Dashboard semester berjalan menggunakan data tiga bulan lalu.

Data tersebut mungkin tidak timely untuk decision making.

---

# BAGIAN III – STANDARDIZATION DAN CLEANSING

## 22. Canonical Value

Canonical Value adalah representasi standar yang disepakati.

Contoh:

| Raw | Canonical |
|---|---|
| TI | Teknologi Informasi |
| Tek. Informasi | Teknologi Informasi |
| TEKNOLOGI INFORMASI | Teknologi Informasi |

Canonical mapping harus terdokumentasi.

---

## 23. Data Standardization

Standardization mengubah format berbeda menjadi representasi yang konsisten.

Contoh gender:

```text
L
M
Male
Laki-laki
```

menjadi:

```text
Laki-laki
```

Standardization berbeda dari mengubah makna data.

---

## 24. Data Cleansing

Data cleansing dapat mencakup:

- trimming;
- case normalization;
- typo correction;
- duplicate treatment;
- missing handling;
- invalid value treatment;
- data type conversion;
- standardization.

Namun setiap tindakan harus memiliki rule.

---

## 25. Jangan Memperbaiki Data Tanpa Rule

Contoh:

```text
nilai = 105
```

Tidak boleh langsung diubah menjadi 100 tanpa business rule.

Possible treatment:

- flag;
- reject;
- quarantine;
- verify to source;
- transform only if rule is authoritative.

---

# BAGIAN IV – DATA INTEGRATION DAN TRANSFORMATION

## 26. Data Integration

UADW memiliki source seperti:

```text
mahasiswa
krs
nilai
lms
pembayaran
kelulusan
program_studi
semester
```

Masalah integrasi:

- key berbeda;
- format berbeda;
- terminology berbeda;
- grain berbeda;
- quality berbeda.

Integrasi bukan sekadar JOIN.

---

## 27. Integration Rule

Integration Rule mendefinisikan bagaimana source dikaitkan.

Contoh:

```text
mahasiswa.nim = nilai.nim = krs.nim
```

Namun relationship harus divalidasi dari business semantics dan uniqueness, bukan hanya kesamaan nama kolom.

---

## 28. Source-to-Canonical Mapping

| Source | Source Field | Canonical Attribute |
|---|---|---|
| mahasiswa | prodi_raw | program_studi |
| krs | kode_mk | mata_kuliah_code |
| nilai | nim | student_natural_key |

Mapping ini menjadi input untuk Source-to-Target Mapping pada Modul 3.

---

## 29. Transformation Rule

Transformation Rule menjelaskan perubahan dari source menuju target.

| Target | Source | Rule |
|---|---|---|
| jenis_kelamin | jk_raw | Standardize values |
| program_studi | prodi_raw | Reference mapping |
| is_lulus | nilai_angka | Apply passing rule |

P7 hanya menentukan rule; coding dilakukan pada P9.

---

## 30. Business Rule vs Technical Rule

### Business Rule
Contoh:

> Mahasiswa dinyatakan lulus jika memenuhi passing grade yang berlaku.

### Technical Rule
Contoh:

> Trim whitespace dan ubah tanggal menjadi format YYYY-MM-DD.

Keduanya harus didokumentasikan secara terpisah.

---

# BAGIAN V – DATA QUALITY RULE DAN TREATMENT

## 31. Data Quality Rule

Rule harus measurable dan testable.

Contoh baik:

> `nilai_angka` harus berada pada rentang 0–100 atau NULL jika nilai belum diterbitkan.

Contoh buruk:

> Nilai harus benar.

---

## 32. Data Quality Rulebook

| Rule ID | Field | Rule | Quality Dimension | Severity |
|---|---|---|---|---|
| DQ01 | nim | NOT NULL | Completeness | Critical |
| DQ02 | nilai_angka | 0–100 | Validity | High |
| DQ03 | nim | Must exist in mahasiswa | Referential Integrity | Critical |

---

## 33. Severity

Gunakan:

- Critical;
- High;
- Medium;
- Low.

Contoh:

- orphan FK → Critical;
- nilai di luar domain → High;
- kota asal kosong → Medium;
- perbedaan kapitalisasi → Low.

---

## 34. Issue → Treatment Decision

P7 tidak berhenti pada menemukan issue.

Gunakan alur:

```text
Issue
  ↓
Severity
  ↓
Treatment
  ↓
Transformation Rule
  ↓
Validation Rule
```

Contoh:

```text
nilai = 105
↓
Validity Violation
↓
High
↓
Quarantine / Verify
↓
Do not auto-correct
↓
Revalidate after source confirmation
```

---

## 35. Data Fitness for Use

Status:

### READY
Dapat digunakan langsung.

### CONDITIONALLY READY
Dapat digunakan setelah rule tertentu diterapkan.

### NOT READY
Tidak layak digunakan tanpa perbaikan signifikan.

Contoh `prodi_raw` dengan label bervariasi tetapi dapat dipetakan → **CONDITIONALLY READY**.

---

# BAGIAN VI – STUDI KASUS UADW

## 36. Perubahan Program Studi

Scenario:

```text
NIM 220001
Prodi Lama: Teknologi Informasi
Prodi Baru: Sistem Informasi
```

Jika analisis membutuhkan prodi saat nilai diperoleh, SCD Type 2 lebih tepat.

---

## 37. Perbaikan Label

Scenario:

```text
Tek. Informasi → Teknologi Informasi
```

Jika hanya standardization label, Type 1 / transformation rule lebih sesuai daripada Type 2.

---

## 38. Nilai Invalid

Temuan:

```text
nilai_angka = 105
```

Expected reasoning:

- Quality: Validity;
- Severity: High;
- Treatment: Flag/Quarantine/Verify;
- Automatic correction: No, kecuali ada business rule authoritative.

---

## 39. Duplicate Mahasiswa

Duplicate natural key harus dianalisis:

- duplicate error?
- dua versi historis?
- record valid yang berbeda?
- source integration problem?

Jangan langsung menghapus duplicate.

---

# BAGIAN VII – RTM 3 FINAL

## 40. SCD Decision Matrix

| Attribute | Change Scenario | History Needed? | SCD Type | Reason |
|---|---|:---:|---|---|
| kota_asal | typo correction | No | 1 | Correction |
| program_studi | student transfer | Yes | 2 | Historical requirement |
| status | aktif → cuti | Depends | 2 | Jika histori dibutuhkan |

---

## 41. Data Quality Rulebook Target

Mahasiswa minimal menyusun:

- 2 completeness rules;
- 2 validity rules;
- 2 consistency rules;
- 2 uniqueness rules;
- 2 referential integrity rules.

Total minimal 10 rule.

---

## 42. Integration & Transformation Matrix

| Target | Source | Issue | Transformation | Validation |
|---|---|---|---|---|
| gender | jk_raw | inconsistent labels | canonical mapping | allowed values |
| prodi | prodi_raw | multiple labels | reference mapping | must exist in Ref_Prodi |

---

## 43. Final RTM 3 – Dimensional Design Package

Final output:

1. Analytical Question Selection;
2. Business Process Matrix;
3. Grain Statements;
4. Bus Matrix;
5. Conceptual Star Schema;
6. Dimension Specifications;
7. Fact Specifications;
8. Measure Dictionary;
9. Additivity Matrix;
10. SCD Decision Matrix;
11. Data Quality Rulebook;
12. Canonical Mapping;
13. Integration & Transformation Matrix;
14. Requirement–Model Traceability;
15. CT Reflection.

---

## 44. Hubungan Profiling → Modeling → ETL

```text
Unit 1.2
Profiling Finding
      ↓
Unit 1.3
Data Fitness
      ↓
P5–P6
Dimension & Fact Design
      ↓
P7
Rules & Treatments
      ↓
P9
ETL Algorithm & Implementation
```

Inilah kontinuitas utama semester.

---

## 45. Miskonsepsi

1. Semua perubahan harus Type 2. **Salah.**
2. Type 1 lebih buruk daripada Type 2. **Salah.**
3. Data cleansing berarti mengubah nilai yang terlihat salah. **Salah.**
4. NULL selalu error. **Tidak selalu.**
5. Duplicate selalu harus dihapus. **Salah.**
6. Data quality hanya tanggung jawab ETL developer. **Salah.**
7. Integrasi cukup dengan JOIN. **Salah.**

---

## 46. Exit Quiz

1. Apa itu Slowly Changing Dimension?
2. Apa perbedaan Type 1 dan Type 2?
3. Berikan contoh kasus Type 1.
4. Berikan contoh kasus Type 2.
5. Mengapa surrogate key penting pada Type 2?
6. Sebutkan enam dimensi Data Quality.
7. Apa perbedaan validity dan accuracy?
8. Apa itu canonical value?
9. Mengapa duplicate tidak boleh langsung dihapus?
10. Jelaskan bagaimana abstraction dan evaluation digunakan dalam SCD dan data quality.

---

## 47. Jembatan ke UTS dan Modul 3

P8 adalah UTS yang mengukur pemahaman konsep dan kemampuan desain dari P1–P7.

Setelah UTS, P9 memulai ETL/ELT.

Perbedaan batas:

### P7
> **What transformation should happen?**

### P9
> **How do we implement the transformation?**

---

## 48. Ringkasan

Prinsip utama:

> **Not every change is history, and not every anomaly is an error.**

> **Data quality rules must be explicit, measurable, and traceable.**

> **ETL should implement design decisions, not invent them.**
