# MODUL PRAKTIKUM 2
## Unit 2.4 – Fact Table & Measure Design
### Mata Kuliah Data Warehouse
### Studi Kasus: UADW v1.0

---

## 1. Identitas Unit

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Modul:** 2 – Dimensional Modeling & Data Quality  
**Unit:** 2.4 – Fact Table & Measure Design  
**Pertemuan Utama:** Pertemuan 6  
**Fase Pembelajaran:** DESIGN  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning  
**Studi Kasus:** University Academic Data Warehouse (UADW) v1.0  
**RTM:** RTM 3 – Abstraction / Dimensional Modeling, versi 0.3  

---

# 2. Posisi Unit dalam Alur Pembelajaran

Unit 2.4 merupakan kelanjutan langsung dari Unit 2.3.

Pada Unit 2.3 mahasiswa telah menghasilkan:

- Designed Dimensions;
- Business Purpose setiap dimension;
- Natural Key;
- Surrogate Key;
- Attribute Dictionary;
- Hierarchy;
- Date/Time Dimension Decision;
- Conformed Dimension Matrix;
- Updated Star Schema;
- RTM 3 v0.2.

Unit 2.4 menjawab pertanyaan:

> **Bagaimana business event direpresentasikan dalam Fact Table, dan measure apa yang dapat dianalisis secara benar pada grain tersebut?**

Alur:

```text
UNIT 2.1
Validated Grain
      ↓
UNIT 2.2
Candidate Fact
      ↓
UNIT 2.3
Designed Dimensions
      ↓
UNIT 2.4
Fact Specification
      ↓
Foreign Keys
      ↓
Measures
      ↓
Additivity
      ↓
Fact Type
      ↓
Grain–Measure Compatibility
      ↓
Updated Dimensional Model
```

---

# 3. CPMK dan Sub-CPMK

## CPMK-3

Mahasiswa mampu:

> **Merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya.**

## Sub-CPMK 6

Mahasiswa mampu:

> **Menentukan Fact Table, grain, foreign key, dan measure yang sesuai dengan kebutuhan analitik serta membedakan sifat aditivitas dan jenis Fact Table.**

---

# 4. Capaian Praktikum Unit 2.4

Setelah menyelesaikan Unit 2.4, mahasiswa diharapkan mampu:

1. memvalidasi kembali grain sebelum merancang Fact Table;
2. menentukan candidate Fact yang benar-benar merepresentasikan business event;
3. menghubungkan Fact dengan Dimension melalui surrogate key;
4. membedakan Fact Table, Measure, dan Dimension Attribute;
5. mengidentifikasi stored measure dan derived measure;
6. mengklasifikasikan measure menjadi additive, semi-additive, atau non-additive;
7. memilih tipe Fact Table yang tepat;
8. mengevaluasi grain–measure compatibility;
9. mengidentifikasi degenerate dimension;
10. membuat Fact Specification;
11. membuat Measure Dictionary;
12. memastikan Fact dan Measure traceable ke Analytical Question;
13. menerapkan Computational Thinking melalui **Abstraction + Evaluation**.

---

# 5. Fokus Computational Thinking

Fokus utama:

# ABSTRACTION + EVALUATION

Mahasiswa tidak sekadar memilih angka dari source.

Mahasiswa harus mengevaluasi:

> **Apakah nilai ini benar-benar merepresentasikan sesuatu yang dapat diukur pada grain yang telah ditetapkan?**

Contoh:

```text
Source nilai:
nim
kode_mk
semester
nilai_angka
nilai_huruf
sks
status_lulus
```

Abstraction:

```text
Business Event:
Penilaian

Grain:
Satu nilai akhir mahasiswa
per mata kuliah per semester

Candidate Measures:
nilai_angka
is_lulus
sks
```

Evaluation:

```text
Apakah nilai_angka bisa dijumlahkan?
Apakah failure rate disimpan langsung?
Apakah SKS additive pada semua konteks?
```

---

# 6. Prasyarat

Sebelum memulai Unit 2.4, mahasiswa wajib memiliki:

- Unit 2.1 PASS;
- Unit 2.2 PASS;
- Unit 2.3 PASS;
- validated grain;
- Conceptual Star Schema;
- Dimension Specifications;
- surrogate key design;
- Bus Matrix;
- Requirement Traceability.

