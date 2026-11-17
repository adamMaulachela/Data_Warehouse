# MODUL PRAKTIKUM 2
## Unit 2.1 – Business Process & Grain
### Mata Kuliah Data Warehouse
### Studi Kasus: UADW v1.0

---

## 1. Identitas Unit

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Modul:** 2 – Dimensional Modeling & Data Quality  
**Unit:** 2.1 – Business Process & Grain  
**Pertemuan Utama:** Pertemuan 4  
**Fase Pembelajaran:** DESIGN  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning  
**Studi Kasus:** University Academic Data Warehouse (UADW) v1.0  
**RTM:** RTM 3 – Abstraction / Dimensional Modeling, versi 0.1  

---

# 2. Posisi Unit dalam Alur Pembelajaran

Unit 2.1 merupakan jembatan langsung dari hasil analisis kebutuhan pada Modul 1 menuju proses perancangan dimensional pada Modul 2.

Alur pembelajaran:

```text
MODUL 1 – UNDERSTAND

Business Problem
      ↓
Stakeholder
      ↓
Analytical Question
      ↓
KPI / Metric
      ↓
Data Requirement
      ↓
Source Mapping
      ↓
Data Profiling
      ↓
Data Fitness
      ↓

MODUL 2 – DESIGN

Business Process
      ↓
DECLARE GRAIN
      ↓
Candidate Dimension
      ↓
Candidate Fact
      ↓
Conceptual Dimensional Model
```

Pertanyaan utama Unit 2.1 adalah:

> **Proses bisnis apa yang sebenarnya ingin dianalisis, dan apa arti tepat satu baris data analitik yang akan dibangun?**

Unit ini belum berfokus pada pembuatan tabel fisik atau implementasi SQL Data Warehouse.

---

# 3. CPMK dan Sub-CPMK

## CPMK-3

Mahasiswa mampu:

> **Merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya.**

## Sub-CPMK 4

Mahasiswa mampu:

> **Merancang model dimensional berdasarkan business process, grain, dimension, fact, dan measure untuk memenuhi kebutuhan analitik organisasi.**

Unit 2.1 terutama berfokus pada dua langkah awal:

1. **Select the Business Process**
2. **Declare the Grain**

---

# 4. Capaian Praktikum Unit 2.1

Setelah menyelesaikan Unit 2.1, mahasiswa diharapkan mampu:

1. menghubungkan analytical question dari Unit 1.3 dengan proses bisnis yang relevan;
2. membedakan business process, entity, dan source table;
3. memilih business process yang mempunyai nilai analitik;
4. menulis grain statement secara eksplisit;
5. mengevaluasi apakah grain sesuai dengan kebutuhan analitik;
6. mengidentifikasi risiko mixed grain dan double counting;
7. mendokumentasikan hubungan antara analytical question, business process, grain, dan source;
8. menerapkan Computational Thinking khususnya **Abstraction** dalam dimensional modeling.

---

# 5. Fokus Computational Thinking

Fokus utama Unit 2.1 adalah:

# ABSTRACTION

Pada Modul 1 mahasiswa melihat banyak source data seperti:

```text
mahasiswa
program_studi
mata_kuliah
semester
krs
nilai
aktivitas_lms
pembayaran
kelulusan
```

Pada Unit 2.1 mahasiswa tidak lagi bertanya:

> “Tabel apa saja yang tersedia?”

Tetapi:

> “Kejadian bisnis apa yang perlu dianalisis?”

Contoh:

```text
SOURCE TABLES
nilai + krs + mata_kuliah + mahasiswa + semester
        ↓
ABSTRACTION
Business Process = Penilaian
        ↓
Grain =
Satu nilai akhir mahasiswa
untuk satu mata kuliah
pada satu semester
```

Abstraction berarti menyederhanakan kerumitan source menjadi konsep bisnis yang penting bagi analisis.

---

# 6. Prasyarat

Sebelum mengerjakan Unit 2.1, mahasiswa wajib telah memiliki hasil Modul 1, terutama:

- Analytical Question Register;
- KPI/Metric Dictionary;
- Data Requirement;
- Source Mapping;
- Data Fitness Assessment;
- Candidate Grain;
- Candidate Dimension;
- Candidate Fact;
- Requirement Traceability Matrix;
- hasil Data Profiling Unit 1.2.

