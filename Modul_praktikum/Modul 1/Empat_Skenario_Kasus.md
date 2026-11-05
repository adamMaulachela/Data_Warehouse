# EMPAT STUDI KASUS TERARAH UNIT 1.3
## Dataset UADW v1.0
### Hanya Bagian Skenario Kasus

---

# Studi Kasus 1
## Deteksi Dini Risiko Mahasiswa Tidak Aktif dan Putus Studi

### Skenario Kasus

Pimpinan universitas dan Ketua Program Studi ingin mengurangi jumlah mahasiswa yang berisiko menjadi tidak aktif atau berhenti studi sebelum menyelesaikan program pendidikan. Selama ini pemantauan mahasiswa lebih banyak dilakukan setelah masalah muncul, misalnya ketika mahasiswa tidak melakukan registrasi ulang, tidak mengambil mata kuliah, atau sudah lama tidak menunjukkan aktivitas akademik. Kondisi ini menyebabkan intervensi sering terlambat dilakukan.

Universitas memiliki beberapa sumber data yang dapat membantu mengidentifikasi gejala risiko lebih awal melalui dataset UADW v1.0. Data mahasiswa memberikan informasi mengenai identitas akademik, angkatan, program studi, dan status mahasiswa. Data KRS menunjukkan pola pengambilan mata kuliah setiap semester. Data nilai memberikan gambaran performa akademik, termasuk mata kuliah yang tidak lulus atau belum memiliki nilai. Data aktivitas LMS dapat menunjukkan intensitas keterlibatan mahasiswa dalam proses pembelajaran daring. Selain itu, data pembayaran dapat memberikan indikasi apakah terdapat kendala administrasi atau finansial yang mungkin berkaitan dengan keberlanjutan studi.

Pimpinan tidak ingin hanya mengetahui daftar mahasiswa yang sudah berstatus tidak aktif. Mereka ingin memperoleh informasi yang lebih awal mengenai mahasiswa yang menunjukkan pola penurunan keterlibatan akademik. Misalnya, mahasiswa yang sebelumnya mengambil beban studi normal tetapi kemudian mengambil jauh lebih sedikit mata kuliah, mahasiswa yang berulang kali tidak lulus mata kuliah, mahasiswa dengan aktivitas LMS yang menurun, atau mahasiswa yang tidak melakukan aktivitas akademik pada semester berikutnya.

Ketua Program Studi juga ingin mengetahui apakah risiko ketidakaktifan lebih banyak terjadi pada angkatan tertentu, program studi tertentu, atau kelompok mahasiswa dengan pola akademik tertentu. Informasi tersebut diharapkan dapat digunakan untuk menyusun program pendampingan, konseling akademik, penguatan peran dosen pembimbing akademik, dan intervensi lebih awal sebelum mahasiswa benar-benar berhenti studi.

Namun demikian, data yang tersedia berasal dari beberapa sistem dan belum tentu memiliki format yang sepenuhnya konsisten. Terdapat kemungkinan duplikasi data mahasiswa, perbedaan penulisan program studi, data nilai yang belum lengkap, serta mahasiswa yang memiliki aktivitas LMS tetapi tidak tercatat pada transaksi akademik tertentu. Karena itu, sebelum universitas dapat membangun sistem analitik yang andal, kebutuhan bisnis harus diterjemahkan terlebih dahulu menjadi kebutuhan informasi dan kebutuhan data yang jelas.

---

# Studi Kasus 2
## Evaluasi Keterlibatan Mahasiswa di LMS terhadap Performa Akademik

### Skenario Kasus

Wakil Rektor Bidang Akademik dan pengelola Learning Management System ingin mengevaluasi apakah penggunaan LMS benar-benar mendukung proses pembelajaran mahasiswa. Selama ini universitas telah memiliki data aktivitas LMS dalam jumlah besar, tetapi pemanfaatannya masih terbatas pada pelaporan jumlah login atau jumlah aktivitas secara umum. Pimpinan ingin mengubah data tersebut menjadi informasi yang dapat membantu mengevaluasi kualitas proses pembelajaran.

Melalui dataset UADW v1.0, universitas memiliki data aktivitas LMS yang mencatat interaksi mahasiswa dengan sistem pembelajaran, data KRS yang menunjukkan mata kuliah yang diambil mahasiswa, data nilai yang menunjukkan hasil akademik, serta data mahasiswa dan mata kuliah sebagai konteks analisis. Pimpinan ingin memahami apakah terdapat pola hubungan antara tingkat keterlibatan mahasiswa di LMS dan hasil belajar yang diperoleh.

Sebagai contoh, universitas ingin mengetahui apakah mahasiswa dengan aktivitas LMS yang rendah cenderung memiliki nilai akhir yang lebih rendah, apakah mahasiswa yang aktif mengakses LMS menjelang ujian memiliki performa yang berbeda dibandingkan mahasiswa yang aktif secara konsisten sepanjang semester, dan apakah terdapat mata kuliah tertentu yang memiliki aktivitas LMS tinggi tetapi hasil belajar mahasiswa masih rendah.

Pengelola program studi juga ingin membandingkan pola keterlibatan antarsemester, antarmata kuliah, dan antarprogram studi. Mereka berharap dapat mengidentifikasi mata kuliah yang membutuhkan perbaikan desain pembelajaran digital, mahasiswa yang berpotensi membutuhkan pendampingan, serta pola penggunaan LMS yang dapat dijadikan indikator awal keterlibatan belajar.

