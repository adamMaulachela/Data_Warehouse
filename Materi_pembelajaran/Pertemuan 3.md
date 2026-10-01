# MATERI PERTEMUAN 3
## Mata Kuliah Data Warehouse
### Business Requirement dan Analytical Question

---

## 1. Identitas Pertemuan

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Pertemuan:** 3  
**Topik Utama:** Business Requirement dan Analytical Question  
**Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning

---

## 2. CPMK dan Sub-CPMK

### CPMK-2

Mahasiswa mampu:

> **Menganalisis kebutuhan bisnis dan kebutuhan data sebagai dasar pembangunan sistem Data Warehouse.**

### Sub-CPMK Pertemuan 3

Mahasiswa mampu:

> **Menganalisis proses bisnis, stakeholder, kebutuhan keputusan, kebutuhan informasi, pertanyaan analitik, kandidat indikator, dan sumber data yang diperlukan sebagai dasar perancangan Data Warehouse.**

---

## 3. Keterkaitan dengan RTM dan Computational Thinking

Pertemuan ini merupakan tahap utama dalam:

### RTM 1 – Problem Decomposition: Memahami Masalah Bisnis

Output yang diharapkan:

1. Problem Statement;
2. Stakeholder Analysis;
3. Decision Requirement;
4. minimal 10 Analytical Questions;
5. Decomposition Tree;
6. Data Requirement;
7. Source System Identification;
8. Candidate Metric/KPI.

Fokus Computational Thinking pada pertemuan ini adalah:

> **Decomposition**

Mahasiswa belajar memecah masalah bisnis yang masih umum menjadi bagian-bagian yang lebih kecil, lebih terukur, dan dapat diterjemahkan menjadi kebutuhan data.

---

# BAGIAN I  
# MENGAPA DATA WAREHOUSE HARUS DIMULAI DARI MASALAH BISNIS?

## 4. Dari Teknologi ke Kebutuhan Bisnis

Salah satu kesalahan paling umum ketika organisasi mulai membangun Data Warehouse adalah memulai dari pertanyaan:

> “Data apa saja yang kita punya?”

Pertanyaan tersebut memang penting, tetapi bukan pertanyaan pertama.

Pertanyaan yang lebih tepat adalah:

> **“Masalah apa yang ingin diselesaikan dan keputusan apa yang ingin didukung?”**

Data Warehouse dibangun bukan karena organisasi memiliki banyak data, melainkan karena organisasi membutuhkan informasi yang lebih baik untuk mendukung pengambilan keputusan.

Contoh pendekatan yang kurang tepat:

```text
Kita memiliki banyak tabel
        ↓
Masukkan semuanya ke Data Warehouse
        ↓
Buat dashboard
        ↓
Cari tahu kegunaannya
```

Pendekatan yang lebih tepat:

```text
Business Problem
        ↓
Stakeholder
        ↓
Business Objective
        ↓
Decision Requirement
        ↓
Analytical Question
        ↓
Metric / KPI
        ↓
Data Requirement
        ↓
Source System
        ↓
Data Warehouse Design
```

Dengan pola tersebut, Data Warehouse dibangun berdasarkan kebutuhan organisasi, bukan berdasarkan ketersediaan teknologi.

---

## 5. Contoh Masalah pada Universitas

Bayangkan sebuah universitas memiliki:

- Sistem Informasi Akademik;
- Learning Management System;
- Sistem Keuangan;
- Sistem Penerimaan Mahasiswa;
- Sistem Kelulusan;
- Sistem Kepegawaian.

Setiap sistem bekerja dengan baik.

Namun rektor mengatakan:

> “Saya ingin mengetahui kondisi akademik mahasiswa secara menyeluruh agar pimpinan dapat mengambil keputusan lebih cepat.”

Pernyataan tersebut belum cukup untuk langsung digunakan sebagai desain Data Warehouse.

Kita belum mengetahui:

- apa yang dimaksud dengan “kondisi akademik”;
- siapa yang membutuhkan informasinya;
- keputusan apa yang ingin dibuat;
- indikator apa yang perlu dihitung;
- periode analisis yang diperlukan;
- sumber data apa yang tersedia.

Oleh karena itu, tahap pertama adalah **menganalisis kebutuhan bisnis**.

---

# BAGIAN II  
# BUSINESS PROCESS

## 6. Pengertian Business Process

