# LAPORAN MODUL 1 UNIT 1.2

## Identitas Laporan
Nama       : [Isi nama lengkap]  
NIM        : [Isi NIM]  
Program Studi : [Isi program studi]  
Modul      : 1  
Unit       : 1.3  
Tanggal Praktikum : [Isi tanggal]  

---

## Studi Kasus
Universitas Digital Nusantara menemukan bahwa evaluasi akademik masih banyak dilakukan secara terpisah oleh program studi. Kaprodi dapat melihat nilai mahasiswa, tetapi belum memiliki informasi terintegrasi untuk menjawab pertanyaan seperti: mata kuliah mana yang paling sering menjadi hambatan, kelompok mahasiswa mana yang perlu mendapat intervensi lebih awal, apakah aktivitas pembelajaran di LMS berkaitan dengan performa nilai, dan pola apa yang muncul pada mahasiswa yang lulus tidak tepat waktu.

Wakil Rektor Bidang Akademik meminta tim Data Warehouse menyiapkan dasar kebutuhan analitik untuk mendukung program peningkatan keberhasilan studi dan kelulusan tepat waktu. Tim belum diminta membangun Star Schema atau ETL. Tugas pada Unit 1.3 adalah menerjemahkan masalah tersebut menjadi kebutuhan informasi dan kebutuhan data yang dapat ditelusuri ke dataset UADW v1.0.

Keputusan yang akan didukung antara lain:
- menentukan mata kuliah yang perlu mendapat evaluasi atau program remedial;
- menentukan kelompok mahasiswa yang perlu mendapat pendampingan akademik lebih awal;
- menentukan periode/angkatan/prodi yang menunjukkan penurunan performa;
- menilai apakah aktivitas LMS dapat menjadi indikator pendukung risiko akademik;
- mengevaluasi pola yang berkaitan dengan kelulusan tepat waktu.
Batas kasus: fokus utama adalah keberhasilan akademik dan kelulusan tepat waktu. Data pembayaran boleh digunakan sebagai pengayaan, tetapi tidak wajib.

## 1. Identifikasi Stakeholder
Langkah pertama yang perlu dilakukan untuk mengelola studi kasus tersebut adalah dengan mengidentifikasi terlebih dahulu siapa pemangku kepentingan dari studi kasus ini. Berikut ini adalah stakeholder yang berhasil diidentifikasi yaitu : 

| Stakeholder | Information Need | Decision Supported | Priority |
|---|---|---|---|
| [Isi] | [Isi] | [Isi] | [Isi] |
 [Isi] | [Isi] | [Isi] | [Isi] |
  [Isi] | [Isi] | [Isi] | [Isi] |


## 2. Problem Statement
Berdasarkan pada studi kasus di atas jawab pertanyaan pemantik berikut ini: 
1. Bagaimana kondisi sekarang? [Kondisi]

    >[Isi Jawaban anda disini!]

2. Apa yang belum dapat dilakukan? [Masalah]

    >[Isi Jawaban anda disini!]

3. Apa akibatnya bagi organisasi? [dampak]

    >[Isi Jawaban anda disini!]

4. Informasi apa yang dibutuhkan untuk memperbaiki kondisi tersebut? [kebutuhan analitik]

    >[Isi Jawaban anda disini!]

Untuk menyusun Problem Statement, mengggunakan rumus berikut ini:

**Current Condition → Problem → Impact → Analytical Need**

atau 

Saat ini [kondisi], tetapi [masalah]. Akibatnya [dampak]. Oleh karena itu diperlukan [kebutuhan analitik].

Sehingga **Problem Statement** adalah sebagai berikut: 

>[**Isi Jawaban anda disini!**]


## 3. Business Process
Setelah kita berhasil menyusun **Problem Statement**, selanjutnya kita akan menyusun **Business Process**. Untuk menyusunnya kita menggunakan rumus berikut ini: 

**Business Process = Event/Kegiatan bisnis + Actor + Object + Time**

atau 

**Actor** melakukan **Event** terhadap **Object** pada **Time**

atau anda bisa menjawab pertanyaan ini: 

1. **Kejadian bisnis apa yang menghasilkan data**

    >[Isi Jawaban anda disini!]

2. **Siapa Aktor yang berperan**

    >[Isi Jawaban anda disini!]

