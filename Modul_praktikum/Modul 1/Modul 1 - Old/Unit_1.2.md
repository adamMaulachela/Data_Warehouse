# MODUL PRAKTIKUM 2
## DATA EXPLORATION DAN DATA PROFILING
### Mata Kuliah Data Warehouse

---

## A. IDENTITAS PRAKTIKUM

**Mata Kuliah:** Data Warehouse  
**Program Studi:** Teknologi Informasi  
**Semester:** 5  
**Praktikum:** 2  
**Topik:** Data Exploration dan Data Profiling  
**Dataset:** Master Dataset UADW v1.0  
**Tools Utama:** PostgreSQL, DBeaver/pgAdmin, Python, Pandas  
**Pendekatan:** OBE, Computational Thinking, Problem-Based Learning

---

# B. POSISI PRAKTIKUM DALAM ALUR PEMBELAJARAN

Pada Praktikum 1 mahasiswa telah:

- menyiapkan PostgreSQL;
- membuat database;
- mengimpor beberapa data sumber UADW;
- mengenali struktur awal tabel;
- menjalankan query eksplorasi sederhana.

Praktikum 2 melanjutkan proses tersebut.

Pertanyaan utama Praktikum 1:

> **Can we access the data?**

Pertanyaan utama Praktikum 2:

> **Can we understand and trust the data?**

Alurnya:

```text
PRAKTIKUM 1
Environment Setup
        ↓
Import Data
        ↓
Initial Exploration
        ↓
PRAKTIKUM 2
Data Exploration
        ↓
Data Profiling
        ↓
Pattern Recognition
        ↓
Anomaly Detection
        ↓
Data Quality Assessment
```

---

# C. CPMK YANG DIDUKUNG

## CPMK-2

Mahasiswa mampu:

> **Menganalisis kebutuhan bisnis dan kebutuhan data sebagai dasar pembangunan sistem Data Warehouse.**

Praktikum ini juga memberikan fondasi untuk:

- CPMK-3: Dimensional Modeling;
- CPMK-4: ETL dan implementasi Data Warehouse.

---

# D. SUB-CPMK PRAKTIKUM

Setelah mengikuti praktikum, mahasiswa mampu:

> **Melakukan eksplorasi dan profiling terhadap data sumber untuk mengidentifikasi struktur, distribusi, pola, missing value, duplicate, inkonsistensi, dan anomali sebagai dasar perancangan proses integrasi Data Warehouse.**

---

# E. KEMAMPUAN AKHIR YANG DIHARAPKAN

Setelah praktikum mahasiswa mampu:

1. menjelaskan tujuan data profiling;
2. melakukan table-level profiling;
3. melakukan column-level profiling;
4. menghitung jumlah baris;
5. menghitung jumlah nilai unik;
6. mendeteksi NULL dan missing value;
7. mendeteksi duplicate;
8. menganalisis frequency distribution;
9. melakukan domain validation;
10. menemukan inconsistency antar-field;
11. membandingkan data dengan reference table;
12. mengenali kandidat Dimension;
13. mengenali kandidat Fact;
14. mengklasifikasikan masalah kualitas data;
15. menyusun Data Profiling Report;
16. menyusun Anomaly Register;
17. menjelaskan proses investigasi menggunakan Computational Thinking.

---

# F. KETERKAITAN DENGAN RTM

Praktikum ini merupakan bagian dari:

# RTM 2 – PATTERN RECOGNITION: MEMAHAMI DATA

RTM 2 menghasilkan:

- Data Profiling Report;
- Pattern Analysis;
- Anomaly Register;
- kandidat Dimension;
- kandidat Fact;
- Data Quality Findings.

Hasil Praktikum 2 nantinya akan digunakan kembali ketika mahasiswa melakukan:

- dimensional modeling;
- data cleansing;
- source-to-target mapping;
- ETL;
- data quality validation.

---

# G. FOKUS COMPUTATIONAL THINKING

Fokus utama:

# PATTERN RECOGNITION

Mahasiswa tidak hanya mencari data yang salah satu per satu.

Mahasiswa harus menemukan **pola masalah**.

