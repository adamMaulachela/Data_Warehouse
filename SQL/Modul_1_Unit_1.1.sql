-- Modul 	: 1
-- Unit		: 1.1
-- Nama 	: Adam Bachtiar
-- NIM		: 08078505

-- 1. Verifikasi Environment PostgreSQL
select version();

select current_database() as database_aktif,
current_user as user_aktif;

select schema_name
from information_schema.schemata
where schema_name = 'src';


-- 2. DDL Source Layer
CREATE SCHEMA IF NOT EXISTS src;
DROP TABLE IF EXISTS src.program_studi;

-- membuat tabel program studi
CREATE TABLE src.program_studi (
    kode_prodi TEXT,
    nama_prodi TEXT,
    fakultas TEXT,
    departemen TEXT,
    status TEXT
);

-- membuat tabel semester
DROP TABLE IF EXISTS src.semester;
CREATE TABLE src.semester (
    semester_id TEXT,
    tahun_akademik TEXT,
    term TEXT,
    urutan_tahun TEXT,
    tanggal_mulai TEXT,
    tanggal_selesai TEXT
);

-- membuat tabel mahasiswa
DROP TABLE IF EXISTS src.mahasiswa;
CREATE TABLE src.mahasiswa (
    nim TEXT,
    nama TEXT,
    jk_raw TEXT,
    tanggal_lahir_raw TEXT,
    kota_asal_raw TEXT,
    kode_prodi_raw TEXT,
    prodi_raw TEXT,
    angkatan TEXT,
    tanggal_masuk_raw TEXT,
    status_raw TEXT,
    email_kampus TEXT
);

-- membuat tabel dosen
DROP TABLE IF EXISTS src.dosen;
CREATE TABLE src.dosen (
    nidn TEXT,
    nama_dosen TEXT,
    jk_raw TEXT,
    unit_prodi_raw TEXT,
    jabatan_akademik TEXT,
    tanggal_masuk_raw TEXT,
    status TEXT
);

-- membuat tabel mata kuliah
DROP TABLE IF EXISTS src.mata_kuliah;
CREATE TABLE src.mata_kuliah (
    kode_mk TEXT,
    nama_mk TEXT,
    kode_prodi TEXT,
    sks TEXT,
    semester_rekomendasi TEXT,
    kategori TEXT,
    aktif TEXT
);

-- membuat tabel krs
DROP TABLE IF EXISTS src.krs;
CREATE TABLE src.krs (
    krs_id TEXT,
    nim TEXT,
    kode_mk TEXT,
    semester_id TEXT,
    kelas TEXT,
    status_krs TEXT,
    tanggal_ambil_raw TEXT,
    sumber_sistem TEXT
);

-- membuat tabel nilai
DROP TABLE IF EXISTS src.nilai;
CREATE TABLE src.nilai (
    nilai_id TEXT,
    nim TEXT,
    kode_mk TEXT,
    semester_id TEXT,
    nilai_angka TEXT,
    nilai_huruf TEXT,
    status_lulus TEXT,
    tanggal_input_raw TEXT
);

-- membuat tabel aktivitas lms
DROP TABLE IF EXISTS src.aktivitas_lms;
CREATE TABLE src.aktivitas_lms (
    lms_event_id TEXT,
    nim TEXT,
    kode_mk TEXT,
    semester_id TEXT,
    waktu_event TEXT,
    tipe_event TEXT,
    durasi_menit TEXT,
    skor_kuis TEXT,
    platform TEXT
);

-- membuat tabel pembayaran
DROP TABLE IF EXISTS src.pembayaran;
CREATE TABLE src.pembayaran (
    pembayaran_id TEXT,
    nim TEXT,
    semester_id TEXT,
    tanggal_bayar_raw TEXT,
    nominal_tagihan TEXT,
    nominal_bayar TEXT,
    status_pembayaran TEXT,
    kanal TEXT
);

-- membuat tabel kelulusan
DROP TABLE IF EXISTS src.kelulusan;
CREATE TABLE src.kelulusan (
    kelulusan_id TEXT,
    nim TEXT,
    tanggal_lulus_raw TEXT,
    ipk_final TEXT,
    masa_studi_bulan TEXT,
    predikat TEXT,
    status_tepat_waktu TEXT
);

