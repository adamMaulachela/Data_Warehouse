# MODUL PRAKTIKUM 2
## Unit 2.5 – Slowly Changing Dimension, Data Integration & Data Quality
### Mata Kuliah Data Warehouse
### Studi Kasus: UADW v1.0

---

## 1. Identitas Unit

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Modul:** 2 – Dimensional Modeling & Data Quality  
**Unit:** 2.5 – Slowly Changing Dimension, Data Integration & Data Quality  
**Pertemuan Utama:** Pertemuan 7  
**Fase Pembelajaran:** DESIGN  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning  
**Studi Kasus:** University Academic Data Warehouse (UADW) v1.0  
**RTM:** RTM 3 – Abstraction / Dimensional Modeling, versi 1.0 FINAL  

---

# 2. Posisi Unit dalam Alur Pembelajaran

Unit 2.5 merupakan unit penutup Modul Praktikum 2.

Pada Unit 2.1–2.4 mahasiswa telah menghasilkan:

- Business Process Register;
- Grain Statements;
- Conceptual Star Schema;
- Bus Matrix;
- Dimension Specifications;
- Fact Specifications;
- Measure Dictionary;
- Additivity Matrix;
- Grain–Measure Compatibility Matrix;
- Requirement–Model Traceability;
- RTM 3 v0.3.

Unit 2.5 menjawab pertanyaan:

> **Bagaimana model Data Warehouse menangani perubahan historis, perbedaan antar-source, dan masalah kualitas data sebelum desain diimplementasikan melalui ETL?**

Alur:

```text
UNIT 2.3
Dimension Attributes
        ↓
UNIT 2.4
Fact + Measures
        ↓
UNIT 2.5
Historical Requirement
        ↓
SCD Decision
        ↓
Data Quality Rules
        ↓
Canonical Mapping
        ↓
Integration Rules
        ↓
Transformation Rules
        ↓
Validation Rules
        ↓
RTM 3 v1.0 FINAL
```

Unit ini merupakan jembatan:

```text
MODUL 2 – DESIGN
        ↓
MODUL 3 – BUILD / ETL
```

---

# 3. CPMK dan Sub-CPMK

## CPMK-3

Mahasiswa mampu:

> **Merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya.**

## CPMK-4

Mahasiswa mulai diarahkan untuk:

> **Mengimplementasikan Data Warehouse dan proses ETL/ELT dari berbagai sumber data dengan memperhatikan integrasi dan kualitas data.**

Pada Unit 2.5 CPMK-4 masih berada pada tahap:

> **design preparation for implementation**

Belum melakukan implementasi ETL penuh.

## Sub-CPMK 7

Mahasiswa mampu:

> **Menerapkan konsep Slowly Changing Dimension serta merancang aturan integrasi, transformasi, dan kualitas data sebagai dasar implementasi Data Warehouse.**

---

# 4. Capaian Praktikum Unit 2.5

Setelah menyelesaikan Unit 2.5, mahasiswa diharapkan mampu:

1. mengidentifikasi atribut dimension yang dapat berubah;
2. membedakan koreksi data dan perubahan bisnis historis;
3. menentukan kebutuhan histori pada setiap atribut;
4. memilih SCD Type 1 atau Type 2 secara beralasan;
5. menjelaskan hubungan surrogate key dengan SCD Type 2;
6. mengidentifikasi isu kualitas data;
7. mengklasifikasikan isu berdasarkan dimensi kualitas data;
8. menentukan severity dan treatment;
9. menyusun Data Quality Rule yang dapat diuji;
10. membuat canonical mapping;
11. merancang integration rules antar-source;
12. merancang transformation rules dari source ke target;
13. membedakan business rule dan technical rule;
14. membangun validation rules;
15. memfinalisasi RTM 3 menjadi versi 1.0;
16. menilai kesiapan desain untuk masuk ke tahap ETL.

---

# 5. Fokus Computational Thinking

