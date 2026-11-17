# MATERI PERTEMUAN 6
## Mata Kuliah Data Warehouse
### Fact Table & Measures

---

## 1. Identitas Pertemuan

- **Mata Kuliah:** Data Warehouse
- **Program Studi:** Teknologi Informasi
- **Semester:** 5
- **Pertemuan:** 6
- **Topik Utama:** Fact Table & Measures
- **Fase Modul:** DESIGN
- **RTM:** RTM 3 v0.3
- **Computational Thinking:** Abstraction + Evaluation

---

## 2. CPMK dan Sub-CPMK

### CPMK-3
Mahasiswa mampu **merancang dimensional model yang sesuai dengan kebutuhan analitik menggunakan Fact Table, Dimension Table, Star Schema, Snowflake Schema, dan konsep dimensional modeling lainnya**.

### Sub-CPMK 6
Mahasiswa mampu **menentukan Fact Table, grain, foreign key, dan measure yang sesuai dengan kebutuhan analitik serta membedakan sifat aditivitas dan jenis Fact Table**.

---

## 3. Posisi Pertemuan 6

P4 telah menetapkan business process dan grain. P5 telah merancang Dimension. P6 berfokus pada pusat Star Schema:

> **FACT TABLE**

Alur:

```text
Business Process
      ↓
Validate Grain
      ↓
Dimension Keys
      ↓
Fact Table
      ↓
Measures
      ↓
Additivity
      ↓
Fact Type
      ↓
Fact Specification
```

---

## 4. RTM 3 dan Computational Thinking

Mahasiswa menggunakan Abstraction untuk memilih event dan measure yang benar-benar relevan. Evaluation digunakan untuk memastikan measure kompatibel dengan grain dan dapat diagregasi secara benar.

Output P6:

1. Fact Specification;
2. validated Grain;
3. Foreign Key List;
4. Measure Dictionary;
5. Additivity Classification;
6. Fact Type Selection;
7. updated Star Schema;
8. Requirement–Fact Traceability.

---

# BAGIAN I – FACT TABLE DAN GRAIN

## 5. Apa itu Fact Table?

Fact Table menyimpan:

- business event;
- foreign key ke Dimension;
- measure;
- indikator analitik.

Contoh:

```text
Fact_Nilai
├── mahasiswa_key
├── mata_kuliah_key
├── semester_key
├── dosen_key
├── nilai_angka
├── sks
└── is_lulus
```

Fact Table biasanya memiliki jumlah row jauh lebih besar daripada Dimension Table.

---

## 6. Fact Table dan Grain

Grain menentukan arti satu row fact.

Contoh grain:

> Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

Maka setiap row Fact_Nilai harus merepresentasikan satu kombinasi event tersebut secara konsisten.

Contoh:

| mahasiswa_key | mata_kuliah_key | semester_key | nilai |
|---:|---:|---:|---:|
| 101 | 501 | 20251 | 85 |
| 101 | 502 | 20251 | 72 |

Dua row tersebut berarti dua nilai untuk dua mata kuliah berbeda.

---

## 7. Grain–Measure Compatibility

Setiap measure harus mempunyai arti yang jelas pada grain yang sudah ditentukan.

Contoh grain:

> Satu mahasiswa per semester.

Measure yang sesuai:

- IPS;
- IPK;
- total SKS;
- jumlah MK lulus.

Measure yang tidak cocok jika dicampur langsung:

- satu nilai tugas tertentu;
- satu klik LMS tertentu;
- satu transaksi pembayaran tertentu.

Prinsip:

> **Do not mix transaction-level measures with semester-level measures in the same grain.**

---

## 8. Kesalahan Grain

Jika satu Fact Table mencampur beberapa event berbeda, hasil analisis menjadi ambigu.

Contoh:

```text
nilai_tugas
nilai_uts
nilai_uas
nilai_akhir
```

disimpan tanpa mendefinisikan apakah grain-nya komponen nilai atau nilai akhir.

Akibat:

- double counting;
- rata-rata salah;
- KPI tidak konsisten.

---

# BAGIAN II – FOREIGN KEY DAN MEASURE

