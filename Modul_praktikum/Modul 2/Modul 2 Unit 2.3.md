# MODUL PRAKTIKUM 2
## Unit 2.3 – Dimension Table Design
### Mata Kuliah Data Warehouse
### Studi Kasus: UADW v1.0

---

## 1. Identitas Unit

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Modul:** 2 – Dimensional Modeling & Data Quality  
**Unit:** 2.3 – Dimension Table Design  
**Pertemuan Utama:** Pertemuan 5  
**Fase Pembelajaran:** DESIGN  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning  
**Studi Kasus:** University Academic Data Warehouse (UADW) v1.0  
**RTM:** RTM 3 – Abstraction / Dimensional Modeling, versi 0.2  

---

# 2. Posisi Unit dalam Alur Pembelajaran

Unit 2.3 merupakan kelanjutan langsung dari Unit 2.2.

Pada Unit 2.2 mahasiswa telah menghasilkan:

- Candidate Dimension Register;
- Candidate Fact Register;
- Candidate Measure Register;
- Conceptual Star Schema;
- Initial Bus Matrix;
- Requirement–Model Traceability;
- RTM 3 v0.1.

Unit 2.3 menjawab pertanyaan:

> **Bagaimana setiap candidate dimension dirancang agar memiliki identitas, atribut, hierarchy, dan makna bisnis yang konsisten untuk mendukung kebutuhan analitik?**

Alur:

```text
UNIT 2.2
Candidate Dimension
      ↓
UNIT 2.3
Business Purpose
      ↓
Natural Key
      ↓
Surrogate Key
      ↓
Dimension Attributes
      ↓
Hierarchy
      ↓
Date/Time Design
      ↓
Conformance
      ↓
Dimension Specification
```

---

# 3. CPMK dan Sub-CPMK

## CPMK-3

Mahasiswa mampu:

> **Merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya.**

## Sub-CPMK 5

Mahasiswa mampu:

> **Merancang Dimension Table dengan menentukan atribut deskriptif, natural key, surrogate key, hierarchy, Date Dimension, dan conformed dimension sesuai kebutuhan analitik.**

---

# 4. Capaian Praktikum Unit 2.3

Setelah menyelesaikan Unit 2.3, mahasiswa diharapkan mampu:

1. menjelaskan business purpose setiap candidate dimension;
2. menentukan natural key yang sesuai;
3. merancang surrogate key sebagai identitas internal Data Warehouse;
4. memilih atribut yang relevan secara analitik;
5. membedakan business key, technical key, dan descriptive attribute;
6. merancang hierarchy dimension;
7. merancang Date/Time Dimension yang sesuai dengan kebutuhan UADW;
8. mengidentifikasi role-playing dimension;
9. mengidentifikasi candidate conformed dimension;
10. mengevaluasi apakah suatu atribut perlu berada pada dimension tertentu;
11. membuat Dimension Specification yang traceable ke requirement;
12. menerapkan Computational Thinking terutama **Abstraction**.

---

# 5. Fokus Computational Thinking

Fokus utama:

# ABSTRACTION

Pada tahap ini mahasiswa harus memilih:

> **atribut apa yang benar-benar penting untuk analisis?**

Contoh source `mahasiswa` mungkin berisi:

```text
nim
nama
email
nomor_telepon
alamat
kota_asal
jenis_kelamin
angkatan
program_studi
status_mahasiswa
```

Tetapi tidak semua atribut harus masuk ke `Dim_Mahasiswa`.

Untuk analisis akademik, kandidat yang lebih relevan:

```text
nim
angkatan
jenis_kelamin
kota_asal
program_studi
status_mahasiswa
```

Atribut seperti:

```text
nomor_telepon
alamat_detail
```

mungkin tidak diperlukan.

Abstraction berarti:

> **memilih atribut yang mempunyai nilai analitik, bukan memindahkan seluruh kolom source.**

---

# 6. Prasyarat

Sebelum memulai Unit 2.3, mahasiswa wajib memiliki:

