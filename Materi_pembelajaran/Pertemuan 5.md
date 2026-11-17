# MATERI PERTEMUAN 5
## Mata Kuliah Data Warehouse
### Dimension Table, Keys & Dimension Design

---

## 1. Identitas Pertemuan

- **Mata Kuliah:** Data Warehouse
- **Program Studi:** Teknologi Informasi
- **Semester:** 5
- **Pertemuan:** 5
- **Topik Utama:** Dimension Table, Keys & Dimension Design
- **Fase Modul:** DESIGN
- **RTM:** RTM 3 v0.2
- **Computational Thinking:** Abstraction

---

## 2. CPMK dan Sub-CPMK

### CPMK-3
Mahasiswa mampu **merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya**.

### Sub-CPMK 5
Mahasiswa mampu **merancang Dimension Table dengan menentukan atribut deskriptif, natural key, surrogate key, hierarchy, Date Dimension, dan conformed dimension sesuai kebutuhan analitik**.

---

## 3. Posisi Pertemuan 5

Pertemuan 4 menghasilkan:

```text
Business Process
      ↓
Grain
      ↓
Candidate Dimensions
      ↓
Candidate Fact
      ↓
Conceptual Star Schema
```

Pertemuan 5 memperdalam **candidate dimension** menjadi **Dimension Specification** yang siap digunakan pada desain Data Warehouse.

Pertanyaan utama:

> **How should dimensions be designed so that facts can be analyzed consistently and meaningfully?**

---

## 4. RTM 3 dan Abstraction

Pada P5 mahasiswa melakukan abstraction pada level atribut.

Contoh source mahasiswa:

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

Jika kebutuhan analisis berfokus pada performa akademik, tidak semua atribut memiliki nilai analitik yang sama.

Output P5:

1. Dimension Specification;
2. Attribute List;
3. Natural Key;
4. Surrogate Key;
5. Hierarchy;
6. Date/Time Dimension;
7. Conformed Dimension identification;
8. Updated Star Schema.

---

# BAGIAN I – DIMENSION TABLE DAN ATRIBUT

## 5. Apa itu Dimension Table?

Dimension Table adalah tabel yang menyimpan informasi deskriptif yang memberikan konteks terhadap business event pada Fact Table.

Contoh:

Fact_Nilai hanya menyimpan:

```text
nilai_angka = 85
```

Tanpa Dimension, nilai tersebut tidak memiliki konteks. Dengan Dimension:

```text
Mahasiswa    : A001
Mata Kuliah  : Basis Data
Semester     : Ganjil 2025
Program Studi: Teknologi Informasi
```

maka nilai 85 menjadi bermakna secara analitik.

Dimension digunakan untuk:

- filtering;
- grouping;
- labeling;
- slicing;
- drill-down;
- roll-up;
- reporting.

---

## 6. Dimension vs Fact

| Dimension | Fact |
|---|---|
| Mendeskripsikan konteks | Menyimpan event |
| Banyak atribut deskriptif | Banyak FK + measure |
| Who/What/Where/When | What happened/how much |
| Lebih sedikit row | Banyak row |
| Filter/grouping | Aggregation |

Contoh:

- `nama_mata_kuliah` → dimension attribute;
- `nilai_angka` → measure.

---

## 7. Dimension Attributes

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

Atribut dimension idealnya:

- business-friendly;
- mudah dipahami;
- mendukung filter dan grouping;
- relevan secara analitik;
- mempunyai definisi bisnis yang jelas.

---

## 8. Business-Friendly Attributes

Source dapat menggunakan istilah teknis:

```text
prd_cd
st_mhs
jk_cd
```

Dalam Data Warehouse lebih baik menggunakan:

```text
kode_program_studi
status_mahasiswa
jenis_kelamin
```

Data Warehouse harus usable bukan hanya untuk developer tetapi juga analyst dan decision maker.

---

# BAGIAN II – NATURAL KEY DAN SURROGATE KEY