3. **Apa yang menjadi objek dari studi kasus**

    >[Isi Jawaban anda disini!]

4. **Kapan kejadian bisnis terjadi**

    >[Isi Jawaban anda disini!]

Sehingga, proses bisnis yang berhasil dibuat pada domain : 

1. **KRS**

    >[Isi Jawaban anda disini!]

2. **Penilaian**

    >[Isi Jawaban anda disini!]

3. **Aktivitas Pembelajaran LMS**

    >[Isi Jawaban anda disini!]

4. **Kelulusan**

    >[Isi Jawaban anda disini!]


## 4. Business Objective

Bagian ini bertujuan untuk menjawab **apa yang ingin dicapai dari studi kasus?**. Oleh karena itu selanjutnya kita akan menyusun tujuan bisnis (Business Objective) dari studi kasus tersebut. Untuk menyusunnya kita membutuhkan rumus berikut ini: 

**Verb tindakan + objek yang ingin diperbaiki + tujuan bisnis**

dari rumus tersebut kita bisa menggunakan **Template** sebagai berikut:

Meningkatkan/Mengurangi/Memperkuat/Mengevaluasi [objek] agar [manfaat organisasi].


**Business Objective** dari studi kasus tersebut diatas adalah sebagai berikut: 

> [Isi Jawaban anda disini! Minimal 3]

## 5. Decision Requirement
Berbeda dengan Business Objective, Decision Requirement berusaha menjawab **Keputusan apa yang harus dibuat?**. Untuk menjawabnya kita perlu menyusun decision requirement, menggunakan rumus berikut ini: 

**Stakeholder + perlu menentukan/memilih/memprioritaskan + objek keputusan + berdasarkan informasi tertentu**

dari rumus tersebut, **template** berikut ini dapat digunakan untuk menyusun kebutuhan, yaitu: 

**[Stakeholder] perlu menentukan [keputusan] berdasarkan [informasi].**

Sehingga berdasarkan template tersebut dapat dirumuskan Decision Requirement dari studi kasus, yaitu : 

> [Isi jawaban anda disini! minimal 3]

## 6. Analytical Questions
Berdasarkan dari decision requirement, disusun rumusan analytical questions yang dapat diukur (measurable), dengan menggunakan rumus berikut ini 

**Metric + Dimension + Time + Comparation**

rumus tersebut dapat diimplementasikan dengan anda menjawab empat pola pertanyaan berikut ini: 
1. Trend - isi dalam kurung siku

    > Bagaimana perubahan [Metric] berdasarkan [dimension] dari [time] ke [time]?

2. Comparison - isi dalam kurung siku

    > Bagaimana perbedaan [metric] antara [group A ] dan [group B]?

3. Rangking - isi dalam kurung siku

    > Apa/Siapa [dimension] yang memiliki [metric] tertinggi/terendah?

4. Relationship - isi dalam kurung siku
   
   > Bagaimana pola hubungan atara [metric/variabel A] dan [metric/variabel B]?

Sehingga analytical question tersebut dapat disimpulkan dalam tabel berikut ini: 

| AQ | Analytical Question | Stakeholder | Decision | Priority | 
|---|---|---|---|---|
| AQ01 | [Isi] | [Isi] | [Isi] | [Isi] | 
| AQ02 | [Isi] | [Isi] | [Isi] | [Isi] |
| AQ03 | [Isi] | [Isi] | [Isi] | [Isi] |

dst (minimal 5)

## 7. Key Performance Indicator (KPI)
Selanjutnya adalah menyusun Key Performance Indicator (KPI) agar memudahkan evaluasi efektifitas universitas dalam mencapai tujuan bisnis (business objective). Untuk menyusun KPI digunakan pendektan top-down dengan alur logika sebagai berikut: 

> Business Objective $\Rightarrow$ Decision Requirement $\Rightarrow$ Analytical Questions (AQ01) $\Rightarrow$ Memilih Bentuk Metriks Yang Adil $\Rightarrow$ Formulasi KPI.

**1. KPI Course Failure Rate**

**Business Obejctive (B001)** = Meningkatkan kemampuan program studi mengidentifikasi mata kuliah yang secara konsisten memiliki performa rendah.