Contoh:

```text
TI
Tek. Informasi
Teknologi Informasi
TEKNOLOGI INFORMASI
```

Empat nilai tersebut tidak boleh langsung dianggap sebagai empat kategori berbeda.

Mahasiswa harus mengenali bahwa terdapat pola:

> **Inconsistent representation of the same business entity.**

Fokus tambahan:

## Decomposition

Masalah profiling dipecah menjadi:

```text
Dataset
  ↓
Table
  ↓
Column
  ↓
Completeness
  ↓
Uniqueness
  ↓
Distribution
  ↓
Validity
  ↓
Consistency
  ↓
Relationship
```

---

# H. PERTANYAAN PEMANTIK

Dosen membuka praktikum dengan pertanyaan:

> “Kita sudah berhasil mengimpor data pada Praktikum 1. Apakah data tersebut sekarang sudah siap dimasukkan ke Data Warehouse?”

Jawaban:

> **Belum tentu.**

Pertanyaan berikutnya:

> “Bagaimana kita mengetahui kualitas data tanpa memeriksa setiap baris secara manual?”

Jawaban:

> **Data Profiling.**

---

# I. PENGERTIAN DATA EXPLORATION

Data Exploration adalah proses awal untuk memahami karakteristik dataset.

Tujuannya adalah mengetahui:

- ukuran data;
- struktur data;
- tipe data;
- nilai yang tersedia;
- distribusi sederhana;
- rentang nilai;
- hubungan antar-data;
- kemungkinan anomali.

Data Exploration menjawab:

> **“Apa yang sebenarnya ada di dalam dataset?”**

---

# J. PENGERTIAN DATA PROFILING

Data Profiling adalah proses sistematis untuk menganalisis:

- struktur;
- isi;
- pola;
- kualitas;
- hubungan;

pada suatu dataset.

Data Profiling menjawab pertanyaan seperti:

- Apakah NIM benar-benar unik?
- Apakah terdapat missing value?
- Apakah program studi ditulis secara konsisten?
- Apakah nilai berada pada rentang yang valid?
- Apakah kode mata kuliah memiliki referensi?
- Apakah ada transaksi yang muncul berulang?

---

# K. DIMENSI DATA PROFILING

Pada praktikum ini digunakan delapan aspek utama.

| Aspek | Pertanyaan |
|---|---|
| Structure | Kolom apa saja yang tersedia? |
| Data Type | Tipe datanya sesuai atau tidak? |
| Completeness | Apakah terdapat data kosong? |
| Uniqueness | Apakah atribut tertentu benar-benar unik? |
| Distribution | Nilai apa yang dominan? |
| Validity | Apakah nilai sesuai domain? |
| Consistency | Apakah representasi data konsisten? |
| Relationship | Apakah hubungan antartabel valid? |

---

# L. DATASET YANG DIGUNAKAN

## Guided Dataset

Tahap awal menggunakan:

```text
mahasiswa.csv
program_studi.csv
```

Tujuan:

- mengenali profiling dasar;
- menemukan duplicate;
- mencari NULL;
- mengenali category inconsistency.

## Challenge Dataset

Setelah Guided Exercise:

```text
krs.csv
nilai.csv
mata_kuliah.csv
semester.csv
```

## Extension Dataset

Mahasiswa yang menyelesaikan challenge lebih cepat dapat menggunakan:

```text
aktivitas_lms.csv
pembayaran.csv
kelulusan.csv
```

---

# M. ATURAN UTAMA PRAKTIKUM

Pada Praktikum 2:

# RAW DATA IS READ-ONLY

Mahasiswa **tidak diperbolehkan**:

- menghapus duplicate;
- mengisi missing value;
- memperbaiki label program studi;
- mengubah nilai;
- melakukan UPDATE terhadap raw source;
- melakukan DELETE terhadap source.

Mahasiswa hanya:

> **Detect → Measure → Classify → Explain → Document**

Perbaikan data akan dilakukan pada tahap Data Cleaning dan ETL.

---

# N. PERSIAPAN PRAKTIKUM

Pastikan:

1. PostgreSQL aktif.
2. Database UADW dari Praktikum 1 tersedia.
3. Data raw telah diimpor.
4. DBeaver atau pgAdmin dapat terhubung.
5. Python telah terinstal.
6. Library Pandas tersedia.

Uji Python:

```python
import pandas as pd

print(pd.__version__)
```

---

# O. BAGIAN 1 — TABLE-LEVEL PROFILING

Tujuan pertama adalah memahami karakteristik setiap tabel.

Pertanyaan:

- berapa jumlah record?
- berapa jumlah kolom?
- apa business key yang mungkin digunakan?
- tabel tersebut master, reference, atau transaction?

---

## O.1 Menghitung Jumlah Baris

Contoh:

```sql
SELECT COUNT(*) AS total_rows
FROM mahasiswa;
```

Lakukan untuk:

```text
mahasiswa
program_studi
mata_kuliah
dosen
krs
nilai
```

Catat hasilnya.

---

## O.2 Menampilkan Sampel Data

```sql
SELECT *
FROM mahasiswa
LIMIT 10;
```

Jangan langsung menyimpulkan kondisi data hanya dari 10 baris.

Tujuan sampel hanyalah:

> memahami bentuk record.

---

## O.3 Menentukan Peran Tabel

Kelompokkan tabel sebagai:

### Master Data

Contoh:

```text
mahasiswa
dosen
mata_kuliah
```

### Reference Data

Contoh:

```text
program_studi
semester
```

### Transaction Data

Contoh:

```text
krs
nilai
pembayaran
aktivitas_lms
```

---

## O.4 Output Table-Level Profiling

Gunakan format:

| Table | Rows | Columns | Candidate Key | Type | Description |
|---|---:|---:|---|---|---|
| mahasiswa | ... | ... | nim | Master | Data mahasiswa |
| program_studi | ... | ... | kode_prodi | Reference | Referensi program studi |
| krs | ... | ... | ... | Transaction | Pengambilan mata kuliah |

---

# P. BAGIAN 2 — COLUMN-LEVEL PROFILING

Setelah memahami tabel, mahasiswa menganalisis kolom.

Pertanyaan utama:

- tipe data apa?
- apakah NULL?
- berapa nilai unik?
- apakah nilai sesuai domain?

---

## P.1 Melihat Struktur Tabel

PostgreSQL:

```sql
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'mahasiswa'
ORDER BY ordinal_position;
```

---

## P.2 Menghitung Nilai Unik

Contoh:

```sql
SELECT COUNT(DISTINCT nim) AS unique_nim
FROM mahasiswa;
```

Bandingkan:

```sql
SELECT COUNT(*) AS total_rows
FROM mahasiswa;
```

Jika:

```text
total_rows > unique_nim
```

maka perlu dilakukan investigasi kemungkinan duplicate.

---

# Q. BAGIAN 3 — COMPLETENESS / MISSING VALUE

Completeness menunjukkan apakah data yang dibutuhkan tersedia.

---

## Q.1 Memeriksa NULL

Contoh:

```sql
SELECT COUNT(*) AS null_kota
FROM mahasiswa
WHERE kota_asal IS NULL;
```

---

## Q.2 Memeriksa Blank String

NULL dan string kosong berbeda.

```sql
SELECT COUNT(*)
FROM mahasiswa
WHERE TRIM(kota_asal) = '';
```

Pemeriksaan yang lebih lengkap:

```sql
SELECT COUNT(*)
FROM mahasiswa
WHERE kota_asal IS NULL
   OR TRIM(kota_asal) = '';
```

---

## Q.3 Pertanyaan Analisis

Jika ditemukan missing value, jangan langsung menulis:

> “Data buruk.”

Tentukan:

1. kolom apa yang kosong?
2. berapa frekuensinya?
3. apakah kolom tersebut dibutuhkan?
4. analisis apa yang akan terpengaruh?

Contoh:

`kota_asal` kosong akan berpengaruh pada:

> analisis distribusi mahasiswa berdasarkan wilayah.

---

# R. BAGIAN 4 — UNIQUENESS DAN DUPLICATE