## 9. Natural Key

Natural Key adalah identifier yang berasal dari source dan memiliki business meaning.

Contoh:

| Entity | Natural Key |
|---|---|
| Mahasiswa | NIM |
| Mata Kuliah | kode_mk |
| Program Studi | kode_prodi |

Natural key sering digunakan oleh sistem operasional dan pengguna bisnis.

---

## 10. Masalah Natural Key

Natural Key dapat bermasalah ketika:

- berubah;
- digunakan ulang;
- memiliki format berbeda antar-source;
- tidak unik secara global;
- tidak stabil lintas waktu.

Contoh:

```text
Source A: TI001
Source B: 001-TI
```

Keduanya mungkin merepresentasikan entitas yang sama.

---

## 11. Surrogate Key

Surrogate Key adalah identifier internal Data Warehouse yang:

- tidak mempunyai business meaning;
- dibuat oleh sistem Data Warehouse;
- biasanya berupa integer;
- stabil;
- mendukung SCD;
- digunakan sebagai primary key dimension.

Contoh:

| mahasiswa_key | nim | prodi |
|---:|---|---|
| 101 | 220001 | TI |
| 102 | 220002 | SI |

`mahasiswa_key` adalah surrogate key; `nim` adalah natural key.

---

## 12. Natural Key vs Surrogate Key

| Aspek | Natural Key | Surrogate Key |
|---|---|---|
| Berasal dari | Source | Data Warehouse |
| Business meaning | Ada | Tidak |
| Dapat berubah | Ya | Idealnya tidak |
| Stabil untuk histori | Rendah | Tinggi |
| Digunakan Fact FK | Tidak ideal | Ya |

Prinsip:

> **Fact Table biasanya menyimpan surrogate key dari Dimension Table.**

---

# BAGIAN III – HIERARCHY DAN TIME DIMENSION

## 13. Dimension Hierarchy

Hierarchy memungkinkan analisis dari level agregat ke detail.

Contoh waktu:

```text
Year
 ↓
Semester
 ↓
Month
 ↓
Date
```

Contoh organisasi:

```text
University
 ↓
Faculty
 ↓
Program Study
```

Hierarchy mendukung roll-up dan drill-down.

---

## 14. Date / Time Dimension

Date Dimension menyimpan lebih dari sekadar kolom tanggal.