-- 3. Import CSV (sesuaikan path sumber data yang ada di komputer anda)
\copy src.program_studi FROM '/PATH/UADW_v1.0/01_raw_data/program_studi.csv' CSV HEADER ENCODING 'UTF8';
\copy src.semester      FROM '/PATH/UADW_v1.0/01_raw_data/semester.csv'      CSV HEADER ENCODING 'UTF8';
\copy src.mahasiswa     FROM '/PATH/UADW_v1.0/01_raw_data/mahasiswa.csv'     CSV HEADER ENCODING 'UTF8';
\copy src.dosen         FROM '/PATH/UADW_v1.0/01_raw_data/dosen.csv'         CSV HEADER ENCODING 'UTF8';
\copy src.mata_kuliah   FROM '/PATH/UADW_v1.0/01_raw_data/mata_kuliah.csv'   CSV HEADER ENCODING 'UTF8';
\copy src.krs           FROM '/PATH/UADW_v1.0/01_raw_data/krs.csv'           CSV HEADER ENCODING 'UTF8';
\copy src.nilai         FROM '/PATH/UADW_v1.0/01_raw_data/nilai.csv'         CSV HEADER ENCODING 'UTF8';
\copy src.aktivitas_lms FROM '/PATH/UADW_v1.0/01_raw_data/aktivitas_lms.csv' CSV HEADER ENCODING 'UTF8';
\copy src.pembayaran    FROM '/PATH/UADW_v1.0/01_raw_data/pembayaran.csv'    CSV HEADER ENCODING 'UTF8';
\copy src.kelulusan     FROM '/PATH/UADW_v1.0/01_raw_data/kelulusan.csv'     CSV HEADER ENCODING 'UTF8';

-- 4. Inventarisir Tabel yang tersedia di src
SELECT
    table_schema,
    table_name
FROM information_schema.tables
WHERE table_schema = 'src'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- 5. Verifikasi Row Count Lima Source Awal 
SELECT 'program_studi' AS tabel, COUNT(*) AS jumlah_baris
FROM src.program_studi
UNION ALL
SELECT 'semester', COUNT(*) FROM src.semester
UNION ALL
SELECT 'mahasiswa', COUNT(*) FROM src.mahasiswa
UNION ALL
SELECT 'dosen', COUNT(*) FROM src.dosen
UNION ALL
SELECT 'mata_kuliah', COUNT(*) FROM src.mata_kuliah
ORDER BY tabel;


-- 6. Verifikasi Row Count Semua 10 Source
SELECT 'program_studi' AS tabel, COUNT(*) AS rows FROM src.program_studi
UNION ALL SELECT 'semester', COUNT(*) FROM src.semester
UNION ALL SELECT 'mahasiswa', COUNT(*) FROM src.mahasiswa
UNION ALL SELECT 'dosen', COUNT(*) FROM src.dosen
UNION ALL SELECT 'mata_kuliah', COUNT(*) FROM src.mata_kuliah
UNION ALL SELECT 'krs', COUNT(*) FROM src.krs
UNION ALL SELECT 'nilai', COUNT(*) FROM src.nilai
UNION ALL SELECT 'aktivitas_lms', COUNT(*) FROM src.aktivitas_lms
UNION ALL SELECT 'pembayaran', COUNT(*) FROM src.pembayaran
UNION ALL SELECT 'kelulusan', COUNT(*) FROM src.kelulusan
ORDER BY tabel;


-- 7. Verifikasi Column Count dan Nama Kolom
SELECT
    table_name,
    COUNT(*) AS jumlah_kolom
FROM information_schema.columns
WHERE table_schema = 'src'
GROUP BY table_name
ORDER BY table_name;

-- untuk tabel tertentu (mis. mahasiswa)
SELECT
    ordinal_position,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'src'
  AND table_name = 'mahasiswa'
ORDER BY ordinal_position;