## 9. Foreign Key pada Fact Table

Fact Table biasanya menyimpan surrogate key dari Dimension Table.

Contoh:

```text
Fact_Nilai
├── mahasiswa_key → Dim_Mahasiswa
├── mata_kuliah_key → Dim_MataKuliah
├── semester_key → Dim_Semester
└── dosen_key → Dim_Dosen
```

Relationship utama menggunakan surrogate key, bukan natural key operasional.

---

## 10. Mengapa Surrogate Key Digunakan?

Karena surrogate key:

- stabil;
- dikontrol oleh Data Warehouse;
- mendukung perubahan historis;
- mendukung SCD;
- tidak bergantung pada perubahan source.

Konsep ini akan menjadi sangat penting pada P7 saat membahas SCD Type 2.

---

## 11. Apa itu Measure?

Measure adalah nilai yang digunakan untuk mengukur business event.

Contoh:

### Fact_Nilai
- nilai_angka;
- is_lulus;
- SKS.

### Fact_Pembayaran
- nominal;
- jumlah_tagihan;
- jumlah_dibayar.

### Fact_Aktivitas_LMS
- jumlah_login;
- durasi;
- jumlah_aktivitas.

---

## 12. Measure vs Dimension Attribute

Contoh:

- `nilai_angka = 85` → measure;
- `nama_mata_kuliah = Basis Data` → dimension attribute;
- `kode_semester = 20251` → identifier, bukan measure.

Prinsip:

> **Measure biasanya menjawab how much / how many.**

---

## 13. Stored Measure vs Derived Measure

### Stored Measure
Nilai disimpan langsung dari source.

Contoh:

```text
nilai_angka
nominal_pembayaran
```

### Derived Measure
Dihitung dari nilai lain.

Contoh:

```text
is_lulus = CASE WHEN nilai_angka >= batas_lulus THEN 1 ELSE 0
```

atau:

```text
total_biaya = jumlah_sks × biaya_per_sks
```

Derived measure harus mempunyai formula yang terdokumentasi.

---

# BAGIAN III – ADDITIVITY

## 14. Mengapa Additivity Penting?

Tidak semua measure dapat dijumlahkan dengan cara yang sama.

Tiga kategori:

1. Additive;
2. Semi-Additive;
3. Non-Additive.

Kesalahan memahami additivity dapat menghasilkan KPI yang secara matematis salah.

---

## 15. Additive Measure

Additive Measure dapat dijumlahkan terhadap semua dimension yang relevan.

Contoh:

- nominal pembayaran;
- jumlah transaksi;
- jumlah unit;
- jumlah SKS dalam konteks tertentu.

Contoh:

```sql
SUM(nominal_pembayaran)
```

valid untuk agregasi berdasarkan mahasiswa, program studi, semester, maupun waktu.

---

## 16. Semi-Additive Measure

Semi-Additive Measure dapat dijumlahkan terhadap beberapa dimension tetapi tidak semuanya, terutama dimension waktu.

Contoh klasik:

> saldo rekening.

Dalam konteks akademik:

> jumlah mahasiswa aktif pada akhir semester.

Jika menjumlahkan snapshot semester yang sama sepanjang waktu, mahasiswa dapat dihitung berkali-kali.

---

## 17. Non-Additive Measure

Non-Additive Measure tidak tepat dijumlahkan langsung.

Contoh:

- persentase;
- ratio;
- rata-rata;
- IPK/GPA;
- failure rate.

Contoh salah:

```text
20% + 25% = 45%
```

untuk menghitung failure rate gabungan.

Solusi: hitung dari komponen dasar.

---

## 18. Simpan Komponen Dasar

KPI:

```text
Failure Rate = jumlah gagal / jumlah peserta
```

Lebih baik Data Warehouse menyimpan atau menyediakan komponen:

- jumlah gagal;
- jumlah peserta;

atau atomic fact yang memungkinkan perhitungan ulang.

Prinsip:

> **Store atomic facts whenever possible.**

---

# BAGIAN IV – FACT TABLE TYPES

## 19. Transaction Fact Table

Transaction Fact merekam satu event bisnis per row.

Contoh:

### Pembayaran
Grain:

> Satu transaksi pembayaran mahasiswa.

```text
Fact_Pembayaran
├── mahasiswa_key
├── date_key
├── prodi_key
├── nomor_transaksi
└── nominal
```

Candidate transaction facts UADW:

- KRS;
- pembayaran;
- aktivitas LMS;
- nilai akhir.

---

## 20. Periodic Snapshot Fact

Periodic Snapshot merekam kondisi pada interval waktu tetap.

Contoh:

> Satu mahasiswa pada satu semester.

Measures:

- IPS;
- IPK;
- total SKS;
- jumlah MK lulus;
- jumlah MK gagal.

Fact ini cocok untuk melihat perkembangan kondisi dari periode ke periode.

---

## 21. Transaction vs Periodic Snapshot

| Transaction | Periodic Snapshot |
|---|---|
| Event-based | Period-based |
| Row per transaksi | Row per periode |
| Detail tinggi | Ringkasan kondisi |
| Contoh pembayaran | Contoh IPK semester |

Pemilihan fact type harus mengikuti analytical requirement.

---

## 22. Accumulating Snapshot – Pengayaan

Accumulating Snapshot digunakan untuk proses yang memiliki milestone.

Contoh proses kelulusan:

```text
Masuk → Proposal → Sidang → Yudisium → Lulus
```

Satu row diperbarui seiring milestone tercapai.

Konsep ini merupakan enrichment dan tidak menjadi fokus asesmen utama P6.

---

## 23. Factless Fact Table – Pengayaan

Factless Fact menyimpan event tanpa numeric measure utama.

Contoh:

```text
mahasiswa_key
mata_kuliah_key
date_key
status_key
```

Keberadaan row itu sendiri berarti event terjadi.

Contoh penggunaan:

- kehadiran;
- enrollment event;
- participation event.

---

# BAGIAN V – SPECIAL FACT DESIGN

## 24. Degenerate Dimension

Degenerate Dimension adalah identifier transaksi yang disimpan langsung pada Fact Table tanpa Dimension Table tersendiri.

Contoh:

- nomor transaksi;
- nomor invoice;
- nomor KRS.

Jika identifier tidak memiliki atribut deskriptif lain, membuat `Dim_No_Transaksi` tidak memberikan nilai analitik tambahan.

---

## 25. Atomic vs Aggregated Grain

### Atomic Grain
Level paling detail.

Contoh:

> satu transaksi pembayaran.

### Aggregated Grain
Data sudah diringkas.

Contoh:

> total pembayaran per mahasiswa per semester.

Atomic grain biasanya lebih fleksibel untuk analisis karena detail belum hilang.

---

## 26. Unknown Dimension Member

Fact Table sebaiknya tidak memiliki FK dimensional yang NULL.

Jika dimension belum diketahui, dapat digunakan `Unknown Member`.

Contoh:

```text
mahasiswa_key = 0
```

pada Fact Table, dengan row `Unknown` pada Dim_Mahasiswa.

Konsep ini akan diimplementasikan saat ETL.

---

# BAGIAN VI – FACT SPECIFICATION

## 27. Fact Specification

Contoh dokumentasi:

| Field | Isi |
|---|---|
| Fact Name | Fact_Nilai |
| Business Process | Penilaian |
| Grain | Satu nilai mahasiswa per MK per semester |
| Dimensions | Mahasiswa, MK, Semester, Dosen |
| Measures | nilai_angka, is_lulus |
| Fact Type | Transaction |
| Source | nilai.csv |
| Additivity | Sesuai measure |

---

## 28. Measure Dictionary

| Measure | Definition | Type | Additivity | Formula |
|---|---|---|---|---|
| nilai_angka | Nilai akhir mahasiswa | Stored | Non-additive untuk total | Direct |
| is_lulus | Indikator kelulusan | Derived | Additive untuk count | 1/0 |
| nominal | Nilai pembayaran | Stored | Additive | Direct |

Measure Dictionary mencegah perbedaan interpretasi antar analyst.

---

# BAGIAN VII – STUDI KASUS UADW

## 29. Fact_Nilai

### Business Process
Penilaian.