Jika grain masih berubah-ubah, Fact Design belum boleh dilanjutkan.

---

# 7. Perangkat yang Digunakan

Gunakan:

1. UADW v1.0 Student Dataset;
2. UADW Data Dictionary;
3. output Unit 2.1–2.3;
4. Data Profiling Workbook Unit 1.2;
5. Requirement Workbook Unit 1.3;
6. diagrams.net;
7. workbook Modul 2 untuk Fact Specification dan Measure Dictionary.

SQL dapat digunakan untuk:

- memahami grain source;
- menguji duplicate;
- menguji measure distribution;
- mengecek candidate derivation.

Belum melakukan implementasi Fact Table fisik.

---

# 8. Prinsip Kerja Unit 2.4

## Prinsip 1 – Grain First

Fact Table tidak boleh dirancang sebelum grain jelas.

---

## Prinsip 2 – One Fact, One Consistent Grain

Satu Fact Table harus memiliki satu arti row.

---

## Prinsip 3 – Measures Must Match the Grain

Tidak semua numeric field layak menjadi measure.

---

## Prinsip 4 – Additivity Must Be Explicit

Mahasiswa harus tahu bagaimana measure boleh diagregasi.

---

## Prinsip 5 – Fact Represents Business Event

Fact tidak dibuat karena ada source table.

---

# 9. Review Grain

Contoh:

## Penilaian

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

## Pembayaran

> Satu transaksi pembayaran mahasiswa.

## Student Semester Snapshot

> Satu mahasiswa pada satu semester.

Grain harus ditulis ulang pada setiap Fact Specification.

---

# 10. Apa itu Fact Table?

Fact Table adalah tabel yang menyimpan:

- business event;
- surrogate key menuju dimensions;
- measure;
- identifier tertentu jika diperlukan.

Contoh conceptual:

```text
Fact_Nilai
----------
mahasiswa_key
mata_kuliah_key
semester_key
dosen_key
nilai_angka
is_lulus
sks
```

---

# 11. Fact Table vs Source Table

Kesalahan umum:

```text
nilai.csv → Fact_Nilai
```

secara otomatis.

Desain yang benar:

```text
Analytical Question
      ↓
Business Process
      ↓
Grain
      ↓
Fact Design
      ↓
Source Mapping
```

Source adalah penyedia data, bukan penentu struktur target.

---

# 12. STEP 1 – Validate the Grain

Sebelum membuat Fact Specification, jawab:

1. Apa arti satu row?
2. Apakah grain atomic?
3. Apakah grain konsisten dengan AQ?
4. Apakah grain dapat didukung source?
5. Apakah grain mencampur event?
6. Apakah ada duplicate pada source?
7. Apakah grain terlalu agregat?

---

# 13. Grain Validation Example

Business Process:

> Penilaian.

Candidate Grain:

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

Validation:

- satu mahasiswa dapat punya banyak mata kuliah → valid;
- satu mata kuliah dapat punya banyak mahasiswa → valid;
- semester memberi konteks waktu → valid;
- harus dicek duplicate untuk kombinasi business key.

---

# 14. SQL Evidence – Grain Validation

Contoh:

```sql
SELECT
    nim,
    kode_mk,
    semester_id,
    COUNT(*) AS jumlah_record
FROM nilai
GROUP BY
    nim,
    kode_mk,
    semester_id
HAVING COUNT(*) > 1;
```

Jika muncul duplicate:

> jangan langsung mengubah grain.

Investigasi penyebabnya.

---

# 15. STEP 2 – Define Fact Name and Business Purpose

Gunakan nama yang merepresentasikan business event.

Contoh:

```text
Fact_Nilai
Fact_KRS
Fact_Pembayaran
Fact_Kelulusan
Fact_Aktivitas_LMS
```

Business Purpose contoh:

> `Fact_Nilai` menyimpan hasil penilaian mahasiswa pada grain satu nilai akhir mahasiswa per mata kuliah per semester.

---

# 16. Fact Specification – Basic Structure

Gunakan format:

| Field | Isi |
|---|---|
| Fact Name | Fact_Nilai |
| Business Process | Penilaian |
| Business Purpose | Analisis performa akademik |
| Grain | Satu nilai akhir mahasiswa per MK per semester |
| Fact Type | Transaction |
| Dimensions | Mahasiswa, Mata Kuliah, Semester, Dosen |
| Measures | nilai_angka, is_lulus, sks |
| Source | nilai, krs |
| Refresh Expectation | Incremental / periodik |
| Notes | ... |

---

# 17. STEP 3 – Define Dimension Foreign Keys

Fact Table biasanya menggunakan surrogate key dari Dimension.

Contoh:

```text
Fact_Nilai
├── mahasiswa_key
├── mata_kuliah_key
├── semester_key
├── dosen_key
```

Setiap key harus traceable ke Dimension Specification Unit 2.3.

---

# 18. Why Surrogate Foreign Keys?

Karena:

- stabil;
- independen dari source;
- mendukung SCD;
- menjaga history;
- memudahkan integrasi.

Contoh:

```text
Fact_Nilai.mahasiswa_key
```

lebih tepat daripada menggunakan NIM sebagai foreign key dimensional utama.

---

# 19. Foreign Key Mapping

Gunakan format:

| Fact Key | Dimension | Dimension PK | Source Match |
|---|---|---|---|
| mahasiswa_key | Dim_Mahasiswa | mahasiswa_key | nim |
| mata_kuliah_key | Dim_MataKuliah | mata_kuliah_key | kode_mk |
| semester_key | Dim_Semester | semester_key | semester_id |

---

# 20. STEP 4 – Identify Measures

Measure menjawab:

> **How much? How many?**

Contoh:

## Fact_Nilai
- nilai_angka;
- is_lulus;
- sks.

## Fact_Pembayaran
- nominal;
- jumlah_tagihan;
- jumlah_dibayar.

## Fact_LMS
- durasi;
- jumlah_aktivitas.

---

# 21. Measure vs Numeric Code

Tidak semua angka adalah measure.

Contoh:

```text
semester_key = 20251
```

bukan measure.

Contoh:

```text
nilai_angka = 85
```

candidate measure.

Contoh:

```text
kode_prodi = 101
```

bukan measure.

---

# 22. Stored vs Derived Measure

## Stored Measure

Disimpan langsung dari source.

Contoh:

```text
nilai_angka
nominal_pembayaran
```

## Derived Measure

Dihitung dari rule.

Contoh:

```text
is_lulus =
CASE WHEN nilai >= batas_lulus THEN 1 ELSE 0
```

Atau:

```text
sisa_tagihan =
jumlah_tagihan - jumlah_dibayar
```

---

# 23. Measure Dictionary

Gunakan:

| Measure | Business Definition | Source/Formula | Type | Used AQ |
|---|---|---|---|---|
| nilai_angka | Nilai akhir mahasiswa | nilai.nilai_angka | Stored | AQ-02 |
| is_lulus | Indikator kelulusan | Derived | Derived | AQ-01 |
| nominal | Nilai pembayaran | pembayaran.nominal | Stored | AQ-03 |

---

# 24. STEP 5 – Evaluate Additivity

Tiga kategori:

1. Additive;
2. Semi-Additive;
3. Non-Additive.

Setiap measure harus diklasifikasikan.

---

# 25. Additive Measure

Dapat dijumlahkan pada semua dimension yang relevan.

Contoh:

```text
nominal_pembayaran
```

Dapat di-SUM berdasarkan:

- mahasiswa;
- prodi;
- semester;
- waktu.

---

# 26. Semi-Additive Measure

Dapat dijumlahkan pada beberapa dimension, tetapi tidak lintas semua dimension.

Contoh:

> jumlah mahasiswa aktif pada snapshot akhir semester.

Dapat dijumlahkan antar-prodi dalam periode yang sama.

Tidak tepat dijumlahkan lintas banyak semester jika mahasiswa yang sama muncul berulang.

---

# 27. Non-Additive Measure

Tidak boleh dijumlahkan langsung.

Contoh:

- IPK;
- persentase;
- rasio;
- average;
- failure rate.

Contoh salah:

```text
failure rate semester 1 = 20%
failure rate semester 2 = 30%

20% + 30% = 50%
```

Tidak valid.

---

# 28. Store Components, Not Only Ratios

Jika KPI:

```text
Failure Rate =
jumlah mahasiswa gagal /
jumlah peserta
```