**Business process** adalah rangkaian aktivitas organisasi yang menghasilkan suatu kejadian, transaksi, atau hasil yang penting bagi organisasi.

Dalam konteks universitas, contoh business process adalah:

- penerimaan mahasiswa;
- registrasi ulang;
- pengisian KRS;
- proses pembelajaran;
- penilaian;
- pembayaran UKT;
- kelulusan.

Business process penting karena Data Warehouse biasanya dirancang untuk menganalisis proses-proses tersebut.

### Contoh

Business process:

> **Pengambilan Mata Kuliah**

Data yang muncul dari proses tersebut dapat mencakup:

- mahasiswa;
- mata kuliah;
- program studi;
- semester;
- kelas;
- dosen;
- jumlah SKS.

Business process:

> **Penilaian**

Data yang muncul:

- mahasiswa;
- mata kuliah;
- semester;
- nilai angka;
- nilai huruf;
- dosen.

Business process:

> **Kelulusan**

Data yang muncul:

- mahasiswa;
- tanggal masuk;
- tanggal lulus;
- IPK;
- masa studi;
- status kelulusan.

---

## 7. Mengapa Business Process Penting?

Business process membantu kita menjawab:

> **Apa sebenarnya kejadian bisnis yang ingin dianalisis?**

Tanpa pemahaman business process, Data Warehouse dapat menjadi kumpulan data yang tidak memiliki fokus analitik.

Contoh:

Jika tujuan organisasi adalah memahami kegagalan mahasiswa pada suatu mata kuliah, maka business process yang relevan adalah:

> **Penilaian / hasil studi**

Bukan:

> pembayaran UKT.

Artinya, kebutuhan bisnis membantu menentukan data mana yang relevan.

---

# BAGIAN III  
# STAKEHOLDER ANALYSIS

## 8. Pengertian Stakeholder

Stakeholder adalah individu atau kelompok yang:

- membutuhkan informasi;
- menggunakan hasil analisis;
- mengambil keputusan;
- terdampak oleh keputusan tersebut.

Dalam Data Warehouse, kebutuhan stakeholder menjadi dasar dalam menentukan jenis informasi yang perlu disediakan.

---

## 9. Contoh Stakeholder Universitas

### 9.1 Rektor

Rektor membutuhkan gambaran strategis tentang:

- jumlah mahasiswa;
- tren penerimaan;
- kelulusan;
- performa akademik;
- indikator universitas.

Pertanyaan rektor biasanya bersifat agregat dan strategis.

Contoh:

> Bagaimana tren tingkat kelulusan universitas selama lima tahun terakhir?

---

### 9.2 Dekan

Dekan membutuhkan informasi pada tingkat fakultas.

Contoh:

- perbandingan program studi;
- tren mahasiswa aktif;
- kelulusan;
- performa mata kuliah.

Contoh pertanyaan:

> Program studi mana yang memiliki tingkat kelulusan tepat waktu paling rendah?

---

### 9.3 Ketua Program Studi

Kaprodi membutuhkan informasi yang lebih operasional-taktis.

Contoh:

- mahasiswa berisiko;
- mata kuliah dengan tingkat kegagalan tinggi;
- rata-rata nilai;
- masa studi;
- kelulusan.

Contoh:

> Mata kuliah apa yang paling sering diulang oleh mahasiswa?

---

### 9.4 Dosen

Dosen membutuhkan informasi tentang pembelajaran.

Contoh:

- distribusi nilai;
- aktivitas kelas;
- performa mahasiswa;
- aktivitas LMS.

---

### 9.5 Bagian Keuangan

Membutuhkan informasi mengenai:

- pembayaran;
- tunggakan;
- pola pembayaran;
- mahasiswa yang belum melunasi UKT.

---

## 10. Mengapa Stakeholder Harus Dibedakan?

Stakeholder yang berbeda dapat melihat data yang sama dari perspektif berbeda.

Contoh data:

> Nilai mahasiswa.

Rektor mungkin bertanya:

> Bagaimana rata-rata nilai universitas?

Dekan:

> Bagaimana perbandingan rata-rata nilai antarprodi?

Kaprodi:

> Mata kuliah apa yang memiliki rata-rata nilai rendah?

Dosen:

> Siapa mahasiswa yang nilainya di bawah batas kelulusan?

Artinya:

> **Data yang sama dapat menghasilkan kebutuhan informasi yang berbeda.**

---

# BAGIAN IV  
# BUSINESS OBJECTIVE

## 11. Pengertian Business Objective

Business Objective adalah tujuan yang ingin dicapai organisasi.

Contoh tujuan yang terlalu umum:

> Meningkatkan kualitas akademik.

Tujuan tersebut perlu dibuat lebih spesifik.

Contoh yang lebih baik:

> Meningkatkan persentase kelulusan tepat waktu mahasiswa.

atau:

> Mengurangi tingkat ketidaklulusan pada mata kuliah dasar.

Business Objective menjadi dasar untuk menentukan apa yang harus dianalisis.

---

## 12. Contoh Business Objective UADW

| Stakeholder | Business Objective |
|---|---|
| Rektor | Meningkatkan kinerja akademik universitas |
| Dekan | Meningkatkan performa program studi |
| Kaprodi | Meningkatkan kelulusan tepat waktu |
| Dosen | Mengurangi tingkat kegagalan mahasiswa |
| Keuangan | Mengurangi tunggakan pembayaran |

---

# BAGIAN V  
# DECISION REQUIREMENT

## 13. Apa Itu Decision Requirement?

Decision Requirement menjawab pertanyaan:

> **Keputusan apa yang akan dibuat berdasarkan informasi yang tersedia?**

Data Warehouse bukan hanya menyediakan laporan.

Data Warehouse harus membantu organisasi membuat keputusan.

Contoh:

### Business Objective

> Meningkatkan kelulusan tepat waktu.

### Decision Requirement

Pimpinan perlu menentukan:

- mahasiswa mana yang memerlukan intervensi;
- mata kuliah mana yang perlu dievaluasi;
- angkatan mana yang memiliki risiko keterlambatan;
- program studi mana yang membutuhkan perhatian.

Tanpa Decision Requirement, dashboard dapat menjadi sekadar kumpulan grafik.

---

## 14. Hubungan Business Objective dan Decision Requirement

```text
Business Objective
        ↓
Apa yang ingin dicapai?
        ↓
Decision Requirement
        ↓
Keputusan apa yang perlu dibuat?
```

Contoh:

```text
Meningkatkan kelulusan tepat waktu
        ↓
Menentukan faktor yang terkait dengan keterlambatan
        ↓
Menentukan kelompok mahasiswa yang memerlukan intervensi
```

---

# BAGIAN VI  
# OPERATIONAL QUESTION DAN ANALYTICAL QUESTION

## 15. Operational Question

Operational question biasanya digunakan untuk mendukung transaksi atau aktivitas sehari-hari.

Contoh:

> Berapa nilai mahasiswa dengan NIM 23010001 pada mata kuliah Basis Data?

Karakteristik:

- fokus pada satu objek;
- menggunakan data terkini;
- query relatif sederhana;
- tidak membutuhkan analisis histori yang luas.

---

## 16. Analytical Question

Analytical question digunakan untuk menganalisis pola, tren, perbandingan, atau hubungan dalam data.

Contoh:

> Bagaimana tren rata-rata nilai mata kuliah Basis Data selama lima tahun berdasarkan angkatan?

Karakteristik:

- menggunakan histori;
- membutuhkan agregasi;
- sering menggunakan lebih dari satu dimensi;
- membandingkan beberapa kelompok;
- mendukung pengambilan keputusan.

---

## 17. Perbandingan

| Aspek | Operational Question | Analytical Question |
|---|---|---|
| Fokus | Transaksi | Analisis |
| Data | Current | Historical |
| Objek | Spesifik | Banyak objek |
| Query | Sederhana | Kompleks |
| Agregasi | Sedikit | Banyak |
| Tujuan | Operasional | Pengambilan keputusan |

---

# BAGIAN VII  
# MERUMUSKAN ANALYTICAL QUESTION

## 18. Pertanyaan yang Terlalu Umum

Contoh:

> Bagaimana kondisi mahasiswa?

Pertanyaan tersebut terlalu luas.

Tidak jelas:

- mahasiswa mana;
- indikator apa;
- periode kapan;
- dibandingkan dengan apa.

---

## 19. Memperbaiki Analytical Question

Pertanyaan umum:

> Bagaimana kondisi mahasiswa?

Diperbaiki menjadi:

> Bagaimana tren rata-rata IPK mahasiswa setiap program studi selama lima tahun terakhir?