Mahasiswa **tidak diperkenankan memulai Unit 2.1 dengan kasus baru** tanpa persetujuan dosen.

---

# 7. Perangkat dan File yang Digunakan

Gunakan:

1. UADW v1.0 Student Dataset;
2. Data Dictionary UADW v1.0;
3. Requirement Workbook Unit 1.3;
4. Data Profiling Workbook Unit 1.2;
5. DBeaver / PostgreSQL untuk verifikasi source jika diperlukan;
6. diagrams.net atau aplikasi diagram setara untuk visualisasi sederhana.

Pada Unit 2.1 SQL hanya digunakan untuk **verifikasi pemahaman source**, bukan membangun schema Data Warehouse.

---

# 8. Prinsip Kerja Unit 2.1

Gunakan lima prinsip berikut.

## Prinsip 1 – Requirement Before Design

Model tidak boleh dibuat hanya karena suatu tabel tersedia.

Setiap keputusan harus dapat ditelusuri ke kebutuhan analitik.

---

## Prinsip 2 – Business Process Before Table

Jangan mulai dari:

> “Kita punya tabel `nilai`.”

Mulailah dari:

> “Kita ingin menganalisis proses penilaian mahasiswa.”

---

## Prinsip 3 – Grain Before Fact

Sebelum menentukan isi Fact Table, mahasiswa wajib menjawab:

> **Apa arti satu baris?**

---

## Prinsip 4 – One Fact, One Consistent Grain

Jangan mencampurkan level detail yang berbeda dalam satu kandidat Fact Table.

---

## Prinsip 5 – Justification Required

Jawaban tidak cukup berupa nama proses dan grain.

Setiap pilihan harus memiliki alasan.

---

# 9. Pengantar Business Process

Business process adalah kejadian atau aktivitas organisasi yang menghasilkan data dan relevan untuk dianalisis.

Contoh business process UADW:

- mahasiswa mengambil mata kuliah;
- mahasiswa memperoleh nilai;
- mahasiswa melakukan pembayaran;
- mahasiswa melakukan aktivitas di LMS;
- mahasiswa menyelesaikan studi.

Contoh yang **bukan** business process:

- mahasiswa;
- mata kuliah;
- program studi;
- dosen.

Item tersebut lebih tepat dipandang sebagai entity atau konteks analitik.

---

# 10. Entity vs Business Process

Perhatikan perbedaan berikut.

| Item | Kategori | Alasan |
|---|---|---|
| Mahasiswa | Entity | Menjelaskan siapa |
| Mata Kuliah | Entity | Menjelaskan apa yang dipelajari |
| Program Studi | Entity/Dimension candidate | Konteks organisasi |
| Penilaian | Business Process | Sebuah kejadian yang menghasilkan nilai |
| Pembayaran | Business Process | Sebuah transaksi |
| KRS | Business Process | Pengambilan mata kuliah |
| Kelulusan | Business Process | Kejadian penyelesaian studi |

---

# 11. Langkah Kerja Umum Unit 2.1

Gunakan urutan:

```text
STEP 1
Pilih Analytical Question
        ↓
STEP 2
Identifikasi Business Process
        ↓
STEP 3
Validasi Process vs Entity
        ↓
STEP 4
Identifikasi Business Event
        ↓
STEP 5
Declare Grain
        ↓
STEP 6
Validasi Grain
        ↓
STEP 7
Hubungkan Grain dengan Source
        ↓
STEP 8
Dokumentasikan Traceability
```

---

# 12. STEP 1 – Memilih Analytical Question

Ambil Analytical Question dari Unit 1.3.

Pilih pertanyaan yang:

- penting bagi stakeholder;
- jelas decision requirement-nya;
- mempunyai data source yang tersedia;
- memiliki nilai analitik;
- cukup layak untuk dikembangkan menjadi model dimensional.

Mahasiswa disarankan memilih minimal **3 Analytical Questions** untuk tahap eksplorasi awal.

---

# 13. Contoh Analytical Question UADW

Contoh:

### AQ-01
> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi setiap semester?

### AQ-02
> Bagaimana tren rata-rata nilai mahasiswa berdasarkan program studi dan semester?