## R.1 Duplicate NIM

```sql
SELECT
    nim,
    COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY nim
HAVING COUNT(*) > 1
ORDER BY jumlah DESC;
```

---

## R.2 Investigasi Record Duplicate

Setelah menemukan NIM tertentu:

```sql
SELECT *
FROM mahasiswa
WHERE nim = 'NIM_YANG_DIPERIKSA';
```

Bandingkan semua atribut.

Pertanyaan:

- apakah seluruh field sama?
- apakah terdapat perubahan atribut?
- apakah record merupakan duplicate persis?
- apakah record mungkin merepresentasikan histori?

---

## R.3 Prinsip Penting

> **Duplicate detection ≠ duplicate deletion.**

Mahasiswa belum boleh menghapus data.

---

# S. BAGIAN 5 — FREQUENCY DISTRIBUTION

Frequency Distribution digunakan untuk melihat pola nilai.

---

## S.1 Program Studi

```sql
SELECT
    prodi_raw,
    COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY prodi_raw
ORDER BY jumlah DESC;
```

Amati:

- jumlah kategori;
- kemiripan label;
- kapitalisasi;
- singkatan;
- variasi penulisan.

---

## S.2 Jenis Kelamin

```sql
SELECT
    jenis_kelamin,
    COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY jenis_kelamin
ORDER BY jumlah DESC;
```

Pertanyaan:

> Apakah satu konsep direpresentasikan dengan satu kode?

---

# T. BAGIAN 6 — PATTERN RECOGNITION

Mahasiswa sekarang mengelompokkan temuan.

Contoh:

```text
Teknologi Informasi
TI
Tek. Informasi
TEKNOLOGI INFORMASI
```

Kemungkinan interpretasi:

> seluruh nilai merepresentasikan entitas bisnis yang sama.

Kategori problem:

> **Consistency Problem**

Pattern Recognition berarti:

> mencari kesamaan makna di balik representasi data yang berbeda.

---

# U. BAGIAN 7 — DOMAIN VALIDATION

Setiap atribut mempunyai domain atau aturan.

Contoh nilai mahasiswa:

```text
0 ≤ nilai_angka ≤ 100
```

Query:

```sql
SELECT *
FROM nilai
WHERE nilai_angka < 0
   OR nilai_angka > 100;
```

Jika ditemukan nilai di luar domain:

> tandai sebagai **Validity Issue**.

Jangan diperbaiki dahulu.

---

# V. BAGIAN 8 — DESCRIPTIVE STATISTICS

Gunakan PostgreSQL:

```sql
SELECT
    MIN(nilai_angka) AS min_nilai,
    MAX(nilai_angka) AS max_nilai,
    AVG(nilai_angka) AS avg_nilai
FROM nilai;
```

Tambahkan:

```sql
SELECT
    COUNT(*) AS jumlah,
    COUNT(nilai_angka) AS nilai_terisi
FROM nilai;
```

Pertanyaan:

> Apa perbedaan `COUNT(*)` dan `COUNT(nilai_angka)`?

Ini membantu mendeteksi NULL.

---

# W. BAGIAN 9 — CROSS-FIELD CONSISTENCY

Satu kolom mungkin valid, tetapi hubungannya dengan kolom lain dapat salah.

Contoh:

```text
nilai_angka = 90
nilai_huruf = D
```

Nilai `90` valid.

Nilai `D` juga merupakan kategori valid.

Namun:

> kombinasinya tidak konsisten.

Mahasiswa harus mencari kemungkinan mismatch antara:

```text
nilai_angka
nilai_huruf
```

Gunakan aturan nilai yang disediakan dosen/data dictionary.

---

# X. BAGIAN 10 — REFERENCE CONSISTENCY

Data master sering mempunyai referensi.

Contoh:

```text
mahasiswa.prodi_raw
```

harus dapat dihubungkan ke:

```text
program_studi
```

Mahasiswa membandingkan daftar nilai:

```sql
SELECT DISTINCT prodi_raw
FROM mahasiswa
ORDER BY prodi_raw;
```

dengan:

```sql
SELECT *
FROM program_studi;
```