lebih baik model menyimpan detail yang memungkinkan menghitung:

- numerator;
- denominator;

daripada hanya menyimpan failure_rate.

Prinsip:

> **Prefer atomic facts and derivable metrics.**

---

# 29. Additivity Matrix

Gunakan:

| Measure | Additive | Semi-Additive | Non-Additive | Reason |
|---|:---:|:---:|:---:|---|
| nominal_pembayaran | ✓ | | | Dapat dijumlahkan |
| ipk | | | ✓ | Rata-rata kumulatif |
| mahasiswa_aktif_snapshot | | ✓ | | Tidak lintas waktu |

---

# 30. STEP 6 – Grain–Measure Compatibility

Pertanyaan wajib:

> **Apakah measure ini mempunyai arti pada grain Fact Table?**

Contoh:

Grain:

> Satu mahasiswa per semester.

Measure:

```text
IPK
```

masuk akal.

Measure:

```text
nominal_per_transaksi
```

tidak masuk akal tanpa aggregation rule.

---

# 31. Grain–Measure Compatibility Matrix

Gunakan:

| Fact | Grain | Measure | Compatible? | Reason |
|---|---|---|:---:|---|
| Fact_Nilai | Nilai per MK per semester | nilai_angka | Yes | Sesuai event |
| Fact_Student_Semester | Mahasiswa per semester | IPK | Yes | Snapshot semester |
| Fact_Student_Semester | Mahasiswa per semester | nominal_transaksi | No | Transaction grain berbeda |

---

# 32. Mixed Grain Warning

Contoh Fact yang salah:

```text
Fact_Akademik
------------
nilai_angka
ipk
total_sks_semester
nominal_pembayaran
```

Masalah:

- nilai = course-level event;
- IPK = student-semester snapshot;
- pembayaran = transaction-level event.

Grain tercampur.

---

# 33. STEP 7 – Select Fact Type

Tipe utama:

1. Transaction Fact;
2. Periodic Snapshot Fact.

Pengayaan:

3. Accumulating Snapshot;
4. Factless Fact.

---

# 34. Transaction Fact

Merekam setiap event.

Contoh:

## Fact_Pembayaran

Grain:

> Satu transaksi pembayaran mahasiswa.

Measures:

- nominal.

---

# 35. Transaction Fact – UADW

Candidate:

- Fact_KRS;
- Fact_Nilai;
- Fact_Pembayaran;
- Fact_Aktivitas_LMS.

Namun classification harus mengikuti source grain dan business requirement.

---

# 36. Periodic Snapshot Fact

Merekam kondisi secara periodik.

Contoh:

```text
Fact_Student_Semester
```

Grain:

> Satu mahasiswa pada satu semester.

Measures:

- IPS;
- IPK;
- jumlah SKS;
- jumlah MK lulus;
- jumlah MK gagal.

---

# 37. Transaction vs Periodic Snapshot

| Aspek | Transaction Fact | Periodic Snapshot |
|---|---|---|
| Fokus | Event | Kondisi periode |
| Grain | Per transaksi | Per periode |
| Update | Event-based | Interval tetap |
| Contoh | Pembayaran | Student Semester Snapshot |

---

# 38. Accumulating Snapshot – Enrichment

Digunakan untuk process dengan milestone.

Contoh:

```text
Masuk
↓
Proposal
↓
Sidang
↓
Yudisium
↓
Lulus
```

Satu row diperbarui ketika milestone tercapai.

Target pembelajaran:

> mengenali konsep.

Bukan target utama.

---

# 39. Factless Fact – Enrichment

Factless Fact mencatat kejadian tanpa measure numerik utama.

Contoh:

> mahasiswa mengikuti event tertentu.

Fact:

```text
mahasiswa_key
event_key
date_key
```

Jumlah event dihitung dengan:

```text
COUNT(*)
```

---

# 40. STEP 8 – Identify Degenerate Dimension

Degenerate Dimension adalah identifier transaksi yang disimpan langsung pada Fact.

Contoh:

```text
nomor_transaksi
nomor_krs
```

Jika identifier tersebut tidak mempunyai atribut deskriptif lain, tidak perlu membuat:

```text
Dim_No_Transaksi
```

---

# 41. Degenerate Dimension Example

Fact_Pembayaran:

```text
payment_transaction_no
mahasiswa_key
date_key
jenis_pembayaran_key
nominal
```

`payment_transaction_no` dapat menjadi degenerate dimension.

---

# 42. Unknown Dimension Member – Design Note

Fact sebaiknya tidak memiliki dimension FK yang NULL.

Pada implementation nanti dapat digunakan:

```text
unknown_key = 0
```

Contoh:

```text
Dim_Mahasiswa
0 = Unknown
```

Pada Unit 2.4 cukup didokumentasikan sebagai:

> design requirement.

Implementasi dilakukan di Modul 3.

---

# 43. Referential Integrity Design

Fact Specification harus menyatakan:

> setiap dimension foreign key harus menemukan valid dimension member.

Contoh rule:

```text
Fact_Nilai.mahasiswa_key
must exist in
Dim_Mahasiswa.mahasiswa_key
```

Validasi teknis dijalankan pada tahap ETL/testing.

---

# 44. Studi Kasus – Fact_Nilai

### Business Process
Penilaian.

### Grain
Satu nilai akhir mahasiswa per mata kuliah per semester.

### Dimensions
- Mahasiswa;
- Mata Kuliah;
- Semester;
- Dosen.

### Measures
- nilai_angka;
- is_lulus;
- sks jika justified.

### Fact Type
Transaction / event fact pada grain nilai akhir.

---

# 45. Fact_Nilai Specification

Contoh:

| Component | Design |
|---|---|
| Fact Name | Fact_Nilai |
| Process | Penilaian |
| Grain | Satu nilai akhir mahasiswa per MK per semester |
| Dimension FK | mahasiswa_key, mata_kuliah_key, semester_key, dosen_key |
| Measures | nilai_angka, is_lulus |
| Degenerate | jika ada identifier relevan |
| Source | nilai, krs |
| Quality Concerns | duplicate, invalid nilai |

---

# 46. Studi Kasus – Fact_Pembayaran

### Grain

> Satu transaksi pembayaran mahasiswa.

### Dimensions

- Mahasiswa;
- Date;
- Program Studi;
- Jenis Pembayaran.

### Measures

- nominal;
- jumlah_tagihan;
- jumlah_dibayar.

### Degenerate Dimension

- nomor_transaksi.

---

# 47. Studi Kasus – Fact_Student_Semester

### Grain

> Satu mahasiswa pada satu semester.

### Fact Type

Periodic Snapshot.

### Dimensions

- Mahasiswa;
- Semester;
- Program Studi.

### Measures

- IPS;
- IPK;
- total SKS;
- jumlah MK lulus;
- jumlah MK gagal.

---

# 48. Aktivitas A – Fact Candidate Review

Ambil minimal **3 candidate facts** dari Unit 2.2.

Untuk masing-masing:

1. tulis business purpose;
2. validasi grain;
3. sebutkan supported AQ;
4. tentukan source;
5. identifikasi risk.

---

# 49. Aktivitas B – Foreign Key Design

Untuk setiap Fact:

1. daftar dimension;
2. tentukan surrogate FK;
3. tentukan source lookup key;
4. cek apakah dimension sudah ada di Unit 2.3;
5. tandai unknown-member requirement jika perlu.

---

# 50. Aktivitas C – Measure Identification

Untuk setiap Fact:

1. identifikasi stored measures;
2. identifikasi derived measures;
3. pisahkan numeric code;
4. hubungkan measure ke AQ;
5. tulis business definition.

---

# 51. Aktivitas D – Additivity Classification

Klasifikasikan minimal:

> **5 measures**

Gunakan:

- Additive;
- Semi-Additive;
- Non-Additive.

Berikan reason.

---

# 52. Aktivitas E – Grain–Measure Compatibility

Untuk setiap measure:

> uji apakah measure compatible dengan grain.

Minimal:

> 5 compatibility decisions.

Jika tidak kompatibel:

- pindahkan measure;
- ubah Fact;
- gunakan aggregation rule;
- atau reject dari desain.

---

# 53. Aktivitas F – Fact Type Decision

Untuk minimal 3 Fact candidates:

Tentukan:

- Transaction;
- Periodic Snapshot;
- Accumulating Snapshot;
- Factless.

Berikan alasan.

---

# 54. Aktivitas G – Degenerate Dimension Identification

Cari identifier transaksi pada UADW.

