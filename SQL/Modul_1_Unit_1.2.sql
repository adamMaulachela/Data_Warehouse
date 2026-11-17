-- Modul 	: 1
-- Unit		: 1.2
-- Nama 	: Adam Bachtiar
-- NIM		: 08078505

-- 1. Tabel Level Profiling

SELECT 'program_studi' AS dataset, COUNT(*) AS rows FROM src.program_studi
UNION ALL
SELECT 'semester', COUNT(*) FROM src.semester
UNION ALL
SELECT 'mahasiswa', COUNT(*) FROM src.mahasiswa
UNION ALL
SELECT 'dosen', COUNT(*) FROM src.dosen
UNION ALL
SELECT 'mata_kuliah', COUNT(*) FROM src.mata_kuliah
UNION ALL
SELECT 'krs', COUNT(*) FROM src.krs
UNION ALL
SELECT 'nilai', COUNT(*) FROM src.nilai
UNION ALL
SELECT 'aktivitas_lms', COUNT(*) FROM src.aktivitas_lms
UNION ALL
SELECT 'pembayaran', COUNT(*) FROM src.pembayaran
UNION ALL
SELECT 'kelulusan', COUNT(*) FROM src.kelulusan;

-- Column count per table
SELECT
    table_name,
    COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = 'src'
GROUP BY table_name
ORDER BY table_name;


-- 2. Mahasiswa - Uniqueness

SELECT
    COUNT(*) AS raw_rows,
    COUNT(DISTINCT nim) AS distinct_nim,
    COUNT(*) - COUNT(DISTINCT nim) AS excess_duplicate_rows
FROM src.mahasiswa;

-- Duplicate NIM groups
SELECT
    nim,
    COUNT(*) AS jumlah
FROM src.mahasiswa
GROUP BY nim
HAVING COUNT(*) > 1
ORDER BY jumlah DESC, nim;

-- 3. Mahasiswa - Completness

SELECT COUNT(*) AS missing_kota
FROM src.mahasiswa
WHERE TRIM(COALESCE(kota_asal_raw,'')) = '';


-- 4. Mahasiswa - Distribution

SELECT prodi_raw, COUNT(*) AS frekuensi
FROM src.mahasiswa
GROUP BY prodi_raw
ORDER BY frekuensi DESC, prodi_raw;

SELECT COUNT(DISTINCT prodi_raw) AS distinct_raw_prodi
FROM src.mahasiswa;

SELECT jk_raw, COUNT(*) AS frekuensi
FROM src.mahasiswa
GROUP BY jk_raw
ORDER BY frekuensi DESC;

SELECT status_raw, COUNT(*) AS frekuensi
FROM src.mahasiswa
GROUP BY status_raw
ORDER BY frekuensi DESC;

SELECT kode_prodi_raw, COUNT(*) AS frekuensi
FROM src.mahasiswa
GROUP BY kode_prodi_raw
ORDER BY frekuensi DESC;

-- Non-standard prodi label against exact canonical names
SELECT COUNT(*) AS non_standard_prodi_rows
FROM src.mahasiswa m
LEFT JOIN src.program_studi p
  ON m.prodi_raw = p.nama_prodi
WHERE p.kode_prodi IS NULL;


-- 5. Mixed Date Format 

SELECT
    CASE
      WHEN tanggal_masuk_raw ~ '^\d{4}-\d{2}-\d{2}$'
        THEN 'YYYY-MM-DD'
      WHEN tanggal_masuk_raw ~ '^\d{2}/\d{2}/\d{4}$'
        THEN 'DD/MM/YYYY'
      WHEN tanggal_masuk_raw ~ '^\d{2}-[A-Za-z]{3}-\d{4}$'
        THEN 'DD-Mon-YYYY'
      ELSE 'OTHER'
    END AS format_tanggal,
    COUNT(*) AS jumlah
FROM src.mahasiswa
GROUP BY 1
ORDER BY 2 DESC;


-- 6. KRS - Duplicate Grain

-- perbedaan krs yang duplikat
SELECT
    COUNT(*) AS raw_rows,
    COUNT(DISTINCT krs_id) AS distinct_krs_id
FROM src.krs;