### AQ-03
> Bagaimana tren pembayaran mahasiswa berdasarkan program studi dan semester?

### AQ-04
> Bagaimana tingkat kelulusan tepat waktu berdasarkan program studi dan angkatan?

### AQ-05
> Bagaimana pola aktivitas LMS mahasiswa sebelum dan sesudah periode ujian?

---

# 14. STEP 2 – Mengidentifikasi Business Process

Gunakan pertanyaan:

> **Kejadian bisnis apa yang menghasilkan data untuk menjawab analytical question ini?**

Contoh:

### AQ
> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi?

### Business Process
> **Penilaian mahasiswa**

Bukan:

> Mata Kuliah

karena Mata Kuliah adalah konteks analisis, bukan kejadian.

---

# 15. Business Process Mapping

Gunakan tabel:

| AQ ID | Analytical Question | Candidate Business Process | Justification |
|---|---|---|---|
| AQ-01 | Failure rate per MK dan semester | Penilaian | Nilai akhir menentukan lulus/gagal |
| AQ-03 | Tren pembayaran | Pembayaran | Pembayaran merupakan transaksi finansial |
| AQ-04 | Kelulusan tepat waktu | Kelulusan | Analisis berpusat pada penyelesaian studi |

---

# 16. STEP 3 – Memvalidasi Business Process

Gunakan checklist.

Sebuah kandidat business process seharusnya:

- merepresentasikan kejadian atau aktivitas;
- menghasilkan data;
- dapat memiliki waktu kejadian;
- dapat dianalisis berdasarkan beberapa konteks;
- berkaitan langsung dengan analytical question.

Jika kandidat hanya menjawab:

> Who? What? Where?

maka kemungkinan besar itu adalah dimension candidate, bukan business process.

---

# 17. STEP 4 – Mengidentifikasi Business Event

Business process dapat memiliki event yang lebih spesifik.

Contoh:

## Proses Penilaian

Event:

> nilai akhir mahasiswa diterbitkan untuk satu mata kuliah.

## Proses Pembayaran

Event:

> satu transaksi pembayaran dicatat.

## KRS

Event:

> mahasiswa mengambil satu mata kuliah pada satu periode akademik.

Business event membantu mahasiswa menulis grain secara lebih presisi.

---

# 18. Pengertian Grain

Grain adalah:

> **pernyataan eksplisit mengenai apa yang direpresentasikan oleh tepat satu baris pada Fact Table.**

Pertanyaan kunci:

> **What does one row represent?**

Grain bukan:

- nama tabel;
- nama business process;
- deskripsi data secara umum.

---

# 19. Contoh Grain yang Baik

## Penilaian

> **Satu nilai akhir seorang mahasiswa untuk satu mata kuliah pada satu semester.**

## KRS

> **Satu pengambilan mata kuliah oleh seorang mahasiswa pada satu semester.**

## Pembayaran

> **Satu transaksi pembayaran yang dilakukan seorang mahasiswa pada satu waktu transaksi.**

## Kelulusan

> **Satu kejadian kelulusan seorang mahasiswa.**

---

# 20. Contoh Grain yang Lemah

Hindari:

> Data nilai mahasiswa.

Masalah:

- tidak jelas satu row merepresentasikan apa;
- tidak jelas mata kuliah;
- tidak jelas periode;
- dapat memunculkan mixed grain.

Hindari:

> Satu mahasiswa.

Jika business process adalah pembayaran, satu mahasiswa dapat memiliki banyak transaksi.

---

# 21. Formula Menulis Grain Statement

Gunakan pola berikut jika sesuai:

> **Satu [business event] untuk satu [entity utama] pada satu [konteks transaksi/periode].**

Contoh:

> Satu nilai akhir untuk satu mahasiswa pada satu mata kuliah dan satu semester.

Atau:

> Satu transaksi pembayaran oleh satu mahasiswa pada satu tanggal transaksi.

Tidak semua grain harus menggunakan kalimat persis sama, tetapi makna satu baris harus tidak ambigu.

---

# 22. STEP 5 – Declare Grain

Untuk setiap business process, mahasiswa menulis minimal satu candidate grain.

Format:

| Business Process | Grain Statement |
|---|---|
| Penilaian | Satu nilai akhir mahasiswa untuk satu MK pada satu semester |
| Pembayaran | Satu transaksi pembayaran mahasiswa |
| KRS | Satu pengambilan MK oleh satu mahasiswa pada satu semester |

---

# 23. STEP 6 – Grain Validation

Setelah grain dibuat, lakukan validasi menggunakan pertanyaan berikut.

1. Apakah arti satu baris jelas?
2. Apakah satu baris dapat diidentifikasi secara logis?
3. Apakah grain konsisten dengan analytical question?
4. Apakah grain terlalu agregat?
5. Apakah grain mencampur dua jenis event?
6. Apakah grain dapat menyebabkan duplicate counting?
7. Apakah source menyediakan detail pada level tersebut?
8. Apakah grain mendukung analisis masa depan yang wajar?

---

# 24. Atomic Grain

Secara umum, pilih grain sedetail mungkin selama:

- source mendukung;
- kebutuhan bisnis mendukung;
- volume data masih realistis.

Contoh:

Lebih fleksibel:

> satu transaksi pembayaran.

Dibanding:

> total pembayaran per semester.

Atomic grain memungkinkan agregasi kemudian.

Sebaliknya, data agregat sulit dikembalikan menjadi detail.

---

# 25. Mixed Grain

Mixed grain terjadi ketika satu Fact Table mencampurkan beberapa arti baris.

Contoh tidak baik:

```text
Row 1 = nilai akhir satu mata kuliah
Row 2 = IPK satu mahasiswa per semester
Row 3 = total SKS per semester
```

Ketiganya tidak memiliki grain yang sama.

Risiko:

- aggregation error;
- double counting;
- query sulit dipahami;
- KPI salah.

---

# 26. Contoh Risiko Double Counting

Misalnya seorang mahasiswa:

- mengambil 5 mata kuliah;
- memiliki 5 record nilai.

Jika kemudian `status_mahasiswa = Aktif` disimpan sebagai angka 1 di setiap record Fact_Nilai dan dijumlahkan:

```text
SUM(status_aktif) = 5
```

Padahal jumlah mahasiswa hanya:

```text
1
```

Ini merupakan contoh konsekuensi grain yang tidak dipahami.

---

# 27. Studi Kasus Utama – Penilaian Mahasiswa

Gunakan:

### Business Problem

Kaprodi ingin mengidentifikasi mata kuliah dengan performa akademik rendah.

### Analytical Question

> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi setiap semester?

### Candidate Business Process

> Penilaian mahasiswa.

### Business Event

> Nilai akhir mahasiswa diterbitkan.

### Grain

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

---

# 28. Menghubungkan Grain ke Source

Untuk studi kasus penilaian, source kandidat:

- `nilai`;
- `krs`;
- `mahasiswa`;
- `mata_kuliah`;
- `semester`.

Gunakan Source Mapping Unit 1.3 untuk memverifikasi hubungan tersebut.

Mahasiswa tidak perlu membuat Fact Table pada tahap ini.

---

# 29. Verifikasi Source dengan SQL

Jika diperlukan, gunakan query sederhana untuk memahami level detail.

Contoh konseptual:

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

Tujuan query:

> memeriksa apakah kombinasi yang diasumsikan sebagai grain memiliki lebih dari satu record.

Jika ada lebih dari satu record, mahasiswa harus menyelidiki:

- duplicate?
- multiple assessment attempt?
- remedial?
- source mempunyai grain berbeda?

Jangan langsung menghapus duplicate.

---

# 30. Grain Discovery vs Grain Design

Mahasiswa harus membedakan:

## Source Grain

Apa arti satu baris pada source.

## Target Grain

Apa arti satu baris pada Fact Table yang akan dirancang.

Keduanya tidak selalu sama.

Contoh:

Source LMS:

> satu log aktivitas pengguna.

Target analytics mungkin:

> satu mahasiswa per course per hari.

Namun perubahan grain tersebut baru boleh dilakukan jika requirement membenarkannya.

---

# 31. Business Process Matrix Awal

Mahasiswa membuat daftar minimal tiga business process.

Contoh:

