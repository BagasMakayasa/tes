# Host: localhost  (Version: 5.6.26)
# Date: 2018-03-05 16:12:34
# Generator: MySQL-Front 5.3  (Build 4.198)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "akun"
#

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_akun` enum('PEMASUKAN','PENGELUARAN') DEFAULT NULL,
  `uraian` varchar(45) DEFAULT NULL,
  `pengaruh_laba_rugi` enum('YA','TIDAK') DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` varchar(45) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_akun`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "akun"
#

INSERT INTO `akun` VALUES (1,'PENGELUARAN','Tagihan Listrik.',NULL,'2018-02-28 12:33:03','2','AKTIF'),(2,'PEMASUKAN','Tagihan Air',NULL,'2018-02-28 12:34:57','2','AKTIF'),(3,'PEMASUKAN','BIaya Internet','YA','2018-03-02 10:07:41','2','AKTIF'),(4,'PEMASUKAN','w','TIDAK','2018-03-02 10:11:16','2','AKTIF');

#
# Structure for table "barang"
#

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(100) NOT NULL DEFAULT '',
  `tanggal_insert` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `status` enum('AKTIF','TIDAK AKTIF') NOT NULL DEFAULT 'AKTIF',
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "barang"
#

INSERT INTO `barang` VALUES (1,'Beras','2018-02-09 02:12:44',2,'AKTIF'),(2,'Ayam','2018-02-26 10:41:11',2,'AKTIF'),(3,'Minyak','2018-03-05 12:13:04',2,'AKTIF'),(8,'Tempe','2018-03-05 15:42:08',2,'AKTIF');

#
# Structure for table "kas_umum"
#

CREATE TABLE `kas_umum` (
  `id_kas_umum` int(11) NOT NULL AUTO_INCREMENT,
  `id_akun` int(11) DEFAULT NULL,
  `uraian` varchar(105) DEFAULT NULL,
  `nominal` varchar(45) DEFAULT NULL,
  `keterangan` varchar(105) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `bulan` varchar(5) DEFAULT NULL,
  `tanggal_insert` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT 'AKTIF',
  PRIMARY KEY (`id_kas_umum`),
  KEY `fk_kas_umum_akun1` (`id_akun`),
  CONSTRAINT `fk_kas_umum_akun1` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Data for table "kas_umum"
#

INSERT INTO `kas_umum` VALUES (23,1,NULL,NULL,NULL,2018,'02',NULL,NULL,'AKTIF'),(24,2,NULL,NULL,NULL,2018,'02',NULL,NULL,'AKTIF'),(27,1,'Tes','90.000','wOW',2018,'03','2018-03-01',2,'AKTIF'),(28,2,'nICE','80.000','K',2018,'03','2018-03-01',2,'AKTIF'),(29,3,'internet maret','20.000','lunas',2018,'03','2018-03-02',2,'AKTIF');

#
# Structure for table "log_transaksi"
#

CREATE TABLE `log_transaksi` (
  `id_log_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(45) NOT NULL DEFAULT '',
  `nomor_meja` int(11) NOT NULL DEFAULT '0',
  `jalur_transaksi` enum('KASIR','WAITER') DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `id_waiter` int(11) DEFAULT NULL,
  `status_pembelian` enum('LUNAS','BELUM BAYAR') DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT 'AKTIF',
  PRIMARY KEY (`id_log_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

#
# Data for table "log_transaksi"
#

INSERT INTO `log_transaksi` VALUES (43,'TR201802-4YGRW522',2,'KASIR','2018-02-23 10:59:50',NULL,NULL,'LUNAS','AKTIF'),(44,'TR201802-KDE8V4BX',1,'KASIR','2018-02-20 11:11:58',NULL,NULL,'LUNAS','AKTIF'),(48,'TR201802-FEBD3ER4',6,'WAITER','2018-02-23 14:39:02',2,1,'LUNAS','AKTIF'),(49,'TR201802-48XKCRM7',4,'WAITER','2018-02-24 14:43:08',2,1,'LUNAS','AKTIF'),(50,'TR201802-HPQ48MAD',4,'KASIR','2018-02-27 13:56:48',2,0,'LUNAS','AKTIF'),(51,'TR201803-J2N5ZE3G',4,'KASIR','2018-03-04 18:10:34',2,0,'BELUM BAYAR','AKTIF'),(52,'TR201803-Q8H6T3JZ',6,'KASIR','2018-03-04 23:33:57',2,0,'LUNAS','TIDAK AKTIF'),(55,'TR201803-Q8H6T3JZ',6,'KASIR','2018-03-04 23:58:33',2,0,'LUNAS','TIDAK AKTIF'),(56,'TR201803-Q8H6T3JZ',6,'KASIR','2018-03-05 00:03:24',2,0,'BELUM BAYAR','TIDAK AKTIF'),(57,'TR201803-ZD377Q9B',1,'KASIR','2018-03-05 00:08:06',2,0,'BELUM BAYAR','TIDAK AKTIF'),(58,'TR201803-ZD377Q9B',1,'KASIR','2018-03-05 00:10:56',2,0,'LUNAS','AKTIF'),(59,'TR201803-MEYXFHCJ',2,'KASIR','2018-03-05 00:12:02',2,0,'LUNAS','AKTIF'),(60,'TR201803-58S33ZXR',7,'KASIR','2018-03-05 00:15:17',2,0,'LUNAS','TIDAK AKTIF'),(61,'TR201803-58S33ZXR',7,'KASIR','2018-03-05 00:16:07',2,0,'BELUM BAYAR','TIDAK AKTIF'),(62,'TR201803-C3KQT78D',7,'KASIR','2018-03-05 00:17:16',2,0,'LUNAS','AKTIF'),(63,'TR201803-58S33ZXR',7,'KASIR','2018-03-05 00:18:41',2,0,'LUNAS','AKTIF'),(64,'TR201803-Q8H6T3JZ',6,'KASIR','2018-03-05 00:45:43',2,0,'LUNAS','TIDAK AKTIF'),(65,'TR201803-Q8H6T3JZ',6,'KASIR','2018-03-05 00:46:21',2,0,'BELUM BAYAR','AKTIF'),(72,'TR201803-PBZ8FZGX',1,'KASIR','2018-03-05 09:42:04',2,0,'BELUM BAYAR','TIDAK AKTIF'),(73,'TR201803-PBZ8FZGX',1,'KASIR','2018-03-05 09:42:42',2,0,'LUNAS','AKTIF');

#
# Structure for table "transaksi"
#

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(45) NOT NULL DEFAULT '',
  `id_menu` int(11) DEFAULT NULL,
  `jumlah_pembelian` varchar(45) DEFAULT NULL,
  `kategori_pembeli` enum('MEMBER','NON MEMBER') DEFAULT NULL,
  `id_member` int(11) DEFAULT NULL,
  `id_diskon` int(11) NOT NULL DEFAULT '0',
  `tanggal_insert` datetime DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT 'AKTIF',
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

#
# Data for table "transaksi"
#

INSERT INTO `transaksi` VALUES (55,'TR201802-4YGRW522',1,'33','NON MEMBER',0,1,'2018-02-25 10:59:50','AKTIF'),(56,'TR201802-KDE8V4BX',1,'6','NON MEMBER',0,1,'2018-02-25 10:59:50','AKTIF'),(57,'TR201802-KDE8V4BX',2,'1','NON MEMBER',0,0,'2018-02-25 10:59:50','AKTIF'),(64,'TR201802-FEBD3ER4',2,'6','NON MEMBER',0,0,'2018-02-23 10:59:50','AKTIF'),(65,'TR201802-FEBD3ER4',1,'6','NON MEMBER',0,1,'2018-02-23 10:59:50','AKTIF'),(66,'TR201802-48XKCRM7',2,'4','NON MEMBER',0,0,'2018-02-23 10:59:50','AKTIF'),(67,'TR201802-48XKCRM7',1,'9','NON MEMBER',0,1,'2018-02-23 10:59:50','AKTIF'),(68,'TR201802-HPQ48MAD',1,'4','NON MEMBER',0,0,'2018-02-27 13:56:48','AKTIF'),(69,'TR201802-HPQ48MAD',2,'7','NON MEMBER',0,0,'2018-02-27 13:56:48','AKTIF'),(70,'TR201803-J2N5ZE3G',2,'4','NON MEMBER',0,0,'2018-03-04 18:10:34','AKTIF'),(71,'TR201803-J2N5ZE3G',1,'3','NON MEMBER',0,0,'2018-03-04 18:10:34','AKTIF'),(72,'TR201803-Q8H6T3JZ',2,'11','NON MEMBER',0,0,'2018-03-04 23:33:57','TIDAK AKTIF'),(73,'TR201803-Q8H6T3JZ',1,'11','NON MEMBER',0,1,'2018-03-04 23:33:57','TIDAK AKTIF'),(76,'TR201803-Q8H6T3JZ',1,'11','NON MEMBER',0,1,'2018-03-04 23:58:33','TIDAK AKTIF'),(77,'TR201803-Q8H6T3JZ',1,'11','NON MEMBER',0,1,'2018-03-05 00:03:24','TIDAK AKTIF'),(78,'TR201803-ZD377Q9B',2,'1','NON MEMBER',0,0,'2018-03-05 00:08:06','TIDAK AKTIF'),(79,'TR201803-ZD377Q9B',2,'1','NON MEMBER',0,0,'2018-03-05 00:10:56','AKTIF'),(80,'TR201803-ZD377Q9B',1,'1','NON MEMBER',0,0,'2018-03-05 00:10:56','AKTIF'),(81,'TR201803-MEYXFHCJ',1,'3','NON MEMBER',0,0,'2018-03-05 00:12:02','AKTIF'),(82,'TR201803-58S33ZXR',2,'2','NON MEMBER',0,0,'2018-03-05 00:15:17','TIDAK AKTIF'),(83,'TR201803-58S33ZXR',2,'2','NON MEMBER',0,0,'2018-03-05 00:16:07','TIDAK AKTIF'),(84,'TR201803-C3KQT78D',2,'4','NON MEMBER',0,0,'2018-03-05 00:17:16','AKTIF'),(85,'TR201803-58S33ZXR',2,'2','NON MEMBER',0,0,'2018-03-05 00:18:41','AKTIF'),(86,'TR201803-Q8H6T3JZ',1,'11','NON MEMBER',0,1,'2018-03-05 00:45:43','TIDAK AKTIF'),(87,'TR201803-Q8H6T3JZ',1,'11','NON MEMBER',0,1,'2018-03-05 00:46:21','AKTIF'),(97,'TR201803-PBZ8FZGX',2,'1','NON MEMBER',0,0,'2018-03-05 09:42:04','TIDAK AKTIF'),(98,'TR201803-PBZ8FZGX',2,'1','NON MEMBER',0,0,'2018-03-05 09:42:42','AKTIF'),(99,'TR201803-PBZ8FZGX',1,'2','NON MEMBER',0,0,'2018-03-05 09:42:42','AKTIF');

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` varchar(15) DEFAULT NULL,
  `nama_lengkap` varchar(45) DEFAULT NULL,
  `user_level` enum('ADMIN','OWNER','KASIR','WAITER','KITCHEN','GUDANG') DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(45) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `kota_asal` varchar(45) DEFAULT NULL,
  `alamat` varchar(105) DEFAULT NULL,
  `pendidikan_terakhir` enum('SD','SMP','SMA','D3','S1') DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `tanggal_selesai_kontrak` datetime DEFAULT NULL,
  `id_user_insert` int(11) DEFAULT NULL,
  `gaji_bulanan` varchar(45) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'201802-WTR1','Sagab','WAITER','sagab','sagab','0867 988','0000-00-00',NULL,'L','-','-','SMA','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'800.000','AKTIF'),(2,'201802-ADM01','dono','ADMIN','admin','admin','-','0000-00-00',NULL,'L','-','-','SMA','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'1.500.000','AKTIF');

