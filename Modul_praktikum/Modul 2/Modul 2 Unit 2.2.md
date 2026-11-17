# MODUL PRAKTIKUM 2
## Unit 2.2 – Star Schema & Dimensional Model
### Mata Kuliah Data Warehouse
### Studi Kasus: UADW v1.0

---

## 1. Identitas Unit

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Modul:** 2 – Dimensional Modeling & Data Quality  
**Unit:** 2.2 – Star Schema & Dimensional Model  
**Pertemuan Utama:** Pertemuan 4  
**Fase Pembelajaran:** DESIGN  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning  
**Studi Kasus:** University Academic Data Warehouse (UADW) v1.0  
**RTM:** RTM 3 – Abstraction / Dimensional Modeling, versi 0.1  

---

# 2. Posisi Unit dalam Alur Pembelajaran

Unit 2.2 merupakan kelanjutan langsung dari Unit 2.1.

Pada Unit 2.1 mahasiswa telah menghasilkan:

- Analytical Question yang dipilih;
- Business Process Register;
- Business Event Description;
- Grain Statement;
- Grain Validation;
- Requirement–Process–Grain Traceability.

Unit 2.2 menjawab pertanyaan:

> **Jika business process dan grain sudah jelas, bagaimana kebutuhan analitik tersebut direpresentasikan menjadi conceptual dimensional model?**

Alur:

```text
UNIT 1.3
Analytical Requirement
        ↓
UNIT 2.1
Business Process
        ↓
Validated Grain
        ↓
UNIT 2.2
Candidate Dimensions
        ↓
Candidate Fact
        ↓
Candidate Measures
        ↓
Conceptual Star Schema
        ↓
Initial Bus Matrix
```

---

# 3. CPMK dan Sub-CPMK

## CPMK-3

Mahasiswa mampu:

> **Merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya.**

## Sub-CPMK 4

Mahasiswa mampu:

> **Merancang model dimensional berdasarkan business process, grain, dimension, fact, dan measure untuk memenuhi kebutuhan analitik organisasi.**

Unit 2.2 terutama berfokus pada langkah:

1. Identify Dimensions;
2. Identify Facts;
3. Identify Candidate Measures;
4. Build Conceptual Star Schema.

---

# 4. Capaian Praktikum Unit 2.2

Setelah menyelesaikan Unit 2.2, mahasiswa diharapkan mampu:

1. mengidentifikasi candidate dimensions dari grain dan kebutuhan analitik;
2. membedakan dimension, fact, dan measure secara konseptual;
3. memilih candidate fact yang merepresentasikan business process;
4. menentukan candidate measures tanpa terlalu dini menetapkan implementasi fisik;
5. menggambar conceptual Star Schema;
6. membandingkan Star Schema dan Snowflake Schema pada level konseptual;
7. membangun initial Bus Matrix lintas business process;
8. mengidentifikasi kandidat conformed dimension;
9. memastikan setiap elemen model traceable ke analytical requirement;
10. menerapkan Computational Thinking terutama **Abstraction**.

---

# 5. Fokus Computational Thinking

Fokus utama:

# ABSTRACTION

Mahasiswa harus mampu mengubah source yang kompleks menjadi struktur analitik yang lebih sederhana.

Contoh:

```text
SOURCE
mahasiswa
nilai
krs
mata_kuliah
program_studi
dosen
semester

        ↓ ABSTRACTION

BUSINESS PROCESS
Penilaian

        ↓

GRAIN
Satu nilai akhir mahasiswa
per mata kuliah per semester

        ↓

DIMENSIONAL CONCEPTS
Mahasiswa
Mata Kuliah
Semester
Dosen
Fact_Nilai
```

Abstraction berarti:

> **mempertahankan struktur yang relevan terhadap analisis dan mengabaikan detail teknis source yang belum diperlukan.**

---

# 6. Prasyarat

Sebelum memulai Unit 2.2, mahasiswa wajib memiliki hasil Unit 2.1 yang berstatus:

> **PASS**

Minimal tersedia:

- 5 Analytical Questions;
- 3 Business Processes;
- 3 Grain Statements;
- 2 SQL Grain Verification;
- Process–Grain Traceability;
- CT Reflection.

Jika grain belum valid, jangan lanjut ke Unit 2.2.

---

