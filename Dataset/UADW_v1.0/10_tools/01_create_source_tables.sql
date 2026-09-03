-- UADW v1.0 - Modul Praktikum 01
CREATE SCHEMA IF NOT EXISTS src;
DROP TABLE IF EXISTS src.program_studi;
CREATE TABLE src.program_studi (kode_prodi TEXT,nama_prodi TEXT,fakultas TEXT,departemen TEXT,status TEXT);
DROP TABLE IF EXISTS src.semester;
CREATE TABLE src.semester (semester_id TEXT,tahun_akademik TEXT,term TEXT,urutan_tahun TEXT,tanggal_mulai TEXT,tanggal_selesai TEXT);
DROP TABLE IF EXISTS src.mahasiswa;
CREATE TABLE src.mahasiswa (nim TEXT,nama TEXT,jk_raw TEXT,tanggal_lahir_raw TEXT,kota_asal_raw TEXT,kode_prodi_raw TEXT,prodi_raw TEXT,angkatan TEXT,tanggal_masuk_raw TEXT,status_raw TEXT,email_kampus TEXT);
DROP TABLE IF EXISTS src.dosen;
CREATE TABLE src.dosen (nidn TEXT,nama_dosen TEXT,jk_raw TEXT,unit_prodi_raw TEXT,jabatan_akademik TEXT,tanggal_masuk_raw TEXT,status TEXT);
DROP TABLE IF EXISTS src.mata_kuliah;
CREATE TABLE src.mata_kuliah (kode_mk TEXT,nama_mk TEXT,kode_prodi TEXT,sks TEXT,semester_rekomendasi TEXT,kategori TEXT,aktif TEXT);