| Business Process | Main Event | Candidate Source | Priority |
|---|---|---|---|
| KRS | Pengambilan MK | krs | Medium |
| Penilaian | Nilai akhir | nilai | High |
| Pembayaran | Transaksi bayar | pembayaran | Medium |
| Kelulusan | Penyelesaian studi | kelulusan | High |

---

# 32. Prioritasi Business Process

Jika terdapat banyak proses, gunakan:

- stakeholder importance;
- analytical value;
- data availability;
- source fitness;
- feasibility.

Contoh sederhana:

| Process | Business Value | Data Fitness | Priority |
|---|---|---|---|
| Penilaian | High | Ready/Conditional | 1 |
| Kelulusan | High | Ready | 2 |
| Pembayaran | Medium | Conditional | 3 |

---

# 33. Hubungan dengan Hasil Profiling

Unit 2.1 harus menggunakan temuan Unit 1.2.

Contoh:

Jika source `nilai` memiliki:

- duplicate record;
- nilai di luar domain;
- missing key;

hal tersebut **belum mengubah grain**, tetapi memengaruhi kelayakan source.

Mahasiswa mencatat:

```text
Grain Design:
Satu nilai akhir mahasiswa per MK per semester

Profiling Concern:
Ada duplicate pada kombinasi business key tertentu

Next Action:
Perlu aturan validasi sebelum loading Fact
```

Treatment detail dibahas pada Unit 2.5.

---

# 34. Hubungan dengan Unit 1.3

Gunakan rantai traceability:

```text
Business Problem
      ↓
Decision Requirement
      ↓
Analytical Question
      ↓
Metric/KPI
      ↓
Data Requirement
      ↓
Business Process
      ↓
Grain
```

Mahasiswa harus mampu menjelaskan setiap hubungan.

---

# 35. Requirement–Process–Grain Traceability

Gunakan format:

| AQ ID | KPI/Metric | Business Process | Grain | Source | Evidence |
|---|---|---|---|---|---|
| AQ-01 | Failure Rate | Penilaian | Satu nilai akhir mahasiswa per MK per semester | nilai, krs | Unit 1.2/1.3 |

---

# 36. Aktivitas Praktikum A – Process Identification

Pilih minimal **5 Analytical Questions** dari Unit 1.3.

Untuk masing-masing:

1. tentukan candidate business process;
2. jelaskan alasan;
3. identifikasi business event;
4. identifikasi source utama.

Minimal 5 baris pada Process Mapping.

---

# 37. Aktivitas Praktikum B – Process Consolidation

Beberapa Analytical Questions mungkin berasal dari business process yang sama.

Contoh:

```text
AQ-01 Failure Rate
AQ-02 Average Grade
AQ-03 Grade Trend
```

semuanya dapat berasal dari:

> **Penilaian**

Mahasiswa harus mengelompokkan Analytical Question berdasarkan business process.

Tujuannya:

> menghindari pembuatan satu Fact Table untuk setiap pertanyaan.

---

# 38. Aktivitas Praktikum C – Grain Drafting

Untuk minimal **3 business process**, tulis candidate grain.

Contoh format:

| Process | Candidate Grain | Reason |
|---|---|---|
| Penilaian | Satu nilai akhir mahasiswa per MK per semester | Mendukung analisis nilai |
| Pembayaran | Satu transaksi pembayaran mahasiswa | Menjaga detail transaksi |

---

# 39. Aktivitas Praktikum D – Grain Challenge

Untuk setiap candidate grain, jawab:

1. Apakah source menyediakan detail ini?
2. Apakah grain bersifat atomic?
3. Apa yang membuat satu row unik?
4. Apa potensi duplicate?
5. Apa risiko jika grain dibuat lebih agregat?
6. Apa risiko jika grain dibuat lebih detail?

---

# 40. Aktivitas Praktikum E – SQL Evidence

Pilih minimal **2 candidate grain**.

Buat query untuk memeriksa apakah source mendukung asumsi grain.

Evidence yang dikumpulkan:

- SQL query;
- screenshot/result count;
- interpretasi.

Contoh interpretasi yang baik:

> “Kombinasi NIM–kode_mk–semester_id masih memiliki beberapa record ganda. Oleh karena itu, grain target tetap ditetapkan satu nilai akhir mahasiswa per mata kuliah per semester, tetapi source membutuhkan aturan deduplikasi/identifikasi record final pada tahap data quality dan ETL.”