-- daftar mahasiswa yang krs mata kuliahnya lebih dari 1
SELECT
    nim,
    kode_mk,
    semester_id,
    COUNT(*) AS jumlah
FROM src.krs
GROUP BY nim, kode_mk, semester_id
HAVING COUNT(*) > 1
ORDER BY jumlah DESC;

-- Jumlah krs yang diduga duplikat
SELECT SUM(jumlah - 1) AS excess_duplicate_krs
FROM (
    SELECT
        nim,
        kode_mk,
        semester_id,
        COUNT(*) AS jumlah
    FROM src.krs
    GROUP BY nim, kode_mk, semester_id
    HAVING COUNT(*) > 1
) x;

-- 7. NILAI - Completness / validity

-- kolom nilai_angka yang kosong / missing
SELECT COUNT(*) AS missing_nilai_angka
FROM src.nilai
WHERE TRIM(COALESCE(nilai_angka::text,'')) = '';

-- Jumlah baris nilai_angka yang berada diluar rentang 0 - 100
SELECT COUNT(*) AS invalid_nilai_angka
FROM src.nilai
WHERE NULLIF(TRIM(nilai_angka::text),'') IS NOT NULL
  AND CAST(nilai_angka AS numeric) NOT BETWEEN 0 AND 100;

-- valid grade statistics
SELECT
    COUNT(*) AS valid_rows,
    MIN(CAST(nilai_angka AS numeric)) AS min_nilai,
    MAX(CAST(nilai_angka AS numeric)) AS max_nilai,
    AVG(CAST(nilai_angka AS numeric)) AS avg_nilai
FROM src.nilai
WHERE NULLIF(TRIM(nilai_angka::text),'') IS NOT NULL
  AND CAST(nilai_angka AS numeric) BETWEEN 0 AND 100;


-- 8. Nilai - Konsistensi nilai_huruf dengan nilai_angka

-- jumlah baris data nilai_angka yang tidak konsisten dengan nilai_huruf
WITH valid_score AS (
    SELECT
        *,
        CAST(nilai_angka AS numeric) AS score
    FROM src.nilai
    WHERE NULLIF(TRIM(nilai_angka::text),'') IS NOT NULL
      AND CAST(nilai_angka AS numeric) BETWEEN 0 AND 100
),
expected AS (
    SELECT
        *,
        CASE
          WHEN score >= 85 THEN 'A'
          WHEN score >= 80 THEN 'AB'
          WHEN score >= 75 THEN 'B'
          WHEN score >= 70 THEN 'BC'
          WHEN score >= 60 THEN 'C'
          WHEN score >= 50 THEN 'D'
          ELSE 'E'
        END AS expected_huruf
    FROM valid_score
)
SELECT COUNT(*) AS letter_mismatch
FROM expected
WHERE nilai_huruf <> expected_huruf;

-- status lulus consistency for valid score
WITH valid_score AS (
    SELECT
        *,
        CAST(nilai_angka AS numeric) AS score
    FROM src.nilai
    WHERE NULLIF(TRIM(nilai_angka::text),'') IS NOT NULL
      AND CAST(nilai_angka AS numeric) BETWEEN 0 AND 100
)
SELECT COUNT(*) AS status_mismatch
FROM valid_score
WHERE status_lulus <>
      CASE WHEN score >= 60 THEN 'Lulus' ELSE 'Tidak Lulus' END;

-- 9. Nilai - Duplikat Grain

-- cek nilai yang duplikat
SELECT
    nim,
    kode_mk,
    semester_id,
    COUNT(*) AS jumlah
FROM src.nilai
GROUP BY nim, kode_mk, semester_id
HAVING COUNT(*) > 1;

-- 10. Referential Integrity
-- Jumlah data KRS yang memiliki nim yang tidak terdaftar
SELECT COUNT(*) AS krs_nim_tidak_terdaftar
FROM src.krs k
LEFT JOIN src.mahasiswa m ON k.nim = m.nim
WHERE m.nim IS NULL;

-- jumlah data nim yang ada pada tabel nilai tetapi tidak ada pada tabel mahasiswa
SELECT COUNT(*) AS nim_tidak_terdaftar
FROM src.nilai n
LEFT JOIN src.mahasiswa m ON n.nim = m.nim
WHERE m.nim IS NULL;