Evaluasi:

1. apakah mempunyai descriptive attributes?
2. apakah perlu Dimension Table?
3. apakah cukup disimpan di Fact?

Minimal satu kasus jika tersedia.

---

# 55. Aktivitas H – Fact Specification

Buat Fact Specification lengkap minimal:

> **3 Fact Tables**

Satu di antaranya harus menjadi model utama proyek.

---

# 56. Aktivitas I – Update Star Schema

Perbarui diagram Unit 2.3.

Sekarang diagram harus menunjukkan:

- designed dimensions;
- Fact Table;
- key relationships secara konseptual;
- selected measures.

Namun belum perlu:

- SQL data type;
- index;
- partitioning.

---

# 57. Requirement–Fact Traceability

Gunakan:

| AQ | KPI/Metric | Fact | Grain | Measure | Dimension |
|---|---|---|---|---|---|
| AQ-01 | Failure Rate | Fact_Nilai | Nilai per MK per semester | is_lulus | MK, Semester, Prodi |
| AQ-02 | Average Grade | Fact_Nilai | Sama | nilai_angka | MK, Semester |

---

# 58. Anti-Pattern 1 – One Big Fact

Contoh:

```text
Fact_Universitas
```

menampung:

- nilai;
- pembayaran;
- LMS;
- kelulusan.

Masalah:

> multiple grain.

---

# 59. Anti-Pattern 2 – Numeric = Measure

Contoh salah:

```text
semester_key
```

dianggap measure karena numeric.

Measure ditentukan berdasarkan business meaning, bukan data type.

---

# 60. Anti-Pattern 3 – Sum Every Measure

Contoh:

```text
SUM(IPK)
```

tidak tepat.

Additivity wajib dianalisis.

---

# 61. Anti-Pattern 4 – Store Only Percentage

Jika hanya menyimpan:

```text
failure_rate = 25%
```

maka agregasi ulang sulit.

Lebih baik simpan atomic event atau komponen pembentuk KPI.

---

# 62. Anti-Pattern 5 – Fact without Grain

Fact yang tidak mempunyai grain statement:

> tidak boleh diterima.

---

# 63. Anti-Pattern 6 – Mixed Snapshot and Transaction

Jangan mencampurkan:

```text
nominal transaksi
```

dengan:

```text
saldo akhir semester
```

dalam Fact yang sama tanpa design justification yang sangat jelas.

---

# 64. RTM 3 v0.3

Setelah Unit 2.4, RTM 3 berkembang menjadi:

# RTM 3 v0.3

Isi:

1. Analytical Scope;
2. Business Process Register;
3. Grain Statements;
4. Bus Matrix;
5. Star Schema;
6. Dimension Specifications;
7. Fact Specifications;
8. Measure Dictionary;
9. Additivity Matrix;
10. Grain–Measure Compatibility Matrix;
11. Fact Type Decision;
12. Degenerate Dimension Decision;
13. Requirement–Fact Traceability;
14. CT Reflection.

---

# 65. CT Reflection Unit 2.4

Jawab:

1. Measure apa yang paling sulit diklasifikasikan?
2. Apa contoh numeric field yang ternyata bukan measure?
3. Apa risiko terbesar jika grain dan measure tidak compatible?
4. Mengapa IPK/failure rate tidak additive?
5. Fact mana yang lebih tepat transaction dan mana snapshot?
6. Apakah ada candidate Fact yang akhirnya dibatalkan? Mengapa?
7. Bagaimana Abstraction dan Evaluation membantu Fact Design?

---

# 66. Luaran Wajib Unit 2.4

Mahasiswa menyerahkan:

1. Fact Candidate Review;
2. Fact Specification;
3. Foreign Key Mapping;
4. Measure Dictionary;
5. Additivity Matrix;
6. Grain–Measure Compatibility Matrix;
7. Fact Type Decision;
8. Degenerate Dimension Decision;
9. Updated Star Schema;
10. Requirement–Fact Traceability;
11. CT Reflection;
12. RTM 3 v0.3.

---

# 67. Target Minimal

| Komponen | Minimum |
|---|---:|
| Fact Specifications | 3 |
| Measures analyzed | 5 |
| Additivity decisions | 5 |
| Grain–Measure checks | 5 |
| Fact Type decisions | 3 |
| Degenerate Dimension | 1 jika tersedia |
| Traceability entries | 5 |
| CT Reflection | 1 |