-- 8. Verifikasi Candidate Key Mahasiswa (silahkan ganti tabel mahasiswa dengan yang lain)
SELECT
    COUNT(*) AS raw_rows,
    COUNT(DISTINCT nim) AS distinct_nim,
    COUNT(*) - COUNT(DISTINCT nim) AS excess_duplicate_rows
FROM src.mahasiswa;

-- kolom nim merupakan candidate natural key secara bisnis, tetapi raw source memiliki indikasi duplikat yang harus di profiling di unit 1.2

-- 9. Rentang Angkatan
SELECT
    MIN(CAST(angkatan AS INTEGER)) AS angkatan_min,
    MAX(CAST(angkatan AS INTEGER)) AS angkatan_max
FROM src.mahasiswa;

-- angkatan_min = 2021, dan angkatan_max = 2024

-- 10. Missing Kota Asal
SELECT COUNT(*) AS missing_kota
FROM src.mahasiswa
WHERE TRIM(COALESCE(kota_asal_raw, '')) = '';

-- kota asal missing = 30 row

-- 11. Variasi Label Program Studi
SELECT COUNT(DISTINCT prodi_raw) AS distinct_prodi_raw
FROM src.mahasiswa;

-- variasi label prodi = 30 variasi

-- Bandingkan dengan master tabel program_studi
SELECT COUNT(*) AS canonical_programs
FROM src.program_studi;

-- distribusi raw label
SELECT
    prodi_raw,
    COUNT(*) AS jumlah
FROM src.mahasiswa
GROUP BY prodi_raw
ORDER BY prodi_raw;

-- Terdapat perbedaan representasi raw yang harus diprofiling dan kemudian distandarisasi
-- pada unit 1.2.

-- 12. Variasi kolom jenis kelamin
SELECT
    jk_raw,
    COUNT(*) AS jumlah
FROM src.mahasiswa
GROUP BY jk_raw
ORDER BY jk_raw;

-- Terdapat variasi representasi kolom jenis kelamin perlu diprofiling di unit 1.2

-- 13. Sampel record dari tabel mahasiswa -- read only
SELECT *
FROM src.mahasiswa
LIMIT 5;

-- limit digunakan untuk memahami bentuk record bukan untuk menyimpulkan kualitas dataset

-- 14. Source Terbesar
SELECT 'program_studi' AS source, COUNT(*) AS rows FROM src.program_studi
UNION ALL SELECT 'semester', COUNT(*) FROM src.semester
UNION ALL SELECT 'mahasiswa', COUNT(*) FROM src.mahasiswa
UNION ALL SELECT 'dosen', COUNT(*) FROM src.dosen
UNION ALL SELECT 'mata_kuliah', COUNT(*) FROM src.mata_kuliah
UNION ALL SELECT 'krs', COUNT(*) FROM src.krs
UNION ALL SELECT 'nilai', COUNT(*) FROM src.nilai
UNION ALL SELECT 'aktivitas_lms', COUNT(*) FROM src.aktivitas_lms
UNION ALL SELECT 'pembayaran', COUNT(*) FROM src.pembayaran
UNION ALL SELECT 'kelulusan', COUNT(*) FROM src.kelulusan
ORDER BY rows DESC;

-- aktivitas_lms menjadi tabel dengan baris terbanyak = 200.356 rows

-- 15. Query Relationship Notes, contoh untuk memahami bahwa NIM muncuk pada tabel transaksi

SELECT 'krs' AS source,
       COUNT(DISTINCT nim) AS distinct_nim
FROM src.krs
UNION ALL
SELECT 'nilai', COUNT(DISTINCT nim) FROM src.nilai
UNION ALL
SELECT 'aktivitas_lms', COUNT(DISTINCT nim) FROM src.aktivitas_lms
UNION ALL
SELECT 'pembayaran', COUNT(DISTINCT nim) FROM src.pembayaran
UNION ALL
SELECT 'kelulusan', COUNT(DISTINCT nim) FROM src.kelulusan;

-- ada hubungan 
-- mahasiswa.nim -> krs.nim
-- mahasiswa.nim -> nilai.nim
-- mahasiswa.nim -> pembayaran.nim
-- mahasiswa.nim -> kelulusan.nim
-- mahasiswa.nim -> aktivitas_lms.nim
