Pertanyaan:

> Apakah semua nilai `prodi_raw` langsung cocok dengan nama canonical?

Kemungkinan tidak.

Ini menjadi dasar kebutuhan:

> **mapping dan standardization.**

---

# Y. BAGIAN 11 — TRANSACTION PROFILING: KRS

KRS merupakan transaction dataset.

Pertanyaan awal:

- berapa jumlah transaksi?
- berapa mahasiswa?
- berapa mata kuliah?
- semester apa saja?
- apakah terdapat transaksi duplicate?

---

## Y.1 Statistik Dasar

```sql
SELECT
    COUNT(*) AS transaksi,
    COUNT(DISTINCT nim) AS mahasiswa,
    COUNT(DISTINCT kode_mk) AS mata_kuliah
FROM krs;
```

---

## Y.2 Candidate Business Key

Secara konseptual kandidat key:

```text
nim + kode_mk + semester
```

Uji:

```sql
SELECT
    nim,
    kode_mk,
    semester,
    COUNT(*) AS jumlah
FROM krs
GROUP BY nim, kode_mk, semester
HAVING COUNT(*) > 1;
```

Jika ada hasil:

> jangan langsung menghapus.

Investigasi terlebih dahulu.

---

# Z. BAGIAN 12 — PROFILING NILAI

Lakukan profiling terhadap:

```text
nilai_angka
nilai_huruf
nim
kode_mk
semester
```

Minimal cari:

1. total record;
2. NULL nilai;
3. minimum;
4. maksimum;
5. kategori nilai huruf;
6. nilai di luar domain;
7. kemungkinan duplicate;
8. mismatch angka-huruf.

---

# AA. BAGIAN 13 — PROFILING DENGAN PYTHON/PANDAS

SQL sangat baik untuk database profiling.

Python digunakan agar mahasiswa melihat alternatif workflow analitik.

---

## AA.1 Membaca CSV

```python
import pandas as pd

mahasiswa = pd.read_csv("mahasiswa.csv")
```

---

## AA.2 Menampilkan Struktur

```python
print(mahasiswa.info())
```

---

## AA.3 Melihat Lima Record

```python
print(mahasiswa.head())
```

---

## AA.4 Menghitung Jumlah Baris dan Kolom

```python
print(mahasiswa.shape)
```

---

## AA.5 Menghitung Missing Value

```python
print(mahasiswa.isna().sum())
```

---

## AA.6 Menghitung Unique Value

```python
print(mahasiswa.nunique())
```

---

## AA.7 Frequency Distribution

```python
print(
    mahasiswa["prodi_raw"]
    .value_counts(dropna=False)
)
```

---

## AA.8 Duplicate Detection

```python
duplikat = mahasiswa[
    mahasiswa.duplicated(subset=["nim"], keep=False)
]

print(duplikat)
```

---

# AB. BAGIAN 14 — DATA QUALITY CLASSIFICATION

Semua temuan harus diklasifikasikan.

Gunakan kategori:

## Completeness

Contoh:

- NULL;
- blank.

## Uniqueness

Contoh:

- duplicate NIM.

## Consistency

Contoh:

- TI;
- Teknologi Informasi;
- Tek. Informasi.

## Validity

Contoh:

- nilai = 105.

## Referential Integrity

Contoh:

- kode mata kuliah tidak terdapat dalam master mata kuliah.

## Semantic Consistency

Contoh:

- nilai 90 tetapi nilai huruf D.

---

# AC. BAGIAN 15 — ANOMALY REGISTER

Mahasiswa membuat tabel berikut:

| ID | Dataset | Column | Problem | Evidence | Category | Severity |
|---|---|---|---|---|---|---|
| A01 | mahasiswa | nim | ... | Query ... | Uniqueness | ... |
| A02 | mahasiswa | kota_asal | ... | Query ... | Completeness | ... |
| A03 | nilai | nilai_angka | ... | Query ... | Validity | ... |

Setiap anomaly harus memiliki:

> **evidence**

bukan hanya dugaan.

---

# AD. BAGIAN 16 — MENENTUKAN SEVERITY

