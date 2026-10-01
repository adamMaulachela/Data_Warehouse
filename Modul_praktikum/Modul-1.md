# Modul Praktikum 01 - Pengenalan Lingkungan Data Warehouse dan Eksplorasi Sumber Data

## 1. Identitas Praktikum


|                              |                                                                          |
| ---------------------------- | ------------------------------------------------------------------------ |
| Mata Kuliah                  | Data Warehouse                                                           |
| Praktikum                    | 01 - Pengenalan Lingkungan Data Warehouse dan Eksplorasi Sumber Data     |
| Dataset                      | Master Dataset UADW v1.0                                                 |
| Semester                     | 5                                                                        |
| Pendekatan                   | OBE + Computational Thinking + Problem-Based Practical                   |
| Fokus Computational Thinking | Problem Identification dan Decomposition                                 |
| RTM Terkait                  | Persiapan RTM 1 - Promblem Decomposition dan RTM 2 - Pattern Recognition |
|                              |                                                                          |

## 2. Kemampuan Akhir Praktikum 
1. Menyiapkan database praktikum dan schema sumber (source layer) di PostgreSQL
2. Memuat liat master dataset awal UADW v1.10 tanpa membersihkan nilai raw
3. Menyusun inventory data berdasarkan nama file, jumlah baris, kolom, dan peran bisnis
4. Mengidentifikasi indikasi awal masalah kualitas data melalui query eksploratif
5. Menjelaskan bagaimana sumber data besar dapat dipecah menjadi komponen yang dapat dianalisis


> **Prinsip utama**:  Pada Praktikum 1 mahasiswa belum diminta memperbaiki dirty data. Tujuannya adalah mengenali sumber, mempertahankan bentuk raw, dan membangun pertanyaan yang akan dijawab pada praktikum berikutnya.

## 3. Konteks Kasus
Universitas Academic Data Warehouse (UADW) memiliki beberapa sistem operasional yang menghasilkan data akademik, LMS, dan pembayaran. Pimpinan ingin membangun Data Warehouse, tetapi sebelum proses ETL dilakukan tim harus memahami terlebih dahulu data apa yang tersedia dan kualitas awalnya.

> **Pertanyaan pemantik**:  Jika sebuah universitas sudah mempunyai database operasional, mengapa tim Data Warehouse tetap harus melakukan inventory dan profiling sumber data sebelum merancang Star Schema?

## 4. Dataset yang digunakan
| File              | Peran                             | Folder      |
| ----------------- | --------------------------------- | ----------- |
| program_studi.csv | Master program studi              | 01_raw_data |
| semester.csv      | Master periode akademik base load | 01_raw_data |
| mahasiswa.csv     | Master mahasiswa raw              | 01_raw_data |
| dosen.csv         | Master dosen raw                  | 01_raw_data |
| mata_kuliah.csv   | Master mata kuliah                | 01_raw_data |

>**Catatan data**:  Seluruh identitas pada **UADW v1.0** adalah data sintetis. Beberapa nilai sengaja dibuat tidak konsisten agar dapat digunakan untuk latihan data profiling, cleansing, SCD, testing, dan debugging pada modul selanjutnya.


## 5. Persiapan
1. PostgreSQL sudah terpasang dan servicenya berjalan
2. DBeaver atau pgAdmin tersedia sebagai database client
3. Folder UADW_v1.0 sudah diekstrak dan dapat dibaca
4. Gunakan encoding UTF-8 dan delimiter koma (,) sata impor CSV
5. Jangan membuka lalu menyimpan ulang CSV menggunakan aplikasi yang dapat mengubah format tanggal secara otomatis

## 6. Konsep Singkat : Source Layer
Pada arsitektur praktikum ini, file CSV pertama-tama dimuat ke schema` src`. Schema ini merepresentasikan data sumber. Kolom yang masih memiliki akhiran `_raw` sengaja dipertahankan agar mahasiswa dapat membandingkan data sumber dengan hasil standardisasi pada proses ETL.

CSV source -> PostgreSQL schema src -> Query eksplorasi -> Data inventory -> Pertanyaan kualitas data

## 7. Guided Excercise A - Membuat Database dan Schema
1. Buka koneksi PostgreSQL menggunakan DBeaver/pgAdmin
2. Buat database bernama `uadw_lab`. jika hak akses pembuatan database tidak tersedia, gunakan database laboratorium yang ditentukan dosen
3. Hubungkan kembali clinet ke database `uadw_lab`
4. Jalankan file `10_tools/01_create_source_tables.sql`. Script ini akan membuat schema src dan luma source tables Praktikum 1
5. Pastikan tabel `src.program_studi`, `src.semester`, `src.mahasiswa`, `src.dosen`, dan `src.mata_kuliah` sudah terlihat.

```sql
CREATE DATABASE uadw_lab;
-- reconect ke uadw_lab
CREATE SCHEMA IF NOT EXISTS src;

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'src';
```