Pertanyaan lain:

> Apakah mahasiswa banyak yang terlambat lulus?

Diperbaiki:

> Berapa persentase kelulusan tepat waktu berdasarkan program studi dan angkatan selama lima tahun terakhir?

Pertanyaan:

> Mata kuliah mana yang sulit?

Diperbaiki:

> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi selama enam semester terakhir?

---

## 20. Elemen Analytical Question

Pertanyaan analitik yang baik biasanya memiliki:

### 20.1 Measure

Apa yang diukur?

Contoh:

- jumlah mahasiswa;
- rata-rata nilai;
- IPK;
- jumlah lulusan;
- masa studi.

### 20.2 Context / Dimension

Berdasarkan apa?

Contoh:

- program studi;
- angkatan;
- mata kuliah;
- jenis kelamin;
- dosen.

### 20.3 Time

Kapan?

Contoh:

- semester;
- tahun;
- lima tahun terakhir.

### 20.4 Comparison

Apa yang dibandingkan?

Contoh:

- antarprodi;
- antarangkatan;
- antarsemester.

---

# BAGIAN VIII  
# ANALYTICAL QUESTION DECOMPOSITION

## 21. Contoh Decomposition

Pertanyaan:

> Bagaimana tren rata-rata nilai mahasiswa Teknologi Informasi selama lima tahun terakhir?

Decomposition:

### Measure

```text
AVG(Nilai)
```

### Subject

```text
Mahasiswa
```

### Dimension

```text
Program Studi
Waktu
```

### Filter

```text
Program Studi = Teknologi Informasi
```

### Period

```text
5 tahun
```

Dari satu pertanyaan, kita sudah memperoleh petunjuk awal untuk kebutuhan Data Warehouse.

---

## 22. Computational Thinking: Decomposition

Dalam Computational Thinking, masalah besar dipecah menjadi masalah yang lebih kecil.

Contoh:

Masalah:

> Prestasi mahasiswa menurun.

Langkah decomposition:

### Apa arti prestasi?

- IPK?
- nilai?
- kelulusan?
- masa studi?

### Siapa?

- seluruh mahasiswa?
- satu prodi?
- satu angkatan?

### Kapan?

- semester ini?
- lima tahun terakhir?

### Dibandingkan dengan apa?

- semester sebelumnya?
- prodi lain?
- target?

Hasil akhirnya dapat menjadi:

> Apakah rata-rata nilai mahasiswa Teknologi Informasi menurun selama enam semester terakhir dibandingkan angkatan sebelumnya?

---

# BAGIAN IX  
# BUSINESS METRIC

## 23. Pengertian Metric

Business Metric adalah ukuran kuantitatif yang digunakan untuk menggambarkan suatu aspek proses atau kinerja.

Contoh:

- jumlah mahasiswa;
- jumlah mahasiswa aktif;
- rata-rata IPK;
- jumlah lulusan;
- rata-rata masa studi;
- jumlah pembayaran.

Contoh formula:

```text
Rata-rata Nilai
=
Total Nilai / Jumlah Record Nilai
```

---

## 24. Metric Tidak Sama dengan KPI

Tidak semua metric merupakan KPI.

Contoh:

> Jumlah mahasiswa.

Ini adalah metric.

Tetapi jika tujuan universitas adalah:

> meningkatkan kelulusan tepat waktu,

maka indikator yang lebih relevan dapat berupa:

> On-Time Graduation Rate.

---

# BAGIAN X  
# KPI – KEY PERFORMANCE INDICATOR

## 25. Pengertian KPI

KPI adalah ukuran yang dianggap penting untuk menilai keberhasilan suatu tujuan strategis atau operasional.

Contoh:

### Business Objective

> Meningkatkan kelulusan tepat waktu.

### KPI

> On-Time Graduation Rate.

Formula konseptual:

```text
Jumlah mahasiswa lulus tepat waktu
---------------------------------- × 100%
Jumlah mahasiswa yang lulus
```

Contoh KPI lain:

- Graduation Rate;
- Retention Rate;
- Course Failure Rate;
- Average GPA;
- Dropout Rate.

---

## 26. KPI Harus Memiliki Definisi yang Jelas

Contoh:

> Graduation Rate.

Pertanyaan yang harus dijawab:

- siapa populasi mahasiswa?
- periode masuk kapan?
- berapa batas masa studi?
- mahasiswa cuti dihitung atau tidak?
- mahasiswa transfer dihitung atau tidak?

Tanpa definisi yang jelas, dua unit organisasi dapat menghasilkan angka KPI berbeda dari data yang sama.

---

# BAGIAN XI  
# BUSINESS QUESTION → METRIC → DATA

## 27. Contoh 1

### Business Question

> Bagaimana tingkat kelulusan tepat waktu setiap program studi?

↓

### Metric

```text
On-Time Graduation Rate
```

↓

### Data Requirement

- NIM;
- program studi;
- tanggal masuk;
- tanggal lulus;
- status kelulusan.

↓

### Source

- mahasiswa.csv;
- program_studi.csv;
- kelulusan.csv.

---

## 28. Contoh 2

### Business Question

> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi?

↓

### Metric

```text
Course Failure Rate
```

↓

### Data

- mahasiswa;
- mata kuliah;
- nilai;
- semester.

↓

### Source

- krs.csv;
- nilai.csv;
- mata_kuliah.csv;
- semester.csv.

---

# BAGIAN XII  
# DATA REQUIREMENT

## 29. Pengertian Data Requirement

Data Requirement adalah daftar data yang diperlukan untuk menjawab analytical question.

Hal yang perlu ditentukan:

1. entitas;
2. atribut;
3. transaksi;
4. periode waktu;
5. granularitas awal;
6. sumber data.

Contoh:

Pertanyaan:

> Bagaimana tren rata-rata nilai per program studi?

Data yang dibutuhkan:

- mahasiswa;
- program studi;
- nilai;
- semester.

---

# BAGIAN XIII  
# SOURCE SYSTEM IDENTIFICATION

## 30. Sumber Data pada UADW

Dalam Master Dataset UADW v1.0 tersedia beberapa source:

| Kebutuhan | Source |
|---|---|
| Identitas mahasiswa | mahasiswa.csv |
| Program studi | program_studi.csv |
| Dosen | dosen.csv |
| Mata kuliah | mata_kuliah.csv |
| Semester | semester.csv |
| KRS | krs.csv |
| Nilai | nilai.csv |
| Kelulusan | kelulusan.csv |
| Aktivitas LMS | aktivitas_lms.csv |
| Pembayaran | pembayaran.csv |

---

## 31. Satu Pertanyaan Dapat Membutuhkan Banyak Source

Contoh:

> Apakah mahasiswa dengan aktivitas LMS rendah memiliki nilai yang lebih rendah?

Data yang diperlukan:

- mahasiswa;
- aktivitas LMS;
- nilai;
- mata kuliah;
- semester.

Artinya, pertanyaan tersebut tidak dapat dijawab hanya dari satu tabel.

---

# BAGIAN XIV  
# SOURCE–QUESTION MAPPING

## 32. Pemetaan Pertanyaan dan Sumber

| Analytical Question | Data Needed | Source |
|---|---|---|
| Tren nilai | mahasiswa, nilai, semester | mahasiswa.csv, nilai.csv, semester.csv |
| Kelulusan tepat waktu | mahasiswa, kelulusan | mahasiswa.csv, kelulusan.csv |
| LMS vs nilai | LMS, nilai | aktivitas_lms.csv, nilai.csv |
| Tunggakan pembayaran | mahasiswa, pembayaran | mahasiswa.csv, pembayaran.csv |

Pemetaan ini membantu memastikan bahwa setiap kebutuhan bisnis memiliki sumber data yang jelas.

---

# BAGIAN XV  
# BUSINESS PROCESS MATRIX

## 33. Pengantar Business Process Matrix

Business Process Matrix digunakan untuk melihat hubungan antara proses bisnis dan objek analisis.

Contoh:

| Business Process | Mahasiswa | Prodi | Mata Kuliah | Waktu | Dosen |
|---|:---:|:---:|:---:|:---:|:---:|
| KRS | ✓ | ✓ | ✓ | ✓ | |
| Nilai | ✓ | ✓ | ✓ | ✓ | ✓ |
| Kelulusan | ✓ | ✓ | | ✓ | |
| Pembayaran | ✓ | ✓ | | ✓ | |

Pemetaan ini nantinya menjadi dasar untuk memahami **Bus Matrix** pada dimensional modeling.

---