# 7. Perangkat yang Digunakan

Gunakan:

1. UADW v1.0 Student Dataset;
2. Data Dictionary UADW v1.0;
3. Requirement Workbook Unit 1.3;
4. output Unit 2.1;
5. Data Profiling Workbook Unit 1.2;
6. diagrams.net / Draw.io atau aplikasi diagram setara;
7. spreadsheet/workbook Modul 2 untuk dokumentasi.

SQL boleh digunakan untuk verifikasi source, tetapi tidak untuk implementasi schema target.

---

# 8. Prinsip Kerja Unit 2.2

Gunakan prinsip berikut.

## Prinsip 1 – Grain Controls the Model

Setiap dimension dan fact harus konsisten dengan grain.

---

## Prinsip 2 – Model the Business, Not the Source

Jangan membuat satu dimension untuk setiap source table.

---

## Prinsip 3 – Fact = Business Event

Candidate Fact harus merepresentasikan business process.

---

## Prinsip 4 – Dimension = Analytical Context

Dimension membantu menjawab:

- siapa;
- apa;
- kapan;
- di mana;
- dalam konteks apa.

---

## Prinsip 5 – Traceability Required

Setiap model harus dapat ditelusuri kembali ke Analytical Question.

---

# 9. Review Kimball Four-Step

Empat langkah:

```text
STEP 1
Select Business Process
        ↓
STEP 2
Declare Grain
        ↓
STEP 3
Identify Dimensions
        ↓
STEP 4
Identify Facts
```

Unit 2.1 menutup Step 1–2.

Unit 2.2 melanjutkan Step 3–4.

---

# 10. STEP 3 – Identify Dimensions

Gunakan pertanyaan:

> **Berdasarkan konteks apa business event ini ingin dianalisis?**

Untuk grain:

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

Candidate dimensions:

- Mahasiswa;
- Mata Kuliah;
- Semester;
- Dosen;
- Program Studi, jika requirement memerlukan analisis eksplisit pada level tersebut.

---

# 11. Dimension sebagai Analytical Context

Dimension umumnya menjawab:

```text
WHO?
Mahasiswa

WHAT?
Mata Kuliah

WHEN?
Semester / Waktu

WHO DELIVERED?
Dosen

ORGANIZATIONAL CONTEXT?
Program Studi
```

Pada tahap ini mahasiswa belum menentukan detail:

- data type;
- surrogate key;
- SCD implementation;
- DDL.

Itu dibahas pada Unit 2.3.

---

# 12. Candidate Dimension Register

Gunakan tabel:

| Dimension | Business Meaning | Supported AQ | Candidate Source | Reason |
|---|---|---|---|---|
| Mahasiswa | Konteks mahasiswa | AQ-01, AQ-02 | mahasiswa | Analisis berdasarkan angkatan/prodi |
| Mata Kuliah | Konteks mata kuliah | AQ-01 | mata_kuliah | Analisis failure per MK |
| Semester | Konteks waktu akademik | AQ-01, AQ-02 | semester | Analisis tren |
| Dosen | Konteks pengajar | AQ tertentu | dosen | Analisis berdasarkan pengampu |

---

# 13. Bagaimana Menentukan Candidate Dimension

Untuk setiap grain, gunakan pertanyaan:

1. Siapa yang terlibat?
2. Apa objek yang terkait?
3. Kapan event terjadi?
4. Di mana/organisasi mana event terjadi?
5. Siapa pihak lain yang relevan?
6. Konteks apa yang digunakan untuk filter atau grouping?

Jika suatu item hanya merupakan nilai yang diukur, itu mungkin measure, bukan dimension.

---

# 14. Dimension Bukan Semua Source Table

Kesalahan umum:

```text
Ada tabel program_studi
→ harus menjadi Dim_Program_Studi
```

Belum tentu.

Pertanyaan yang benar:

> Apakah Program Studi diperlukan sebagai analytical context?

Jika ya, lalu pertimbangkan apakah:

- dimension terpisah;
- atribut dalam Dim_Mahasiswa;
- atau struktur lain yang lebih tepat.

Keputusan detail dibuat pada Unit 2.3.

---

# 15. STEP 4 – Identify Candidate Fact

Candidate Fact merepresentasikan:

> **kejadian bisnis pada grain yang sudah ditetapkan.**