**Decision Requirement (DR01)** = Kaprodi perlu menentukan mata kuliah yang mempunyai tingkat ketidaklulusan tinggi secara konsisten.

**Analytical Question (AQ01)** = Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi pada setiap semester?

Berdasarkan dari informasi yang tersedia, maka KPI disusun menggunakan pendekatan Top-Down (dari tujuan bisnis ke metriks teknis). Prosesnya dimulai dengan:
1. **Membedah tujuan bisnis (B001)**
   
   **Pernyataan**: *Meningkatakan kemampuan program studi mengidentifikasi mata kuliah yang secara konsisten memiliki performa rendah*

   **Kata kunci** apa yang bisa ditemukan, yaitu **performa rendah**. performa sebuah mata kuliah diukur dari seberapa berhasil mahasiswa menyerap materi dan memenuhi standar kelulusan. **Informasi yang ingin dicapai**: *jika banyak mahasiswa gagal, artinya performa mata kuliah tersebut rendah*. 

2. **Menangkap Kebutuhan Keputusan (DR01)**

    **Pernyataan**: *Kaprodi perlu menentukan mata kuliah yang mempunyai tingkat ketidaklulusan tinggi secara konsisten*

    Dari pernyataan tersebut terdapat **kata kunci** yang menjadi parameter yang lebih spesifik yaitu **tingkat ketidaklulusan**. Kaprodi membutuhkan informasi performa khusus tidak hanya umum. **Informasi yang ingin dicapai**: *jika tingkat kegagalannya tinggi saya harus melakukan intervensi*

3. **Menerjemahkan ke pertanyaan analitis (AQ01)**

    **Pernyataan**: *Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi pada setiap semester?*

    Pertanyaan ini menentukan dimensi dan ukuran data yang dibutuhkan: 
    - Apa yang diukur (Measure) : **Tingkat Kelulusan**
    - Dikelompokkan berdasarkan apa (dimension): **per mata kuliah dan per semester**
    - Bagaimana cara mencarinya: **dengan mengurutkan (rangking) dari yang tertinggi**

4. **Memilih Bentuk Matiks yang adil (Rasio vs Angka Absolut)
**
    Saat menghitung "tingkat kelulusan" yang dibutuhkan adalah jumlah absolut (misalnya : 20 mahsiswa tidak lulus) atau persentase/rasio (misalnya: 20% mahasiswa tidak lulus). 

    Yang dipilih adalah **Persentase Kelulusan**. Mengapa? karena jumlah mahasiswa pada setiap mata kuliah berbeda-beda. Misalnya Mata kuliah wajib tingkat satu bisa memiliki 200 mahasiswa, sedangkan mata kuliah pilihan hanya 20 mahasiswa. Jika 15 mahasiswa tidak lulus pada kelas berisi 20 orang (75%), masalahnya jauh lebih parah dibandingkan 20 mahasiswa tidak lulus pada kelas berisi 200 orang (10%). Oleh karena itu, bentuk persentase dipilih agar perbandingan antar mata kuliah menjadi adil