## HIGH

Masalah berpotensi menyebabkan:

- salah JOIN;
- duplicate counting;
- salah KPI;
- ETL gagal.

## MEDIUM

Masalah memengaruhi sebagian analisis.

## LOW

Masalah tidak banyak memengaruhi analisis utama.

Mahasiswa harus memberikan alasan.

---

# AE. BAGIAN 17 — CANDIDATE DIMENSION

Setelah memahami source, mahasiswa mulai mengenali data yang berpotensi menjadi Dimension.

Pertanyaan:

> Data mana yang memberikan konteks deskriptif terhadap analisis?

Contoh kandidat:

```text
Mahasiswa
Program Studi
Mata Kuliah
Dosen
Semester/Waktu
```

Mahasiswa belum membuat Dimension Table.

Cukup:

> identify + justify.

---

# AF. BAGIAN 18 — CANDIDATE FACT

Pertanyaan:

> Data mana yang merepresentasikan kejadian atau transaksi berulang?

Contoh kandidat:

```text
KRS
Nilai
Pembayaran
Aktivitas LMS
Kelulusan
```

Mahasiswa menjelaskan alasan.

---

# AG. GUIDED EXERCISE

Gunakan:

```text
mahasiswa
program_studi
```

Dosen membimbing mahasiswa untuk:

1. menghitung total baris;
2. menghitung unique NIM;
3. mencari duplicate;
4. mencari missing value;
5. melihat frequency `prodi_raw`;
6. membandingkan dengan reference program studi;
7. mengklasifikasikan masalah.

Mahasiswa mencatat query dan hasil.

---

# AH. PROBLEM CHALLENGE

Setelah Guided Exercise, mahasiswa menerima:

```text
krs
nilai
mata_kuliah
semester
```

Dosen tidak memberikan query lengkap.

Mahasiswa harus menentukan sendiri:

### 1.

Kolom apa yang perlu diperiksa?

### 2.

Apa candidate business key?

### 3.

Apa domain validnya?

### 4.

Bagaimana mendeteksi duplicate?

### 5.

Bagaimana mendeteksi missing?

### 6.

Bagaimana mendeteksi inconsistency?

### 7.

Apa masalah dengan severity tertinggi?

### 8.

Data mana yang berpotensi menjadi Fact atau Dimension?

---

# AI. EXTENSION CHALLENGE

Untuk mahasiswa yang menyelesaikan tugas utama:

Pilih salah satu:

```text
aktivitas_lms
pembayaran
kelulusan
```

Lakukan profiling tanpa panduan.

Minimal temukan:

- struktur;
- completeness;
- uniqueness;
- distribution;
- validity;
- anomaly;
- candidate grain.

---

# AJ. OUTPUT PRAKTIKUM

Mahasiswa menyerahkan:

## 1. Data Profiling Report

Format:

| Dataset | Column | Type | Null | Unique | Min | Max | Issue |
|---|---|---|---:|---:|---|---|---|

## 2. Data Quality Summary

Contoh:

| Quality Dimension | Number of Findings | Severity |
|---|---:|---|
| Completeness | ... | ... |
| Consistency | ... | ... |
| Validity | ... | ... |

## 3. Anomaly Register

Sertakan query sebagai evidence.

## 4. SQL Script

Nama file:

```text
praktikum02_profiling.sql
```

## 5. Python Script / Notebook

Contoh:

```text
praktikum02_profiling.ipynb
```

atau:

```text
praktikum02_profiling.py
```

## 6. Pattern Recognition Summary

Minimal lima pola.

## 7. Candidate Dimension

Daftar + alasan.

## 8. Candidate Fact

Daftar + alasan.

## 9. Computational Thinking Log

## 10. Reflection

---

# AK. COMPUTATIONAL THINKING LOG

Gunakan format:

| Elemen CT | Jawaban |
|---|---|
| Problem | Masalah apa yang diperiksa? |
| Decomposition | Bagaimana profiling dipecah menjadi langkah kecil? |
| Pattern Recognition | Pola apa yang ditemukan? |
| Abstraction | Temuan apa yang paling penting? |
| Evaluation | Bagaimana temuan dibuktikan? |
| Next Action | Apa yang perlu diperbaiki pada tahap ETL? |