Namun, data aktivitas LMS memiliki volume yang jauh lebih besar dibandingkan data akademik lainnya. Satu mahasiswa dapat menghasilkan banyak catatan aktivitas dalam satu hari. Selain itu, beberapa aktivitas mungkin merupakan duplikasi teknis atau tidak semuanya relevan sebagai indikator keterlibatan akademik. Karena itu, universitas perlu menentukan informasi apa yang benar-benar diperlukan dan bagaimana data LMS harus dikaitkan dengan data mahasiswa, KRS, mata kuliah, semester, dan nilai agar analisis yang dihasilkan tidak menyesatkan.

---

# Studi Kasus 3
## Analisis Risiko Tunggakan Pembayaran dan Dampaknya terhadap Aktivitas Akademik

### Skenario Kasus

Biro Keuangan bersama pimpinan akademik universitas ingin memahami pola pembayaran mahasiswa dan dampaknya terhadap keberlanjutan aktivitas akademik. Selama ini data pembayaran lebih banyak digunakan untuk keperluan administrasi keuangan, sedangkan hubungan antara pembayaran, registrasi akademik, pengambilan mata kuliah, dan performa mahasiswa belum dianalisis secara terintegrasi.

Dataset UADW v1.0 menyediakan data pembayaran mahasiswa, data mahasiswa, data KRS, data nilai, data semester, serta data kelulusan. Pimpinan ingin mengetahui apakah terdapat mahasiswa yang berulang kali mengalami keterlambatan atau ketidaklengkapan pembayaran, apakah kondisi tersebut berhubungan dengan berkurangnya beban studi, tidak melakukan KRS, atau tertundanya penyelesaian studi.

Biro Keuangan membutuhkan informasi mengenai pola pembayaran berdasarkan semester, program studi, angkatan, dan jenis pembayaran. Sementara itu, Ketua Program Studi lebih membutuhkan informasi mengenai mahasiswa yang secara administratif mengalami masalah pembayaran dan pada saat yang sama menunjukkan penurunan aktivitas akademik. Tujuannya bukan untuk memberikan sanksi, melainkan untuk mendukung kebijakan intervensi yang lebih tepat, seperti pemberian informasi beasiswa, skema pembayaran, atau pendampingan akademik.

Pimpinan juga ingin menghindari kesimpulan yang terlalu sederhana. Mahasiswa yang terlambat membayar belum tentu memiliki masalah akademik, dan mahasiswa yang tidak aktif belum tentu disebabkan oleh faktor pembayaran. Karena itu, data pembayaran harus dianalisis bersama data akademik dan status mahasiswa.

Dalam dataset juga terdapat kemungkinan transaksi pembayaran yang duplikat, pembayaran dengan nilai yang tidak konsisten, pembayaran yang belum memiliki pasangan informasi akademik yang jelas, atau mahasiswa yang tercatat pada data pembayaran tetapi memiliki status akademik berbeda. Kondisi ini membuat universitas perlu merumuskan kebutuhan analitik, indikator, kebutuhan data, dan kriteria kelayakan data terlebih dahulu sebelum membangun model analitik yang digunakan untuk pengambilan keputusan.

---

# Studi Kasus 4
## Evaluasi Efektivitas Program Studi Berdasarkan Retensi, Prestasi, dan Kelulusan Mahasiswa

### Skenario Kasus

Rektorat dan unit penjaminan mutu universitas ingin melakukan evaluasi yang lebih komprehensif terhadap kinerja program studi. Selama ini evaluasi sering dilakukan menggunakan indikator yang terpisah, misalnya jumlah mahasiswa aktif, rata-rata nilai, atau jumlah lulusan. Pimpinan ingin memperoleh gambaran yang lebih terintegrasi mengenai perjalanan mahasiswa mulai dari masuk perguruan tinggi hingga lulus.

Dengan menggunakan dataset UADW v1.0, universitas memiliki data mahasiswa berdasarkan angkatan dan program studi, data KRS setiap semester, data nilai, data aktivitas LMS, serta data kelulusan. Data tersebut memungkinkan universitas untuk melihat tidak hanya hasil akhir berupa kelulusan, tetapi juga proses akademik yang mendahuluinya.

Pimpinan ingin mengetahui program studi mana yang memiliki tingkat retensi mahasiswa paling baik, program studi mana yang memiliki banyak mahasiswa dengan pola pengulangan mata kuliah, bagaimana tren performa akademik dari satu angkatan ke angkatan berikutnya, serta bagaimana tingkat kelulusan tepat waktu berbeda antarprogram studi. Selain itu, universitas ingin mengetahui apakah terdapat pola tertentu yang menunjukkan bahwa mahasiswa pada program studi tertentu membutuhkan intervensi lebih awal.

Unit penjaminan mutu juga membutuhkan informasi yang dapat digunakan dalam evaluasi internal dan perencanaan peningkatan mutu. Mereka ingin melihat hubungan antara jumlah mahasiswa masuk, mahasiswa aktif, mahasiswa yang tetap melanjutkan studi, performa akademik, dan lulusan pada level angkatan dan program studi.

Tantangan utama adalah bahwa indikator-indikator tersebut berasal dari proses bisnis yang berbeda. Data mahasiswa menggambarkan kondisi individu, KRS menggambarkan aktivitas registrasi akademik, nilai menggambarkan hasil pembelajaran, dan kelulusan menggambarkan penyelesaian studi. Selain itu, perubahan status mahasiswa dan perubahan informasi program studi dapat terjadi dari waktu ke waktu.

Karena itu, universitas tidak dapat sekadar menggabungkan seluruh tabel dan menghitung indikator secara langsung. Diperlukan pemahaman yang jelas mengenai kebutuhan pimpinan, pertanyaan analitik yang akan dijawab, definisi indikator, data yang dibutuhkan, sumber data yang tepat, serta tingkat kelayakan setiap sumber sebelum sistem Data Warehouse dikembangkan.