# BAGIAN XVI  
# INTRODUKSI GRAIN

## 34. Apa Itu Grain?

Grain menjawab pertanyaan:

> **Apa arti satu baris pada data analitik?**

Contoh KRS:

> Satu mahasiswa mengambil satu mata kuliah pada satu semester.

Contoh nilai:

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

Contoh pembayaran:

> Satu transaksi pembayaran mahasiswa.

Grain sangat penting karena grain yang tidak jelas dapat menyebabkan:

- duplicate counting;
- agregasi salah;
- hasil analisis tidak konsisten.

Detail grain akan dibahas lebih mendalam pada Pertemuan 4 dan 6.

---

# BAGIAN XVII  
# CANDIDATE DIMENSION DAN MEASURE

## 35. Pengantar Dimensional Thinking

Pertanyaan:

> Berapa rata-rata nilai mahasiswa berdasarkan program studi dan semester?

Candidate Measure:

- nilai;
- jumlah mahasiswa.

Candidate Dimension:

- mahasiswa;
- program studi;
- semester;
- waktu.

Pada pertemuan ini mahasiswa baru dikenalkan pada hubungan antara analytical question dan calon elemen dimensional model.

Desain formal dilakukan mulai Pertemuan 4.

---

# BAGIAN XVIII  
# REQUIREMENT PRIORITIZATION

## 36. Mengapa Requirement Perlu Diprioritaskan?

Dalam proyek nyata, stakeholder dapat memberikan puluhan kebutuhan sekaligus.

Tidak semua kebutuhan harus dibangun pada tahap pertama.

Prioritas dapat ditentukan berdasarkan:

### Business Value

Seberapa besar manfaatnya?

### Data Availability

Apakah data tersedia?

### Feasibility

Apakah solusi dapat dibangun?

### Urgency

Seberapa mendesak?

### Analytical Relevance

Apakah kebutuhan benar-benar membutuhkan Data Warehouse?

---

## 37. Contoh Prioritas

| Requirement | Business Value | Data Availability | Priority |
|---|---|---|---|
| Graduation Rate | Tinggi | Tinggi | 1 |
| Course Failure Rate | Tinggi | Tinggi | 1 |
| Prediksi Dropout | Tinggi | Sedang | 2 |
| Analisis Media Sosial | Rendah | Rendah | 3 |

---

# BAGIAN XIX  
# STUDI KASUS UADW

## 38. Permintaan Rektor

Rektor mengatakan:

> “Saya ingin mengetahui kondisi akademik mahasiswa agar pimpinan dapat mengambil keputusan lebih cepat.”

Pernyataan ini harus dipecah.

### Decomposition Level 1

```text
Kondisi Akademik
│
├── Populasi Mahasiswa
├── Prestasi Akademik
├── Pembelajaran
├── Kelulusan
└── Pembayaran
```

### Decomposition Level 2 – Prestasi Akademik

```text
Prestasi Akademik
│
├── IPK
├── Nilai
├── SKS
├── Ketidaklulusan Mata Kuliah
└── Performa Antarsemester
```

---

## 39. Contoh Analytical Questions UADW

1. Bagaimana tren jumlah mahasiswa aktif setiap tahun?
2. Bagaimana rata-rata nilai berdasarkan program studi?
3. Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi?
4. Bagaimana tren IPK berdasarkan angkatan?
5. Bagaimana tingkat kelulusan tepat waktu setiap program studi?
6. Bagaimana rata-rata masa studi tiap angkatan?
7. Apakah aktivitas LMS berbeda antara mahasiswa dengan performa tinggi dan rendah?
8. Bagaimana tren jumlah mahasiswa cuti?
9. Bagaimana pola pembayaran UKT berdasarkan semester?
10. Program studi mana yang menunjukkan perubahan performa akademik paling besar?

Untuk setiap pertanyaan, mahasiswa harus menjelaskan:

- stakeholder;
- tujuan;
- metric;
- data yang dibutuhkan;
- source data.

---

# BAGIAN XX  
# WORKED EXAMPLE

## 40. Kasus: Kelulusan Terlambat

Kaprodi menyampaikan:

> “Banyak mahasiswa terlambat lulus.”

### Langkah 1 – Problem Statement

Masalah:

> Persentase mahasiswa yang lulus tepat waktu dianggap belum optimal.

### Langkah 2 – Stakeholder

Stakeholder utama:

