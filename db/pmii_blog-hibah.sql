-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2022 at 03:22 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmii_blog-hibah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about`
--

CREATE TABLE `tbl_about` (
  `about_id` int(11) NOT NULL,
  `about_image` varchar(100) DEFAULT NULL,
  `about_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_about`
--

INSERT INTO `tbl_about` (`about_id`, `about_image`, `about_description`) VALUES
(1, 'about1.jpg', '<div xss=\"removed\" xss=removed><span xss=\"removed\"><span xss=\"removed\"><span xss=\"removed\">POROZ (Perkumpulan Organisasi Pengelola Zakat) adalah asosiasi lembaga pengelola zakat yang bersifat nirlaba dan independen, sebagai wadah berhimpun Lembaga Amil Zakat (LAZ), terutama yang berbasis organisasi masyarakat Islam. POROZ dideklarasikan pada Jumat, 9 Februari 2018, bertepatan dengan 23 Jumadil Awal 1439 Hijriyah. Saat ini POROZ berkedudukan atau sekretariat di Jl. Kramat Raya No.45, Kramat, Senen, Jakarta Pusat.</span></span></span></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_slug` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`) VALUES
(1, 'Articles', 'articles'),
(2, 'News', 'news'),
(3, 'Opinion', 'opinion'),
(4, 'Kajian', 'kajian');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_date` timestamp NULL DEFAULT current_timestamp(),
  `comment_name` varchar(60) DEFAULT NULL,
  `comment_email` varchar(90) DEFAULT NULL,
  `comment_message` text DEFAULT NULL,
  `comment_status` int(11) DEFAULT 0,
  `comment_parent` int(11) DEFAULT 0,
  `comment_post_id` int(11) DEFAULT NULL,
  `comment_image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home`
--