- hasil Unit 2.1 berstatus PASS;
- hasil Unit 2.2 berstatus PASS;
- Conceptual Star Schema;
- Candidate Dimension Register;
- Initial Bus Matrix;
- Requirement–Model Traceability;
- Data Profiling Workbook Unit 1.2;
- Requirement Workbook Unit 1.3.

Candidate dimension yang belum memiliki justifikasi requirement harus diperbaiki sebelum dilanjutkan.

---

# 7. Perangkat yang Digunakan

Gunakan:

1. UADW v1.0 Student Dataset;
2. UADW Data Dictionary;
3. output Unit 2.2;
4. Data Profiling Workbook Unit 1.2;
5. Requirement Workbook Unit 1.3;
6. diagrams.net / Draw.io;
7. workbook Modul 2 untuk mencatat Dimension Specification.

SQL dapat digunakan untuk:

- mengecek uniqueness natural key;
- melihat domain nilai;
- memeriksa missing value;
- memeriksa variasi label.

---

# 8. Prinsip Kerja Unit 2.3

Gunakan prinsip:

## Prinsip 1 – Dimension Must Have Business Purpose

Jangan membuat dimension hanya karena ada source table.

---

## Prinsip 2 – Surrogate Key Protects the Warehouse

Surrogate key menjadi identitas internal yang stabil.

---

## Prinsip 3 – Attributes Must Support Analysis

Tidak semua source attribute perlu dimasukkan.

---

## Prinsip 4 – Business Meaning Before Data Type

Pada Unit 2.3, fokus utama adalah makna analitik.

Data type final dapat disempurnakan pada tahap implementasi.

---

## Prinsip 5 – Conformance Enables Cross-Process Analysis

Dimension lintas process harus konsisten.

---

# 9. Apa itu Dimension Table?

Dimension Table adalah tabel yang berisi:

> **informasi deskriptif yang memberikan konteks terhadap business event pada Fact Table.**

Contoh:

Fact_Nilai menyimpan:

```text
nilai_angka = 85
```

Tanpa dimension, angka tersebut belum cukup bermakna.

Dengan dimension:

```text
Mahasiswa      : MHS001
Mata Kuliah    : Basis Data
Semester       : Ganjil 2025/2026
Program Studi  : Teknologi Informasi
```

maka nilai tersebut dapat dianalisis secara kontekstual.

---

# 10. Dimension vs Fact

| Dimension | Fact |
|---|---|
| Menjelaskan konteks | Menyimpan business event |
| Banyak descriptive attribute | Banyak dimension key + measure |
| Who / What / When / Where | What happened / how much |
| Digunakan untuk filter | Digunakan untuk aggregation |
| Relatif lebih sedikit record | Biasanya jauh lebih banyak record |

---

# 11. STEP 1 – Define Business Purpose

Setiap dimension wajib mempunyai tujuan bisnis.

Contoh:

## Dim_Mahasiswa

Business Purpose:

> Memberikan konteks mahasiswa untuk analisis akademik, pembayaran, aktivitas LMS, dan kelulusan.

## Dim_MataKuliah

Business Purpose:

> Memberikan konteks mata kuliah untuk analisis KRS dan penilaian.

---

# 12. Business Purpose Register

Gunakan format:

| Dimension | Business Purpose | Supported Process | Supported AQ |
|---|---|---|---|
| Dim_Mahasiswa | Konteks mahasiswa | KRS, Penilaian, Pembayaran | AQ-01, AQ-02, AQ-03 |
| Dim_MataKuliah | Konteks mata kuliah | KRS, Penilaian | AQ-01, AQ-02 |
| Dim_Semester | Konteks waktu akademik | KRS, Penilaian, Kelulusan | AQ terkait tren |

---

# 13. STEP 2 – Identify Natural Key

Natural Key adalah identifier dari sistem operasional/source yang mempunyai arti bisnis.

Contoh:

### Mahasiswa
```text
nim
```

### Mata Kuliah
```text
kode_mk
```

### Program Studi
```text
kode_prodi
```

Natural key membantu:

- pencocokan dengan source;
- proses lookup;
- integrasi antar-source.

---

# 14. Validasi Natural Key

Mahasiswa harus memeriksa:

1. Apakah key unik?
2. Apakah key dapat NULL?
3. Apakah key stabil?
4. Apakah formatnya konsisten?
5. Apakah key digunakan lintas source?
6. Apakah key dapat berubah?

Gunakan evidence dari profiling.

---

# 15. SQL Evidence – Natural Key

Contoh:

```sql
SELECT
    nim,
    COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY nim
HAVING COUNT(*) > 1;
```

Tujuan:

> mengecek apakah `nim` memenuhi asumsi uniqueness pada source mahasiswa.

Jika duplicate ditemukan:

> jangan otomatis menyimpulkan NIM tidak dapat menjadi natural key.

Selidiki apakah duplicate merupakan:

- data error;
- histori;
- duplicate load;
- multiple source record.

---

# 16. STEP 3 – Design Surrogate Key

Surrogate Key adalah:

> **identifier internal Data Warehouse yang tidak mempunyai arti bisnis.**

Contoh:

```text
mahasiswa_key
mata_kuliah_key
semester_key
dosen_key
```

Biasanya:

- integer;
- generated;
- stabil;
- tidak berasal dari source.

---

# 17. Natural Key vs Surrogate Key

| Aspek | Natural Key | Surrogate Key |
|---|---|---|
| Asal | Source | Data Warehouse |
| Arti bisnis | Ada | Tidak |
| Dapat berubah | Bisa | Tidak seharusnya |
| Digunakan user | Sering | Jarang |
| Cocok untuk Fact FK | Kurang ideal | Ya |
| Contoh | NIM | mahasiswa_key |

---

# 18. Mengapa Surrogate Key Penting?

Surrogate key membantu:

1. mengisolasi Data Warehouse dari perubahan source key;
2. mengintegrasikan beberapa source;
3. mendukung Slowly Changing Dimension;
4. menjaga relationship Fact–Dimension;
5. memungkinkan beberapa versi historis untuk natural key yang sama.

---

# 19. STEP 4 – Select Dimension Attributes

Atribut dimension harus:

- mempunyai business meaning;
- relevan dengan analytical question;
- mendukung filter/grouping;
- mudah dipahami;
- konsisten.

Contoh `Dim_Mahasiswa`:

```text
mahasiswa_key
nim
angkatan
jenis_kelamin
kota_asal
program_studi
status_mahasiswa
```

---

# 20. Attribute Selection Test

Untuk setiap candidate attribute, jawab:

1. Apakah digunakan untuk filter?
2. Apakah digunakan untuk grouping?
3. Apakah dibutuhkan stakeholder?
4. Apakah mendukung hierarchy?
5. Apakah mempunyai nilai analitik?
6. Apakah kualitas datanya cukup?
7. Apakah atribut sensitif dan benar-benar diperlukan?

Jika jawabannya tidak:

> pertimbangkan untuk tidak memasukkannya.

---

# 21. Business-Friendly Attribute

Hindari technical naming jika dapat diperjelas.

Source:

```text
prd_cd
jk_cd
st_mhs
```

Target conceptual dimension:

```text
kode_program_studi
jenis_kelamin
status_mahasiswa
```

Data Warehouse harus mudah dipahami analyst.

---

# 22. Attribute Dictionary

Gunakan format:

| Attribute | Business Definition | Source | Transformation Need | Used For |
|---|---|---|---|---|
| nim | Nomor mahasiswa | mahasiswa.nim | Direct | Lookup |
| angkatan | Tahun masuk | mahasiswa.angkatan | Direct | Grouping |
| jenis_kelamin | Gender canonical | mahasiswa.jk_raw | Standardization | Analysis |
| program_studi | Nama prodi canonical | mahasiswa.prodi_raw | Mapping | Grouping |

---

# 23. Hubungan dengan Data Profiling

Gunakan hasil Unit 1.2.

Contoh temuan:

```text
prodi_raw:
TI
Tek. Informasi
TEKNOLOGI INFORMASI
Teknologi Informasi
```

Maka pada Dimension Specification:

```text
Attribute:
program_studi

Source:
mahasiswa.prodi_raw

Transformation Need:
Canonical mapping

Quality Status:
Conditionally Ready
```