> Ketua Program Studi.

### Langkah 3 – Business Objective

> Meningkatkan kelulusan tepat waktu.

### Langkah 4 – Decision Requirement

Kaprodi perlu menentukan:

- mahasiswa berisiko;
- mata kuliah bermasalah;
- pola pengulangan mata kuliah;
- angkatan dengan masa studi tinggi.

### Langkah 5 – Analytical Questions

Contoh:

> Mata kuliah apa yang paling sering diulang oleh mahasiswa yang lulus terlambat?

### Langkah 6 – Metric

> Repeat Rate.

### Langkah 7 – Data Requirement

- NIM;
- mata kuliah;
- semester;
- nilai;
- tanggal masuk;
- tanggal lulus.

### Langkah 8 – Source

- krs.csv;
- nilai.csv;
- mahasiswa.csv;
- kelulusan.csv.

---

# BAGIAN XXI  
# RTM 1 – PROBLEM DECOMPOSITION

## 41. Instruksi RTM

Mahasiswa bekerja dalam kelompok dan menggunakan studi kasus UADW.

Setiap kelompok harus menyusun:

### A. Problem Statement

Tuliskan masalah bisnis dalam satu paragraf yang jelas.

### B. Stakeholder Analysis

Minimal tiga stakeholder.

Gunakan format:

| Stakeholder | Kebutuhan Informasi | Keputusan |
|---|---|---|

### C. Decomposition Tree

Pecah masalah menjadi beberapa submasalah.

### D. Analytical Questions

Minimal 10 pertanyaan.

### E. Candidate Metric/KPI

Minimal 5.

### F. Data Requirement

Tentukan data yang dibutuhkan.

### G. Source Mapping

Tentukan file sumber.

---

# BAGIAN XXII  
# COMPUTATIONAL THINKING LOG

## 42. Refleksi CT

Mahasiswa mengisi:

| Elemen | Pertanyaan |
|---|---|
| Problem | Apa masalah utama? |
| Decomposition | Bagaimana masalah dipecah? |
| Pattern | Apakah terdapat pola kebutuhan yang berulang? |
| Abstraction | Informasi mana yang penting? |
| Data Need | Data apa yang diperlukan? |
| Validation | Bagaimana memastikan pertanyaan analitik relevan? |

---

# BAGIAN XXIII  
# MINI CASE ACTIVITY

## 43. Kasus Kelas

Pernyataan:

> “Prestasi mahasiswa menurun.”

Mahasiswa diminta mengubah pernyataan tersebut menjadi analytical requirement.

### Langkah

1. Definisikan “prestasi”.
2. Tentukan stakeholder.
3. Tentukan periode.
4. Tentukan metric.
5. Tentukan pembanding.
6. Tentukan data.
7. Tentukan source.

Contoh hasil:

> “Apakah rata-rata nilai mahasiswa Teknologi Informasi menurun selama enam semester terakhir dibandingkan tiga angkatan sebelumnya?”

---

# BAGIAN XXIV  
# MISKONSEPSI YANG HARUS DIHINDARI

## 44. Requirement Bukan Daftar Tabel

Salah:

> Kita membutuhkan tabel mahasiswa, nilai, dan KRS.

Benar:

> Kita membutuhkan informasi mengenai tren performa mahasiswa untuk menentukan program intervensi akademik.

Daftar tabel baru muncul setelah kebutuhan informasi diketahui.

---

## 45. Semakin Banyak KPI Tidak Selalu Lebih Baik

KPI harus:

- relevan;
- terdefinisi;
- dapat dihitung;
- terkait keputusan.

Dashboard dengan 50 KPI belum tentu lebih baik daripada dashboard dengan 5 KPI yang relevan.

---

## 46. Tidak Semua Pertanyaan Harus Dijawab Data Warehouse

Contoh:

> Berapa saldo pembayaran mahasiswa A hari ini?

Ini lebih cocok dijawab oleh sistem operasional.

Data Warehouse digunakan ketika kebutuhan bersifat:

- historis;
- agregat;
- komparatif;
- analitik.

---

## 47. Data Tersedia Tidak Berarti Data Berkualitas

Walaupun data tersedia, masih mungkin terdapat:

- duplicate;
- missing value;
- kode tidak konsisten;
- kategori berbeda;
- kesalahan format.

Hal inilah yang akan dianalisis pada RTM 2 dan Praktikum 2.