CREATE TABLE `tbl_home` (
  `home_id` int(11) NOT NULL,
  `home_caption_1` varchar(200) DEFAULT NULL,
  `home_caption_2` varchar(200) DEFAULT NULL,
  `home_bg_heading` varchar(50) DEFAULT NULL,
  `home_bg_testimonial` varchar(50) DEFAULT NULL,
  `home_bg_testimonial2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_home`
--

INSERT INTO `tbl_home` (`home_id`, `home_caption_1`, `home_caption_2`, `home_bg_heading`, `home_bg_testimonial`, `home_bg_testimonial2`) VALUES
(1, 'Welcome to', 'Arya Suralaya Bumiayu Indonesian Moslem Student Movement', '03.jpg', 'home-2.png', 'home-3.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `inbox_id` int(11) NOT NULL,
  `inbox_name` varchar(50) DEFAULT NULL,
  `inbox_email` varchar(80) DEFAULT NULL,
  `inbox_subject` varchar(200) DEFAULT NULL,
  `inbox_message` text DEFAULT NULL,
  `inbox_created_at` timestamp NULL DEFAULT current_timestamp(),
  `inbox_status` varchar(2) DEFAULT '0' COMMENT '0=Unread, 1=Read'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `member_id` int(11) NOT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `member_link` varchar(50) DEFAULT NULL,
  `member_desc` text DEFAULT NULL,
  `member_image` varchar(50) DEFAULT NULL,
  `member_created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_navbar`
--

CREATE TABLE `tbl_navbar` (
  `navbar_id` int(11) NOT NULL,
  `navbar_name` varchar(50) DEFAULT NULL,
  `navbar_slug` varchar(200) DEFAULT NULL,
  `navbar_parent_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_navbar`
--

INSERT INTO `tbl_navbar` (`navbar_id`, `navbar_name`, `navbar_slug`, `navbar_parent_id`) VALUES
(1, 'Home', NULL, 0),
(2, 'Profil', 'about', 0),
(13, 'Edukasi', 'edu', 0),
(17, 'Contact', 'contact', 0),
(18, 'HTML Dasar', 'category/html-dasar', 13),
(19, 'CSS Dasar', 'category/css-dasar', 13),
(20, 'JavaScript Dasar', 'category/javascript-dasar', 13),
(21, 'PHP Dasar', 'category/php-dasar', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) DEFAULT NULL,
  `post_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_contents` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_image` varchar(40) DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT current_timestamp(),
  `post_last_update` datetime DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `post_tags` varchar(225) DEFAULT NULL,
  `post_slug` varchar(250) DEFAULT NULL,
  `post_status` int(11) DEFAULT NULL COMMENT '1=Publish, 0=Unpublish',
  `post_views` int(11) DEFAULT 0,
  `post_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `post_title`, `post_description`, `post_contents`, `post_image`, `post_date`, `post_last_update`, `post_category_id`, `post_tags`, `post_slug`, `post_status`, `post_views`, `post_user_id`) VALUES
(1, 'Interferensi Bahasa Sunda dan Jawa terhadap Bahasa Indonesia', 'Bahasa merupakan elemen utama dalam bersosialisasi, ragam bahasa merupakan warna', '<p style=\"text-align: justify; \">Seperti yang kita ketahui, sosiolinguistik merupakan ilmu antardisiplin antara sosiologi dan linguistik. Yang mana sosiologi berusaha mengetahui bagaimana masyarakat dan bahasa itu terjadi, berlangsung, dan tetap ada. Sedangkan linguistik sendiri jelas merupakan ilmu yang mempelajari tentang bahasa.</p><p style=\"text-align: justify;\">Disini, bahasa merupakan alat yang digunakan untuk menghubungkan atau berinteraksi antara individu dengan indvidu yang lain. Namun, dalam berkomunikasi, terkadang masih terdapat banyak sekali kesalahan-kesalahan. Seperti perubahan fonem, perubahan konsonan, atau perbedaan kata tetapi memiliki arti yang sama. Kesalahan berbahasa inilah yang disebut dengan interferensi bahasa. Di mana terdapat dua bahasa yang digunakan ketika berkomunikasi. Bahasa ke satu adalah bahasa Ibu, yang kedua adalah bahasa yang bahasa yang digunakan untuk mencoba menyesuaikan dengan lawan bahasa dan lain sebagainya.</p><p style=\"text-align: justify; \">Dalam hal ini, terdapat Interferensi Bahasa Sunda dan Jawa terhadap Bahasa Indonesia dalam lingkup Pergerakan Mahasiswa Islam Indonesia Komisariat Arya Suralaya Bumiayu yang mana terdapat banyak orang dari asal daerah yang berbeda-beda.</p><p style=\"text-align: justify;\"><em>“Ja, bade kamana? Aku nitip hoh” </em>tanya Deni kepada Reza yang sedang memakai sandal di depan pintu.</p><p style=\"text-align: justify;\">Dari kalimat percakapan di atas, dapat dilihat bahwa Deni yang memiliki bahasa daerah Sunda masih menggunakan logat dan bahasanya sendiri dalam berkomunikasi dengan Reza. Dibuktikan dengan adanya kata “<em>Ja” </em>di mana itu adalah logat sunda yang mengganti huruf atau konsonan Z menjadi J. Kemudian klausa “<em>bade kamana?</em>“ juga merupakan bahasa sunda yang lagi-lagi digunakan oleh Deni, artinya ‘Mau kemana?’. Kedua hal tersebutlah yang akhirnya menjadi interferensi bahasa sunda terhadap bahasa Indonesia. Dapat dilihat kambali pada kalimat percakapan di bawah ini.</p><p style=\"text-align: justify;\">“Balik sama siapa, Nda?” tanya Reza kepada Amanda.</p><p style=\"text-align: justify;\">Dari kalimat percakapan di atas, bahasa yang Reza gunakan adalah campuran dari bahasa Jawa dan Indonesia. Di mana hal tersebut dikarenakan kebiasaan Reza yang memiliki kemampuan bahasa Indonesia lebih dominan daripada bahasa Jawanya.</p><p style=\"text-align: justify;\">Dari kedua kalimat percakapan di atas, dapat menjadi bukti atau menjadi sample bahwa dalam lingkup Pergerakan Mahasiswa Islam Indonesia (PMII) Komisariat Arya Suralaya Bumiayu terjadi interferensi bahasa Sunda dan Jawa terhadap bahasa Indonesia. Interferensi yang terjadi adalah interferensi fonologi dan semantik. Yaitu interferensi fonologi yang berarti adanya perubahan bunyi dan konsonan, sedangkan interferensi semantik yang berarti adanya perubahan kata namun memiliki arti atau makna yang sama.</p><p style=\"text-align: justify;\">Hal ini bisa terjadi karena perbedaan daerah asal tempat tinggal dengan kebiasaan masyarakat yang dwibahasaan (bahasa Indonesia terhadap bahasa Sunda-Jawa). Sehingga kebiasaan tersebut dibawa oleh sesama anggota yang dan digunakan saat berkomunikasi.</p><p style=\"text-align: justify; \"><!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph --></p><p style=\"text-align: justify;\"><em><br></em></p><p style=\"text-align: justify;\"><b style=\"\">Sahabati Amanda Qori Ifadakh</b></p>', 'ccca7e866c78966d4d7f3110303ef43d.jpg', '2022-02-11 07:00:12', NULL, 3, 'pmii,pmiidev,pmiimedia,pmiimaju,pmiimendunia,keindonesiaan,kemahasiswaan,kebangsaan', 'interferensi-bahasa-sunda-dan-jawa', 1, 0, 4),
(2, 'JHT Bisa Cair Di Usia 56 Tahun ? Berikut Penjelasannya', 'JHT Merupakan salah satu program BPJS Ketenagakerjaan', '<p style=\"text-align: justify; \">           BPJS Merupakan singkatan dari Badan Penyelenggara Jaminan Sosial, merupakan Badan Hukum Publik yang bertanggung jawab langsung kepada Presiden dan memiliki tugas untuk menyelenggarakan jaminan Kesehatan Nasional bagi seluruh rakyat Indonesia, terutama untuk Pegawai Negeri Sipil, Penerima Pensiun PNS dan TNI/POLRI, Veteran, Perintis Kemerdekaan beserta keluarganya dan Badan Usaha lainnya ataupun rakyat biasa (<em>Dilansiri dari Wikipedia</em>).</p><p style=\"text-align: justify;\">            BPJS mengalami sejarah yang panjang, dari masa kolonial Belanda, pemerintah sudah menerapkan sistem BPJS namun belum seperti sekarang. Setelah Indonesia Merdera dan menerima kedaulatan, mulailah dibangun lembaga atau badan negara yang menangani terkait Kesejahteraan sosial dalam hal ini dibidang kesehatan dan ketenagakerjaan. Keduanya awalnya terpisah dari dua lembaga atau badan yang berbeda, di bidang kesehatan bernama Askes, di bidang ketenagakerjaan bernama Jamsostek. Lalu di tahun 2014 kemudian diubah statusnya, diresmikan menjadi satu Badan yang resmi menangani Jaminan Sosial, yaitu BJPS Kesehatan dan BPJS Ketenagakerjaan.</p><p style=\"text-align: justify;\">            BPJS Ketenagakerjaan sebelumnya memiliki 4 Program, antara lain JHT (Jaminan Hari Tua), JKM (Jaminan Kematian), JKK (Jaminan Kecelakaan Kerja), dan JP (Jaminan Pensiun). Pada awalnya, ketika peserta BPJS mengalami PHK (Pemutusan Hubungan Kerja), resign, atau habis kontrak dapat menggunakan manfaat program JHT dan tanpa terpaut dengan usia, namun sekarang melalui peraturan yang baru yaitu Permenaker Nomor 2 Tahun 2022 diberikan ketentuan mengenai batas minimum usia pengambilan manfaat JHT. Inilah yang menjadi kontroversi di masyarakat khususnya dalam hal ini dikalangan para buruh. Mereka mengira bahwa saat usia dibawah 56 Tahun tidak dapat mengambil hak mereka sebagai peserta BPJS Ketenagakerjaan, dan mengklaim bahwa Pemerintah Gila, Pemerintah Kekurangan dana, BPJS Surut dana, dan pernyataan-pernyataan lain yang mengarah kepada ketidaksetujuan dan ketidakpuasan yang cenderung provokatif dan tendensial khususnya kepada pemerintah dan BPJS. Apalagi berita-berita yang tersebar di artikel online atau media sosial. Maka dari itu kami PK Arya Suralaya Bumiayu di hari senin, 14 Februari mengadakan kajian dan analisis terhadap Permenaker yang baru ini, dan artikel ini adalah hasil dari diskusi kami.</p><p style=\"text-align: justify;\">            Permenaker yang mengatur mengenai JHT sebelumnya, yaitu Permenaker Nomor 19 Tahun 2015 tidak dimuat mengenai batas usia minimun pengambilan manfaat JHT, didalamnya disebutkan bahwa manfaat JHT dapat diambil ketika peserta meninggal dunia, mengalami cacat total, resign, di PHK dan habis kontrak. Dengan kata lain, peserta dapat mencairkan dana JHT kapanpun dan diusia berapa pun. Sedangkan dari Arti kata nya saja, manfaat JHT seharusnya diberikan ketika peserta sudah memasuki usia tua, atau dalam hal ini usia pensiun. Hal ini yang menjadi evaluasi BPJS Ketenagakerjaan, ketika peserta masih diusia produktif, seluruh tabungannya di BPJS Ketenagakerjaan dihabiskan dan ketika sudah memasuki usia tua dan tidak bisa bekerja peserta sudah tidak memiliki tabungan. Namun melalui peraturan yang baru, yaitu Permenaker Nomor 2 Tahun 2022 sudah menentukan dengan spesifik bahwa JHT diberikan kepada peserta saat sudah memasuki usia pensiun, yaitu 56 Tahun, sehingga peserta masih memiliki tabungan ketika sudah tidak bisa bekerja.</p><p style=\"text-align: justify;\">            Namun memang yang menjadi masalah, ketika peserta masih dibawah usia 56 Tahun dan sudah tidak bekerja belum bisa mencairkan dana JHT. Maka BPJS Ketenagakerjaan menambah 1 program baru yang bernama JKP (Jaminan Kehilangan Pekerjaan) untuk membersamai program JHT yang sudah dispesifikan untuk di berikan saat hari tua. Sebenarnya aturan mengenai JKP sudah dibuat dan diundangkan melalui PP Nomor 37 Tahun 2021, hanya saja belum di rilis. Dan kabarnya akan dirilis sepekan kedepan tanggal 22 Februari 2022.</p><p style=\"text-align: justify; \"><!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph --></p><p style=\"text-align: justify; \">            Progran JKP memberikan 3 manfaat kepada peserta, antara lain pencairan dana tabungan, lowongan pekerjaan baru dan pelatihan kerja. Program JKP diberikan kepada peserta yang mengalami PHK, resign dan habis kontrak ketika masih diusia produktif (dibawah 56 Tahun). Sehingga saat ini, artinya BPJS Ketenagakerjaan memiliki 5 Program. Dengan kata lain, JHT yang awalnya menyatukan Jaminan Sosial di hari tua dengan Jaminan Sosial Setelah berhenti bekerja dibawah usia pensiun sekarang di spesifikkan menjadi dua program yang berbeda, yakni JHT dan JKP</p><p style=\"text-align: justify; \">.             Kesimpulannya, menurut kami Permenaker Nomor 2 Tahun 2022 ini sudah baik, dengan adanya aturan JHT yang dipisah hakikatnya dengan JKP, maka peserta dapat memiliki tabungan dibawah usia pensiun yang dapat digunakan untuk kebutuhan atau membangun usaha, serta dapat memiliki pekerjaan baru. Hanya saja framing media dan kekurangan literasi serta mungkin belum sempurnanya sosialisasi mengenai hal ini yang membuat kontroversi dan disinformasi menyebarluas begitu cepat di media sosial. Kita sebagai kaum intelektual mahasiswa dan kader pergerakan sudah seharusnya menjadi tameng dan agen pemutus disinformasi. Kita menyatakan tegas, tidak Pro Pemerintah dan tidak Pro Rakyat juga, kita Pro Kebenaran dan Pro Kemaslahatan. Salam Pergerakan !</p>', 'aef706a1b16a3b44820725c8262768cd.png', '2022-02-15 15:06:23', NULL, 3, 'pmii,pmiidev,pmiimendunia,kemahasiswaan,kebangsaan,pemuda', 'jht-cair-diusia-56-tahun', 1, 2, 5),
(3, 'Hasil Kajian dan Sikap PMII Bumiayu Terhadap Kejadian Wadas', 'Bendungan Bener dan Penambangan Batu andesit adalah salah satu PSN', '<p style=\"text-align: justify; \">Proyek Strategis Nasional (PSN) adalah proyek-proyek infrastruktur Indonesia pada masa pemerintahan Presiden Joko Widodo yang dianggap strategis dalam meningkatkan pertumbuhan ekonomi, pemerataan pembangunan, kesejahteraan masyarakat, dan pembangunan di daerah (dilansir dari wikipedia). Seperti yang kita ketahui dari definisi PSN tersebut, sebenarnya memiliki tujuan yang baik, membangun Indonesia menuju Negara yang lebih sejahtera dan mandiri khususnya dalam bidang ekonomi yang menjadi jantung berjalannya suatu Negara. Ketika suatu Negara memiliki kemandirian ekonomi maka akan meminimalisir pengeluaran negara dan dapat mengembangkan potensi serta penghasilan yang didapatkan, ditambah lagi potensi Sumber Daya Alam di indonesia sangat menjanjikan.</p><p style=\"text-align: justify; \">Tertera pada data yang ada pada perencanaan PSN, pulau Jawa memiliki rencana proyek yang paling banyak dan dana yang paling besar diantara pulau yang lain. Dengan kata lain, untuk saat ini dan dikemudian hari akan banyak PSN-PSN yang digalangkan oleh pemerintah di berbagai daerah Pulau Jawa. Seperti pembangunan Jalan Raya, Jalan Tol, Bendungan, dan lain sebagainya. Didaerah Brebes juga sudah banyak digarap, dan tentunya tidak sedikit pula yang menuai kontroversi dari mulai segi pengambilan lahan, efek yang ditimbulkan, serta resiko lain yang mungkin terjadi.</p><p style=\"text-align: justify;\">Bendungan adalah konstruksi yang dibangun untuk menahan laju air menjadi waduk, danau, atau tempat rekreasi. seringkali Bendungan juga digunakan untuk mengalirkan air ke sebuah Pembangkit Listrik Tenaga Air (PLTA). Pembangunan Bendungan merupakan salah satu PSN yang dilakukan oleh pemerintah, salah satunya dalam hal ini Pembangunan Bendungan Bener yang terletak di Desa Wadas Kecamatan Bener Kabupaten Purworejo Jawa Tengah yang kemarin sempat menuai kontroversi, dimulai dari video yang beredar mengenai penangkapan, pengepungan yang dilakukan oleh aparat kepolisian dalam proses pengukuran yang dilakukan oleh tim pengukur Selasa, 8 Februari 2022 kemarin. Oleh karena itu, PK PMII Arya Suralaya mengadakan kajian dan analisi mengenai kejadian tersebut, tentunya kita tidak boleh tinggal diam apabila memang terjadi sesuatu yang melanggar hak asasi manusia karena kita adalah kaum intelektual mahasiswa sekaligus kader pergerakan. Kita mengkaji terkait asal atau awal dibangunnya bendungan, sampai ke payung hukum yang digunakan sampai kronologis kejadian hingga menarik kesimpulan dan mengambil sikap.</p><p style=\"text-align: justify;\">Dibangunnya Bendungan Bener bertujuan untuk mengaliri 3 Kabupaten yaitu Kulon Progo, Kebumen dan Purworejo. Awal perencanaan pengadaan Bendungan Bener sejak tahun 2013, kemudian melalui proses analisis lingkungan dan lain sebagainya hingga resmi digarapnya pada tahun 2018 setelah dikeluarkannya SK oleh Gubernur Jawa Tengah No. 591/41/2018 tentang Izin Penetapan Lokasi Bendungan Bener, kemudian melalui proses administratif, pengadaan tanah, dan kemudian pengukuran dan diprediksi akan rampung pada tahun 2023. Bendungan ini digarap oleh PUPR RI (Pekerjaan Umum Perumahan Rakyat Republik Indonesia) dan didanai oleh APBN sebesar 2,06 Trilyun. Tujuan dibangunna Bendungan Bener:</p><ol type=\"1\"><li style=\"text-align: justify;\">Dapat mengurangi debit banjir karena air ditampung diwadah raksasa</li><li style=\"text-align: justify;\">Menambah pasokan air untuk perumahan warga dan pertanian</li><li style=\"text-align: justify;\">Menghasilkan listrik melalui PLTA</li><li style=\"text-align: justify;\">Salah satu bentuk realisasi proyek untuk menunjang ketahanan pangan</li></ol><p style=\"text-align: justify;\">Pada tanggal 20 Januari 2022, pemerintah telah mengadakan musyawarah dan dihadiri oleh Warga yang Pro dan kontra serta pihak-pihak terkait yang lain. Kemudian hasilnya pada saat itu warga yang pro meminta agar pengukuran lahan dipercepat. Akhirnya pada tanggal 7 Februari 2022 Tim pengukur datang namun disambut dengan tidak hangat oleh warga, lalu dipaksa untuk di tunda pengukurannya. Kemudian Tim pengukur melapor kepada Gubernur lalu ditindaklanjuti dengan meminta kepada Kapolda untuk melakukan pengawalan terhadap pengukuran. Sehingga, pada malam harinya Pasukan kepolisian mendirikan tenda dilokasi. Pada Pagi hari dihari selasa, 8 Februari 2022 pasukan melepas pamflet-pamflet penolakan lalu mengawal Tim pengukur untuk melakukan Pengukuran, kemudian disitulah kejadian yang kontroversi terjadi.</p><p style=\"text-align: justify;\">Pada video yang tersebar dan sempat viral kemarin, disajikan tontonan kejam kepolisian menarik-narik warga, mengepung masjid, dan melakukan tindak yang tidak berperikemanusiaan lainnya. Kita sebagai Mahasiswa yang dinamis dan kritis, tentunya mengetahui bahwa media sangat mudah dimanipulasi. Agar tidak terjadi disinformasi, kami mengkaji dan menganalisis berdasarkan data yang ada kemudian dikumpulkan.</p><p style=\"text-align: justify;\">Menurut kami, Aparat kepolisian memang salah ketika langsung main hakim sendiri, namun jika dinilai kejam kami tidak setuju, karena menurut kami pasti yang namanya kepolisian tidak akan bertindak berlebihan tanpa sebab dan alasan yang jelas, dengan kata lain main tarik pukul sembarangan. Kemudian spot yang menyajikan gerombolan kepolisian memenuhi area sekitar masjid, itu bukanlah pengepungan melainkan pengamanan yang dilakukan untuk mengamankan warga yang sedang konflik. Kemudian terkait kabar mengenai senjata tajam yang dibawa oleh warga, itu bukan kesengajaan melainkan barang yang dibawa ketika sedang melakukan kegiatan sehari-hari dan secara tidak sengaja terbawa ketika dikejar oleh warga yang lain.</p><p style=\"text-align: justify;\">Dari Awal sebenarnya sudah menuai kontroversi khususnya dalam hal ini masyarakat Desa Wadas. Pembangunan Bendungan sebenarnya tidak terlalu dipermasalahkan oleh warga, karena tujuan dan manfaat yang didapat cukup baik dan untuk masyarakat pula, serta IPL nya juga sudah tuntas, namun dikarenakan adanya proyek tambahan pengadaan Pertambangan Batu Andesit yang disinyalir hasil pertambangannya yaitu Batu Andesit merupakan material pokok yang digunakan untuk membangun Bendungan tersebut. Pembangunan Pertambangan tersebut dikhawatirkan akan terjadi hal-hal yang tidak diinginkan seperti dampak negatif terhadap lingkungan, mematikan mata pencaharian warga lokal yaitu petani ketika kelestarian alamnya dirusak oleh pertambangan, dan efek samping negatif lainnya. Disisi lain, ternyata syarat administratif terkait Pembangunan Pertambangan belum sesuai prosedur perundang-undangan yang ada di Indonesia. Salah satunya IUP (Izin Usaha Pertambangan) yang tertuang dalam UU Pertambangan Mineral dan Batubara. Kemudian, AMDAL (Analisis Dampak Lingkungan) yang diterbitkan juga telah dimanipulasi seakan-akan warga sudah setuju tanpa memperhatikan warga yang belum setuju, karena pada saat ini diperoleh data warga yang setuju masih presentasi 57% dan yang belum menyetujui sebesar 21%, dan 22 % sisanya belum memutuskan.</p><p style=\"text-align: justify;\">Dari kajian dan analisis tersebut, dengan itu kami PK PMII Arya Suralaya Bumiayu menarik kesimpulan dan mengambil sikap sebagai berikut :</p><ol type=\"1\"><li style=\"text-align: justify;\">Menuntut Gubernur Jawa Tengah untuk mengkaji ulang IPL (Izin Penetapan Lokasi) Pertambangan Batu Andesit yang terindikasi belum sesuai prosedur dalam perundang-undangan yang ada, salah satunya IUP (Izin Usaha Pertambangan) yang tertuang dalam UU Pertambangan Mineral dan Batubara</li><li style=\"text-align: justify;\">Menuntut pemerintah untuk Mengkaji ulang AMDAL (Analisi Dampak Lingkungan) yang terindikasi dimanipulasi atau belum sesuai kondisi realita yang ada, khususnya data mengenai persetujuan warga</li><li style=\"text-align: justify;\">Mengecam segala bentuk tindakan represif yang dilakukan oleh aparat kepolisian terhadap warga Wadas</li><li style=\"text-align: justify;\">Menuntut Pemerintah untuk tidak melanjutkan pengukuran terlebih dahulu sebelum situasi kembali kondusif</li><li style=\"text-align: justify;\">Menuntut agar Polda Jateng dan Polres Purworejo menarik pasukan pengawalan terhadap pengukuran lahan karena menimbulkan kekhawatiran dan kepanikan terhadap masyarakat</li><li style=\"text-align: justify;\">Memberi himbauan kepada warga khususnya yang ada di desa Wadas agar lebih memahami tujuan PSN (Proyek Strategi Nasional) dalam hal ini pembangunan Bendungan Bener dan Pertambangan Batu Andesit sehingga persetujuan atau penolakan yang dilakukan tidak hanya ikut-ikutan semata</li><li style=\"text-align: justify;\">Meminta kepada Pemerintah untuk memberikan sosialisasi dan edukasi lebih terkait PSN khususnya dalam hal ini warga Desa Wadas dan umumnya untuk warga di daerah yang menjadi tempat pembangunan PSN serta memediasi ketika terjadi ketidaksepakatan antar masyarakat sehingga tidak terjadi konflik</li></ol><p style=\"text-align: justify; \"><!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:list {\"ordered\":true,\"type\":\"1\"} -->\r\n\r\n<!-- /wp:list -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:list {\"ordered\":true,\"type\":\"1\"} -->\r\n\r\n<!-- /wp:list -->\r\n\r\n<!-- wp:paragraph -->\r\n\r\n<!-- /wp:paragraph --></p><p style=\"text-align: justify; \">Demikian sikap dari kami, dan jika dikemudian hari dibutuhkan tindak lanjut maka dari kami menyatakan siap untuk mengawal kejadian ini. Salam Pergerakan !</p>', '7a549dd3faeb2baf5f2a171ab339674d.png', '2022-02-11 07:16:21', NULL, 4, 'pmii,pmiidev,keindonesiaan,keislaman,kemahasiswaan,kebangsaan', 'hasil-kajian-dan-sikap--kejadian-wadas', 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_views`
--

CREATE TABLE `tbl_post_views` (
  `view_id` int(11) NOT NULL,
  `view_date` timestamp NULL DEFAULT current_timestamp(),
  `view_ip` varchar(50) DEFAULT NULL,
  `view_post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_site`
--

CREATE TABLE `tbl_site` (
  `site_id` int(11) NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_title` varchar(200) DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_favicon` varchar(50) DEFAULT NULL,
  `site_logo_header` varchar(50) DEFAULT NULL,
  `site_logo_footer` varchar(50) DEFAULT NULL,
  `site_logo_big` varchar(50) DEFAULT NULL,
  `site_facebook` varchar(150) DEFAULT NULL,
  `site_twitter` varchar(150) DEFAULT NULL,
  `site_instagram` varchar(150) DEFAULT NULL,
  `site_pinterest` varchar(150) DEFAULT NULL,
  `site_linkedin` varchar(150) DEFAULT NULL,
  `site_wa` varchar(15) DEFAULT NULL,
  `site_mail` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_site`
--

INSERT INTO `tbl_site` (`site_id`, `site_name`, `site_title`, `site_description`, `site_favicon`, `site_logo_header`, `site_logo_footer`, `site_logo_big`, `site_facebook`, `site_twitter`, `site_instagram`, `site_pinterest`, `site_linkedin`, `site_wa`, `site_mail`) VALUES
(1, 'PMII Bumiayu', 'Pergerakan Mahasiswa Islam Indonesia Bumiayu', 'Website Resmi Pergerakan Mahasiswa Islam Indonesia Bumiayu', 'favicon1.png', 'apple-touch-icon2.png', 'favicon.png', 'logobig.jpg', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/pmii_bumiayu/', 'Jl.Raya Pagojengan Perum Palm Indah Km 3. D4 , Paguyangan Brebes Jawa Tengah 52276', 'https://www.linkedin.com/', '6281575356670', 'admin@pmiibumiayu.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscribe`
--

CREATE TABLE `tbl_subscribe` (
  `subscribe_id` int(11) NOT NULL,
  `subscribe_email` varchar(100) DEFAULT NULL,
  `subscribe_created_at` timestamp NULL DEFAULT current_timestamp(),
  `subscribe_status` int(11) DEFAULT 0,
  `subscribe_rating` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tags`
--

CREATE TABLE `tbl_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tags`
--

INSERT INTO `tbl_tags` (`tag_id`, `tag_name`) VALUES
(1, 'pmii'),
(2, 'pmiidev'),
(3, 'pmiimedia'),
(4, 'pmiimaju'),
(7, 'pmiimendunia'),
(8, 'keindonesiaan'),
(9, 'keislaman'),
(10, 'kemahasiswaan'),
(11, 'kebangsaan'),
(12, 'pemuda');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team`
--

CREATE TABLE `tbl_team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) DEFAULT NULL,
  `team_org` varchar(50) DEFAULT NULL,
  `team_content` text DEFAULT NULL,
  `team_image` varchar(50) DEFAULT NULL,
  `team_twitter` varchar(50) DEFAULT NULL,
  `team_facebook` varchar(50) DEFAULT NULL,
  `team_instagram` varchar(50) DEFAULT NULL,
  `team_linked` varchar(50) DEFAULT NULL,
  `team_created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_team`
--

INSERT INTO `tbl_team` (`team_id`, `team_name`, `team_org`, `team_content`, `team_image`, `team_twitter`, `team_facebook`, `team_instagram`, `team_linked`, `team_created_at`) VALUES
(1, 'Rudi Juniyanto', 'Mandataris Ketua', '', 'd3528d89254950eb597bdf3014f4f5e6.jpg', 'https://twitter.com/', 'https://facebook.com/', 'https://instagram.com/', 'https://linkedin.com/', '2021-08-10 09:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_name` varchar(50) DEFAULT NULL,
  `testimonial_org` varchar(50) DEFAULT NULL,
  `testimonial_content` text DEFAULT NULL,
  `testimonial_image` varchar(50) DEFAULT NULL,
  `testimonial_created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`testimonial_id`, `testimonial_name`, `testimonial_org`, `testimonial_content`, `testimonial_image`, `testimonial_created_at`) VALUES
(1, 'Angga Nugraha', 'PR PMII Teknik', 'PMII telah memadukan potensi jaringan antar pengelola organisasi untuk menjadi kekuatan yang menyatukan strategi pemberdayaan melalui kaderisasi.', '3ff07ca20e7acd5ca7bff893ac043c68.png', '2021-07-30 09:48:07'),
(2, 'Tan Sukma', 'PR PMII Saintek', 'Gerakan kami untuk mendorong berbagai  usaha pengembangan ekonomi produktif yang berkelanjutan. Melakukan upaya pengembangan SDM dalam bidang pengelolaan UMKM.', 'e497eda35658c5984707fa25eb945b8e.png', '2021-07-30 09:57:52'),
(3, 'Edi Muktiono', 'PR PMII Eksakta', 'PMII membangun jaringan dan kerjasama guna membangun hubungan aspiratif dengan pemerintah. Dengan kerjasama yang baik dengan pengelola gerakan nasional dan internasional.', '0cbf1a5492b39e3a92288117f8487eb5.png', '2021-07-30 10:02:22'),
(4, 'Dewi Sri', 'PR PMII Algoritma', 'Ikhtiar kami untuk mewujudkan organisasi pengelola rayon yang transparan, amanah dan profesional untuk meningkatkan taraf kehidupan masyarakat yang sejahtera.', '0082e8fdb74eb6c977c3aa25bd45418f.png', '2021-07-30 10:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  `user_password` varchar(40) DEFAULT NULL,
  `user_level` varchar(10) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT '1',
  `user_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_level`, `user_status`, `user_photo`) VALUES
(4, 'Author Dev', 'author@gmail.com', '6de37e2ac5eb524e32ceff7599dbabae', '2', '1', '4894343ac02c28e5f292e7fa60ba447b.png'),
(5, 'Admin Dev', 'admin@gmail.com', '45f0d53693e62c673f066f383694e530', '1', '1', '225fc323cfd8ddae21b10991a6468916.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `visit_id` int(11) NOT NULL,
  `visit_date` timestamp NULL DEFAULT current_timestamp(),
  `visit_ip` varchar(50) DEFAULT NULL,
  `visit_platform` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`home_id`);

--
-- Indexes for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  ADD PRIMARY KEY (`navbar_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `tbl_site`
--
ALTER TABLE `tbl_site`
  ADD PRIMARY KEY (`site_id`);

--
-- Indexes for table `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  ADD PRIMARY KEY (`subscribe_id`);

--
-- Indexes for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `tbl_team`
--
ALTER TABLE `tbl_team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`visit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_member`
--
ALTER TABLE `tbl_member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  MODIFY `navbar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_site`
--
ALTER TABLE `tbl_site`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_team`
--
ALTER TABLE `tbl_team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
