# MATERI PERTEMUAN 4
## Mata Kuliah Data Warehouse
### Data Understanding & Dimensional Modeling

---

## 1. Identitas Pertemuan

- **Mata Kuliah:** Data Warehouse
- **Program Studi:** Teknologi Informasi
- **Semester:** 5
- **Pertemuan:** 4
- **Topik Utama:** Data Understanding & Dimensional Modeling
- **Pendekatan:** Outcome-Based Education (OBE), Case Method, Computational Thinking, dan Project-Based Learning
- **Fase Modul:** DESIGN

---

## 2. CPMK dan Sub-CPMK

### CPMK-3
Mahasiswa mampu **merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya**.

### Sub-CPMK 4
Mahasiswa mampu **merancang model dimensional berdasarkan business process, grain, dimension, fact, dan measure untuk memenuhi kebutuhan analitik organisasi**.

Pada Pertemuan 4 mahasiswa belum diwajibkan membuat desain fisik tabel secara rinci. Fokus utama adalah membentuk **model dimensional konseptual yang dapat ditelusuri ke kebutuhan bisnis dan pertanyaan analitik**.

---

## 3. Posisi Pertemuan 4 dalam Alur Pembelajaran

Pertemuan 1–3 membangun pemahaman tentang alasan organisasi membutuhkan Data Warehouse, arsitektur Data Warehouse, serta kebutuhan bisnis dan kebutuhan data. Pertemuan 4 menjadi titik transisi dari fase **UNDERSTAND** menuju **DESIGN**.

Alur utama pembelajaran:

```text
Business Problem
      ↓
Analytical Question
      ↓
Data Requirement
      ↓
Source Data
      ↓
Business Process
      ↓
Declare Grain
      ↓
Identify Dimensions
      ↓
Identify Facts
      ↓
Conceptual Dimensional Model
```

Pertanyaan kunci pada pertemuan ini adalah:

> **How should analytical data be modeled so that business questions can be answered efficiently and consistently?**

---

## 4. Keterkaitan dengan RTM 3 dan Computational Thinking

Pertemuan 4 membuka **RTM 3 – Abstraction / Dimensional Modeling**.

Output tahap P4:

1. Business Process Selection;
2. Grain Statement;
3. Candidate Dimensions;
4. Candidate Facts;
5. Candidate Measures;
6. Draft/Conceptual Star Schema;
7. Requirement–Model Traceability awal.

Fokus Computational Thinking:

### Abstraction
Mahasiswa belajar menyederhanakan source data yang kompleks menjadi struktur analitik yang hanya mempertahankan elemen yang relevan dengan kebutuhan analisis.

Contoh source UADW:

```text
mahasiswa
program_studi
krs
nilai
mata_kuliah
dosen
semester
kelulusan
aktivitas_lms
pembayaran
```

Untuk pertanyaan:

> Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi setiap semester?

mahasiswa tidak perlu membawa seluruh tabel source ke model analitik. Abstraction dilakukan dengan mengidentifikasi:

```text
Business Event : Penilaian
Measure        : nilai / indikator lulus
Context        : mahasiswa, mata kuliah, semester, program studi
```

---

# BAGIAN I – DARI REQUIREMENT KE DIMENSIONAL MODEL

## 5. Mengapa Dimensional Modeling Dimulai dari Requirement?

Salah satu kesalahan umum dalam pembangunan Data Warehouse adalah merancang tabel berdasarkan struktur source yang sudah ada. Pendekatan ini berisiko menghasilkan Data Warehouse yang hanya menjadi salinan database operasional.

Pendekatan yang lebih tepat adalah:

```text
Business Problem
      ↓
Analytical Question
      ↓
KPI / Metric
      ↓
Data Requirement
      ↓
Business Process
      ↓
Dimensional Model
```

Contoh:

### Analytical Question
> Bagaimana tingkat ketidaklulusan mata kuliah berdasarkan program studi dan semester?

### Data yang Dibutuhkan
- mahasiswa;
- program studi;
- mata kuliah;
- semester;
- nilai.

Namun struktur Data Warehouse tidak harus mempertahankan bentuk tabel source tersebut. Struktur analitik harus dirancang berdasarkan konteks analisis.

---

## 6. Operational Model vs Dimensional Model

### Operational Model
Dirancang untuk mendukung transaksi harian. Ciri utamanya:

- highly normalized;
- banyak tabel;
- integritas transaksi tinggi;
- insert/update/delete intensif;
- query berorientasi satu transaksi atau satu entitas.

Contoh pertanyaan operasional:

> Apakah mahasiswa A sudah melakukan pembayaran semester ini?

### Dimensional Model
Dirancang untuk mendukung analisis. Ciri utamanya:

- struktur sederhana;
- fact dan dimension terpisah;
- data historis;
- mudah di-query;
- mendukung aggregation;
- cocok untuk BI dan OLAP.

Contoh pertanyaan analitik:

> Bagaimana tren pembayaran mahasiswa menurut program studi selama empat semester terakhir?

Perbandingan ringkas:

| Aspek | Operational Model | Dimensional Model |
|---|---|---|
| Tujuan | Transaksi | Analisis |
| Struktur | Normalized | Star-oriented |
| Query | Sederhana/transaksional | Agregatif/multidimensi |
| Data historis | Terbatas | Penting |
| Pengguna | Aplikasi operasional | Analyst/BI |

Pesan utama:

> **Operational model answers how the business operates; dimensional model answers how the business is analyzed.**

---

# BAGIAN II – KONSEP DASAR DIMENSIONAL MODELING

## 7. Apa itu Dimensional Modeling?

Dimensional Modeling adalah pendekatan desain data analitik yang memisahkan informasi menjadi:

### Fact
Merepresentasikan **business event** atau hal yang ingin diukur.

### Dimension
Memberikan **konteks deskriptif** terhadap business event.

### Measure
Nilai numerik atau indikator yang digunakan untuk mengukur event.

Secara sederhana:

```text
FACT      = What happened?
DIMENSION = Who? What? Where? When? How?
MEASURE   = How much? How many?
```

Contoh:

```text
Fact_Nilai
├── mahasiswa_key
├── mata_kuliah_key
├── semester_key
├── dosen_key
├── nilai_angka
└── is_lulus
```

`nilai_angka` dan `is_lulus` adalah measure, sedangkan mahasiswa, mata kuliah, semester, dan dosen menjadi konteks analitik.

---

## 8. Abstraction dalam Dimensional Modeling

Abstraction berarti memilih struktur yang benar-benar relevan terhadap kebutuhan analitik dan mengabaikan detail operasional yang tidak diperlukan.

Contoh source `mahasiswa` memiliki:

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
status
```

Jika kebutuhan analisis hanya berfokus pada performa akademik berdasarkan angkatan dan program studi, maka `nomor_telepon` tidak memiliki nilai analitik langsung.

Abstraction bukan berarti membuang data sembarangan. Abstraction adalah keputusan desain berbasis kebutuhan.

---

# BAGIAN III – KIMBALL FOUR-STEP DIMENSIONAL DESIGN PROCESS

## 9. Kerangka Empat Langkah Kimball

Kerangka utama dimensional design:

```text
STEP 1 – Select the Business Process
        ↓
STEP 2 – Declare the Grain
        ↓
STEP 3 – Identify the Dimensions
        ↓