#
# Structure for table "tr_penggajian"
#

CREATE TABLE `tr_penggajian` (
  `id_gaji_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `gaji_bulan` varchar(2) DEFAULT NULL,
  `gaji_tahun` int(11) DEFAULT NULL,
  `nominal_gaji` varchar(45) DEFAULT NULL,
  `gaji_bonus` varchar(45) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user_insert` int(11) DEFAULT NULL,
  `status_pembayaran` enum('SUDAH','BELUM') DEFAULT 'BELUM',
  `catatan` text,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT 'AKTIF',
  PRIMARY KEY (`id_gaji_karyawan`),
  KEY `fk_gaji_karyawan_user1` (`id_user`),
  KEY `fk_gaji_karyawan_user2` (`id_user_insert`),
  CONSTRAINT `fk_gaji_karyawan_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gaji_karyawan_user2` FOREIGN KEY (`id_user_insert`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "tr_penggajian"
#

INSERT INTO `tr_penggajian` VALUES (1,1,'02',2018,'800.000',NULL,NULL,NULL,'BELUM',NULL,'TIDAK AKTIF'),(2,2,'02',2018,'1.500.000',NULL,NULL,NULL,'BELUM',NULL,'TIDAK AKTIF'),(3,1,'01',2018,'800.000',NULL,NULL,NULL,'BELUM',NULL,'TIDAK AKTIF'),(4,2,'01',2018,'1.200.000',NULL,'2018-02-24 12:28:00',2,'SUDAH',NULL,'TIDAK AKTIF'),(11,1,'02',2018,'800.000','310.000','2018-02-27 17:42:03',2,'SUDAH','','AKTIF'),(12,2,'02',2018,'1.200.000','96.000','2018-02-27 14:51:58',2,'SUDAH','Absen dua hari\r\nGaji bonus untuk uang lembur dua hari','AKTIF'),(13,1,'01',2018,'800.000',NULL,NULL,NULL,'BELUM',NULL,'AKTIF'),(14,1,'03',2018,'800.000',NULL,NULL,NULL,'BELUM',NULL,'AKTIF'),(15,2,'03',2018,'1.500.000',NULL,NULL,NULL,'BELUM',NULL,'AKTIF');

#
# Structure for table "tr_menu_habis"
#

CREATE TABLE `tr_menu_habis` (
  `id_tr_menu_habis` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_tr_menu_habis`),
  KEY `fk_tr_menu_habis_user1` (`id_user`),
  CONSTRAINT `fk_tr_menu_habis_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "tr_menu_habis"
#

INSERT INTO `tr_menu_habis` VALUES (1,2,'Habis bahan','2018-02-23 17:56:25',2,'AKTIF');

#
# Structure for table "tr_meja_kosong"
#

CREATE TABLE `tr_meja_kosong` (
  `id_tr_meja_kosong` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(45) DEFAULT NULL,
  `nomor_meja` int(11) DEFAULT NULL,
  `status_meja` enum('TERISI','KOSONG') DEFAULT 'TERISI',
  `tanggal_insert` datetime DEFAULT NULL,
  `jam_pulang` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_update` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT 'AKTIF',
  PRIMARY KEY (`id_tr_meja_kosong`),
  KEY `fk_tr_meja_kosong_user1` (`id_user`),
  KEY `fk_tr_meja_kosong_user2` (`id_update`),
  CONSTRAINT `fk_tr_meja_kosong_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tr_meja_kosong_user2` FOREIGN KEY (`id_update`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Data for table "tr_meja_kosong"
#

INSERT INTO `tr_meja_kosong` VALUES (6,'TR201802-4YGRW522',2,'TERISI','2018-02-23 11:00:09',NULL,2,NULL,'AKTIF'),(7,'TR201802-KDE8V4BX',1,'TERISI','2018-02-23 11:12:12',NULL,2,NULL,'AKTIF'),(11,'TR201802-FEBD3ER4',6,'TERISI','2018-02-23 14:39:23',NULL,1,NULL,'AKTIF'),(12,'TR201802-48XKCRM7',4,'TERISI','2018-02-23 14:43:34',NULL,1,NULL,'AKTIF'),(13,'TR201802-HPQ48MAD',4,'TERISI','2018-02-27 13:56:48',NULL,2,NULL,'AKTIF'),(14,'TR201803-J2N5ZE3G',4,'TERISI','2018-03-04 18:10:34',NULL,2,NULL,'AKTIF'),(15,'TR201803-Q8H6T3JZ',6,'TERISI','2018-03-04 23:33:57',NULL,2,NULL,'AKTIF'),(16,'TR201803-9BGFZSKW',5,'TERISI','2018-03-04 23:37:27',NULL,2,NULL,'AKTIF'),(17,'TR201803-9BGFZSKW',5,'TERISI','2018-03-04 23:38:45',NULL,2,NULL,'AKTIF'),(18,'TR201803-Q8H6T3JZ',6,'TERISI','2018-03-04 23:58:33',NULL,2,NULL,'AKTIF'),(19,'TR201803-Q8H6T3JZ',6,'TERISI','2018-03-05 00:03:24',NULL,2,NULL,'AKTIF'),(20,'TR201803-ZD377Q9B',1,'TERISI','2018-03-05 00:08:06',NULL,2,NULL,'AKTIF'),(21,'TR201803-ZD377Q9B',1,'TERISI','2018-03-05 00:10:56',NULL,2,NULL,'AKTIF'),(22,'TR201803-MEYXFHCJ',2,'TERISI','2018-03-05 00:12:02',NULL,2,NULL,'AKTIF'),(23,'TR201803-58S33ZXR',7,'TERISI','2018-03-05 00:16:07',NULL,2,NULL,'AKTIF'),(24,'TR201803-Q8H6T3JZ',6,'TERISI','2018-03-05 00:45:43',NULL,2,NULL,'AKTIF'),(25,'TR201803-Q8H6T3JZ',6,'TERISI','2018-03-05 00:46:21',NULL,2,NULL,'AKTIF'),(26,'TR201803-SP7RTZVH',1,'TERISI','2018-03-05 09:19:39',NULL,2,NULL,'AKTIF'),(27,'TR201803-SP7RTZVH',1,'TERISI','2018-03-05 09:27:32',NULL,2,NULL,'AKTIF'),(28,'TR201803-QEJBM62Z',1,'TERISI','2018-03-05 09:30:07',NULL,2,NULL,'AKTIF'),(29,'TR201803-QEJBM62Z',1,'TERISI','2018-03-05 09:31:10',NULL,2,NULL,'AKTIF'),(30,'TR201803-RFZ98GB5',1,'TERISI','2018-03-05 09:34:26',NULL,2,NULL,'AKTIF'),(31,'TR201803-RFZ98GB5',1,'TERISI','2018-03-05 09:35:07',NULL,2,NULL,'AKTIF'),(32,'TR201803-PBZ8FZGX',1,'TERISI','2018-03-05 09:42:04',NULL,2,NULL,'AKTIF'),(33,'TR201803-PBZ8FZGX',1,'TERISI','2018-03-05 09:42:42',NULL,2,NULL,'AKTIF');

#
# Structure for table "stok"
#

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` enum('STOK AWAL','STOK AKHIR') DEFAULT NULL,
  `id_barang` int(11) NOT NULL DEFAULT '0',
  `jumlah` varchar(45) DEFAULT NULL,
  `id_satuan` int(11) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `tanggal_kadaluarsa` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_stok`),
  KEY `fk_stok_user1` (`id_user`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `fk_stok_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "stok"
#

INSERT INTO `stok` VALUES (1,'STOK AKHIR',1,'3',1,'2018-02-23 02:27:44','2018-10-01 17:00:00',2,'AKTIF'),(2,'STOK AWAL',1,'5',1,'2018-02-23 10:25:37','2018-02-01 08:00:00',2,'AKTIF'),(3,'STOK AWAL',2,'4',1,'2018-02-26 10:41:23','2018-02-01 08:00:00',2,'AKTIF');

#
# Structure for table "satuan"
#

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` varchar(45) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_satuan`),
  KEY `fk_satuan_user1` (`id_user`),
  CONSTRAINT `fk_satuan_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "satuan"
#

INSERT INTO `satuan` VALUES (1,'Kg','2018-02-08 16:32:38',2,'AKTIF');

#
# Structure for table "profil"
#

CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL AUTO_INCREMENT,
  `nama_usaha` varchar(45) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `instagram` varchar(45) DEFAULT NULL,
  `whatsapp` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `jam_buka` time DEFAULT NULL,
  `hari_buka` varchar(45) DEFAULT NULL,
  `jam_tutup` time DEFAULT NULL,
  `hari_tutup` varchar(45) DEFAULT NULL,
  `jumlah_meja` varchar(45) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_profil`),
  KEY `fk_profil_user` (`id_user`),
  CONSTRAINT `fk_profil_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "profil"
#

INSERT INTO `profil` VALUES (1,'Maju jaya','JL. Jendral Besar H.M. Soeharto No. 488B, Kab. Bojonegoro - Jawa Timur','(0321) 442156','-','compress_20180209132940.jpg','-','-','-','-','--','00:00:00','-','00:00:00','-','10','2018-02-09 13:14:20',2,'AKTIF');

#
# Structure for table "pembelian_barang"
#

CREATE TABLE `pembelian_barang` (
  `id_pembelian_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(45) DEFAULT NULL,
  `nominal` varchar(45) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_pembelian_barang`),
  KEY `fk_modal_usaha_user1` (`id_user`),
  CONSTRAINT `fk_modal_usaha_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pembelian_barang"
#

INSERT INTO `pembelian_barang` VALUES (1,'Kulak kopi 1Kg','60.000','2018-02-24 14:10:34',2,'AKTIF');

#
# Structure for table "menu"
#

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_menu` int(11) DEFAULT NULL,
  `nama_menu` varchar(45) DEFAULT NULL,
  `harga` varchar(45) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_menu_user1` (`id_user`),
  CONSTRAINT `fk_menu_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "menu"
#

INSERT INTO `menu` VALUES (1,1,'Roti Bakar','8.000','2018-02-08 16:16:42',2,'AKTIF'),(2,2,'Jus Melon','5.000','2018-02-11 17:56:05',2,'AKTIF');

#
# Structure for table "kategori_menu"
#

CREATE TABLE `kategori_menu` (
  `id_kategori_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_kategori_menu`),
  KEY `fk_kategori_menu_user1` (`id_user`),
  CONSTRAINT `fk_kategori_menu_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "kategori_menu"
#

INSERT INTO `kategori_menu` VALUES (1,'Makanan',2,'2018-02-08 15:52:05','AKTIF'),(2,'Minuman',2,'2018-02-08 15:56:52','AKTIF');

#
# Structure for table "diskon"
#

CREATE TABLE `diskon` (
  `id_diskon` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_diskon` enum('PERSEN','BONUS ITEM') DEFAULT NULL,
  `nama_diskon` varchar(45) DEFAULT NULL,
  `id_menu` int(11) NOT NULL DEFAULT '0',
  `jumlah_minimal_pesan` int(11) DEFAULT NULL,
  `jumlah_diskon` varchar(45) DEFAULT NULL,
  `id_menu_bonus` int(11) DEFAULT NULL,
  `tanggal_insert` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id_diskon`),
  KEY `fk_diskon_user1` (`id_user`),
  CONSTRAINT `fk_diskon_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "diskon"
#

INSERT INTO `diskon` VALUES (1,'BONUS ITEM','Beli 5 Roti Bakar, Gratis 1 Roti Bakar',1,5,'',2,'2018-02-10 14:01:29',2,'AKTIF');

#
# Function "f_akun"
#

CREATE FUNCTION `f_akun`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select uraian from akun where id_akun = p_id and status = 'AKTIF');
END;

#
# Function "f_kategori_menu"
#

CREATE FUNCTION `f_kategori_menu`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select nama_kategori from kategori_menu where id_kategori_menu = p_id and status = 'AKTIF');
END;

#
# Function "f_menu"
#

CREATE FUNCTION `f_menu`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select nama_menu from menu where id_menu = p_id and status = 'AKTIF');
END;

#
# Function "f_nama_barang"
#

CREATE FUNCTION `f_nama_barang`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select nama_barang from barang where id_barang = p_id and status = 'AKTIF');
END;

#
# Function "f_satuan"
#

CREATE FUNCTION `f_satuan`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select satuan from satuan where id_satuan = p_id and status = 'AKTIF');
END;

#
# Function "f_sisa_stok"
#

CREATE FUNCTION `f_sisa_stok`(`p_id` INT,`p_tanggal` varchar(10)) RETURNS varchar(20) CHARSET latin1
BEGIN RETURN (select jumlah from stok where id_barang = p_id and kategori = 'STOK AKHIR' and status = 'AKTIF' and DATE(tanggal_insert) = p_tanggal);
END;

#
# Function "f_total_transaksi"
#

CREATE FUNCTION `f_total_transaksi`(`p_id` varchar(30)) RETURNS varchar(30) CHARSET latin1
BEGIN RETURN (select sum(replace(bb.harga, '.', '')* aa.jumlah_pembelian)as total from transaksi aa, menu bb where aa.id_menu = bb.id_menu and bb.status='AKTIF' and aa.status = 'AKTIF' and aa.kode_transaksi= p_id);
END;

#
# Function "f_user"
#

CREATE FUNCTION `f_user`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select nama_lengkap from user where id_user = p_id and status = 'AKTIF');
END;

#
# Function "f_user_level"
#

CREATE FUNCTION `f_user_level`(`p_id` INT) RETURNS varchar(50) CHARSET latin1
BEGIN RETURN (select user_level from user where id_user = p_id and status = 'AKTIF');
END;