Treatment final dirinci pada Unit 2.5.

---

# 24. STEP 5 – Design Hierarchy

Hierarchy membantu analisis:

- roll-up;
- drill-down.

Contoh waktu:

```text
Tahun Akademik
    ↓
Semester
```

Contoh organisasi:

```text
Fakultas
    ↓
Program Studi
```

Contoh lokasi:

```text
Provinsi
    ↓
Kota
```

---

# 25. Hierarchy Validation

Hierarchy harus:

- mempunyai makna bisnis;
- tidak dibuat hanya karena source terhubung;
- memiliki level yang jelas;
- mendukung analisis.

Contoh salah:

```text
Mahasiswa
↓
Mata Kuliah
```

Ini bukan hierarchy.

Keduanya adalah konsep berbeda.

---

# 26. STEP 6 – Design Date/Time Dimension

Time Dimension merupakan salah satu dimension penting.

Dimension waktu dapat menyimpan:

```text
date_key
tanggal
hari
nama_hari
bulan
nama_bulan
kuartal
tahun
semester
tahun_akademik
```

Untuk UADW, kebutuhan kalender dan periode akademik harus dibedakan.

---

# 27. Date vs Semester Dimension

Pertanyaan desain:

> Apakah cukup memakai `Dim_Semester` atau memerlukan `Dim_Date`?

Contoh:

### Fact_Nilai
Mungkin cukup:

```text
Dim_Semester
```

karena analisis dilakukan per semester.

### Fact_Pembayaran
Mungkin membutuhkan:

```text
Dim_Date
```

karena transaksi terjadi pada tanggal spesifik.

Keputusan harus mengikuti grain.

---

# 28. Date Dimension Specification

Contoh:

| Field | Isi |
|---|---|
| Dimension Name | Dim_Date |
| Grain | Satu tanggal kalender |
| Natural Key | tanggal |
| Surrogate Key | date_key |
| Attributes | hari, bulan, kuartal, tahun |
| Special Attribute | semester_akademik |
| Role Playing | Ya |

---

# 29. STEP 7 – Identify Role-Playing Dimension

Role-Playing Dimension adalah satu physical dimension yang digunakan dengan beberapa role.

Contoh:

```text
Dim_Date
```

pada proses kelulusan:

- tanggal_masuk;
- tanggal_sidang;
- tanggal_yudisium;
- tanggal_lulus.

Tidak perlu membuat empat physical Date Dimension yang berbeda.

---

# 30. Role-Playing Example

Conceptual:

```text
Fact_Kelulusan
  ├── tanggal_masuk_key
  ├── tanggal_sidang_key
  └── tanggal_lulus_key
```

Ketiganya merujuk ke:

```text
Dim_Date
```

dengan role berbeda.

---

# 31. STEP 8 – Identify Conformed Dimension

Conformed Dimension adalah dimension yang:

> digunakan secara konsisten lintas business process.

Contoh:

```text
Dim_Mahasiswa
```

digunakan oleh:

- Fact_KRS;
- Fact_Nilai;
- Fact_Pembayaran;
- Fact_LMS;
- Fact_Kelulusan.

---

# 32. Conformed Dimension Requirements

Agar benar-benar conformed:

- definisi bisnis sama;
- key strategy sama;
- attribute meaning konsisten;
- canonical values sama;
- hierarchy konsisten.

Tidak cukup hanya memiliki nama tabel yang sama.

---

# 33. Gunakan Bus Matrix

Gunakan Bus Matrix Unit 2.2.

Contoh:

| Process | Mahasiswa | Mata Kuliah | Prodi | Waktu | Dosen |
|---|:---:|:---:|:---:|:---:|:---:|
| KRS | ✓ | ✓ | ✓ | ✓ | |
| Penilaian | ✓ | ✓ | ✓ | ✓ | ✓ |
| Pembayaran | ✓ | | ✓ | ✓ | |
| Kelulusan | ✓ | | ✓ | ✓ | |

Dimension yang muncul pada banyak process menjadi kandidat conformed dimension.

---

# 34. Program Studi: Separate Dimension atau Attribute?