Contoh:

Business Process:

> Penilaian.

Grain:

> Satu nilai akhir mahasiswa per mata kuliah per semester.

Candidate Fact:

> `Fact_Nilai`

---

# 16. Fact ≠ Source Table

Jangan berasumsi:

```text
source nilai
=
Fact_Nilai
```

secara otomatis.

Candidate Fact ditetapkan karena:

- business process = Penilaian;
- grain telah ditentukan;
- analytical requirement memerlukan kejadian tersebut.

Source hanya menyediakan data.

---

# 17. Candidate Fact Register

Gunakan tabel:

| Fact Candidate | Business Process | Grain | Supported AQ | Main Source |
|---|---|---|---|---|
| Fact_Nilai | Penilaian | Satu nilai akhir mahasiswa per MK per semester | AQ-01, AQ-02 | nilai |
| Fact_Pembayaran | Pembayaran | Satu transaksi pembayaran mahasiswa | AQ-03 | pembayaran |
| Fact_Kelulusan | Kelulusan | Satu kejadian kelulusan mahasiswa | AQ-04 | kelulusan |

---

# 18. Candidate Measures

Measure menjawab:

> **Apa yang dapat diukur dari business event?**

Contoh candidate measures untuk Penilaian:

- nilai angka;
- indikator lulus;
- jumlah record;
- SKS, jika dibutuhkan analisis.

Pada Unit 2.2:

> candidate measure belum diklasifikasikan secara detail berdasarkan additivity.

Additivity dibahas pada Unit 2.4.

---

# 19. Candidate Measure Register

Gunakan format:

| Measure | Business Meaning | Related AQ | Source/Derivation | Status |
|---|---|---|---|---|
| nilai_angka | Nilai akhir | AQ-02 | nilai.nilai_angka | Candidate |
| is_lulus | Status lulus numerik | AQ-01 | Derived | Candidate |
| nominal | Nilai pembayaran | AQ-03 | pembayaran.nominal | Candidate |

---

# 20. Fact vs Measure

Perbedaan:

## Fact Table

Merepresentasikan business event pada grain tertentu.

## Measure

Nilai yang dianalisis dari event tersebut.

Contoh:

```text
Fact_Nilai
   ├── mahasiswa
   ├── mata_kuliah
   ├── semester
   └── nilai_angka
```

`Fact_Nilai` = candidate Fact Table.

`nilai_angka` = candidate Measure.

---

# 21. Conceptual Star Schema

Star Schema memiliki:

- satu Fact di pusat;
- Dimension mengelilingi Fact;
- hubungan langsung Dimension → Fact.

Contoh conceptual:

```text
               Dim_Mahasiswa
                     |
                     |
Dim_MataKuliah — Fact_Nilai — Dim_Semester
                     |
                     |
                 Dim_Dosen
```

Pada tahap Unit 2.2, diagram belum memerlukan:

- semua atribut;
- data type;
- PK/FK detail;
- SCD fields.

---

# 22. Mengapa Star Schema Menjadi Default

Star Schema dipilih sebagai default proyek UADW karena:

- mudah dipahami mahasiswa;
- sesuai kebutuhan analitik;
- query lebih sederhana;
- cocok untuk BI;
- mendukung komunikasi dengan stakeholder;
- mengurangi kompleksitas join dibanding model sangat normalized.

---

# 23. Star Schema vs Snowflake Schema

| Aspek | Star | Snowflake |
|---|---|---|
| Dimension | Lebih denormalized | Lebih normalized |
| JOIN | Lebih sedikit | Lebih banyak |
| Query | Lebih sederhana | Lebih kompleks |
| Keterbacaan | Tinggi | Lebih rendah |
| Redundancy | Lebih tinggi | Lebih rendah |

Dalam Unit 2.2:

> Star Schema adalah default.

Snowflake digunakan hanya jika mahasiswa memiliki alasan desain yang dapat dipertanggungjawabkan.

---

# 24. Kapan Snowflake Dipertimbangkan?

Snowflake dapat dipertimbangkan jika:

- hierarchy dimension kompleks;
- atribut referensi sangat besar;
- terdapat kebutuhan governance tertentu;
- reuse struktur tertentu memberikan manfaat nyata.

Jawaban:

> “karena lebih normalized”

tidak cukup sebagai alasan.