---

# BAGIAN XXV  
# RINGKASAN

## 48. Alur Utama Pertemuan 3

```text
BUSINESS PROBLEM
        ↓
STAKEHOLDER
        ↓
BUSINESS OBJECTIVE
        ↓
DECISION REQUIREMENT
        ↓
ANALYTICAL QUESTION
        ↓
METRIC / KPI
        ↓
DATA REQUIREMENT
        ↓
SOURCE SYSTEM
        ↓
DIMENSIONAL MODEL
```

---

## 49. Kata Kunci

Mahasiswa harus memahami:

- Business Process;
- Stakeholder;
- Business Objective;
- Decision Requirement;
- Analytical Question;
- Business Metric;
- KPI;
- Data Requirement;
- Source System;
- Decomposition;
- Grain;
- Candidate Dimension;
- Candidate Measure.

---

# BAGIAN XXVI  
# ASESMEN FORMATIF

## 50. Exit Quiz

### Soal 1

Apa perbedaan Business Objective dan Analytical Question?

### Soal 2

Ubah pertanyaan berikut:

> “Bagaimana kondisi kelulusan mahasiswa?”

menjadi pertanyaan analitik yang lebih spesifik.

### Soal 3

Apa perbedaan Business Metric dan KPI?

### Soal 4

Untuk pertanyaan:

> “Bagaimana tren rata-rata nilai berdasarkan program studi selama lima tahun?”

identifikasi:

- measure;
- dimension;
- time;
- source data.

### Soal 5

Mengapa stakeholder harus diidentifikasi sebelum merancang Data Warehouse?

### Soal 6 – Computational Thinking

Lakukan decomposition terhadap:

> “Kinerja mahasiswa menurun.”

---

# BAGIAN XXVII  
# JEMBATAN KE PRAKTIKUM DAN PERTEMUAN 4

## 51. Menuju Praktikum

Pada teori mahasiswa menentukan:

> **Data apa yang dibutuhkan.**

Pada praktikum mahasiswa akan menguji:

> **Apa sebenarnya yang terdapat pada data tersebut?**

Alur:

```text
Business Requirement
        ↓
Data Requirement
        ↓
Source Identification
        ↓
Data Profiling
        ↓
Pattern Recognition
```

---

## 52. Menuju Pertemuan 4

Setelah mahasiswa mengetahui:

- masalah bisnis;
- analytical question;
- metric;
- kebutuhan data;
- source data;

maka pertanyaan berikutnya adalah:

> **Bagaimana data tersebut dimodelkan agar efisien untuk analisis?**

Pertanyaan tersebut menjadi fokus:

# PERTEMUAN 4
## Data Understanding dan Dimensional Modeling

Materi berikutnya:

- Fact;
- Dimension;
- Measure;
- Grain;
- Star Schema;
- Snowflake Schema.

---

# 53. Benang Merah Pertemuan

Pertemuan 1:

> **WHY DATA WAREHOUSE?**

Pertemuan 2:

> **HOW IS THE DATA WAREHOUSE ENVIRONMENT STRUCTURED?**

Pertemuan 3:

> **WHAT INFORMATION IS NEEDED?**

Pertemuan 4:

> **HOW SHOULD THE DATA BE MODELED?**

Prinsip utama Pertemuan 3 adalah:

> **A good Data Warehouse starts with a good question.**

Kemampuan utama seorang perancang Data Warehouse bukan hanya menulis SQL atau membuat tabel, tetapi:

> **mampu menerjemahkan masalah organisasi menjadi kebutuhan informasi, pertanyaan analitik, metric, dan kebutuhan data yang terstruktur.**

---

## 54. Rekomendasi Alokasi Waktu

Untuk sesi teori 2 × 50 menit:

| Waktu | Aktivitas |
|---|---|
| 10 menit | Review Pertemuan 2 + problem trigger |
| 15 menit | Business Process, Stakeholder, Objective |
| 15 menit | Decision Requirement |
| 20 menit | Analytical Question |
| 15 menit | Metric, KPI, dan Data Requirement |
| 10 menit | Source Mapping + introduksi grain/dimension/measure |
| 10 menit | Computational Thinking Case |
| 5 menit | RTM 1 briefing/finalization |
| 5 menit | Exit Quiz |

---

**Akhir Materi Pertemuan 3**