---

# 41. Aktivitas Praktikum F – Grain Review

Lakukan peer review atau self-review.

Gunakan checklist:

- [ ] Satu baris memiliki arti jelas.
- [ ] Tidak menggunakan nama tabel sebagai definisi grain.
- [ ] Tidak mencampur beberapa event.
- [ ] Mendukung Analytical Question.
- [ ] Mendukung KPI/Metric.
- [ ] Source memungkinkan grain tersebut.
- [ ] Risiko duplicate sudah dicatat.
- [ ] Tidak melakukan agregasi prematur.

---

# 42. RTM 3 v0.1 – Bagian Unit 2.1

Output Unit 2.1 menjadi bagian pertama RTM 3.

Isi:

### A. Analytical Scope

Daftar AQ yang dipilih.

### B. Business Process Register

Minimal 3 proses.

### C. Grain Statements

Minimal satu per proses.

### D. Process–Grain Traceability

Hubungan AQ → process → grain.

### E. CT Reflection

Bagaimana abstraction digunakan untuk berpindah dari source tables menuju business process?

---

# 43. CT Reflection

Jawab singkat tetapi substantif:

1. Source data apa yang awalnya terlihat paling kompleks?
2. Bagaimana Anda menyederhanakannya menjadi business process?
3. Informasi apa yang Anda abaikan pada tahap ini, dan mengapa?
4. Apa keputusan grain yang paling sulit?
5. Apa risiko jika grain salah?

---

# 44. Luaran Wajib Unit 2.1

Mahasiswa menyerahkan:

1. **Business Process Register**
2. **Analytical Question–Process Mapping**
3. **Business Event Description**
4. **Grain Statement Register**
5. **Grain Validation Checklist**
6. **SQL Evidence** untuk minimal 2 grain
7. **Requirement–Process–Grain Traceability**
8. **CT Reflection**

Luaran ini nantinya masuk ke:

> **Modul 2 Dimensional Design Workbook**

---

# 45. Target Minimal

| Komponen | Minimum |
|---|---:|
| Analytical Questions dianalisis | 5 |
| Business Process teridentifikasi | 3 |
| Grain Statements | 3 |
| SQL Grain Verification | 2 |
| Traceability entries | 5 |
| CT Reflection | 1 |

---

# 46. Kriteria Jawaban Berkualitas

Jawaban kuat:

> “Business process yang dipilih adalah Penilaian karena AQ-01, AQ-02, dan AQ-03 seluruhnya mengukur outcome akademik yang terjadi saat nilai akhir diberikan. Grain ditetapkan satu nilai akhir seorang mahasiswa untuk satu mata kuliah pada satu semester agar setiap hasil penilaian dapat dianalisis secara atomic berdasarkan mahasiswa, mata kuliah, prodi, dan semester.”

Jawaban lemah:

> “Business process = nilai karena ada tabel nilai.”

Masalah jawaban lemah:

- berorientasi source;
- tidak menjelaskan event;
- tidak menghubungkan requirement;
- grain belum dinyatakan.

---

# 47. Kesalahan Umum Mahasiswa

## Kesalahan 1
Memilih entity sebagai process.

Contoh salah:

> Mahasiswa.

Perbaiki menjadi event seperti:

> pengambilan mata kuliah / penilaian / pembayaran.

---

## Kesalahan 2
Grain terlalu umum.

Contoh:

> data pembayaran.

Perbaiki:

> satu transaksi pembayaran mahasiswa.

---

## Kesalahan 3
Grain menggunakan istilah tabel.

Contoh:

> satu row tabel nilai.

Perbaiki dengan makna bisnis.

---

## Kesalahan 4
Membuat grain berdasarkan apa yang mudah di-query.

Grain harus berdasarkan requirement, bukan kemudahan teknis.

---

## Kesalahan 5
Menganggap duplicate source berarti grain salah.

Duplicate dapat disebabkan data quality issue.

Selidiki terlebih dahulu.

---

## Kesalahan 6
Mendesain Star Schema terlalu dini.

Unit 2.1 fokus pada:

> process + grain.

Star Schema dikembangkan pada Unit 2.2.

---

# 48. Checkpoint Dosen