-- jumlah nilai yang tidak ada mata kuliahnya
SELECT COUNT(*) AS orphan_nilai_mk
FROM src.nilai n
LEFT JOIN src.mata_kuliah mk ON n.kode_mk = mk.kode_mk
WHERE mk.kode_mk IS NULL;

-- jumlah data nilai yang tidak ada semesternya
SELECT COUNT(*) AS orphan_nilai_semester
FROM src.nilai n
LEFT JOIN src.semester s ON n.semester_id = s.semester_id
WHERE s.semester_id IS NULL;


-- 11. LMS
-- perbandingan jumlah baris, dengan aktivitas unik, dan selisihnya
SELECT
    COUNT(*) AS raw_rows,
    COUNT(DISTINCT lms_event_id) AS distinct_event_id,
    COUNT(*) - COUNT(DISTINCT lms_event_id) AS duplicate_excess
FROM src.aktivitas_lms;

-- jumlah aktivitas berdasarkan tipe aktivitas dalam lms
SELECT tipe_event, COUNT(*) AS jumlah
FROM src.aktivitas_lms
GROUP BY tipe_event
ORDER BY jumlah DESC;

-- Jumlah baris kosong/missing dari kolom quiz
SELECT COUNT(*) AS quiz_missing_score
FROM src.aktivitas_lms
WHERE tipe_event = 'quiz_attempt'
  AND TRIM(COALESCE(skor_kuis::text,'')) = '';

-- jumlah baris aktivitas skor non quiz
SELECT COUNT(*) AS nonquiz_with_score
FROM src.aktivitas_lms
WHERE tipe_event <> 'quiz_attempt'
  AND TRIM(COALESCE(skor_kuis::text,'')) <> '';


-- 12. Pembayaran
-- jumlah pembayaran yang dengan nominal negatif
SELECT COUNT(*) AS negative_payment
FROM src.pembayaran
WHERE CAST(nominal_bayar AS numeric) < 0;

-- jumlah baris pembayaran yang tidak ada tanggal pembayarannya
SELECT COUNT(*) AS positive_payment_missing_date
FROM src.pembayaran
WHERE CAST(nominal_bayar AS numeric) > 0
  AND TRIM(COALESCE(tanggal_bayar_raw,'')) = '';

-- Jumlah baris pembayaran berdasarkan status pembayarannya
SELECT status_pembayaran, COUNT(*) AS jumlah
FROM src.pembayaran
GROUP BY status_pembayaran
ORDER BY jumlah DESC;

-- 13. Kelulusan
-- Perbandingan jumlah baris, nim unik, dan duplikat
SELECT
    COUNT(*) AS raw_rows,
    COUNT(DISTINCT nim) AS distinct_graduate_nim,
    COUNT(*) - COUNT(DISTINCT nim) AS duplicate_excess
FROM src.kelulusan;

-- Jumlah kelulusan tepat waktu
SELECT status_tepat_waktu, COUNT(*) AS jumlah
FROM src.kelulusan
GROUP BY status_tepat_waktu;

-- 14. Relasi antar tabel
-- jumlah aktivitas lms yang nimnya tidak terdaftar
SELECT COUNT(*) AS orphan_lms_student
FROM src.aktivitas_lms l
LEFT JOIN src.mahasiswa m ON l.nim = m.nim
WHERE m.nim IS NULL;

-- jumlah aktivitas lms yang mata kuliahnya tidak terdaftar
SELECT COUNT(*) AS orphan_lms_course
FROM src.aktivitas_lms l
LEFT JOIN src.mata_kuliah mk ON l.kode_mk = mk.kode_mk
WHERE mk.kode_mk IS NULL;

-- jumlah pembayaran yang nimnya tidak terdaftar
SELECT COUNT(*) AS orphan_payment_student
FROM src.pembayaran p
LEFT JOIN src.mahasiswa m ON p.nim = m.nim
WHERE m.nim IS NULL;

-- jumlah kelulusan yang nimnya tidak terdaftar
SELECT COUNT(*) AS orphan_graduation_student
FROM src.kelulusan g
LEFT JOIN src.mahasiswa m ON g.nim = m.nim
WHERE m.nim IS NULL;
