---

# 68. Checkpoint Dosen

Sebelum Unit 2.5:

| Check | Status |
|---|:---:|
| Grain konsisten | ☐ |
| Fact merepresentasikan event | ☐ |
| Dimension FK valid secara desain | ☐ |
| Measures memiliki business meaning | ☐ |
| Additivity dianalisis | ☐ |
| Grain–measure compatible | ☐ |
| Fact type justified | ☐ |
| Degenerate dimension dipahami | ☐ |
| Traceability lengkap | ☐ |

---

# 69. Design Gate Unit 2.4

Status:

```text
PASS
REVISE
```

Mahasiswa belum boleh masuk ke SCD/Data Quality finalization jika:

- Fact mencampur grain;
- measure tidak sesuai grain;
- non-additive measure diperlakukan additive;
- dimension FK tidak jelas;
- Fact tidak dapat ditelusuri ke AQ;
- Fact type dipilih tanpa alasan.

---

# 70. Penilaian Unit 2.4

Rekomendasi:

| Aspek | Bobot |
|---|---:|
| Grain Validation | 15% |
| Fact Specification | 20% |
| Foreign Key Design | 10% |
| Measure Dictionary | 15% |
| Additivity Analysis | 15% |
| Grain–Measure Compatibility | 15% |
| Fact Type & Degenerate Decision | 5% |
| Traceability + CT Reflection | 5% |
| **Total** | **100%** |

---

# 71. Exit Reflection

### Pertanyaan 1
Mengapa grain harus divalidasi ulang sebelum Fact Design?

### Pertanyaan 2
Apa perbedaan Fact Table dan Measure?

### Pertanyaan 3
Mengapa numeric code bukan measure?

### Pertanyaan 4
Apa beda additive, semi-additive, dan non-additive?

### Pertanyaan 5
Apa beda Transaction Fact dan Periodic Snapshot?

### Pertanyaan 6
Apa yang dimaksud Grain–Measure Compatibility?

### Pertanyaan 7
Apa fungsi degenerate dimension?

---

# 72. Jembatan ke Unit 2.5

Unit 2.4 menghasilkan:

```text
Validated Grain
       ↓
Designed Dimensions
       ↓
Fact Specification
       ↓
Measure Dictionary
       ↓
Additivity
       ↓
Fact Type
```

Unit 2.5 akan menjawab:

> **Bagaimana model menangani perubahan historis, data yang tidak konsisten, integrasi antar-source, serta aturan transformasi sebelum implementasi ETL?**

Alur:

```text
Dimension Attributes
       ↓
Change Scenario
       ↓
SCD Decision
       ↓
Data Quality Issue
       ↓
Severity
       ↓
Treatment
       ↓
Canonical Mapping
       ↓
Integration Rule
       ↓
Transformation Rule
       ↓
RTM 3 v1.0
```

---

# 73. Checklist Akhir Mahasiswa

Sebelum submit:

- [ ] Saya menggunakan grain dari Unit 2.1.
- [ ] Saya memvalidasi grain kembali.
- [ ] Setiap Fact memiliki business purpose.
- [ ] Setiap Fact memiliki satu grain.
- [ ] Dimension FK menggunakan surrogate key design.
- [ ] Setiap measure memiliki business definition.
- [ ] Saya membedakan stored dan derived measure.
- [ ] Saya mengklasifikasikan additivity.
- [ ] Saya menguji grain–measure compatibility.
- [ ] Saya memilih Fact Type dengan alasan.
- [ ] Saya mengidentifikasi degenerate dimension jika tersedia.
- [ ] Saya memperbarui Star Schema.
- [ ] Semua Fact dan Measure traceable ke AQ.
- [ ] Saya memperbarui RTM 3 menjadi v0.3.
- [ ] Saya menyelesaikan CT Reflection.
- [ ] Saya siap melanjutkan Unit 2.5.

---

# 74. Prinsip Penutup

> **The grain defines what a fact row means.**

> **A measure is useful only when its meaning matches the grain.**

> **Not every number is a measure.**

> **Not every measure can be summed.**

> **A well-designed Fact Table is traceable to the business event and the analytical question it is intended to answer.**