Ini merupakan keputusan desain yang valid untuk didiskusikan.

Pilihan A:

```text
Dim_Mahasiswa
  └── program_studi
```

Pilihan B:

```text
Dim_Program_Studi
```

Pertimbangkan:

- kebutuhan analitik lintas process;
- hierarchy fakultas→prodi;
- penggunaan conformed dimension;
- perubahan historis;
- kemudahan query.

Tidak selalu ada satu jawaban absolut.

---

# 35. Denormalization dalam Dimension

Dalam Star Schema, redundancy tertentu dapat diterima.

Contoh:

```text
Dim_Mahasiswa
  ├── program_studi
  └── fakultas
```

meskipun source mungkin memisahkan tabel prodi dan fakultas.

Tujuannya:

- query lebih mudah;
- join lebih sedikit;
- model lebih understandable.

---

# 36. Snowflaking sebagai Alternatif

Snowflake dapat digunakan jika:

- hierarchy sangat besar;
- reuse dimension substructure penting;
- governance memerlukan normalisasi;
- manfaat lebih besar daripada kompleksitas.

Namun baseline UADW:

> **prefer Star Schema unless there is a clear reason to snowflake.**

---

# 37. Degenerate Dimension – Preview

Identifier transaksi tertentu dapat muncul langsung pada Fact.

Contoh:

```text
nomor_transaksi
nomor_krs
```

Konsep ini disebut:

> Degenerate Dimension.

Pembahasan utama dilakukan pada Unit 2.4 karena posisinya dekat dengan Fact Table.

---

# 38. Junk Dimension – Enrichment

Junk Dimension dapat menggabungkan sejumlah flag kecil.

Contoh:

```text
is_lulus
is_remedial
is_transfer
is_beasiswa
```

Konsep ini:

> enrichment.

Tidak menjadi target utama Unit 2.3.

---

# 39. Dimension Specification

Setiap dimension wajib didokumentasikan.

Format:

| Field | Isi |
|---|---|
| Dimension Name | Dim_Mahasiswa |
| Business Purpose | Konteks mahasiswa |
| Grain | Satu record per versi mahasiswa |
| Natural Key | NIM |
| Surrogate Key | mahasiswa_key |
| Source | mahasiswa |
| Hierarchy | Fakultas → Prodi |
| Conformed | Ya |
| SCD Candidate | Ya |
| Quality Status | Conditional |

---

# 40. Grain pada Dimension

Dimension juga mempunyai grain.

Contoh:

## Dim_Mahasiswa

> Satu record merepresentasikan satu versi mahasiswa.

Pada implementasi SCD Type 2, satu NIM dapat memiliki beberapa versi dimension.

Karena itu grain dimension harus dipahami sejak tahap desain.

---

# 41. Studi Kasus – Dim_Mahasiswa

Candidate design:

```text
Dim_Mahasiswa
--------------
mahasiswa_key
nim
angkatan
jenis_kelamin
kota_asal
program_studi
status_mahasiswa
```

### Natural Key
`nim`

### Surrogate Key
`mahasiswa_key`

### Candidate Conformed
Ya.

### SCD Candidate
Ya.

---

# 42. Studi Kasus – Dim_MataKuliah

Candidate design:

```text
Dim_MataKuliah
--------------
mata_kuliah_key
kode_mk
nama_mk
sks
kategori_mk
semester_rekomendasi
```

### Natural Key
`kode_mk`

### Surrogate Key
`mata_kuliah_key`

### Supported Process
- KRS;
- Penilaian;
- Aktivitas LMS tertentu.

---

# 43. Studi Kasus – Dim_Semester

Candidate design:

```text
Dim_Semester
------------
semester_key
kode_semester
tahun_akademik
jenis_semester
tanggal_mulai
tanggal_selesai
```

Analytical use:

- trend analysis;
- grouping;
- comparison semester.

---

# 44. Studi Kasus – Dim_Dosen

Candidate design:

```text
Dim_Dosen
---------
dosen_key
kode_dosen
nama_dosen
status_dosen
program_studi
```

Tetapi mahasiswa harus memeriksa:

> Apakah semua atribut diperlukan untuk analytical questions?

Jangan menyalin semua source columns.

---

# 45. Aktivitas A – Business Purpose

Pilih minimal **4 candidate dimensions** dari Unit 2.2.

Untuk masing-masing:

1. tulis business purpose;
2. sebutkan supported process;
3. sebutkan supported AQ;
4. jelaskan mengapa dimension diperlukan.

---

# 46. Aktivitas B – Key Design

Untuk minimal 4 dimensions:

1. tentukan natural key;
2. verifikasi uniqueness;
3. tentukan surrogate key;
4. jelaskan alasan penggunaan surrogate key;
5. catat issue jika natural key bermasalah.

---

# 47. Aktivitas C – Attribute Selection

Untuk setiap dimension:

1. ambil candidate source attributes;
2. klasifikasikan:
   - Keep;
   - Review;
   - Exclude;
3. berikan alasan;
4. hubungkan dengan AQ.

Contoh:

| Attribute | Decision | Reason |
|---|---|---|
| angkatan | Keep | Dipakai analisis cohort |
| email | Exclude | Tidak digunakan analisis |
| kota_asal | Keep | Mendukung analisis geografis |
| telepon | Exclude | Tidak relevan |

---

# 48. Aktivitas D – Attribute Profiling Evidence

Pilih minimal 3 atribut yang membutuhkan evaluasi kualitas.

Contoh:

- `prodi_raw`;
- `jk_raw`;
- `kota_asal_raw`.

Gunakan hasil Unit 1.2.

Catat:

- missing;
- inconsistent labels;
- invalid values;
- canonical need.

---

# 49. Aktivitas E – Hierarchy Design

Buat minimal **2 hierarchy** jika relevan.

Contoh:

```text
Fakultas
  ↓
Program Studi
```

dan:

```text
Tahun Akademik
  ↓
Semester
```

Jelaskan analytical use masing-masing.

---

# 50. Aktivitas F – Time Dimension Decision

Untuk setiap Fact kandidat, tentukan:

- Dim_Date?
- Dim_Semester?
- keduanya?

Contoh format:

| Fact | Grain | Time Need | Decision | Reason |
|---|---|---|---|---|
| Fact_Nilai | Nilai per MK per semester | Academic period | Dim_Semester | Cukup untuk analisis |
| Fact_Pembayaran | Transaksi pembayaran | Exact date | Dim_Date | Perlu tanggal transaksi |

---

# 51. Aktivitas G – Role-Playing Dimension

Identifikasi minimal satu kasus jika tersedia.

Contoh:

Fact_Kelulusan:

- Admission Date;
- Graduation Date.

Keduanya dapat menggunakan:

> `Dim_Date`

dengan role berbeda.

---

# 52. Aktivitas H – Conformed Dimension Matrix

Gunakan format:

| Dimension | KRS | Nilai | Pembayaran | LMS | Kelulusan | Conformed Candidate |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Mahasiswa | ✓ | ✓ | ✓ | ✓ | ✓ | Yes |
| Mata Kuliah | ✓ | ✓ | | ✓ | | Yes |
| Semester | ✓ | ✓ | ✓ | ✓ | ✓ | Yes |

---

# 53. Aktivitas I – Dimension Specification

Buat Dimension Specification untuk minimal:

> **4 Dimension Tables**

Minimal salah satunya:

- Dim_Mahasiswa;
- Dim_MataKuliah;
- Dim_Semester/Date.

---

# 54. Aktivitas J – Update Star Schema

Perbarui model Unit 2.2.

Dari:

```text
Candidate Dimension
```

menjadi:

```text
Designed Dimension
```

Diagram masih bersifat logical/conceptual.

Belum perlu:

- SQL DDL;
- index;
- physical storage specification.

---

# 55. Requirement–Dimension Traceability

Gunakan:

| AQ | Analytical Context | Dimension | Attribute | Reason |
|---|---|---|---|---|
| AQ-01 | Mata Kuliah | Dim_MataKuliah | nama_mk | Group failure rate |
| AQ-02 | Program Studi | Dim_Mahasiswa / Dim_Prodi | program_studi | Compare average grade |
| AQ-02 | Semester | Dim_Semester | tahun_akademik | Trend analysis |