Fokus Unit 2.5:

# EVALUATION + ABSTRACTION

Mahasiswa harus mengevaluasi:

- apakah perubahan harus disimpan historinya;
- apakah nilai berbeda sebenarnya memiliki makna yang sama;
- apakah anomali merupakan error atau perubahan bisnis yang sah;
- apakah data dapat digunakan langsung atau memerlukan treatment;
- bagaimana source yang berbeda dipetakan ke bentuk canonical.

Contoh:

```text
Source A:
TI

Source B:
Tek. Informasi

Source C:
TEKNOLOGI INFORMASI

Source D:
Teknologi Informasi
```

Abstraction:

```text
Semua representasi
        ↓
Canonical Business Meaning
        ↓
Teknologi Informasi
```

Evaluation:

> Apakah ini perubahan historis?

Jawaban:

> Tidak. Ini masalah standardisasi label.

---

# 6. Prasyarat

Sebelum memulai Unit 2.5, mahasiswa wajib memiliki:

- Unit 2.1 PASS;
- Unit 2.2 PASS;
- Unit 2.3 PASS;
- Unit 2.4 PASS;
- Dimension Specifications;
- Fact Specifications;
- Measure Dictionary;
- Bus Matrix;
- updated Star Schema;
- hasil Data Profiling Unit 1.2;
- Data Fitness Assessment Unit 1.3.

Jika Fact atau Dimension belum stabil, finalisasi Unit 2.5 belum boleh dilakukan.

---

# 7. Perangkat yang Digunakan

Gunakan:

1. UADW v1.0 Student Dataset;
2. Data Dictionary UADW v1.0;
3. hasil Unit 1.2 Data Profiling;
4. hasil Unit 1.3 Data Fitness;
5. output Unit 2.1–2.4;
6. workbook Modul 2;
7. DBeaver/PostgreSQL untuk verifikasi sederhana jika diperlukan.

SQL hanya digunakan untuk:

- memverifikasi issue;
- memeriksa duplicate;
- memeriksa missing;
- memeriksa domain;
- memeriksa referential mismatch.

Belum melakukan ETL production.

---

# 8. Prinsip Kerja Unit 2.5

## Prinsip 1 – Not Every Change Is History

Tidak semua perubahan harus menjadi SCD Type 2.

## Prinsip 2 – Not Every Anomaly Is an Error

Nilai aneh harus diperiksa terlebih dahulu.

## Prinsip 3 – Quality Rules Must Be Testable

Aturan:

> "data harus baik"

tidak dapat diterima.

## Prinsip 4 – Transformation Must Be Documented

Perubahan dari raw value ke canonical value harus mempunyai rule.

## Prinsip 5 – ETL Implements the Design

Unit 2.5 menentukan:

> **what should happen**

Modul 3 menentukan:

> **how to implement it**

---

# 9. STEP 1 – Identify Changing Attributes

Ambil Dimension Specification Unit 2.3.

Tandai atribut yang:

- dapat berubah;
- mungkin dikoreksi;
- mempunyai makna historis;
- perlu distandardisasi.

Contoh Dim_Mahasiswa:

```text
nim
angkatan
jenis_kelamin
kota_asal
program_studi
status_mahasiswa
```

Candidate changing attributes:

- kota_asal;
- program_studi;
- status_mahasiswa.

---

# 10. Change Scenario Register

Gunakan format:

| Dimension | Attribute | Change Scenario | Frequency | Business Impact |
|---|---|---|---|---|
| Dim_Mahasiswa | kota_asal | Koreksi typo | Low | Low |
| Dim_Mahasiswa | program_studi | Pindah prodi | Low | High |
| Dim_Mahasiswa | status_mahasiswa | Aktif → Cuti | Medium | High |

---

# 11. STEP 2 – Distinguish Correction vs Business Change

Contoh:

### Koreksi

```text
Kendri
→
Kendari
```

Ini kemungkinan:

> data correction.

### Business Change

```text
Teknologi Informasi
→
Sistem Informasi
```

Jika mahasiswa resmi pindah program studi:

> historical business change.

Perbedaan ini menentukan strategi SCD.

---

# 12. Historical Requirement

Pertanyaan utama:

> **Apakah analisis harus menggunakan kondisi saat event terjadi atau hanya kondisi terbaru?**

Contoh:

Mahasiswa memperoleh nilai pada 2024 saat berada di:

> Teknologi Informasi.

Pada 2025 pindah ke:

> Sistem Informasi.

Jika laporan nilai 2024 harus tetap dikategorikan sebagai TI:

> histori diperlukan.

---

# 13. STEP 3 – SCD Type 1

SCD Type 1:

> nilai lama ditimpa oleh nilai baru.

Tidak menyimpan histori.

Cocok untuk:

- typo correction;
- standardization;
- error correction;
- perubahan yang tidak membutuhkan historical analysis.

---

# 14. SCD Type 1 Example

Sebelum:

```text
mahasiswa_key = 1001
nim            = MHS001
kota_asal      = Kendri
```

Sesudah:

```text
mahasiswa_key = 1001
nim            = MHS001
kota_asal      = Kendari
```

Tidak ada record baru.

---

# 15. STEP 4 – SCD Type 2

SCD Type 2:

> membuat record dimension baru ketika terjadi perubahan yang harus disimpan historinya.

Contoh:

```text
Old:
mahasiswa_key = 1001
nim = MHS001
program_studi = Teknologi Informasi
is_current = N

New:
mahasiswa_key = 2054
nim = MHS001
program_studi = Sistem Informasi
is_current = Y
```

Natural key sama.

Surrogate key berbeda.

---

# 16. SCD Type 2 Supporting Attributes

Candidate attributes:

```text
effective_from
effective_to
is_current
version_number
```

Tidak semua harus digunakan sekaligus.

Namun histori harus dapat dibedakan secara jelas.

---

# 17. Why Surrogate Key Matters for SCD Type 2

Fact lama:

```text
mahasiswa_key = 1001
```

Fact baru:

```text
mahasiswa_key = 2054
```

Keduanya memiliki:

```text
nim = MHS001
```

Dengan demikian:

> Fact dapat mempertahankan konteks historis yang benar.

---

# 18. SCD Type 0 dan Type 3 – Enrichment

## Type 0

Nilai tidak pernah diubah.

## Type 3

Menyimpan nilai sekarang dan nilai sebelumnya dalam satu row.

Target wajib mahasiswa:

> **Type 1 dan Type 2**

Type 0 dan Type 3 hanya pengayaan.

---

# 19. STEP 5 – SCD Decision Matrix

Gunakan format:

| Dimension | Attribute | Scenario | History Needed? | SCD Type | Reason |
|---|---|---|:---:|---|---|
| Dim_Mahasiswa | kota_asal | typo correction | No | 1 | Koreksi |
| Dim_Mahasiswa | program_studi | pindah prodi | Yes | 2 | Historical analysis |
| Dim_Mahasiswa | status_mahasiswa | aktif → cuti | Yes/Depends | 2 | Jika status historis diperlukan |

Minimal:

> **5 keputusan SCD**

---

# 20. SCD Decision Rule

Gunakan alur:

```text
Attribute Changed?
        ↓
Is it only correction/standardization?
   YES → Type 1
        ↓ NO
Is historical state needed?
   YES → Type 2
        ↓ NO
Type 1 / other justified strategy
```

Mahasiswa wajib menulis alasan.

---

# 21. STEP 6 – Identify Data Quality Issues

Gunakan hasil Unit 1.2.

Contoh isu UADW:

- duplicate mahasiswa;
- missing kota asal;
- inconsistent program studi;
- duplicate KRS;
- nilai di luar range;
- nilai kosong;
- duplicate LMS activity;
- payment inconsistency;
- duplicate graduation record.