### Grain
Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester.

### Dimensions
- Mahasiswa;
- Mata Kuliah;
- Semester;
- Dosen.

### Measures
- nilai_angka;
- is_lulus;
- SKS jika relevan.

### Candidate Structure

```text
Fact_Nilai
├── mahasiswa_key
├── mata_kuliah_key
├── semester_key
├── dosen_key
├── nilai_angka
├── sks
└── is_lulus
```

---

## 30. Fact_Pembayaran

### Grain
Satu transaksi pembayaran mahasiswa.

### Dimensions
- Mahasiswa;
- Date;
- Program Studi;
- jenis pembayaran.

### Measures
- nominal;
- jumlah_tagihan;
- jumlah_dibayar.

### Type
Transaction Fact.

---

## 31. Student Semester Snapshot

Candidate fact:

`Fact_Student_Semester`

### Grain
Satu mahasiswa pada satu semester.

### Measures
- IPS;
- IPK;
- total SKS;
- jumlah MK lulus;
- jumlah MK gagal.

### Type
Periodic Snapshot.

---

# BAGIAN VIII – OUTPUT PEMBELAJARAN

## 32. RTM 3 v0.3

Mahasiswa menghasilkan:

1. Fact Specification;
2. Grain Validation;
3. Foreign Key List;
4. Measure Dictionary;
5. Additivity Matrix;
6. Fact Type Selection;
7. updated Star Schema;
8. Requirement–Fact Traceability.

Gunakan Fact Design Canvas:

| Component | Result |
|---|---|
| Fact Name | ... |
| Business Process | ... |
| Grain | ... |
| Fact Type | ... |
| Dimensions | ... |
| Foreign Keys | ... |
| Measures | ... |
| Additivity | ... |
| Source | ... |

---

## 33. Additivity Analysis

Mahasiswa mengklasifikasikan minimal lima measure.

| Measure | Additive | Semi | Non | Reason |
|---|:---:|:---:|:---:|---|
| nominal_pembayaran | ✓ | | | Dapat dijumlahkan |
| IPK | | | ✓ | Ratio/rata-rata |
| active_student_snapshot | | ✓ | | Tidak boleh dijumlahkan lintas waktu |

---

## 34. Requirement–Fact Traceability

| AQ | KPI | Fact | Measure | Dimension |
|---|---|---|---|---|
| AQ01 Course Failure | Failure Rate | Fact_Nilai | is_lulus | MK, Semester, Prodi |

Fact harus dapat ditelusuri ke analytical question yang menjadi alasan keberadaannya.

---

## 35. Miskonsepsi

1. Fact Table hanya berisi angka. **Salah.**
2. Semua numeric column adalah measure. **Salah.**
3. Semua measure dapat dijumlahkan. **Salah.**
4. IPK dapat dijumlahkan. **Salah.**
5. Satu business process selalu satu fact type. **Tidak selalu.**
6. Grain dapat berubah dalam satu fact. **Tidak.**

---

## 36. Exit Quiz

1. Apa fungsi Fact Table?
2. Mengapa grain harus konsisten?
3. Apa perbedaan Fact dan Measure?
4. Jelaskan additive, semi-additive, dan non-additive.
5. Mengapa IPK tidak additive?
6. Apa perbedaan Transaction Fact dan Periodic Snapshot?
7. Kapan Accumulating Snapshot digunakan?
8. Apa itu Factless Fact Table?
9. Bagaimana menentukan measure yang kompatibel dengan grain?

---

## 37. Jembatan ke Pertemuan 7

Setelah P6 mahasiswa sudah mempunyai:

- business process;
- grain;
- Dimension Table;
- Fact Table;
- measures;
- Star Schema.

Pertanyaan berikutnya:

> Bagaimana jika dimension berubah, data source tidak konsisten, atau data memiliki quality issue?

Pertemuan 7 membahas SCD, historical requirement, data quality, integration, dan transformation rules.

---

## 38. Ringkasan

Prinsip utama:

> **The grain defines what a fact row means.**

> **Measures must be classified before they are aggregated.**

> **A Fact Table must remain traceable to the analytical questions it is designed to answer.**