---

# 25. Studi Kasus UADW – Penilaian

Gunakan:

### Analytical Question
> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi setiap semester?

### Business Process
Penilaian.

### Grain
Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

### Candidate Dimensions
- Mahasiswa;
- Mata Kuliah;
- Semester;
- Dosen.

### Candidate Fact
Fact_Nilai.

### Candidate Measures
- nilai_angka;
- is_lulus.

---

# 26. Draft Conceptual Schema – Penilaian

```text
                  Dim_Mahasiswa
                        |
                        |
Dim_MataKuliah —— Fact_Nilai —— Dim_Semester
                        |
                        |
                    Dim_Dosen
```

Mahasiswa harus dapat menjelaskan:

- mengapa setiap Dimension diperlukan;
- Analytical Question apa yang didukung;
- apa arti Fact_Nilai;
- apa grain model tersebut.

---

# 27. Requirement–Model Traceability

Gunakan:

| AQ | Process | Grain | Dimension | Fact | Measure |
|---|---|---|---|---|---|
| AQ-01 | Penilaian | Nilai mahasiswa per MK per semester | Mahasiswa, MK, Semester | Fact_Nilai | is_lulus |
| AQ-02 | Penilaian | Nilai mahasiswa per MK per semester | Mahasiswa, MK, Semester, Prodi | Fact_Nilai | nilai_angka |

Tujuan:

> membuktikan bahwa model dibangun dari requirement.

---

# 28. Satu Business Process, Banyak Analytical Questions

Contoh:

```text
AQ-01 Failure Rate
AQ-02 Average Grade
AQ-03 Grade Trend
```

dapat menggunakan:

```text
Business Process = Penilaian
Fact Candidate = Fact_Nilai
```

Ini lebih baik daripada membuat:

```text
Fact_Failure
Fact_Average_Grade
Fact_Trend
```

tanpa kebutuhan.

---

# 29. Satu Analytical Question Bisa Melibatkan Banyak Konteks

Contoh:

> Bagaimana rata-rata nilai berdasarkan program studi, mata kuliah, dan semester?

Candidate dimensions:

- Mahasiswa;
- Program Studi;
- Mata Kuliah;
- Semester.

Tetapi mahasiswa harus mengevaluasi:

> Apakah Program Studi menjadi dimension tersendiri atau bagian dari Dimension lain?

Detail diputuskan pada Unit 2.3.

---

# 30. Pengantar Bus Matrix

Bus Matrix membantu melihat hubungan:

> Business Process × Shared Dimensions.

Contoh:

| Business Process | Mahasiswa | Mata Kuliah | Prodi | Waktu | Dosen |
|---|:---:|:---:|:---:|:---:|:---:|
| KRS | ✓ | ✓ | ✓ | ✓ | |
| Penilaian | ✓ | ✓ | ✓ | ✓ | ✓ |
| Pembayaran | ✓ | | ✓ | ✓ | |
| Kelulusan | ✓ | | ✓ | ✓ | |

---

# 31. Fungsi Bus Matrix

Bus Matrix membantu:

1. melihat dimension yang dipakai lintas process;
2. menemukan kandidat conformed dimension;
3. menjaga konsistensi enterprise Data Warehouse;
4. merencanakan pengembangan bertahap;
5. menghindari desain isolated data mart.

---

# 32. Candidate Conformed Dimension

Jika sebuah dimension digunakan pada banyak process, ia menjadi kandidat conformed dimension.

Contoh:

```text
Dim_Mahasiswa
```

dapat digunakan oleh:

- Fact_KRS;
- Fact_Nilai;
- Fact_Pembayaran;
- Fact_LMS;
- Fact_Kelulusan.

Pada Unit 2.2 cukup:

> identifikasi kandidat.

Detail conformance dibahas pada Unit 2.3.

---

# 33. Aktivitas A – Candidate Dimension Identification

Ambil minimal **3 business process** dari Unit 2.1.

Untuk masing-masing:

1. tulis grain;
2. identifikasi candidate dimensions;
3. jelaskan business meaning;
4. sebutkan AQ yang didukung;
5. sebutkan source kandidat.

Target:

> minimal 3 dimensions per process, jika relevan.

---

# 34. Aktivitas B – Candidate Fact Identification

Untuk minimal **3 business process**:

1. tentukan candidate Fact;
2. pastikan Fact merepresentasikan event;
3. pastikan sesuai grain;
4. hubungkan dengan AQ;
5. hubungkan dengan source.

---

# 35. Aktivitas C – Candidate Measure Identification

Untuk setiap Fact:

1. identifikasi nilai yang ingin dianalisis;
2. pisahkan numeric code dari measure;
3. tandai measure yang derived;
4. hindari klasifikasi additivity terlalu dini.

Minimal:

> 2 candidate measures per Fact jika tersedia.

Factless business event tetap dapat didokumentasikan jika tidak memiliki measure numerik.

---

# 36. Aktivitas D – Build Conceptual Star Schema

Pilih minimal **1 business process utama**.

Buat diagram:

- Fact di tengah;
- Dimensions di sekeliling;
- nama model jelas;
- grain dicantumkan sebagai catatan;
- tidak perlu atribut detail.

File dapat dibuat menggunakan:

- diagrams.net;
- PowerPoint;
- aplikasi diagram setara.

---

# 37. Aktivitas E – Star vs Snowflake Evaluation

Untuk model utama:

Jawab:

1. Apakah Star Schema sudah cukup?
2. Dimension mana yang berpotensi dinormalisasi?
3. Apa manfaat snowflaking?
4. Apa konsekuensinya terhadap query?
5. Apa pilihan final Anda?

Default:

> Star Schema.

Jika memilih Snowflake, wajib memberikan justification.

---

# 38. Aktivitas F – Initial Bus Matrix

Masukkan minimal **3 business process**.

Contoh kolom candidate dimensions:

- Mahasiswa;
- Mata Kuliah;
- Program Studi;
- Waktu;
- Dosen.

Tandai dengan:

```text
✓
```

jika process menggunakan dimension tersebut.

---

# 39. Aktivitas G – Requirement–Model Traceability

Minimal 5 Analytical Questions harus dipetakan sampai:

```text
AQ
↓
Business Process
↓
Grain
↓
Dimensions
↓
Fact
↓
Candidate Measure
```

Tidak boleh ada Fact yang tidak mempunyai requirement justification.

---

# 40. Aktivitas H – Model Review

Gunakan pertanyaan:

1. Apakah Fact benar-benar event?
2. Apakah setiap Dimension merupakan analytical context?
3. Apakah grain masih konsisten?
4. Apakah ada source table yang dipaksakan menjadi Dimension?
5. Apakah ada duplicate conceptual dimension?
6. Apakah candidate measure sesuai kebutuhan AQ?
7. Apakah model terlalu normalized?
8. Apakah model terlalu kompleks untuk kebutuhan saat ini?

---

# 41. Anti-Pattern 1 – Source-to-Star Copy

Contoh salah:

```text
mahasiswa.csv → Dim_Mahasiswa
nilai.csv → Fact_Nilai
krs.csv → Dim_KRS
semester.csv → Dim_Semester
```

tanpa reasoning.

Masalah:

> desain hanya menyalin source.

Perbaikan:

> mulai dari process + grain + analytical context.

---

# 42. Anti-Pattern 2 – One Question, One Fact

Contoh:

```text
AQ failure rate → Fact_Failure
AQ average grade → Fact_Average
AQ grade trend → Fact_Trend
```

Padahal ketiganya berasal dari process yang sama.

Perbaikan:

> konsolidasikan berdasarkan business process dan grain.

---

# 43. Anti-Pattern 3 – Entity as Fact

Contoh salah:

> Fact_Mahasiswa

jika hanya menyimpan atribut deskriptif mahasiswa.

Mahasiswa lebih tepat menjadi dimension apabila berfungsi sebagai konteks.

Namun bisa ada snapshot fact dengan grain mahasiswa-per-semester jika business process memang memerlukan.

---

# 44. Anti-Pattern 4 – Measure as Dimension

Contoh salah:

```text
Dim_Nilai_85
```

Nilai angka biasanya measure, bukan dimension.

Kategori nilai dapat menjadi atribut atau dimension tertentu jika requirement membenarkan.

---

# 45. Anti-Pattern 5 – Over-Snowflaking

Contoh:

```text
Dim_Mahasiswa
↓
Dim_Prodi
↓
Dim_Fakultas
↓
Dim_Universitas
```