Mahasiswa tidak perlu mencari issue baru jika sudah teridentifikasi sebelumnya.

---

# 22. Data Quality Dimensions

Gunakan minimal:

1. Completeness;
2. Uniqueness;
3. Validity;
4. Consistency;
5. Accuracy;
6. Referential Integrity.

Tambahan:

7. Timeliness.

---

# 23. Completeness

Contoh:

```text
kota_asal = NULL
```

Rule:

```text
Jika kota_asal dibutuhkan untuk analisis geografis,
missing value harus dicatat.
```

Metric:

```text
missing_count
missing_percentage
```

---

# 24. Uniqueness

Contoh:

```text
nim
```

pada master mahasiswa seharusnya unik pada grain tertentu.

Jika duplicate:

> lakukan investigasi.

Jangan langsung `DROP DUPLICATE`.

---

# 25. Validity

Contoh:

```text
nilai_angka = 105
```

Domain:

```text
0 <= nilai_angka <= 100
```

Maka:

> validity violation.

---

# 26. Accuracy

Contoh:

```text
nilai_angka = 85
```

Secara domain:

> valid.

Tetapi apakah nilai tersebut benar?

Tidak dapat diketahui hanya dari profiling.

Accuracy membutuhkan:

> authoritative/reference source.

Prinsip:

> **Validity is not the same as accuracy.**

---

# 27. Consistency

Contoh:

```text
TI
Tek. Informasi
TEKNOLOGI INFORMASI
Teknologi Informasi
```

Makna bisnis sama.

Masalah:

> inconsistent representation.

Treatment:

> canonical mapping.

---

# 28. Referential Integrity

Contoh:

```text
nilai.nim = MHS999
```

tetapi:

```text
mahasiswa.nim
```

tidak memiliki MHS999.

Masalah:

> orphan relationship.

---

# 29. STEP 7 – Create Data Quality Rules

Rule harus:

- eksplisit;
- dapat diuji;
- mempunyai target field;
- memiliki severity;
- memiliki treatment.

Contoh buruk:

> Nilai harus benar.

Contoh baik:

> `nilai_angka` harus bernilai 0–100 atau NULL jika nilai belum diterbitkan.

---

# 30. Data Quality Rulebook

Format:

| Rule ID | Table/Field | Rule | Quality Dimension | Severity | Treatment |
|---|---|---|---|---|---|
| DQ01 | mahasiswa.nim | NOT NULL | Completeness | Critical | Reject |
| DQ02 | nilai.nilai_angka | 0–100 or NULL | Validity | High | Quarantine |
| DQ03 | nilai.nim | Must exist in mahasiswa | Referential Integrity | Critical | Investigate |

Minimum:

> **10 Data Quality Rules**

---

# 31. Severity Classification

Gunakan:

## Critical
Mengancam integritas model.

## High
Berisiko menghasilkan analisis salah.

## Medium
Mengurangi kemampuan analisis.

## Low
Masalah format yang mudah distandardisasi.

---

# 32. STEP 8 – Treatment Decision

Gunakan pola:

```text
Issue
↓
Quality Dimension
↓
Severity
↓
Treatment
↓
Transformation
↓
Validation
```

Treatment candidate:

- accept;
- standardize;
- correct;
- reject;
- quarantine;
- flag;
- map;
- return to source owner;
- assign unknown member.

---

# 33. Example Treatment

Issue:

```text
nilai_angka = 105
```

Decision:

```text
Quality Dimension:
Validity

Severity:
High

Treatment:
Quarantine

Transformation:
None

Validation:
0 <= nilai <= 100

Auto-correct:
NO
```

---

# 34. Why Auto-Correction Can Be Dangerous

Contoh:

```text
105 → 100
```

tanpa rule bisnis.

Ini berbahaya karena:

> sistem mengubah fakta bisnis tanpa dasar.

---

# 35. STEP 9 – Canonical Mapping