Sebelum lanjut Unit 2.2, dosen memeriksa:

| Check | Status |
|---|:---:|
| AQ berasal dari Unit 1.3 | ☐ |
| Process merupakan event | ☐ |
| Grain eksplisit | ☐ |
| Grain konsisten dengan requirement | ☐ |
| Tidak mixed grain | ☐ |
| Source support diperiksa | ☐ |
| Traceability tersedia | ☐ |

Jika salah satu elemen kritis belum terpenuhi, mahasiswa melakukan revisi.

---

# 49. Design Gate Unit 2.1

Mahasiswa **belum boleh lanjut** ke conceptual Star Schema jika:

- business process ambigu;
- grain tidak dapat dijelaskan;
- grain mencampur level transaksi;
- analytical question tidak traceable;
- grain tidak didukung source;
- duplicate source belum dipahami.

Status yang digunakan:

```text
PASS
REVISE
```

---

# 50. Penilaian Unit 2.1

Rekomendasi penilaian internal Unit 2.1:

| Aspek | Bobot |
|---|---:|
| Analytical Question Selection | 10% |
| Business Process Identification | 20% |
| Business Event Reasoning | 10% |
| Grain Statement Quality | 25% |
| Grain Validation & SQL Evidence | 15% |
| Traceability | 10% |
| Computational Thinking Reflection | 10% |
| **Total** | **100%** |

Nilai ini dapat dikonversi ke bobot asesmen Modul 2.

---

# 51. Exit Reflection

Sebelum mengakhiri praktikum, jawab:

### Pertanyaan 1
Mengapa business process harus ditentukan sebelum Fact Table?

### Pertanyaan 2
Apa arti grain dalam dimensional modeling?

### Pertanyaan 3
Apa akibat grain yang ambigu?

### Pertanyaan 4
Apa perbedaan source grain dan target grain?

### Pertanyaan 5
Mengapa beberapa Analytical Questions dapat menggunakan business process yang sama?

---

# 52. Jembatan ke Unit 2.2

Unit 2.1 menghasilkan:

```text
Analytical Questions
       ↓
Business Processes
       ↓
Validated Grain
```

Unit 2.2 akan melanjutkan:

```text
Validated Grain
       ↓
Identify Dimensions
       ↓
Identify Facts
       ↓
Identify Candidate Measures
       ↓
Build Conceptual Star Schema
       ↓
Build Initial Bus Matrix
```

Pertanyaan utama Unit 2.2:

> **Jika grain sudah jelas, bagaimana business process tersebut direpresentasikan menjadi conceptual dimensional model yang mudah dianalisis?**

---

# 53. Ringkasan Unit

Unit 2.1 menanamkan dua keputusan fundamental:

> **Select the right business process.**

dan:

> **Declare the grain before designing the tables.**

Jika dua keputusan ini salah, desain Dimension, Fact, Measure, ETL, dan KPI pada tahap berikutnya juga berisiko salah.

Karena itu Unit 2.1 merupakan **design gate pertama** dalam pembangunan Data Warehouse UADW.

---

# 54. Checklist Akhir Mahasiswa

Sebelum submit:

- [ ] Saya menggunakan Analytical Question dari Unit 1.3.
- [ ] Saya menganalisis minimal 5 Analytical Questions.
- [ ] Saya mengidentifikasi minimal 3 business process.
- [ ] Saya tidak menggunakan entity sebagai business process.
- [ ] Setiap business process memiliki business event yang jelas.
- [ ] Saya menulis minimal 3 grain statements.
- [ ] Grain menjelaskan arti tepat satu baris.
- [ ] Saya memeriksa risiko mixed grain.
- [ ] Saya memverifikasi minimal 2 grain menggunakan source data/SQL.
- [ ] Saya mencatat temuan data quality tanpa memperbaiki source.
- [ ] Saya membuat requirement–process–grain traceability.
- [ ] Saya menyelesaikan CT Reflection.
- [ ] Saya belum melakukan implementasi Fact Table fisik.
- [ ] Saya siap melanjutkan Unit 2.2.

---

## Prinsip Penutup

> **A table name is not a business process.**

> **A business process is not yet a grain.**

> **The grain must explain exactly what one fact row means.**

> **Good dimensional design starts with business meaning, not with SQL.**