1. **Merumuskan KPI Final**

    KPI disusun menggunakan template berikut ini: 
    1. KPI Name = apa yang diukur
    2. Definition = makna bisnis
    3. Formula = numerator / denominator / aggregation
    4. Context = dianalisis berdasarkan apa
    5. Caveat = batasan penggunaan

    Sehingga berikut hasil penyusunan KPI berdasarkan tempelate tersebut : 

    6. **KPI Name (Apa yang diukur)**

        > **Persentase Ketidaklulusan per Mata Kuliah (Course Failure Rate)**

    7. **Definisi (Makna Bisnis)**

        > Mengukur proporsi mahasiswa yang gagal memenuhi standar kelulusan pada suatu mata kuliah dibandingkan dengan total mahasiswa yang mengambil mata kuliah tersebut. Metrik ini digunakan untuk mengidentifikasi mata kuliah dengan performa akademik rendah secara objektif dan melacak konsistensi kegagalannya antarsemester.
    8. **Formulasi**

        > Numerator (Pembilang) : Jumlah mahasiswa yang mendapatkan nilai akhir tidak lulus (misalnya nilai D, E, atau status Tidak Lulus/Gagal) pada mata kuliah tertentu.

        > Denominator (Penyebut): Total keseluruhan mahasiswa yang terdaftar dan memiliki nilai akhir pada mata kuliah tersebut di semester yang sama.

        > Aggregation (Agregasi): Rasio persentase yang dihitung dengan membagi pembilang dengan penyebut lalu dikalikan 100%, dengan fungsi agregasi COUNT pada entitas mahasiswa/KRS.

        **Rumus Matematis**:
        $$\left(\frac{\text{COUNT(Mahasiswa Tidak Lulus)}}{\text{COUNT(Total Mahasiswa Peserta Mata Kuliah)}}\right)\times 100\%$$

    9. **Konteks (Dianalisis berdasarkan apa)**

        KPI ini dianalisis dan dipotong berdasarkan periode atau dimensi berikut ini: 
        - **Dimensi Waktu** : Tahun Akademik dan Semester (Ganjil/Genap) untuk memantau tren dan konsistensi performa lintas waktu.
        - D**imensi Mata Kuliah**: Kode Mata Kuliah, Nama Mata Kuliah, Kelompok Keahlian, dan Jenis Mata Kuliah (Wajib/Pilihan).
        - **Dimensi Dosen** : Dosen Pengampu atau Koordinator Mata Kuliah untuk keperluan evaluasi metode pengajaran.

    10. **Caveat (Batasan penggunaan)**

        - **Bias Jumlah Peserta Kecil**: Pada mata kuliah pilihan dengan jumlah peserta sangat sedikit (misalnya di bawah 10 mahasiswa), ketidaklulusan 1 atau 2 orang saja dapat menyebabkan lonjakan persentase yang ekstrem sehingga perlu dianalisis dengan hati-hati.
        - **Data Nilai Belum Final**: Perhitungan hanya valid dilakukan setelah periode input dan validasi nilai akhir semester ditutup secara resmi (tidak mencakup nilai tunda/BL yang belum diproses).
        - **Mahasiswa Mengundurkan Diri**: Mahasiswa yang melakukan batal tambah (drop) mata kuliah secara resmi di awal semester tidak boleh dimasukkan ke dalam denominator agar tidak mendistorsi hasil.
        - **Perubahan Kurikulum**: Perbandingan historis antarsemester menjadi kurang akurat apabila terjadi perubahan kode mata kuliah, bobot SKS, atau standar batas kelulusan (misalnya perubahan batas lulus dari D menjadi C) di tengah periode analisis.

**2. KPI [Isi]**

**Lanjutkan Untuk Business Objective, Decision Requirement, dan Analytical Question selanjutnya Minimun 2 KPI lagi**


## 8. Data Requirement
Setelah KPI dapat dirumuskan kita dapat mengetahui kebutuhan data apa saja yang mendukung KPI untuk dapat digunakan. Untuk mengetahui data apa saja yang kita butuhkan kita perlu mengidentifikasi measure, context, time, filter/comparison yang telah tersirat pada Analytical Question dan KPI. 

1. **AQ01 dan KPI01**
   
   **Analytical Question (AQ01)** = Mata kuliah apa yang memiliki tingkat ketidaklulusan tertinggi pada setiap semester?

    **Persentase Ketidaklulusan per Mata Kuliah (Course Failure Rate)**, dengan komponen yang terdiri dari: 
   1. Total Mahasiswa Tidak Lulus
   2. Total Mahasiswa Per Mata Kuliah

    sehingga, 
   - Measure (Ukuran) : jumlah mahasiswa, nilai_angka per MK D dan E, Hitung failure Rate
   - Context (dimension) : MK, prodi
   - Time : semester
   - Comparison/filter : nilai_angka A sd C

    Berdasarkan informasi tersebut maka dapat disimpulkan data yang kita butuhkan adalah:
    - `nim` dari tabel `nilai`, untuk mendapatkan jumlah mahasiswa (measure)
    - `kode_mk` dari tabel `nilai`, untuk mendapatkan mata kuliah yang ingin dipantau (context)
    - `semester_id` dari tabel `nilai`, untuk mendapatkan periode evaluasi (Time)
    - `nilai_angka`, `nilai_huruf`, dan `satus_lulus`, untuk mendapatkan `nim` mahasiswa yang statusnya `lulus` sekaligus `nilai_huruf` dan `nilai_angka` (Comparison/filter)