Contoh:

| Raw Value | Canonical Value |
|---|---|
| TI | Teknologi Informasi |
| Tek. Informasi | Teknologi Informasi |
| TEKNOLOGI INFORMASI | Teknologi Informasi |
| Teknologi Informasi | Teknologi Informasi |

---

# 36. Canonical Mapping Rules

Setiap mapping harus:

- terdokumentasi;
- mempunyai domain;
- mempunyai source;
- mempunyai target;
- dapat diuji;
- tidak mengubah business meaning.

---

# 37. Canonical Mapping Register

Gunakan:

| Mapping ID | Domain | Raw Value | Canonical Value | Reason |
|---|---|---|---|---|
| MAP01 | Program Studi | TI | Teknologi Informasi | Standardization |
| MAP02 | Gender | M | Laki-laki | Standardization |
| MAP03 | Status | ACT | Aktif | Standardization |

Minimum:

> **5 mapping entries**

---

# 38. STEP 10 – Design Integration Rules

Integration Rule menjelaskan:

> bagaimana data dari beberapa source dihubungkan secara bisnis.

Contoh:

```text
mahasiswa.nim
=
krs.nim
=
nilai.nim
=
aktivitas_lms.nim
```

Harus dicek:

- semantic meaning;
- uniqueness;
- missing;
- format;
- grain.

---

# 39. Integration Rule Example

| Rule ID | Source A | Source B | Join/Match | Validation |
|---|---|---|---|---|
| IR01 | mahasiswa | nilai | nim = nim | All nilai.nim must match mahasiswa.nim |
| IR02 | krs | mata_kuliah | kode_mk = kode_mk | kode_mk must exist |
| IR03 | nilai | semester | semester_id | Must match valid semester |

---

# 40. Integration Risks

Risiko integrasi:

- duplicate natural key;
- different formats;
- missing key;
- conflicting business meaning;
- grain mismatch;
- late arriving records;
- orphan transactions.

---

# 41. Late Arriving Dimension – Introduction

Contoh:

Fact sudah datang:

```text
nilai.nim = MHS001
```

tetapi Dim_Mahasiswa belum memiliki MHS001.

Possible design:

> unknown member / late-arriving strategy.

Pada Unit 2.5 cukup dokumentasikan requirement.

Implementasi dilakukan Modul 3.

---

# 42. STEP 11 – Design Transformation Rules

Transformation Rule menjelaskan:

> perubahan dari source ke target.

Contoh:

| Target | Source | Rule |
|---|---|---|
| jenis_kelamin | jk_raw | Map to canonical domain |
| program_studi | prodi_raw | Reference mapping |
| is_lulus | nilai_angka | Derive according to passing rule |

---

# 43. Business Rule vs Technical Rule

## Business Rule

Contoh:

> Mahasiswa dinyatakan lulus mata kuliah jika memenuhi batas kelulusan.

## Technical Rule

Contoh:

> TRIM whitespace dan convert tanggal ke format target.

---

# 44. Transformation Specification

Gunakan format:

| Rule ID | Target | Source | Rule | Rule Type | Validation |
|---|---|---|---|---|---|
| TR01 | program_studi | prodi_raw | Canonical mapping | Technical/Business | Must exist in reference |
| TR02 | is_lulus | nilai_angka | Derive by threshold | Business | 0/1 |
| TR03 | tanggal | tanggal_raw | Standardize format | Technical | Valid date |

Minimum:

> **5 Transformation Rules**

---

# 45. STEP 12 – Design Validation Rules

Validation memastikan transformation menghasilkan output valid.

Contoh:

```text
Target:
program_studi

Validation:
value must exist in canonical program list
```

---

# 46. Source-to-Target Thinking

```text
SOURCE
raw data
    ↓
QUALITY CHECK
    ↓
STANDARDIZATION
    ↓
INTEGRATION
    ↓
TRANSFORMATION
    ↓
VALIDATION
    ↓
TARGET DESIGN
```