dibuat hanya demi normalisasi.

Pertanyaan:

> apakah kompleksitas tambahan memberi nilai analitik?

Jika tidak:

> jangan dilakukan.

---

# 46. SQL sebagai Evidence Pendukung

SQL dapat digunakan untuk memahami source context.

Contoh:

```sql
SELECT
    kode_mk,
    COUNT(DISTINCT nim) AS jumlah_mahasiswa
FROM nilai
GROUP BY kode_mk;
```

Tujuan:

> memahami pola business event.

Bukan:

> membuat final dimensional model dari hasil query tersebut.

---

# 47. Hubungan dengan Data Profiling

Temuan Unit 1.2 dapat memengaruhi kandidat model.

Contoh:

```text
prodi_raw memiliki banyak variasi label
```

Tetapi pada Unit 2.2:

> Program Studi tetap dapat menjadi analytical context.

Masalah label ditangani:

- Unit 2.3 pada dimension specification;
- Unit 2.5 pada canonical mapping.

---

# 48. Hubungan dengan Data Fitness

Jika source berstatus:

> CONDITIONALLY READY

model masih dapat dirancang.

Catat:

```text
Model Element:
Dim_Program_Studi

Source:
prodi_raw

Data Fitness:
Conditionally Ready

Reason:
Inconsistent labels

Required Treatment:
Canonical mapping
```

---

# 49. RTM 3 v0.1 – Finalisasi Tahap P4

Unit 2.1 + Unit 2.2 membentuk:

# RTM 3 v0.1

Isi:

1. Analytical Scope;
2. Business Process Register;
3. Grain Statements;
4. Candidate Dimension Register;
5. Candidate Fact Register;
6. Candidate Measure Register;
7. Conceptual Star Schema;
8. Initial Bus Matrix;
9. Requirement–Model Traceability;
10. CT Reflection.

---

# 50. CT Reflection Unit 2.2

Jawab:

1. Bagaimana Anda menyederhanakan beberapa source menjadi satu business process?
2. Bagaimana grain membantu menentukan dimension?
3. Apa dimension yang paling sulit diklasifikasikan?
4. Adakah source table yang akhirnya tidak menjadi Fact maupun Dimension? Jelaskan.
5. Mengapa Star Schema dipilih sebagai baseline?
6. Apa potensi conformed dimension yang ditemukan?

---

# 51. Luaran Wajib Unit 2.2

Mahasiswa menyerahkan:

1. Candidate Dimension Register;
2. Candidate Fact Register;
3. Candidate Measure Register;
4. Conceptual Star Schema;
5. Star vs Snowflake Evaluation;
6. Initial Bus Matrix;
7. Requirement–Model Traceability;
8. CT Reflection;
9. RTM 3 v0.1 update.

---

# 52. Target Minimal

| Komponen | Minimum |
|---|---:|
| Business Process dimodelkan | 3 |
| Candidate Dimensions | ≥ 3 per process jika relevan |
| Candidate Facts | 3 |
| Candidate Measures | ≥ 2 per fact jika relevan |
| Conceptual Star Schema | 1 utama |
| Initial Bus Matrix | 1 |
| AQ Traceability | 5 |
| CT Reflection | 1 |

---

# 53. Kriteria Conceptual Star Schema yang Baik

Model yang baik:

- Fact berada di pusat;
- grain jelas;
- Dimension merepresentasikan analytical context;
- hubungan mudah dibaca;
- tidak menunjukkan implementasi yang belum diperlukan;
- mampu menjawab AQ;
- tidak sekadar menyalin source schema.

---

# 54. Contoh Jawaban Berkualitas

> “Fact_Nilai dipilih karena business process yang dianalisis adalah penilaian mahasiswa. Grain adalah satu nilai akhir seorang mahasiswa untuk satu mata kuliah pada satu semester. Dim_Mahasiswa, Dim_MataKuliah, dan Dim_Semester diperlukan karena ketiganya menjadi konteks utama untuk menjawab AQ mengenai failure rate dan tren nilai. Dim_Dosen ditambahkan hanya untuk AQ yang membutuhkan analisis berdasarkan pengampu.”

Jawaban lemah:

> “Saya membuat Fact_Nilai karena ada tabel nilai dan Dim_Mahasiswa karena ada tabel mahasiswa.”