2. [Isi, lanjutkan AQ dan KPI berikutnya]

Seluruh kebutuhan data disimpulkan dalam tabel berikut ini

| AQ | Measure | Context | Time | Filter/Comparison | Required Data |
|---|---|---|---|---|---|
| AQ01 | jumlah mahasiswa, nilai_angka per MK D dan E, Hitung failure Rate | MK, prodi | semester |`nim` mahasiswa yang statusnya `lulus` sekaligus `nilai_huruf` dan `nilai_angka`| `nim`,`kode_mk`,`semester_id`,`nilai_angka`,`status_lulus` |
| AQ02 | [Isi] | [Isi] | [Isi] | [Isi] | [Isi] |


## 9. Source Mapping

Setelah kita mengetahui kebutuhan data, maka selanjutnya kita perlu melakukan pemetaan, dari mana data tersebut kita dapatkan. Secara umum pendekatan yang kita lakukan adalah sebagai berikut: 

> **Data yang dibutuhkan → Tabel/file mana? → kolom apa → untuk fungsi/role apa?**

Implementasi dari pendekatan ini atas studi kasus disajikan dalam bentuk tabel sebagai berikut: 

| Data Requirement | Source | Column | Role |
|---|---|---|---|
| Mahasiswa | [Isi] | [Isi] | [isi] |
| Mata kuliah | [Isi] | [Isi] | [isi] |
| Nama MK | [Isi] | [Isi] | [isi] |
| Semester | [Isi] | [Isi] | [isi] |
| Nilai | [Isi] | [Isi] | [isi] |
| Lulus/gagal | [Isi] | [Isi] | [isi] |


role/fungsi yang bisa anda pilih antara lain: 
- integration key, yaitu sebagai kunci penghubung antar tabel
- course identifier, sebagai penanda MK
- analytical context, sebagai data yang akan dianalisis
- time key, sebagai data yang digunakan untuk time (periode/rentang waktu)
- measure, sebagai data yang akan dihitung
- KPI component, sebagai komponen utama dari KPI

## 10. Data Fitness

Selanjutnya setelah kita berhasil memetakan data yang dibutuhkan selanjutnya kita perlu untuk mengetahui bagaimana kualitas data tersebut dalam dataset. Aktivitas ini sangat penting sebelum kita melakukan Data cleaning. Untuk menilai kualitas dan kesiapan data kita bisa memanfaatkan hasil dari Modul 1 Unit 1.2 Data Profiling. 

Pada dasarnya untuk mendokumentasikan kualitas atau kesiapan data yang akan digunakan maka kita dapat menyusunnya dalam bentuk tabel sebagai berikut: 

| Source | Evidence Unit 1.2 | Fitness | Required Action |
|---|---|---|---|
| mahasiswa | [Isi] | [Isi] | [Isi] |
| program_studi | [Isi] | [Isi] | [Isi]  |
| mata_kuliah | [Isi] | [Isi] | [Isi]  |
| krs | [Isi] | [Isi] | [Isi]  |
| nilai | [Isi] | [Isi] | [Isi]  |
| aktivitas_lms | [Isi] | [Isi] | [Isi]  |
| kelulusan – profile on-time | [Isi] | [Isi] | [Isi]  |
| kelulusan – on-time vs late | [Isi] | [Isi] | [Isi]  |

Ket: 
- Source, sumber data
- Evidence Unit 1.2, bukti kondisi data atas dasar analisis pada Unit 1.2
- Fitness, kondisi data dapat diisi dengan [Ready, not Ready, Conditional Ready]
- Required Action, aksi yang dibutuhkan agar data siap digunakan


## 11. Candidate Model
Pada bagian ini kita belum membuat Star Schema Final, namun kita perlu untuk menentukan kandidat model yang akan kita gunakan. Untuk menetapkan kandidat model yang akan kita gunakan kita perlu untuk menetapkan candidate Grain, yaitu daftar opsi tingkat detail data (granularitas) paling rendah yang berpotensi dipilih untuk mendefinisikan satu barus dalam sebuah tabel. 

Mengapa candidate grain penting?, karena berperan sebagai fondasi utama yang menentukan struktur dan bentuk dari setiap candidate model. 

Rumusan yang dapat kita gunakan adalah sebagai berikut : 
>**Analytical Question → Business Event → Grain → Dimension → Fact → Measure**