STEP 4 – Identify the Facts
```

Urutan ini harus dipertahankan. Kesalahan dalam satu langkah akan memengaruhi langkah berikutnya.

---

## 10. Step 1 – Select the Business Process

Business process adalah aktivitas atau kejadian organisasi yang ingin dianalisis.

Contoh dalam UADW:

- pengambilan mata kuliah;
- penilaian;
- pembayaran;
- aktivitas LMS;
- kelulusan.

### Business Process bukan Entity

Salah:

> Mahasiswa

Benar:

> Mahasiswa memperoleh nilai pada suatu mata kuliah.

Mahasiswa adalah entity/dimension candidate; penilaian adalah business process.

Contoh mapping:

| Analytical Question | Business Process |
|---|---|
| Mata kuliah apa yang failure rate-nya tertinggi? | Penilaian |
| Bagaimana tren pembayaran mahasiswa? | Pembayaran |
| Berapa tingkat kelulusan tepat waktu? | Kelulusan |

---

## 11. Step 2 – Declare the Grain

Grain menjawab:

> **What does one row in the fact table represent?**

Contoh grain:

### Penilaian
> Satu nilai akhir seorang mahasiswa untuk satu mata kuliah pada satu semester.

### KRS
> Satu pengambilan mata kuliah oleh seorang mahasiswa pada satu semester.

### Pembayaran
> Satu transaksi pembayaran seorang mahasiswa pada satu waktu transaksi.

### Kelulusan
> Satu kejadian kelulusan seorang mahasiswa.

Grain harus ditulis sebagai kalimat eksplisit. Pernyataan seperti “data nilai mahasiswa” terlalu umum.

---

## 12. Mengapa Grain Sangat Kritis?

Jika grain tidak konsisten, maka:

- terjadi double counting;
- KPI salah;
- dimension dan fact bercampur;
- measure tidak memiliki arti yang konsisten;
- satu row fact dapat mewakili lebih dari satu jenis event.

Contoh kesalahan:

Satu Fact_Nilai mencampur:

- nilai tugas;
- nilai UTS;
- nilai UAS;
- nilai akhir;

padahal grain tidak membedakan masing-masing jenis nilai.

Prinsip:

> **Declare the grain before designing the table.**

---

## 13. Step 3 – Identify the Dimensions

Setelah grain ditetapkan, tanyakan:

> Berdasarkan konteks apa kejadian tersebut ingin dianalisis?

Untuk grain:

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

Candidate dimensions:

- Mahasiswa;
- Mata Kuliah;
- Semester/Waktu;
- Dosen;
- Program Studi.

Dimension menjawab:

```text
WHO?   → Mahasiswa
WHAT?  → Mata Kuliah
WHEN?  → Semester
WHERE/ORG? → Program Studi
WHO DELIVERED? → Dosen
```

Detail struktur Dimension Table dibahas pada Pertemuan 5.

---

## 14. Step 4 – Identify the Facts and Measures

Fact merepresentasikan business event. Measure merepresentasikan nilai yang diukur.

Contoh:

### Business Process
Penilaian.

### Candidate Fact
`Fact_Nilai`

### Candidate Measures
- nilai_angka;
- is_lulus;
- jumlah_record;
- SKS (tergantung kebutuhan dan grain).

Pada P4, identifikasi fact dan measure masih bersifat konseptual. Detail measure dan sifat aditivitas dibahas pada P6.

---

# BAGIAN IV – STAR SCHEMA DAN SNOWFLAKE SCHEMA

## 15. Star Schema

Star Schema terdiri atas satu Fact Table di pusat dan beberapa Dimension Table yang terhubung langsung.

Contoh:

```text
                 Dim_Mahasiswa
                       |
                       |
Dim_MataKuliah — Fact_Nilai — Dim_Semester
                       |
                       |
                   Dim_Dosen
```

Kelebihan:

- mudah dipahami;
- query lebih sederhana;
- JOIN lebih sedikit;
- cocok untuk BI;
- performa analitik baik;
- mudah ditelusuri ke analytical question.

Star Schema menjadi pendekatan default pada proyek UADW.

---

## 16. Snowflake Schema

Snowflake Schema terjadi ketika satu atau lebih dimension dinormalisasi menjadi beberapa tabel.

Contoh:

```text
Fact_Nilai
    |
Dim_Mahasiswa
    |
Dim_Prodi
    |
Dim_Fakultas
```

Perbandingan:

| Aspek | Star | Snowflake |
|---|---|---|
| Struktur | Sederhana | Lebih kompleks |
| JOIN | Sedikit | Lebih banyak |
| Redundancy | Lebih tinggi | Lebih rendah |
| BI usability | Sangat baik | Lebih kompleks |
| Normalisasi | Rendah | Lebih tinggi |

Snowflake bukan otomatis lebih baik. Dalam Data Warehouse, simplicity sering lebih penting daripada normalisasi maksimal.

---

# BAGIAN V – BUS MATRIX DAN TRACEABILITY

## 17. Bus Matrix – Pengantar

Bus Matrix memperlihatkan hubungan antara business process dan shared dimensions.

Contoh:

| Business Process | Mahasiswa | Mata Kuliah | Prodi | Waktu | Dosen |
|---|:---:|:---:|:---:|:---:|:---:|
| KRS | ✓ | ✓ | ✓ | ✓ | |
| Penilaian | ✓ | ✓ | ✓ | ✓ | ✓ |
| Kelulusan | ✓ | | ✓ | ✓ | |
| Pembayaran | ✓ | | ✓ | ✓ | |

Dimension yang digunakan berulang akan menjadi kandidat **conformed dimension**, yang dibahas lebih dalam pada P5.

---

## 18. Requirement–Model Traceability

Setiap elemen model harus dapat ditelusuri ke kebutuhan awal.

Contoh:

```text
Analytical Question
↓
Business Process
↓
Grain
↓
Dimensions
↓
Fact
↓
Measures
```

Template:

| AQ | Business Process | Grain | Dimensions | Measures | Candidate Fact |
|---|---|---|---|---|---|
| AQ01 | Penilaian | Nilai mahasiswa per MK per semester | Mahasiswa, MK, Semester, Prodi | Nilai, is_lulus | Fact_Nilai |

Traceability mencegah mahasiswa membuat schema berdasarkan tebakan.

---

# BAGIAN VI – STUDI KASUS UADW

## 19. Kasus: Analisis Ketidaklulusan Mata Kuliah

### Business Problem
Kaprodi ingin mengetahui mata kuliah yang mempunyai tingkat ketidaklulusan tinggi.

### Analytical Questions
1. Mata kuliah apa yang memiliki failure rate tertinggi?
2. Bagaimana failure rate setiap semester?
3. Apakah failure rate berbeda antarprogram studi?
4. Bagaimana tren nilai setiap mata kuliah?

### Business Process
Penilaian.

### Grain
Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

### Candidate Dimensions
- Mahasiswa;
- Mata Kuliah;
- Semester;
- Dosen;
- Program Studi.

### Candidate Measures
- nilai_angka;
- is_lulus;
- count record.

### Candidate Fact
`Fact_Nilai`

### Draft Star Schema

```text
                 Dim_Mahasiswa
                       |