## 8. Guided Excercise B - Mengimpor CSV
1. Klik kana tabel tujuan pada schema src lalu pilih Import Data
2. Pilih CSV sebagai sumber dan arahkan ke file pada folder 01_raw_data
3. Pastikan Header aktif, delimiter adalah koma, encoding UTF-8, dan mapping kolom sesuai
4. Impor data tanpa melakukan standarisasi nilai, Semua dirty value harus tetap dipertahankan
5. Ulangi proses untuk lima file yang digunakan pada praktikum 1

> **Kenapa semua kolom source dibuat longgar?** Pada tahap raw/source layer kita mengutamakan keberhasilan ingestion dan preservation. Konversi tipe data, standardisasi tanggal, mapping kode, serta aturan kualitas dilakukan pada tahap staging/transformasi di modul berikutnya.

## 9. Guided Excercise C - Membuat Data Inventory
Jalankan query berikut untuk memastikan lima tabel telah berisi data. Jangan membandingkan hasil dengan teman sebelum seluruh file selesai diimpor.
```sql
SELECT 'program_studi' AS tabel, COUNT(*) AS jumlah_baris
FROM src.program_studi
UNION ALL
SELECT 'semester', COUNT(*) FROM src.semester
UNION ALL
SELECT 'mahasiswa', COUNT(*) FROM src.mahasiswa
UNION ALL
SELECT 'dosen', COUNT(*) FROM src.dosen
UNION ALL
SELECT 'mata_kuliah', COUNT(*) FROM src.mata_kuliah;
```
| Tabel           | Jumlah Baris | Jumlah Kolom | Natural Key Candidat | Peran Bisnis |
| --------------- | ------------ | ------------ | -------------------- | ------------ |
| `program_studi` |              |              |                      |              |
| `semester`      |              |              |                      |              |
| `mahasiswa`     |              |              |                      |              |
| `dosen`         |              |              |                      |              |
| `mata_kuliah`   |              |              |                      |              |

## 10. Guide Excercise D - Eksplorasi Awal 
```sql
-- Mahasiswa unik dan indikasi duplicate

SELECT COUNT(*) AS raw_rows,

       COUNT(DISTINCT nim) AS distinct_nim,

       COUNT(*) - COUNT(DISTINCT nim) AS excess_duplicate_rows

FROM src.mahasiswa;


-- Missing kota

SELECT COUNT(*) AS missing_kota

FROM src.mahasiswa

WHERE TRIM(COALESCE(kota_asal_raw,'')) = '';


-- Lihat variasi label program studi

SELECT prodi_raw, COUNT(*) AS jumlah

FROM src.mahasiswa

GROUP BY prodi_raw

ORDER BY prodi_raw;
```

> **Observe, do not repair:**  Jika Anda menemukan 30 label raw untuk program studi padahal master hanya berisi 6 program studi, jangan langsung **UPDATE** data. Catat pola tersebut sebagai masalah yang harus ditangani pada proses mapping/cleansing.

## 11. Problem Challenge 
Tanpa menggunakan file instructor, selesaikan pertanyaan berikut menggunakan SQL dan jelaskan alasan setiap kesimpulan.

1.  Berapa jumlah baris pada masing-masing dari lima tabel sumber?
2.  Berapa jumlah NIM unik pada mahasiswa.csv? Apakah jumlahnya sama dengan jumlah baris?
3.  Berapa baris mahasiswa yang merupakan excess duplicate jika NIM dianggap natural key?
4.  Apa rentang angkatan pada base load?
5.  Berapa mahasiswa yang kota_asal_raw-nya kosong?
6.  Berapa banyak label prodi_raw yang berbeda? Bandingkan dengan jumlah program studi canonical.
7.  Temukan minimal tiga pola lain yang menunjukkan bahwa source data belum siap langsung dimasukkan ke Dimension Table.
8.  Kelompokkan lima file menjadi master/reference data atau transactional data. Jelaskan alasan Anda.
9.  Tuliskan minimal lima pertanyaan analitik yang belum dapat dijawab hanya dengan lima master dataset ini dan sebutkan dataset tambahan yang dibutuhkan.


# 12. Computational Thinking Log
| Element CT             | Pertanyaan Refleksi                                                   | Jawaban Mahasiswa |
| ---------------------- | --------------------------------------------------------------------- | ----------------- |
| Problem Identification | Masalah apa yang harus diselesaikan sebelum Data Warehouse dibangun?  |                   |
| Decomposition          | Bagaimana Anda memecah sumber data menjadi komponen yang lebih kecil? |                   |
| Pattern Recognition    | Pola atau ketidakkonsistenan apa yang terlihat?                       |                   |
| Abstraction            | Informasi mana yang cukup penting untuk inventory awal?               |                   |
| Evaluation             | Bagaimana Anda membuktikan bahwa proses import berhasil?              |                   |

## 13. Tugas dan Deliverables
1. File SQL: praktikum01_NIM.sql yang berisi query inventory dan eksplorasi.
2. Tabel Data Inventory yang sudah dilengkapi.
3. Jawaban Problem Challenge 1-9 dengan bukti query/output yang relevan.
4. Computational Thinking Log.
5. Satu paragraf refleksi: mengapa source layer tidak boleh langsung dianggap sebagai data yang benar dan bersih?

