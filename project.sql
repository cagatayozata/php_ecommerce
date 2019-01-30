-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 20, 2018 at 09:21 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `name`, `date`, `text`) VALUES
(28, 44, 'Cagatay O', '2018-05-21 00:19:52', 'Ürün çok başarılı...');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `product_id`, `product_name`, `amount`, `date`) VALUES
(10, 'mail@me.com', 47, 'Sony Playstation 4 Slim 500 GB', 1299, '2018-05-21 00:14:37'),
(11, 'mail@me.com', 42, 'HP 14-BS006NT Intel Celeron N3060', 999, '2018-05-21 00:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `category` int(11) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `descp` text COLLATE utf8_turkish_ci NOT NULL,
  `promotional` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `brand`, `category`, `categoryname`, `photo`, `price`, `rating`, `descp`, `promotional`) VALUES
(49, 'Sony Playstation 3 1 Tb', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/3/768/9612441092146.jpg', 1998, 0, 'Sony Playstation 3 1 Tb ( Ps4 Pro )-Türkçe Menü\r\nSONY PLAYSTATİON 4 PRO \r\nKarşınızda süper güçlü PS4. Dünyanın en güçlü konsolu.\r\nDinamik 4K oyun ve 4K eğlence deneyimi\r\nYoğun ve gerçekçi oyun deneyimi, olağanüstü net videolar ve her anında inanılmaz ayrıntı seviyesi.\r\nSüper Güç\r\nPS4 Pro; bugüne kadar karşılaştığınız en hızlı, en net ve en yüksek tepki hızına sahip oyun deneyimlerini sunmak için rakipsiz teknoloji ile gelmektedir*.\r\nDünyanın en güçlü konsolu Standart PS4\'e kıyasla iki kat güçlü GPU sayesinde oyunlar, yoğun grafikler ve inanılmaz gerçekçi ayrıntılarla hayat bulur.\r\nDaha yüksek kare hızı\r\nDaha yüksek ve daha istikrarlı kare hızları sayesinde kristal netliğinde hareketlerle aksiyonlar daha hızlı, daha akıcı ve daha heyecanlı hale gelir.\r\nDinamik 4K oyun deneyimi\r\nEn yeni oyunları dinamik 4K* ile muhteşem netlikte oynayın; ten renkleri daha sıcak hale gelir, oyun içi öğeler gerçekçi dokulara sahip olur ve oyun ortamları hiç olmadığı kadar canlanır.\r\nHDR teknolojisi\r\nBir HDR TV sayesinde PS4 oyunları* çarpıcı ölçüde canlı ve gerçekçi renkler sunarak maceralarınıza inanılmaz canlılıkta hayat verir.\r\nThe Last of Us Remastered, Uncharted 4: Bir Hırsızın Sonu ve inFAMOUS First Light ile PS4 ve PS4 Pro sistemlerinde HDR oyun deneyimini yaşayın.\r\nİnanılmaz eğlence deneyimi\r\nNetflix, YouTube ve pek yakında kullanıma sunulacak eğlence uygulamaları üzerinden en iyi filmlerin, en sevilen TV programlarının ve en yeni videoların 4K etkileyici çözünürlükle* akışını gerçekleştirin. Üstelik hepsini mümkün olan en net görüntü kalitesine otomatik yükseltilmiş halde izleyin.\r\nDaha iyi bağlantı\r\nSorunsuzca bağlanın ve oyun dünyalarınızı paylaşın.', 0),
(48, 'Sony Playstation 4 Pro 1 Tb', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/3/768/9612441092146.jpg', 1998, 0, 'Sony Playstation 4 Pro 1 Tb ( Ps4 Pro )-Türkçe Menü\r\nSONY PLAYSTATİON 4 PRO \r\nKarşınızda süper güçlü PS4. Dünyanın en güçlü konsolu.\r\nDinamik 4K oyun ve 4K eğlence deneyimi\r\nYoğun ve gerçekçi oyun deneyimi, olağanüstü net videolar ve her anında inanılmaz ayrıntı seviyesi.\r\nSüper Güç\r\nPS4 Pro; bugüne kadar karşılaştığınız en hızlı, en net ve en yüksek tepki hızına sahip oyun deneyimlerini sunmak için rakipsiz teknoloji ile gelmektedir*.\r\nDünyanın en güçlü konsolu Standart PS4\'e kıyasla iki kat güçlü GPU sayesinde oyunlar, yoğun grafikler ve inanılmaz gerçekçi ayrıntılarla hayat bulur.\r\nDaha yüksek kare hızı\r\nDaha yüksek ve daha istikrarlı kare hızları sayesinde kristal netliğinde hareketlerle aksiyonlar daha hızlı, daha akıcı ve daha heyecanlı hale gelir.\r\nDinamik 4K oyun deneyimi\r\nEn yeni oyunları dinamik 4K* ile muhteşem netlikte oynayın; ten renkleri daha sıcak hale gelir, oyun içi öğeler gerçekçi dokulara sahip olur ve oyun ortamları hiç olmadığı kadar canlanır.\r\nHDR teknolojisi\r\nBir HDR TV sayesinde PS4 oyunları* çarpıcı ölçüde canlı ve gerçekçi renkler sunarak maceralarınıza inanılmaz canlılıkta hayat verir.\r\nThe Last of Us Remastered, Uncharted 4: Bir Hırsızın Sonu ve inFAMOUS First Light ile PS4 ve PS4 Pro sistemlerinde HDR oyun deneyimini yaşayın.\r\nİnanılmaz eğlence deneyimi\r\nNetflix, YouTube ve pek yakında kullanıma sunulacak eğlence uygulamaları üzerinden en iyi filmlerin, en sevilen TV programlarının ve en yeni videoların 4K etkileyici çözünürlükle* akışını gerçekleştirin. Üstelik hepsini mümkün olan en net görüntü kalitesine otomatik yükseltilmiş halde izleyin.\r\nDaha iyi bağlantı\r\nSorunsuzca bağlanın ve oyun dünyalarınızı paylaşın.', 0),
(41, 'Asus X542UR-GQ029T', 'Asus', 20, 'Computer', 'https://productimages.hepsiburada.net/s/6/768/9747790299186.jpg', 3199, 0, '10/100 Ethernet	Var\r\nBellek Hızı	2133 MHz\r\nBellek Yuvası	2\r\nBluetooth Özelliği	Var\r\nBoyutlar	251 x 232 x 38 mm\r\nCihaz Ağırlığı	2 - 4 kg\r\nDokunmatik Ekran	Yok\r\nEkran Boyutu	15,6 inç\r\nEkran Kartı Bellek Tipi	GDDR5\r\nEkran Kartı Hafızası	2 GB\r\nEkran Kartı İşlemcisi	Nvidia GeForce\r\nEkran Kartı Tipi	Harici Ekran Kartı\r\nEkran Kartı	Nvidia GeForce 930MX', 0),
(42, 'HP 14-BS006NT Intel Celeron N3060', 'HP', 20, 'Computer', 'https://productimages.hepsiburada.net/s/19/768/9841392287794.jpg', 999, 0, 'HP 14-BS006NT Intel Celeron N3060 4GB 500GB Freedos 14\" Taşınabilir Bilgisayar 2BS99EA\r\nHP Notebook 14-bs006nt \r\nPerformans\r\n\r\nİşletim Sistemi\r\n\r\nFreeDOS 2.0\r\n\r\nIşlemci\r\n\r\nIntel® Celeron® N3060 (1,6 GHz taban frekansı, 2,48 GHz\'e kadar patlama frekansı, 2\r\n\r\nMB önbellek, 2 çekirdekli)6,7\r\n\r\nİşlemci ailesi: Intel® Celeron® işlemci\r\n\r\nBellek\r\n\r\n4 GB DDR3L-1600 SDRAM (1 x 4 GB)\r\n\r\nBilgi Depolama\r\n\r\n500 GB 5400 rpm SATA\r\n\r\nGrafik\r\n\r\nTümleşik Intel® HD Grafik Kartı 400\r\n\r\nSes\r\n\r\nÇift hoparlör\r\n\r\nEkran\r\n\r\n35,6 cm (14\") diyagonal HD SVA yansımasız WLED arkadan aydınlatmalı (1366 x 768)\r\n\r\nGüç\r\n\r\n45 W AC güç adaptörü\r\n\r\nPil Tipi\r\n\r\n4 hücreli, 41 WHr Lityum iyon\r\n\r\nKullanıcı tarafından değiştirilebilir pil\r\n\r\nHızlı pil şarj etmeyi destekler: 90 dakikada yaklaşık %905\r\n\r\nHedef pil ömrü\r\n\r\n12 saat 30 dakikaya varan tahmini pil ömrü3\r\n\r\nVideo yürütme için maksimum pil ömrü\r\n\r\n9 saat 30 dakikaya kadar3\r\n\r\n_ Bağlanabilirlik\r\n\r\nAğ arabirimi\r\n\r\nTümleşik 10/100/1000 GbE LAN\r\n\r\nKablosuz bağlantı\r\n\r\nIntel® 802.11b/g/n/ac (1x1) Wi-Fi® ve Bluetooth® 4.2 Birleşimi (Miracast uyumlu)\r\n\r\nBağlantı Noktaları\r\n\r\n2 USB 3.1 Gen 1 (Yalnızca veri aktarımı); 1 USB 2.0; 1 HDMI; 1 VGA; 1 RJ-45; 1 birleşik\r\n\r\nkulaklık/mikrofon\r\n\r\n1 multi-format SD ortam kartı okuyucusu\r\n\r\nWeb kamerası\r\n\r\nTümleşik dijital mikrofonlu HP Web Kamerası\r\n', 1),
(43, 'Apple MacBook Pro Intel Core i5 8GB', 'Apple', 20, 'Computer', 'https://productimages.hepsiburada.net/s/6/768/9706653319218.jpg', 5274, 0, 'Apple MacBook Pro Intel Core i5 8GB 128GB SSD MacOs Sierra 13.3\" Taşınabilir Bilgisayar MPXR2TU A - Silver\r\nÖzellik Adı Özellik Değeri\r\nBellek 8GB\r\nBluetooth usb\r\nİşlemci Hızı 2.3GHz\r\nİşlemci Tipi i5\r\nLCD Ekran 13 inç DC\r\nMarka APPLE\r\nRenk Gümüş\r\nSabit Disk 128GB PCIe SSD\r\nÜrün Ailesi MacBook Pro\r\nÜrün Kodu MPXR2TU/A\r\nYazılım Mac', 0),
(44, 'Apple iPhone X 64 GB (Apple Türkiye Garantili)', 'Apple', 21, 'Telephone', 'https://productimages.hepsiburada.net/s/6/768/9713620156466.jpg', 5359, 0, 'iPhone X\r\nBu ürün Apple Türkiye Firmasının Garantisi altındadır. “Apple Türkiye Garantili” ürünlerde 2 yıl süresince, Türkiye geneline yayılmış KVK , Teleservis ve diğer tüm Apple yetkili servislerinden garanti kapsamı dahilinde ücretsiz faydalanabilirsiniz. 2 yıl sonrasında ise, Apple yetkili servislerinden ücretli bir şekilde faydalanmaya devam edebilirsiniz. Telefonunuzda oluşan herhangi bir arıza durumunda tüm AppleTürkiye servis noktalarından hizmet alabilirsiniz. Apple Türkiye yetkili servis bilgilerine Apple Müşteri Hizmetleri üzerinden veya aşağıda yer alan adresten ulaşabilirsiniz. \r\nhttps://support.apple.com/tr-tr/repair', 0),
(45, 'Samsung Galaxy S9 Plus 64 GB', 'Samsung', 21, 'Telephone', 'https://productimages.hepsiburada.net/s/18/768/9802309959730.jpg', 5199, 0, 'Samsung Galaxy S9 Plus !\r\nBu ürün Samsung Türkiye Firmasının Garantisi altındadır. “Samsung Türkiye Garantili” ürünlerde 2 yıl süresince, Türkiye geneline yayılmış KVK , Teleservis ve diğer tüm Samsung yetkili servislerinden garanti kapsamı dahilinde ücretsiz faydalanabilirsiniz. 2 yıl sonrasında ise, Samsung yetkili servislerinden ücretli bir şekilde faydalanmaya devam edebilirsiniz.Telefonunuzda oluşan herhangi bir arıza durumunda tüm Samsung Türkiye servis noktalarından hizmet alabilirsiniz. Samsung Türkiye yetkili servis bilgilerine Samsung Müşteri Hizmetleri üzerinden veya aşağıda yer alan adresten ulaşabilirsiniz. https://www.samsung.com/tr/support/servicelocation/', 1),
(46, 'Samsung Galaxy J7 Prime', 'Samsung', 21, 'Telephone', 'https://productimages.hepsiburada.net/s/1/768/9489589469234.jpg', 1249, 0, 'Samsung Galaxy J7 Prime ile Tanışın!\r\nSamsung Galaxy J7 Prime; coğrafi konum etiketleme, elle odaklama, HDR, otomatik odaklama, panorama ve seri çekim (Burst) gibi çok sayıda özellikle güçlendirilen F1.9 diyafram açıklığına ve 28 mm odak uzaklığına sahip 13 MP çözünürlükteki arka kamerayla geliyor. 1920x1080 piksel çözünürlüğündeki videoları 30 FPS hızında kaydedebilen arka kamera, gece çekimlerinde etkili olan LED flaşla daha başarılı kareleri yakalayabiliyor. Özçekimlerde ya da videolu görüşmelerde kullanılabilecek F1.9 diyafram açıklığına sahip 5 MP’lik ön kamera, 1920x1080 piksel çözünürlüğünde olan videoları, yüksek bitrate oranıyla 30 FPS hızında kaydedebiliyor. LED flaşla desteklenen ön kamera, 120 derece açılı panorama özçekim ve 85 derece açılı özçekimler gerçekleştirebilirken, Gesture Shot yeteneğiyle de göz dolduruyor. Android Beam, ANT+, S Finder, S Health, Wi-Fi Direct, Bluetooth 4.1 gibi donanım ve yazılım yetenekleriyle öne çıkan Samsung Galaxy J7 Prime, OTG desteği ile depolama birimlerinden klavye ve fare gibi donanımlara kadar pek çok ürünün telefonla birlikte kullanılabilmesine imkan tanıyor. Samsung Galaxy J7 Prime fiyatı ile de ulaşılabilir olurken özellikle Android dünyasına adım atacak kullanıcılar için uygunluk sunuyor. Samsung’un özel olarak geliştirdiği yazılımlarla daha da zenginleşen ürün, kullanıcı dostu arayüzü sayesinde Android’le yeni tanışacak olanlara da kolaylık sağlıyor. Bütçesine göre akıllı cep telefonu edinecek kullanıcılar için ideal yapıdaki Samsung Galaxy J7 Prime, Samsung’un donanım ve yazılım olanaklarından yararlanmak için ideal fırsatlardan biri haline geliyor.\r\n', 0),
(47, 'Sony Playstation 4 Slim 500 GB', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/6/768/9718384197682.jpg', 1299, 0, '\r\nSony Playstation 4 Slim 500 GB Oyun Konsolu-Türkçe Menü\r\nSony Playstation 4 Slim 500 GB\r\n\r\nHer zaman oyuncuları düşünen, olağanüstü oyun gücüne sahip, daha zarif ve daha küçük PS4 deneyimini yaşamanız için Sony Playstation 4 Slim kasa oyun konsolu yeniden tasarlandı. Yepyeni görünümüyle artık daha ince olan PS4, nefes kesen HDR görsellerle olağanüstü canlı ve parlak görüntü ve renk kalitesini yaşamanız için imkan sağlıyor. \r\n\r\nSony Playstation 4 Slim, orijinal PS4 modelinden %30 daha ince ve %16 daha hafiftir. İlk PS4’ün aksine yuvarlatılmış kenarları ve mat görünümüyle daha zariftir. PS4 Slim 26.5cm genişliğinde x 3.9cm yüksekliğinde x 28.8cm derinliğindeki küçük boyutuyla oldukça az bir alan kaplar. Yuvarlak kenarlarıyla beraber, karşınızda küçük ve kompakt bir cihaz bulunmaktadır. \r\n500 GB seçeneği ile oyunlarınız, uygulamalarınız, ekran görüntüleriniz ve videolarınız için depolama alanı sağlar.\r\n\r\nEn iyi televizyon programları, filmler ve diğer içerikler favori eğlence uygulamalarınızda sizi bekliyor. \r\n\r\nYeni Playstation 4’te rakipsiz kontrol DUALSHOCK 4 yenilenerek yepyeni bir görünüme ve hisse kavuştu. Daha görünür hale gelen renkli ışıklı çubuk, oyunları daha iyi kontrol etmenizi sağlar. Diğer modellere göre daha büyük olan bu yeni nesil kumanda sunduğu daha fazla kontrol seçeneği ile hareket özgürlüğünüzü artırır. Kumandanın üzerinde hoparlör, mikrofon ve kulaklık bağlamanıza yardımcı olacak bir port yer almaktadır. Böylece hem hareket kabiliyetinizi sınırlamadan hem de kimseyi rahatsız etmeden oyun keyfinizi sürdürebilirsiniz. \r\nYine kumandanın üzerinde, analog çubuklarının üstündeki bölgeye konumlandırılmış, dokunmaya duyarlı bir izleme dörtgeni bulunmaktadır. Böylece başparmaklarınız yardımıyla hem analog çubukları hem de izleme dörtgenini rahatça kullanabilirsiniz. \r\nAyrıca bu yeni tasarımda da analog çubuklarını görmeye devam ediyoruz ancak bu kez boyları daha kısa ve daha sağlam yapıda. Bu sayede oyun esnasında kontrolünüzü daha rahat sağlayabilirsiniz.', 1),
(50, 'Sony Playstation 4 Slim 1 Tb', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/3/768/9612441092146.jpg', 1998, 0, 'Sony Playstation 4 Pro 1 Tb ( Ps4 Pro )-Türkçe Menü\r\nSONY PLAYSTATİON 4 PRO \r\nKarşınızda süper güçlü PS4. Dünyanın en güçlü konsolu.\r\nDinamik 4K oyun ve 4K eğlence deneyimi\r\nYoğun ve gerçekçi oyun deneyimi, olağanüstü net videolar ve her anında inanılmaz ayrıntı seviyesi.\r\nSüper Güç\r\nPS4 Pro; bugüne kadar karşılaştığınız en hızlı, en net ve en yüksek tepki hızına sahip oyun deneyimlerini sunmak için rakipsiz teknoloji ile gelmektedir*.\r\nDünyanın en güçlü konsolu Standart PS4\'e kıyasla iki kat güçlü GPU sayesinde oyunlar, yoğun grafikler ve inanılmaz gerçekçi ayrıntılarla hayat bulur.\r\nDaha yüksek kare hızı\r\nDaha yüksek ve daha istikrarlı kare hızları sayesinde kristal netliğinde hareketlerle aksiyonlar daha hızlı, daha akıcı ve daha heyecanlı hale gelir.\r\nDinamik 4K oyun deneyimi\r\nEn yeni oyunları dinamik 4K* ile muhteşem netlikte oynayın; ten renkleri daha sıcak hale gelir, oyun içi öğeler gerçekçi dokulara sahip olur ve oyun ortamları hiç olmadığı kadar canlanır.\r\nHDR teknolojisi\r\nBir HDR TV sayesinde PS4 oyunları* çarpıcı ölçüde canlı ve gerçekçi renkler sunarak maceralarınıza inanılmaz canlılıkta hayat verir.\r\nThe Last of Us Remastered, Uncharted 4: Bir Hırsızın Sonu ve inFAMOUS First Light ile PS4 ve PS4 Pro sistemlerinde HDR oyun deneyimini yaşayın.\r\nİnanılmaz eğlence deneyimi\r\nNetflix, YouTube ve pek yakında kullanıma sunulacak eğlence uygulamaları üzerinden en iyi filmlerin, en sevilen TV programlarının ve en yeni videoların 4K etkileyici çözünürlükle* akışını gerçekleştirin. Üstelik hepsini mümkün olan en net görüntü kalitesine otomatik yükseltilmiş halde izleyin.\r\nDaha iyi bağlantı\r\nSorunsuzca bağlanın ve oyun dünyalarınızı paylaşın.', 0),
(51, 'Sony Playstation 2', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/3/768/9612441092146.jpg', 1998, 0, 'Sony Playstation 4 Pro 1 Tb ( Ps4 Pro )-Türkçe Menü\r\nSONY PLAYSTATİON 4 PRO \r\nKarşınızda süper güçlü PS4. Dünyanın en güçlü konsolu.\r\nDinamik 4K oyun ve 4K eğlence deneyimi\r\nYoğun ve gerçekçi oyun deneyimi, olağanüstü net videolar ve her anında inanılmaz ayrıntı seviyesi.\r\nSüper Güç\r\nPS4 Pro; bugüne kadar karşılaştığınız en hızlı, en net ve en yüksek tepki hızına sahip oyun deneyimlerini sunmak için rakipsiz teknoloji ile gelmektedir*.\r\nDünyanın en güçlü konsolu Standart PS4\'e kıyasla iki kat güçlü GPU sayesinde oyunlar, yoğun grafikler ve inanılmaz gerçekçi ayrıntılarla hayat bulur.\r\nDaha yüksek kare hızı\r\nDaha yüksek ve daha istikrarlı kare hızları sayesinde kristal netliğinde hareketlerle aksiyonlar daha hızlı, daha akıcı ve daha heyecanlı hale gelir.\r\nDinamik 4K oyun deneyimi\r\nEn yeni oyunları dinamik 4K* ile muhteşem netlikte oynayın; ten renkleri daha sıcak hale gelir, oyun içi öğeler gerçekçi dokulara sahip olur ve oyun ortamları hiç olmadığı kadar canlanır.\r\nHDR teknolojisi\r\nBir HDR TV sayesinde PS4 oyunları* çarpıcı ölçüde canlı ve gerçekçi renkler sunarak maceralarınıza inanılmaz canlılıkta hayat verir.\r\nThe Last of Us Remastered, Uncharted 4: Bir Hırsızın Sonu ve inFAMOUS First Light ile PS4 ve PS4 Pro sistemlerinde HDR oyun deneyimini yaşayın.\r\nİnanılmaz eğlence deneyimi\r\nNetflix, YouTube ve pek yakında kullanıma sunulacak eğlence uygulamaları üzerinden en iyi filmlerin, en sevilen TV programlarının ve en yeni videoların 4K etkileyici çözünürlükle* akışını gerçekleştirin. Üstelik hepsini mümkün olan en net görüntü kalitesine otomatik yükseltilmiş halde izleyin.\r\nDaha iyi bağlantı\r\nSorunsuzca bağlanın ve oyun dünyalarınızı paylaşın.', 0),
(52, 'Sony Playstation 4 Pro Special Edition', 'Sony', 22, 'Games', 'https://productimages.hepsiburada.net/s/3/768/9612441092146.jpg', 1998, 0, 'Sony Playstation 4 Pro 1 Tb ( Ps4 Pro )-Türkçe Menü\r\nSONY PLAYSTATİON 4 PRO \r\nKarşınızda süper güçlü PS4. Dünyanın en güçlü konsolu.\r\nDinamik 4K oyun ve 4K eğlence deneyimi\r\nYoğun ve gerçekçi oyun deneyimi, olağanüstü net videolar ve her anında inanılmaz ayrıntı seviyesi.\r\nSüper Güç\r\nPS4 Pro; bugüne kadar karşılaştığınız en hızlı, en net ve en yüksek tepki hızına sahip oyun deneyimlerini sunmak için rakipsiz teknoloji ile gelmektedir*.\r\nDünyanın en güçlü konsolu Standart PS4\'e kıyasla iki kat güçlü GPU sayesinde oyunlar, yoğun grafikler ve inanılmaz gerçekçi ayrıntılarla hayat bulur.\r\nDaha yüksek kare hızı\r\nDaha yüksek ve daha istikrarlı kare hızları sayesinde kristal netliğinde hareketlerle aksiyonlar daha hızlı, daha akıcı ve daha heyecanlı hale gelir.\r\nDinamik 4K oyun deneyimi\r\nEn yeni oyunları dinamik 4K* ile muhteşem netlikte oynayın; ten renkleri daha sıcak hale gelir, oyun içi öğeler gerçekçi dokulara sahip olur ve oyun ortamları hiç olmadığı kadar canlanır.\r\nHDR teknolojisi\r\nBir HDR TV sayesinde PS4 oyunları* çarpıcı ölçüde canlı ve gerçekçi renkler sunarak maceralarınıza inanılmaz canlılıkta hayat verir.\r\nThe Last of Us Remastered, Uncharted 4: Bir Hırsızın Sonu ve inFAMOUS First Light ile PS4 ve PS4 Pro sistemlerinde HDR oyun deneyimini yaşayın.\r\nİnanılmaz eğlence deneyimi\r\nNetflix, YouTube ve pek yakında kullanıma sunulacak eğlence uygulamaları üzerinden en iyi filmlerin, en sevilen TV programlarının ve en yeni videoların 4K etkileyici çözünürlükle* akışını gerçekleştirin. Üstelik hepsini mümkün olan en net görüntü kalitesine otomatik yükseltilmiş halde izleyin.\r\nDaha iyi bağlantı\r\nSorunsuzca bağlanın ve oyun dünyalarınızı paylaşın.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `x5` int(11) NOT NULL DEFAULT '0',
  `x4` int(11) NOT NULL DEFAULT '0',
  `x3` int(11) NOT NULL DEFAULT '0',
  `x2` int(11) NOT NULL DEFAULT '0',
  `x1` int(11) NOT NULL DEFAULT '0',
  `proid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`x5`, `x4`, `x3`, `x2`, `x1`, `proid`) VALUES
(3, 5, 1, 0, 9, 39),
(1, 0, 1, 0, 0, 23),
(0, 0, 0, 0, 0, 24),
(0, 0, 0, 0, 0, 25),
(4, 0, 0, 2, 0, 11),
(0, 0, 0, 0, 0, 37),
(3, 0, 0, 0, 1, 36),
(1, 0, 0, 0, 0, 27),
(1, 0, 0, 0, 1, 26),
(0, 0, 0, 0, 0, 22),
(0, 0, 0, 0, 0, 40),
(0, 0, 0, 0, 0, 41),
(0, 0, 0, 0, 0, 42),
(0, 0, 0, 0, 0, 43),
(1, 0, 0, 0, 0, 44),
(0, 0, 0, 0, 0, 47);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autologin` varchar(255) DEFAULT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `fullname`, `address`, `date`, `autologin`, `role`) VALUES
('mail@me.com', '$2y$10$TlzMF/Pl80YStBoPO168GeLsYB.pXxJsTJVjBuifOFaz66bzImC9q', 'Cagatay O', 'Seyitnizam mah. Gümüşsuyu Davutpaşa cad. no:17/1 34015 Zeytinburnu/İstanbul', '2018-05-16 22:16:05', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