Masalah:

- source-driven;
- tidak menunjukkan requirement;
- tidak menyebut grain;
- tidak menunjukkan analytical context.

---

# 55. Checkpoint Dosen

Sebelum lanjut Unit 2.3:

| Check | Status |
|---|:---:|
| Grain sudah PASS Unit 2.1 | ☐ |
| Dimensions adalah analytical context | ☐ |
| Fact merepresentasikan event | ☐ |
| Measures relevan dengan AQ | ☐ |
| Star Schema traceable ke requirement | ☐ |
| Bus Matrix tersedia | ☐ |
| Candidate conformed dimension teridentifikasi | ☐ |
| Tidak over-snowflake | ☐ |

---

# 56. Design Gate Unit 2.2

Status:

```text
PASS
REVISE
```

Mahasiswa belum boleh merancang Dimension Table secara detail jika:

- grain belum konsisten;
- Fact tidak jelas;
- Dimension hanya meniru source;
- Star Schema tidak dapat menjawab AQ;
- model mempunyai multiple grain yang tercampur;
- Bus Matrix tidak konsisten dengan model.

---

# 57. Penilaian Unit 2.2

Rekomendasi:

| Aspek | Bobot |
|---|---:|
| Candidate Dimension Identification | 20% |
| Candidate Fact Identification | 20% |
| Candidate Measure Identification | 10% |
| Conceptual Star Schema | 25% |
| Bus Matrix | 10% |
| Requirement–Model Traceability | 10% |
| CT Reflection | 5% |
| **Total** | **100%** |

Nilai dapat dikonversi ke bobot Modul 2.

---

# 58. Exit Reflection

### Pertanyaan 1
Mengapa Dimension tidak boleh ditentukan hanya berdasarkan source table?

### Pertanyaan 2
Apa hubungan grain dengan candidate Fact?

### Pertanyaan 3
Apa perbedaan Fact dan Measure?

### Pertanyaan 4
Mengapa beberapa AQ dapat menggunakan satu Fact yang sama?

### Pertanyaan 5
Apa fungsi Bus Matrix?

### Pertanyaan 6
Mengapa Star Schema menjadi baseline proyek UADW?

---

# 59. Jembatan ke Unit 2.3

Unit 2.2 menghasilkan:

```text
Validated Grain
        ↓
Candidate Dimensions
        ↓
Candidate Fact
        ↓
Candidate Measures
        ↓
Conceptual Star Schema
        ↓
Initial Bus Matrix
```

Unit 2.3 akan menjawab:

> **Bagaimana setiap candidate dimension dirancang secara detail agar memiliki key, attributes, hierarchy, dan definisi bisnis yang konsisten?**

Fokus berikutnya:

```text
Dimension Candidate
      ↓
Business Purpose
      ↓
Natural Key
      ↓
Surrogate Key
      ↓
Attributes
      ↓
Hierarchy
      ↓
Conformance
      ↓
Dimension Specification
```

---

# 60. Checklist Akhir Mahasiswa

Sebelum submit:

- [ ] Semua business process berasal dari Unit 2.1.
- [ ] Grain tidak diubah tanpa alasan.
- [ ] Saya mengidentifikasi candidate dimensions berdasarkan analytical context.
- [ ] Saya mengidentifikasi candidate Fact berdasarkan business event.
- [ ] Saya mengidentifikasi candidate measures berdasarkan kebutuhan analitik.
- [ ] Saya tidak menggunakan numeric code sebagai measure.
- [ ] Saya membuat minimal satu Conceptual Star Schema.
- [ ] Saya mengevaluasi Star vs Snowflake.
- [ ] Saya membuat Initial Bus Matrix.
- [ ] Saya mengidentifikasi candidate conformed dimension.
- [ ] Semua model traceable ke AQ.
- [ ] Saya belum membuat DDL final.
- [ ] Saya belum menentukan detail SCD.
- [ ] Saya menyelesaikan CT Reflection.
- [ ] Model siap dikembangkan pada Unit 2.3.

---

# 61. Prinsip Penutup

> **The source tells us where data comes from; the business requirement tells us what the model should mean.**

> **Dimensions describe the context.**

> **Facts represent the business event.**

> **The grain controls both.**

> **A good Star Schema is simple enough to understand and strong enough to answer the analytical questions.**