---

# 47. Important Boundary: Unit 2.5 vs Modul 3

Unit 2.5:

> **Define WHAT should happen**

Modul 3:

> **Implement HOW it happens**

Contoh Unit 2.5:

```text
Map:
TI → Teknologi Informasi
```

Modul 3:

```text
SQL CASE / reference table / Python mapping
```

---

# 48. Data Fitness Revisited

Gunakan status Unit 1.3:

- READY
- CONDITIONALLY READY
- NOT READY

Unit 2.5 menentukan treatment agar source dapat digunakan sesuai desain.

---

# 49. Example Data Fitness Resolution

Source:

```text
prodi_raw
```

Unit 1.3:

```text
Conditionally Ready
Reason:
Inconsistent labels
```

Unit 2.5:

```text
Treatment:
Canonical mapping

Validation:
Must exist in Ref_Program_Studi
```

---

# 50. Studi Kasus UADW – Perubahan Program Studi

```text
MHS001
2024 → Teknologi Informasi
2025 → Sistem Informasi
```

Jika analisis historis diperlukan:

> SCD Type 2.

---

# 51. Studi Kasus UADW – Label Program Studi

```text
TI
Tek. Informasi
TEKNOLOGI INFORMASI
```

Jika business meaning sama:

> bukan SCD.

Treatment:

> canonical mapping.

---

# 52. Studi Kasus UADW – Missing Kota Asal

```text
kota_asal = NULL
```

Possible reasoning:

```text
Quality:
Completeness

Severity:
Medium

Treatment:
Unknown / preserve NULL / source remediation

Decision:
Depends on analytical need
```

---

# 53. Studi Kasus UADW – Duplicate KRS

Jika kombinasi:

```text
nim
kode_mk
semester_id
```

muncul lebih dari sekali, investigasi:

- legitimate repeated attempt?
- duplicate load?
- class section?
- status berbeda?
- source error?

---

# 54. Studi Kasus UADW – LMS Duplicate

Mahasiswa harus membedakan:

> duplicate teknis

dan

> event valid yang kebetulan mirip.

Treatment harus menggunakan explicit rule.

---

# 55. Aktivitas A – Change Scenario Analysis

Pilih minimal:

> **5 dimension attributes**

Untuk masing-masing:

1. identifikasi change scenario;
2. klasifikasikan correction vs business change;
3. tentukan historical requirement;
4. pilih SCD strategy;
5. jelaskan alasan.

---

# 56. Aktivitas B – SCD Decision Matrix

Lengkapi minimal:

> **5 SCD decisions**

Wajib mencakup:

- minimal 1 Type 1;
- minimal 1 Type 2.

---

# 57. Aktivitas C – Data Quality Rulebook

Buat minimal:

- 2 Completeness Rules;
- 2 Validity Rules;
- 2 Consistency Rules;
- 2 Uniqueness Rules;
- 2 Referential Integrity Rules.

Total:

> **10 rules**

---

# 58. Aktivitas D – Severity & Treatment

Untuk minimal:

> **5 quality issues**

tentukan:

- severity;
- treatment;
- auto-correct allowed?;
- validation.

---

# 59. Aktivitas E – Canonical Mapping

Pilih minimal 2 domain bermasalah.

Buat minimal:

> **5 mapping rows**

---

# 60. Aktivitas F – Integration Rules

Buat minimal:

> **5 integration rules**

yang mencakup minimal 3 source berbeda.

---

# 61. Aktivitas G – Transformation Rules

Buat minimal:

> **5 transformation rules**

Wajib ada:

- 1 standardization;
- 1 derived field;
- 1 mapping;
- 1 format conversion jika relevan;
- 1 quality-related treatment.

---

# 62. Aktivitas H – Final Model Update

Perbarui Star Schema dan specifications jika Unit 2.5 mengubah keputusan desain.

---

# 63. Aktivitas I – ETL Readiness Matrix