Contoh atribut:

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
is_weekend
```

Dalam konteks akademik, periode kalender dan periode akademik perlu dibedakan.

Contoh:

- tanggal kalender: 2026-02-15;
- tahun akademik: 2025/2026;
- semester: Genap.

---

## 15. Mengapa Date Dimension Penting?

Tanpa Date Dimension, logic waktu tersebar pada banyak query. Dengan Date Dimension:

- definisi waktu konsisten;
- analisis bulanan/tahunan mudah;
- semester akademik dapat dipetakan;
- role-playing lebih mudah;
- BI dapat melakukan time slicing dengan lebih baik.

---

## 16. Role-Playing Dimension

Satu physical dimension dapat digunakan untuk beberapa role.

Contoh `Dim_Date` digunakan untuk:

- tanggal_masuk;
- tanggal_lulus;
- tanggal_pembayaran;
- tanggal_jatuh_tempo.

Secara fisik hanya satu tabel `Dim_Date`, tetapi secara logis memainkan role berbeda.

---

# BAGIAN IV – CONFORMED DIMENSION DAN BUS MATRIX

## 17. Conformed Dimension

Conformed Dimension adalah dimension yang digunakan secara konsisten oleh lebih dari satu business process/fact.

Contoh `Dim_Mahasiswa` digunakan oleh:

- Fact_KRS;
- Fact_Nilai;
- Fact_Pembayaran;
- Fact_Aktivitas_LMS.

Conformed Dimension memungkinkan analisis lintas proses.

Contoh:

> Apakah aktivitas LMS berhubungan dengan performa nilai mahasiswa?

Untuk menjawabnya, `Fact_Aktivitas_LMS` dan `Fact_Nilai` harus terhubung ke definisi mahasiswa yang konsisten.

---

## 18. Bus Matrix dan Shared Dimensions

Contoh:

| Business Process | Mahasiswa | Mata Kuliah | Prodi | Waktu | Dosen |
|---|:---:|:---:|:---:|:---:|:---:|
| KRS | ✓ | ✓ | ✓ | ✓ | |
| Penilaian | ✓ | ✓ | ✓ | ✓ | ✓ |
| LMS | ✓ | ✓ | ✓ | ✓ | |
| Pembayaran | ✓ | | ✓ | ✓ | |
| Kelulusan | ✓ | | ✓ | ✓ | |

Dimension yang dipakai lintas process adalah kandidat conformed dimension.

---

# BAGIAN V – DENORMALIZATION DAN SPECIAL DIMENSIONS

## 19. Denormalization dalam Dimension

Dalam database operasional, struktur biasanya dinormalisasi. Dalam Data Warehouse, dimension sering dibuat lebih denormalized agar query lebih sederhana.

Contoh normalized:

```text
Mahasiswa → Program Studi → Fakultas
```

Contoh dimension yang lebih denormalized:

```text
Dim_Mahasiswa
├── nim
├── program_studi
└── fakultas
```

Denormalization dapat mengurangi JOIN dan meningkatkan usability.

---

## 20. Kapan Snowflaking Dipertimbangkan?

Snowflaking dapat dipertimbangkan jika:

- hierarchy sangat kompleks;
- dimension sangat besar;
- atribut banyak digunakan lintas domain;
- governance memerlukan separation tertentu.

Namun prinsip pembelajaran:

> **Prefer simplicity unless normalization gives clear analytical benefit.**

---

## 21. Degenerate Dimension – Preview

Degenerate Dimension adalah identifier transaksi yang disimpan langsung di Fact Table tanpa Dimension Table tersendiri.

Contoh:

- nomor transaksi;
- nomor invoice;
- nomor KRS.

Pembahasan utama dipindahkan ke Pertemuan 6 karena secara fisik berada pada Fact Table.

---

## 22. Junk Dimension – Pengayaan

Junk Dimension menggabungkan beberapa flag atau atribut kecil yang tidak layak menjadi dimension terpisah.

Contoh:

```text
is_lulus
is_remedial
is_transfer
is_beasiswa
```

Konsep ini merupakan pengayaan dan bukan outcome utama P5.

---

# BAGIAN VI – DIMENSION SPECIFICATION

## 23. Dimension Specification

Setiap Dimension perlu didokumentasikan.

Contoh:

| Field | Isi |
|---|---|
| Dimension Name | Dim_Mahasiswa |
| Business Purpose | Mendeskripsikan mahasiswa |
| Grain | Satu record per versi mahasiswa |
| Natural Key | NIM |
| Surrogate Key | mahasiswa_key |
| Source | mahasiswa.csv |
| Hierarchy | Fakultas → Prodi |
| SCD Candidate | Ya |
| Conformed | Ya |

---

## 24. Attribute Specification

| Attribute | Business Definition | Source | Transformation |
|---|---|---|---|
| nim | Nomor mahasiswa | mahasiswa.nim | Direct |
| angkatan | Tahun masuk | mahasiswa.angkatan | Direct |
| jenis_kelamin | Gender canonical | mahasiswa.jk_raw | Standardization |
| program_studi | Nama prodi canonical | mahasiswa.prodi_raw | Reference mapping |

Dimension design mulai menghubungkan hasil profiling dari Unit 1.2 dengan desain model.

---

## 25. Hubungan Dimension Design dan Data Quality

Temuan Unit 1.2 misalnya:

```text
TI
Tek. Informasi
TEKNOLOGI INFORMASI
Teknologi Informasi
```

Jika `program_studi` menjadi atribut dimension, maka Dimension Specification harus mencatat kebutuhan standardization.

P5 belum menentukan rule detail; rule tersebut difinalkan pada P7.

---

# BAGIAN VII – STUDI KASUS UADW

## 26. Dim_Mahasiswa

### Source
`mahasiswa.csv`

### Natural Key
`nim`

### Surrogate Key
`mahasiswa_key`

### Candidate Attributes
- nim;
- angkatan;
- jenis_kelamin;
- kota_asal;
- program_studi;
- status_mahasiswa.

### Potential SCD Candidates
- program_studi;
- kota_asal;
- status_mahasiswa.

Keputusan SCD belum dibuat pada P5.

---

## 27. Dim_MataKuliah

### Source
`mata_kuliah.csv`

### Natural Key
`kode_mk`

### Surrogate Key
`mata_kuliah_key`

### Candidate Attributes
- kode_mk;
- nama_mk;
- sks;
- kategori;
- semester_rekomendasi.

---

## 28. Dim_Semester vs Dim_Date

Mahasiswa harus membedakan kebutuhan grain.

Untuk Fact_Nilai, analisis mungkin cukup menggunakan `Dim_Semester`.

Untuk Fact_Pembayaran, tanggal transaksi detail lebih relevan sehingga `Dim_Date` diperlukan.

Prinsip:

> **Dimension design follows analytical grain and question.**

---

# BAGIAN VIII – OUTPUT PEMBELAJARAN

## 29. RTM 3 v0.2

Mahasiswa memperbarui RTM dari P4 dengan:

1. minimal tiga Dimension Specifications;
2. Natural Key;
3. Surrogate Key;
4. Attribute List;
5. Hierarchy;
6. Date/Time Dimension;
7. Conformed Dimension identification;
8. updated Star Schema.

Gunakan Dimension Design Canvas:

| Component | Result |
|---|---|
| Dimension Name | ... |
| Business Purpose | ... |
| Natural Key | ... |
| Surrogate Key | ... |
| Attributes | ... |
| Hierarchy | ... |
| Source | ... |
| Transformation Needed | ... |
| Conformed? | ... |
| SCD Candidate? | ... |

---

## 30. Miskonsepsi

1. Natural key dan surrogate key sama. **Salah.**
2. NIM selalu cocok sebagai PK Dim_Mahasiswa. **Tidak ideal dalam DWH.**
3. Setiap source table harus menjadi dimension. **Salah.**
4. Semakin banyak atribut semakin baik. **Salah; relevansi analitik lebih penting.**
5. Normalisasi selalu lebih baik. **Tidak dalam semua dimensional model.**
6. Date Dimension sama dengan kolom tanggal. **Salah.**

---

## 31. Exit Quiz

1. Apa fungsi utama Dimension Table?
2. Apa perbedaan Natural Key dan Surrogate Key?
3. Mengapa Fact Table lebih tepat menyimpan surrogate key?
4. Berikan contoh hierarchy pada Dimension Waktu.
5. Apa yang dimaksud Conformed Dimension?
6. Mengapa Date Dimension lebih kaya daripada kolom tanggal biasa?
7. Apa yang dimaksud Role-Playing Dimension?
8. Bagaimana abstraction digunakan untuk memilih atribut Dim_Mahasiswa?

---

## 32. Jembatan ke Pertemuan 6

Setelah P5 mahasiswa memahami **siapa, apa, kapan, dan konteks apa** dari business event.

Pertanyaan berikutnya:

> **Bagaimana business event tersebut disimpan dan apa yang benar-benar dapat diukur?**

Pertemuan 6 akan membahas:

- Fact Table;
- grain validation;
- foreign key;
- measure;
- additivity;
- fact type;
- Fact Specification.

---

## 33. Ringkasan

Prinsip utama:

> **Dimensions give meaning to facts.**

> **Use surrogate keys to protect the Data Warehouse from operational key changes.**

> **A Dimension should contain attributes that are useful for analysis, not simply copied from the source.**
