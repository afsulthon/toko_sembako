DROP DATABASE IF EXISTS `toko_sembako`;
CREATE DATABASE `toko_sembako`;
USE `toko_sembako`;

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
);

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
);

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
);

DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
);

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '123', 2);

ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'So Klin Detergent Cair Provence Lavender 525mL', 'Soklin Liquid Provence Lavender, dengan perpaduan perfum istimewa membuat Anda bisa menikmati kemewahan perfum kelas dunia setiap saat pada pakaian anda . ', 'Pembersih', 12000, 100, 'deterjen.jpg'),
(2, 'Dove Deeply Nourishing Body Wash Refill 400mL', 'Dove Deeply Nourishing dengan Nutrium Moisture dapat menutrisi dan melembabkan hingga ke dalam lapisan kulit lebih baik dari susu, untuk menjadikan kulitmu lebih halus, lembut, dan kenyal.', 'Pembersih', 25000, 50, 'sabun.jpg'),
(3, 'Indomaret Facial Tissue 2 Ply (2+1) 3X180\'s', 'Indomaret Facial Tissue. Bahan virgin 100n pulp, dapat digunakan untuk mengusap muka, dan membersihkan benda-benda dari kotoran.', 'Pembersih', 22000, 100, 'tissue.jpg'),
(4, 'Sunlight Pencuci Piring Jeruk Nipis 650mL', 'Sunlight Jeruk Nipis 100 mampu menghilangkan lemak dengan kekuatan 100 jeruk nipis di tiap kemasannya, secara aktif mengangkat dan menghilangkan lemak membandel, dan juga membersihkan dengan cepat berkat teknologi baru Cepat ', 'Pembersih', 15000, 40, 'sunlight.jpg'),
(5, 'Mr.Muscle Pembersih Kamar Mandi Pump 500Ml', 'MR. MUSCLE PEMBERSIH KAMAR MANDI 5 IN 1 Adalah Pembersih Kamar Mandi Serbaguna yang sangat praktis, cukup semprotkan dan lap tanpa perlu dibilas. Membunuh 99% bakteri, Menghilangkan noda sabun membandel pada bath tub, dinding', 'Pembersih', 24000, 70, 'otot.jpg'),
(6, 'Baygon Insektisida Spray Flower Garden 600+75Ml', 'Baygon insektisida spray flower garden kaleng.', 'Lain-lain', 38000, 50, 'baygon.jpg'),
(7, 'Bellagio Homme Pomade Kidz Bubblegum 40G', 'Mengandung Argan Oil untuk menutrisi dan menghaluskan rambut, serta melembabkan kulit kepada. Dengan aroma bubblegum yang segar dan menenangkan. Water Based - mudah dibilas dengan air.', 'Lain-lain', 16000, 20, 'pomade.jpg'),
(8, 'Pixy Vitamin Infused Brightening Mist Light Radiance 60mL', 'Face mist dari PIXY yang mampu melembapkan dan memberi nutrisi untuk kulitmu dimanapun dan kapanpun. Dapat digunakan sebagai Hydrating Toner sebelum menggunakan pelembap.', 'Lain-lain', 14000, 40, 'serum.jpg'),
(9, 'Kenko Gel Pen+Highlighter Gp-20Hl 2s', 'Pena dan Highlighter', 'Lain-lain', 14000, 50, 'pulpen.jpg'),
(10, 'Deli School Correction Tape - 8101', 'Correction tape, Tip-x, Correction Pen, Pulpen, Deli, Deli E8101', 'Lain-lain', 10000, 30, 'correction_tape.jpg'),
(11, 'Pucuk Harum Minuman Teh Melati 350Ml', 'Teh pucuk harum minuman teh beraroma melati dibuat dengan pucuk daun teh pilihan dengan ekstrak melati yang menyegarkan.', 'Minuman', 3800, 20000, 'pucuk.jpg'),
(12, 'Sprite Soft Drink 250Ml', 'Sprite minuman berperisa jeruk lemon dan lime berkarbonasi, kemasan pas harga pas.', 'Minuman', 3500, 200, 'sprite.jpg'),
(13, 'Frisian Flag Susu Sereal Cair Uht Cokelat 225mL', 'Susu Sereal Cokelat dengan kandungan 8 vitamin dan 3 mineral', 'Minuman', 6300, 100, 'frisian.jpg'),
(14, 'Coca-Cola Soft Drink 1500Ml', 'Coca cola minuman beraroma kola berkarbonasi botol 1500mL', 'Minuman', 12900, 10, 'coca.jpg'),
(15, 'Club Air Mineral 1500Ml', 'Club air minum dalam kemasan botol 1500mL', 'Minuman', 4200, 999, 'club.jpg'),
(16, 'Indomaret Beras Pulen Wangi Premium 5Kg', 'Beras premium', 'Bahan Makanan', 69500, 20, 'beras.jpg'),
(17, 'Segitiga Biru Tepung Terigu 1000G', 'Segitiga Biru adalah tepung terigu yang cocok untukmembuat aneka makanan seperti bolu, brownies, cake, pisang, martabak manis, muffin, kue bulan, croissant, puff pastry, denish, bapia, pastel, kroket, risoles, dan lain-lain', 'Bahan Makanan', 15300, 60, 'tepung.jpg'),
(18, 'Rose Brand Gula Pasir Putih 1Kg', 'Gula pasir putih yang terbuat dari gula tebu asli pilihan dan diproses secara higienis yang telah memenuhi standar mutu. Menghasilkan gula yang manis, alami, murni dan bersih', 'Bahan Makanan', 16000, 88, 'gula.jpg'),
(19, 'Tropical Minyak Goreng 1000Ml', 'Tropical minyak goreng dengan 2x penyaringa, yang kaya akan Vitamin E yang baik. Minyak goreng sawit dengan 90mg Omega 3 per saji, 1.7g Omega 6 per saji, dan 6.7g Omega 9 per saji.', 'Bahan Makanan', 20300, 90, 'minyak.jpg'),
(20, 'Dolphin Garam 500G', 'Cocok untuk segala masakan, maupun untuk kue-kue dan makanan ringan, dapat dipakai langsung di dapur ataupun di meja makan', 'Bahan Makanan', 11500, 10, 'garam.jpeg'),
(21, 'Choice Fried Chicken Paha Bawah', 'Daging ayam bagian paha bawah pilihan dibalut tepung dan di goreng dengan renyah dan garing menjadikan rasa ayam goreng yang enak dan citarasa khas yummy fried chicken.', 'Makanan', 11500, 30, 'paha_bawah.jpg'),
(22, 'Choice Crispy Boneless Chicken', 'Ayam fillet goreng tepung, disajikan dengan bumbu tabur rasa barbeque pedas.', 'Makanan', 10000, 200, 'boneless.jpg'),
(23, 'Yummy Choice French Fries', 'Kentang goreng yang dipotong tipis dan digoreng dalam keadaan beku untuk mendapatkan tekstur yang lebih crunch', 'Makanan', 12000, 20, 'french.jpg'),
(24, 'Choice Fried Chicken Paha Atas', 'Daging ayam bagian paha atas pilihan dibalut tepung dan di goreng dengan renyah dan garing menjadikan rasa ayam goreng yang enak dan citarasa khas yummy fried chicken.', 'Makanan', 20100, 40, 'paha_atas.jpg'),
(25, 'Choice Fried Chicken Sayap', 'Daging ayam bagian sayap pilihan dibalut tepung dan di goreng dengan renyah dan garing menjadikan rasa ayam goreng yang enak dan citarasa khas yummy fried chicken', 'Makanan', 15600, 21, 'sayap.jpg');