| Design Component | Ready? | Evidence | Issue |
|---|:---:|---|---|
| Grain | Yes | Unit 2.1 | — |
| Dimension Spec | Yes | Unit 2.3 | — |
| Fact Spec | Yes | Unit 2.4 | — |
| SCD Rules | Yes | Unit 2.5 | — |
| Quality Rules | Yes | Unit 2.5 | — |
| Transformation Rules | Yes | Unit 2.5 | — |

---

# 64. RTM 3 v1.0 FINAL

Final **Dimensional Design Package**:

1. Analytical Question Selection;
2. Business Process Register;
3. Grain Statements;
4. Business Process Matrix;
5. Bus Matrix;
6. Conceptual Star Schema;
7. Dimension Specifications;
8. Attribute Dictionary;
9. Fact Specifications;
10. Measure Dictionary;
11. Additivity Matrix;
12. Grain–Measure Compatibility Matrix;
13. SCD Decision Matrix;
14. Historical Requirement Statement;
15. Data Quality Rulebook;
16. Severity & Treatment Register;
17. Canonical Mapping;
18. Integration Rules;
19. Transformation Rules;
20. Validation Rules;
21. Requirement–Model Traceability;
22. ETL Readiness Matrix;
23. CT Reflection.

---

# 65. CT Reflection Unit 2.5

Jawab:

1. Perubahan atribut mana yang paling sulit dibedakan antara koreksi dan histori?
2. Mengapa tidak semua perubahan menggunakan Type 2?
3. Data quality issue apa yang paling berbahaya?
4. Apa contoh data yang valid tetapi belum tentu accurate?
5. Mengapa duplicate tidak boleh langsung dihapus?
6. Apa manfaat canonical mapping?
7. Bagaimana integration rule berbeda dari transformation rule?
8. Bagaimana Unit 2.5 mempersiapkan ETL?
9. Bagaimana Evaluation dan Abstraction digunakan dalam keputusan Anda?

---

# 66. Luaran Wajib Unit 2.5

Mahasiswa menyerahkan:

1. Change Scenario Register;
2. Historical Requirement Statement;
3. SCD Decision Matrix;
4. Data Quality Rulebook;
5. Severity & Treatment Register;
6. Canonical Mapping Register;
7. Integration Rules;
8. Transformation Rules;
9. Validation Rules;
10. Updated Dimensional Model;
11. ETL Readiness Matrix;
12. Requirement–Model Traceability Final;
13. CT Reflection;
14. RTM 3 v1.0 FINAL.

---

# 67. Target Minimal

| Komponen | Minimum |
|---|---:|
| Change Scenarios | 5 |
| SCD Decisions | 5 |
| Type 1 Cases | ≥ 1 |
| Type 2 Cases | ≥ 1 |
| Data Quality Rules | 10 |
| Treatment Decisions | 5 |
| Canonical Mapping Rows | 5 |
| Integration Rules | 5 |
| Transformation Rules | 5 |
| Validation Rules | 5 |
| ETL Readiness Matrix | 1 |
| CT Reflection | 1 |

---

# 68. Checkpoint Dosen

| Check | Status |
|---|:---:|
| Historical requirement jelas | ☐ |
| SCD Type 1/2 justified | ☐ |
| Quality rules dapat diuji | ☐ |
| Severity konsisten | ☐ |
| Treatment sesuai issue | ☐ |
| Canonical mapping terdokumentasi | ☐ |
| Integration rules jelas | ☐ |
| Transformation rules jelas | ☐ |
| Validation rules tersedia | ☐ |
| Traceability lengkap | ☐ |
| ETL readiness tercapai | ☐ |

---

# 69. FINAL DESIGN GATE – MODUL 2

Mahasiswa hanya dapat masuk ke Modul 3 jika:

- Business Process jelas;
- Grain eksplisit;
- Star Schema valid;
- Dimension Specification lengkap;
- Fact Specification lengkap;
- Measure sesuai grain;
- Additivity dianalisis;
- SCD strategy jelas;
- Data Quality Rules tersedia;
- Integration Rules tersedia;
- Transformation Rules tersedia;
- Validation Rules tersedia;
- Traceability lengkap.

Status:

```text
READY FOR ETL
atau
REVISE DESIGN
```

---

# 70. Kondisi REVISE DESIGN

Model harus direvisi jika:

- grain ambigu;
- fact mencampur grain;
- measure tidak compatible;
- SCD dipilih tanpa historical requirement;
- data quality issue tidak memiliki treatment;
- canonical mapping tidak jelas;
- integration key bermasalah;
- transformation rule tidak dapat diuji;
- model tidak traceable ke AQ.

---

# 71. Penilaian Unit 2.5

| Aspek | Bobot |
|---|---:|
| Historical Requirement | 10% |
| SCD Decision | 20% |
| Data Quality Rulebook | 20% |
| Severity & Treatment | 15% |
| Canonical Mapping | 10% |
| Integration Rules | 10% |
| Transformation & Validation Rules | 10% |
| Traceability + CT Reflection | 5% |
| **Total** | **100%** |

---

# 72. Exit Reflection

1. Apa perbedaan koreksi data dan perubahan historis?
2. Kapan SCD Type 1 digunakan?
3. Kapan SCD Type 2 digunakan?
4. Mengapa surrogate key penting untuk Type 2?
5. Apa beda validity dan accuracy?
6. Apa yang dimaksud canonical value?
7. Apa beda integration rule dan transformation rule?
8. Mengapa treatment harus ditentukan sebelum ETL?

---

# 73. Jembatan ke Modul 3

Unit 2.5 menghasilkan:

```text
WHAT SHOULD HAPPEN
```

Modul 3 menghasilkan:

```text
HOW IT IS IMPLEMENTED
```

Contoh:

```text
Unit 2.5:
TI → Teknologi Informasi

Modul 3:
SQL / Python / ETL mapping
```

---

# 74. Kesiapan Modul 2

```text
MODUL 1
UNDERSTAND
      ↓
MODUL 2
DESIGN
      ↓
RTM 3 v1.0
      ↓
DESIGN GATE
      ↓
MODUL 3
BUILD
```

Mahasiswa telah menghasilkan:

> **desain Data Warehouse yang siap diterjemahkan menjadi proses ETL dan implementasi fisik.**

---

# 75. Checklist Akhir Mahasiswa

- [ ] Saya mengidentifikasi perubahan atribut.
- [ ] Saya membedakan correction dan historical change.
- [ ] Saya membuat minimal 5 SCD decisions.
- [ ] Saya memiliki minimal 1 Type 1 dan 1 Type 2.
- [ ] Saya membuat minimal 10 Data Quality Rules.
- [ ] Saya mengklasifikasikan severity.
- [ ] Saya membuat treatment untuk issue utama.
- [ ] Saya membuat canonical mapping.
- [ ] Saya membuat minimal 5 integration rules.
- [ ] Saya membuat minimal 5 transformation rules.
- [ ] Saya membuat validation rules.
- [ ] Saya memperbarui dimensional model.
- [ ] Saya membuat ETL Readiness Matrix.
- [ ] Saya menyelesaikan Requirement–Model Traceability.
- [ ] Saya menyelesaikan CT Reflection.
- [ ] Saya memfinalisasi RTM 3 v1.0.
- [ ] Status desain saya READY FOR ETL atau saya mencatat revisi yang diperlukan.

---

# 76. Prinsip Penutup

> **Not every change is history.**

> **Not every anomaly is an error.**

> **Validity is not the same as accuracy.**

> **Data quality rules must be explicit, measurable, and testable.**

> **Integration requires shared business meaning, not merely matching column names.**

> **Transformation rules must be designed before they are coded.**

> **ETL should implement design decisions, not invent them.**