Urutannya: 
1. Apa yang terjadi? 
   
   Business Event
2. Apa arti satu record?
   
   Grain

3. Berdasarkan apa dianalisis?
   
   Dimension

4. Apa kejadian yang diukur?
   
   Fact

5. Apa angka/indikator yang dianalisis?
   
   Measure


**AQ01** : 
>Mata kuliah apa yang memiliki failure rate tertinggi per semester?

**Business Event**: 
>Mahasiswa memperoleh nilai akhir

**Candidate Grain**:
>Satu nilai akhir mahasiswa untuk satu mata kuliah pada satu semester

**Candidate Fact**:
>Penilaian / Nilai

**Candidate Dimensions**:
- Mahasiswa
- Mata Kuliah
- Semester
- Program Studi
  
**Candidate Measures**:
- nilai_angka
- is_lulus
- record count

**AQ02** : 
>[Isi dengan jawaban anda!]

**Business Event**: 
>[Isi dengan jawaban anda!]

**Candidate Grain**:
>S[Isi dengan jawaban anda!]

**Candidate Fact**:
>[Isi dengan jawaban anda!]

**Candidate Dimensions**:
- [Isi dengan jawaban anda!]
  
**Candidate Measures**:
- [Isi dengan jawaban anda!]

Dst...


## 12. Traceability
Traceability merupakan bagian paling penting karena menghubungkan seluruh jawaban dari awal hingga akhir. 

>Rumusnya : 
Problem
→
Business Objective
→
Stakeholder
→
Decision Requirement
→
Analytical Question
→
KPI / Metric
→
Data Requirement
→
Source Mapping
→
Data Fitness
→
Candidate Model

Kemudian menyusunnya dalam satu kalimat sebagai berikut: 
> Karena ada [**Problem**], maka [**Stakeholder**] ingin mencapai [**Objective**] dan harus membuat [**Decision**]. Untuk itu diperlukan jawaban atas [**AQ**] menggunakan [**KPI**]. KPI membutuhkan [**Data**], yang berasal dari [**Source**]. Berdasarkan profiling, data berstatus [**Fitness**]. Oleh karena itu kandidat modelnya adalah [Grain + Fact + Dimension + Measure].

1. **TR01 – Course Failure**

    - Problem → mata kuliah berisiko belum mudah diidentifikasi
    - Stakeholder → Kaprodi
    - Decision → menentukan mata kuliah prioritas
    - AQ → failure rate tertinggi per semester
    - KPI → Course Failure Rate
    - Data → NIM, MK, semester, status/score
    - Source → nilai + mata_kuliah + semester
    - Fitness → nilai Conditional; MK/Semester Ready
    - Candidate Process → Penilaian
    - Candidate Grain → nilai mahasiswa per MK per semester

    Karena ada mata kuliah berisiko yang belum mudah diidentifikasi, maka Kaprodi ingin mencapai peningkatan kualitas pembelajaran dan deteksi dini masalah akademik dan harus membuat keputusan dalam menentukan mata kuliah prioritas. Untuk itu diperlukan jawaban atas mata kuliah mana yang memiliki failure rate tertinggi per semester menggunakan KPI Course Failure Rate. KPI membutuhkan data NIM, mata kuliah (MK), semester, dan status kelulusan/skor, yang berasal dari tabel nilai, mata_kuliah, dan semester. Berdasarkan profiling, data berstatus Conditional untuk tabel nilai, sedangkan tabel mata_kuliah dan semester berstatus Ready. Oleh karena itu, kandidat model untuk proses bisnis Penilaian adalah:
      - **Grain**: Satu baris data mewakili nilai akhir satu mahasiswa per mata kuliah per semester.
      - **Fact**: Fact_Penilaian (atau Fact_Nilai_Mahasiswa).
      - **Dimension**: Dim_Mahasiswa (dari NIM), Dim_Mata_Kuliah (dari MK), dan Dim_Semester (dari semester).
      - **Measure**: Score (Nilai Angka), Status_Lulus (Flag 1/0 atau Tidak Lulus), Jumlah_Peserta, Jumlah_Tidak_Lulus, dan Course_Failure_Rate (%).
 


2. **TR02 - [Isi]**




