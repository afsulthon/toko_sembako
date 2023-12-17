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
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
(10, 'Deli School Correction Tape - 8101', 'Correction tape, Tip-x, Correction Pen, Pulpen, Deli, Deli E8101', 'Lain-lain', 10000, 30, 'correction_tape.jpg');