Dim_MataKuliah — Fact_Nilai — Dim_Semester
                       |
                   Dim_Dosen
```

---

## 20. Mini Case: Analisis Pembayaran

Analytical Question:

> Bagaimana tren pembayaran mahasiswa berdasarkan program studi dan semester?

Mahasiswa diminta menentukan:

1. business process;
2. grain;
3. candidate dimensions;
4. candidate measures;
5. candidate fact;
6. draft Star Schema.

Arah jawaban:

```text
Business Process : Pembayaran
Grain            : Satu transaksi pembayaran mahasiswa
Dimensions       : Mahasiswa, Prodi, Waktu, Jenis Pembayaran
Measure          : Nominal
Fact             : Fact_Pembayaran
```

---

# BAGIAN VII – OUTPUT PEMBELAJARAN

## 21. Output P4 / RTM 3 v0.1

Mahasiswa menghasilkan:

1. Selected Business Process;
2. Grain Statement;
3. Candidate Dimension List;
4. Candidate Fact;
5. Candidate Measures;
6. Conceptual Star Schema;
7. Requirement–Model Traceability awal.

Gunakan **Dimensional Design Canvas**:

| Component | Result |
|---|---|
| Analytical Question | ... |
| Business Process | ... |
| Grain | ... |
| Dimensions | ... |
| Fact | ... |
| Measures | ... |

---

## 22. Miskonsepsi yang Harus Dihindari

1. **Semua source table harus menjadi dimension atau fact.** Salah. Model harus berasal dari requirement.
2. **Satu transaction table source otomatis menjadi satu fact.** Belum tentu; grain dan business process harus ditentukan lebih dahulu.
3. **Mahasiswa adalah fact.** Salah; mahasiswa lebih cocok sebagai dimension candidate.
4. **Grain ditentukan setelah Fact Table dibuat.** Salah; grain harus lebih dulu.
5. **Star Schema lebih buruk karena tidak senormal ERD.** Salah; dimensional modeling mengutamakan usability analitik.

---

## 23. Asesmen Formatif / Exit Quiz

1. Apa perbedaan operational model dan dimensional model?
2. Sebutkan empat langkah Kimball dimensional design.
3. Apa yang dimaksud grain?
4. Mengapa grain harus ditentukan sebelum fact dirancang?
5. Buat satu grain untuk business process pembayaran UKT.
6. Tentukan candidate fact dan dimensions untuk analisis nilai mahasiswa.
7. Apa perbedaan Fact dan Measure?
8. Jelaskan bagaimana abstraction digunakan dalam dimensional modeling.

---

## 24. Jembatan ke Pertemuan 5

Setelah P4 mahasiswa mengetahui **apa yang dianalisis** dan **bagaimana struktur dimensional secara konseptual terbentuk**.

Pertanyaan berikutnya:

> **Bagaimana Dimension Table dirancang agar mampu memberikan konteks analitik yang konsisten dan historis?**

Pertemuan 5 membahas:

- dimension attributes;
- natural key;
- surrogate key;
- hierarchy;
- Date Dimension;
- role-playing dimension;
- conformed dimension;
- dimension specification.

---

## 25. Ringkasan

Pertemuan 4 membangun fondasi desain dimensional melalui empat keputusan utama:

```text
Select Business Process
        ↓
Declare Grain
        ↓
Identify Dimensions
        ↓
Identify Facts
```

Prinsip utama:

> **Declare the grain before designing the tables.**

> **A dimensional model must be traceable to an analytical requirement.**