---

# 56. Anti-Pattern 1 – Copy All Columns

Kesalahan:

> semua kolom mahasiswa dimasukkan ke Dim_Mahasiswa.

Masalah:

- dimension menjadi terlalu besar;
- atribut tidak relevan;
- risiko privacy;
- model sulit digunakan.

---

# 57. Anti-Pattern 2 – Natural Key as Warehouse PK

Contoh:

```text
PK Dim_Mahasiswa = NIM
```

tanpa surrogate key.

Masalah:

- sulit mendukung SCD;
- tergantung source;
- sulit integrasi multi-source.

---

# 58. Anti-Pattern 3 – Dimension without Business Purpose

Contoh:

> Dim_Alamat dibuat karena source memiliki tabel alamat.

Jika tidak ada AQ yang menggunakan alamat:

> dimension mungkin tidak diperlukan.

---

# 59. Anti-Pattern 4 – False Hierarchy

Contoh salah:

```text
Mahasiswa
↓
Mata Kuliah
```

Bukan hierarchy.

Hierarchy harus menunjukkan level dalam satu analytical dimension.

---

# 60. Anti-Pattern 5 – Different Definitions Across Facts

Jika:

```text
Dim_Mahasiswa untuk Fact_Nilai
```

menggunakan definisi mahasiswa berbeda dari:

```text
Dim_Mahasiswa untuk Fact_Pembayaran
```

maka cross-process analysis menjadi bermasalah.

---

# 61. Hubungan dengan SCD

Pada Unit 2.3 mahasiswa hanya menandai:

> **SCD Candidate**

Contoh:

```text
program_studi
status_mahasiswa
kota_asal
```

Keputusan:

- Type 1;
- Type 2;

baru dibuat pada Unit 2.5.

---

# 62. RTM 3 v0.2

Setelah Unit 2.3, RTM 3 diperbarui menjadi:

# RTM 3 v0.2

Isi:

1. Analytical Scope;
2. Business Process Register;
3. Grain Statements;
4. Conceptual Star Schema;
5. Bus Matrix;
6. Dimension Specifications;
7. Attribute Dictionary;
8. Key Mapping;
9. Hierarchy Design;
10. Time Dimension Decision;
11. Conformed Dimension Matrix;
12. Requirement–Dimension Traceability;
13. CT Reflection.

---

# 63. CT Reflection Unit 2.3

Jawab:

1. Atribut apa yang paling sulit diputuskan untuk dimasukkan?
2. Apa alasan Anda mengeluarkan beberapa atribut source?
3. Mengapa surrogate key diperlukan?
4. Dimension mana yang paling berpotensi menjadi conformed dimension?
5. Apa hierarchy yang paling berguna?
6. Kapan Dim_Date lebih tepat daripada Dim_Semester?
7. Bagaimana hasil profiling memengaruhi desain dimension?

---

# 64. Luaran Wajib Unit 2.3

Mahasiswa menyerahkan:

1. Business Purpose Register;
2. Key Design;
3. Attribute Selection Matrix;
4. Attribute Dictionary;
5. Dimension Specification;
6. Hierarchy Design;
7. Time Dimension Decision;
8. Role-Playing Dimension Identification;
9. Conformed Dimension Matrix;
10. Updated Star Schema;
11. Requirement–Dimension Traceability;
12. CT Reflection;
13. RTM 3 v0.2.

---

# 65. Target Minimal

| Komponen | Minimum |
|---|---:|
| Dimension Specification | 4 |
| Natural Keys | 4 |
| Surrogate Keys | 4 |
| Attribute Selection | ≥ 5 per dimension jika tersedia |
| Hierarchy | 2 jika relevan |
| Date/Semester Decision | 1 matrix |
| Conformed Dimension Candidates | 2 |
| Role-Playing Example | 1 jika relevan |
| Traceability Entries | 5 |
| CT Reflection | 1 |

---

# 66. Checkpoint Dosen

Sebelum Unit 2.4:

| Check | Status |
|---|:---:|
| Business purpose jelas | ☐ |
| Natural key teridentifikasi | ☐ |
| Surrogate key dirancang | ☐ |
| Attribute relevan | ☐ |
| Tidak copy semua source columns | ☐ |
| Hierarchy valid | ☐ |
| Time dimension sesuai grain | ☐ |
| Conformed candidates masuk akal | ☐ |
| SCD candidate ditandai | ☐ |
| Traceability tersedia | ☐ |

---

# 67. Design Gate Unit 2.3

Status:

```text
PASS
REVISE
```

Mahasiswa belum boleh melanjutkan Fact Design jika:

- dimension tidak mempunyai business purpose;
- natural key tidak dipahami;
- surrogate key tidak dirancang;
- atribut tidak memiliki analytical value;
- hierarchy salah;
- conformed dimension tidak konsisten;
- relationship dengan AQ tidak jelas.

---

# 68. Penilaian Unit 2.3

Rekomendasi:

| Aspek | Bobot |
|---|---:|
| Business Purpose | 10% |
| Natural & Surrogate Key Design | 20% |
| Attribute Selection | 20% |
| Dimension Specification | 20% |
| Hierarchy & Time Dimension | 10% |
| Conformed Dimension | 10% |
| Traceability | 5% |
| CT Reflection | 5% |
| **Total** | **100%** |

---

# 69. Exit Reflection

### Pertanyaan 1
Apa perbedaan Natural Key dan Surrogate Key?

### Pertanyaan 2
Mengapa tidak semua source attribute harus masuk ke Dimension?

### Pertanyaan 3
Apa fungsi hierarchy?

### Pertanyaan 4
Apa perbedaan Dim_Date dan Dim_Semester?

### Pertanyaan 5
Apa yang dimaksud conformed dimension?

### Pertanyaan 6
Mengapa SCD candidate ditandai sekarang tetapi diputuskan nanti?

---

# 70. Jembatan ke Unit 2.4

Unit 2.3 menghasilkan:

```text
Designed Dimensions
       ↓
Natural Keys
       ↓
Surrogate Keys
       ↓
Attributes
       ↓
Hierarchy
       ↓
Conformance
```

Unit 2.4 akan menjawab:

> **Bagaimana business event disimpan dalam Fact Table dan bagaimana measure dirancang agar sesuai dengan grain?**

Alur berikutnya:

```text
Validated Grain
       ↓
Designed Dimensions
       ↓
Fact Table
       ↓
Foreign Keys
       ↓
Measures
       ↓
Additivity
       ↓
Fact Type
```

---

# 71. Checklist Akhir Mahasiswa

Sebelum submit:

- [ ] Saya menggunakan candidate dimensions dari Unit 2.2.
- [ ] Setiap dimension mempunyai business purpose.
- [ ] Setiap dimension mempunyai candidate natural key.
- [ ] Saya memverifikasi natural key menggunakan source/profiling.
- [ ] Setiap dimension mempunyai surrogate key design.
- [ ] Saya hanya memilih atribut yang mempunyai analytical value.
- [ ] Saya mendokumentasikan source dan transformation need.
- [ ] Saya membuat hierarchy jika relevan.
- [ ] Saya mengevaluasi kebutuhan Date/Semester Dimension.
- [ ] Saya mengidentifikasi role-playing dimension jika relevan.
- [ ] Saya mengidentifikasi candidate conformed dimension.
- [ ] Saya menandai SCD candidate tetapi belum memilih Type 1/2.
- [ ] Saya memperbarui Star Schema.
- [ ] Saya memperbarui RTM 3 menjadi v0.2.
- [ ] Saya menyelesaikan CT Reflection.
- [ ] Saya siap melanjutkan Unit 2.4.

---

# 72. Prinsip Penutup

> **Dimensions give analytical meaning to facts.**

> **Natural keys connect the warehouse to the source; surrogate keys protect the warehouse from the source.**

> **Not every source attribute deserves a place in a dimension.**

> **A dimension should be designed for analysis, not copied from an operational table.**

> **Conformed dimensions are the foundation of integrated analytics across business processes.**