---

# AL. PERTANYAAN REFLEKSI

Jawab secara singkat:

### 1.

Apakah data yang berhasil diimpor otomatis berarti data berkualitas?

### 2.

Masalah data apa yang menurut Anda paling berbahaya untuk Data Warehouse?

### 3.

Mengapa duplicate tidak boleh langsung dihapus?

### 4.

Apa perbedaan validity dan consistency?

### 5.

Mengapa data secara sintaksis benar belum tentu benar secara semantik?

### 6.

Pola masalah apa yang paling sering ditemukan?

### 7.

Dataset mana yang paling berpotensi menjadi Dimension?

### 8.

Dataset mana yang paling berpotensi menjadi Fact?

---

# AM. RUBRIK PENILAIAN

| Komponen | Bobot |
|---|---:|
| Table-Level Profiling | 10% |
| Column-Level Profiling | 10% |
| Missing & Duplicate Detection | 15% |
| Validity & Consistency Analysis | 15% |
| Pattern Recognition | 20% |
| SQL/Python Evidence | 10% |
| Candidate Fact/Dimension Reasoning | 10% |
| CT Log & Reflection | 10% |
| **TOTAL** | **100%** |

---

# AN. KRITERIA PENILAIAN

## Sangat Baik

Mahasiswa:

- melakukan profiling sistematis;
- menemukan pola;
- memberikan evidence;
- mengklasifikasikan anomaly dengan tepat;
- menjelaskan dampaknya;
- mampu membedakan fact dan dimension secara awal.

## Baik

Mayoritas profiling benar tetapi analisis pola masih dapat ditingkatkan.

## Cukup

Mahasiswa menemukan beberapa anomaly tetapi belum mampu menjelaskan pola dan dampaknya dengan baik.

## Kurang

Mahasiswa hanya menjalankan query tanpa dapat menjelaskan arti hasilnya.

---

# AO. PRINSIP PENILAIAN

Nilai tinggi **tidak diberikan hanya karena mahasiswa menemukan banyak error**.

Yang dinilai adalah:

```text
DETECT
  ↓
PROVE
  ↓
CLASSIFY
  ↓
EXPLAIN
  ↓
PRIORITIZE
```

Contoh jawaban lemah:

> “Nama prodi banyak yang salah.”

Contoh jawaban baik:

> “Ditemukan beberapa representasi nama program studi yang secara semantik merujuk pada entitas yang sama. Masalah ini dikategorikan sebagai consistency issue dan dapat menghasilkan pemisahan kelompok yang seharusnya sama ketika dilakukan agregasi berdasarkan program studi.”

---

# AP. JEMBATAN KE PRAKTIKUM 3

Pada akhir Praktikum 2 mahasiswa sudah mengetahui:

> **What is inside the data?**

dan:

> **What problems exist in the data?**

Pertanyaan berikutnya:

> **Which data do we actually need to answer the business questions?**

Pertanyaan tersebut menjadi fokus Praktikum 3:

# BUSINESS REQUIREMENT TO DATA REQUIREMENT

Alurnya:

```text
Praktikum 1
Access the Data
        ↓
Praktikum 2
Understand the Data
        ↓
Praktikum 3
Select the Required Data
        ↓
Praktikum 4
Model the Data
```

---

# AQ. BENANG MERAH PRAKTIKUM 2

Pesan yang harus dibawa mahasiswa adalah:

> **Never clean what you do not understand.**

Sebelum memperbaiki data:

1. pahami struktur;
2. ukur kualitas;
3. temukan pola;
4. identifikasi anomaly;
5. tentukan dampak;
6. dokumentasikan evidence.

Barulah pada tahap selanjutnya mahasiswa dapat merancang aturan:

> **cleaning → standardization → transformation → loading.**

Dengan demikian Praktikum 2 bukan hanya latihan SQL atau Pandas, melainkan latihan untuk membangun **data awareness dan pattern recognition** sebagai bagian dari Computational Thinking.
