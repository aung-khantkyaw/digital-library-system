-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2024 at 01:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digital_library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` text NOT NULL,
  `author_profile` varchar(255) NOT NULL,
  `author_Biography` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_profile`, `author_Biography`) VALUES
(1, 'တက္ကသိုလ်ဘုန်းနိုင်', 'Tekkatho_Phone_Naing.jpg', 'တက္ကသိုလ် ဘုန်းနိုင် (၁၉၃ဝ-၂ဝဝ၂) သည် မြန်မာနိုင်ငံသား တက္ကသိုလ် ပါမောက္ခ/ပါမောက္ခချုပ် တစ်ဦး အဖြစ်တာဝန်ထမ်းဆောင်ခဲ့သူ ဖြစ်ပြီး အမျိုးသား စာပေဆုရ စာရေးဆရာ၊ ဇာတ်ညွှန်းရေးဆရာ၊ တေးရေးဆရာလည်း ဖြစ်ခဲ့သည်။စာပေနယ်သို့ ရှုမဝ မဂ္ဂဇင်း ပါ \"ဒွိဟ\" ကဗျာဖြင့် ၁၉၄၉ ခုနှစ်တွင် စတင် ဝင်ရောက် ခဲ့သည်။ ထင်ရှားသည့် လုံးချင်း ဝတ္ထုရှည်အချို့မှာ၊ ညီမလေးရယ် စိုးရိမ်မိတယ် (၁၉၅၈)၊ သူ့ကျွန်မခံပြီ (၁၉၅၉)၊ လွမ်း (၁၉၆၂)၊ မိုးည အိပ်မက်မြူ (၁၉၆၂)၊ ဤမြေမှသည် (၁၉၆၃)၊ စိမ်းနေဦးမည့် ကျွန်တော့်မြေ (၁၉၆၃)၊ မောင့်ဘဝ ညအလားကွယ် (၁၉၆၃)၊ သူငယ်ချင်းလို့ပဲ ဆက်၍ခေါ်မည် ခိုင် (၁၉၆၄)၊ ချစ်သော ဤကမ္ဘာ (၁၉၆၄)၊ လွမ်းတေး မဆုံးစေနှင့် စောသခင် (၁၉၆၅)၊ ကမ္ဘာကုန် ကျယ်သရွေ့ဝယ် (၁၉၆၆)၊ နွေကန္တာဦး (၁၉၆၈)၊ ဝသန် လေချိန်မှန်ကူး (၁၉၆၉)၊ တပြည်သူ မရွှေထား (၁၉၇၁)၊ နှင်းငွေ့တထောင့် မိုးတမှောင့် (၁၉၇၂)၊ ကိုယ့်အလှ ဘဝငွေလမင်း (၁၉၇၆)၊ စွန့်ခွာရသည့် နွေညများ (၁၉၈ဝ)၊ မိုးတွေ ရွာမှဖြင့် လျှင်ကွယ် (၁၉၈၄)၊ တိမ်ညိုအလွင့် လအမြင့် (၁၉၉ဝ)၊ ချစ်သူအိမ်အမိုး နောက်ဝယ် လပျောက်ခဲ့ခြင်း (၁၉၉၁)၊ မျက်ရည် လောကများ၏ ဟိုမှာဘက် (၁၉၉၂)၊ လေရူးသည် စာမတတ်ပါ (၁၉၉၅)စသည်တို့ ဖြစ်ကြသည်။ ထင်ရှားသည့် မဂ္ဂဇင်း ဝတ္ထုရှည် (novelette) များမှာ နှင်းရွက်ကြွေစော (၁၉၅၈)၊ မုန်းရစ်လေဦး (၁၉၅၈)၊ ရေပင်လယ်နှင် ငွေစင်ကြယ် (၁၉၅၈)၊ တန်ခူးလေနှင့် လျောတော့သည် (၁၉၆၁)၊ ပိတောက်နှင့် ကြိုပါမည် မာရီယာ (၁၉၆၃)၊ ကရုဏာ မိခင် (၁၉၆၃) တို့ ဖြစ်ကြသည်။ ဝတ္ထုတို အများ ကိုလည်း ရေးသားခဲ့ရာ ယင်းတို့ကို ပြန်လည် တင်ပြသည် (၁၉၆၅)၊ ဝတ္ထုတို ပေါင်းချုပ် အမှတ် ၁၊ ၂၊ ၃ (၁၉၆၉)၊ ဝိညာဉ်မှာ ဖူးသည့် ကြည်နူးမှု အလှပန်း (၁၉၉၃)၊ ကျွန်တော့် ဘဝ ပိတောက်ကမ္ဘာ (၁၉၉၃) စသည်ဖြင့် စုစည်း ခဲ့သည်။ စာပေ အနုပညာ ဆိုင်ရာ ကျမ်းများမှာ ဘုန်းနိုင့် အတွေး ဘုန်းနိုင့် အမြင် (၁၉၇၇)၊ ခမ်သိမ်းကလျာ ရှုဖွယ်သာတည်း ပထမတွဲ၊ ဒုတိယတွဲ (၁၉၉၄) တို့ ဖြစ်ကြသည်။ အင်္ဂလိပ် - မြန်မာ နှစ်ဘာသာ ဘာသာပြန် ကဗျာ စာအုပ် များမှာ ရှားလော့ဒေဝီ (၁၉၉၆)၊ တမ်းတမိခြင်း (၁၉၉၇) တို့ ဖြစ်ကြသည်။\r\n\r\nနိုင်ငံခြား ဘာသာသို့ ပြန်ဆို ထုတ်ဝေ ခဲ့သည့် စာအုပ်များမှာ ရုရှား ဘာသာဖြင့် \'သူ့ကျွန်မခံပြီ\' (၁၉၇ဝ)၊ တရုတ် ဘာသာဖြင့် \'စွန့်ခွာရသည့် နွေညများ\' (၁၉၈၈)၊ ဟင်ဒီ ဘာသာဖြင့် \'သူငယ်ချင်းလို့ပဲ ဆက်၍ခေါ်မည် ခိုင်\' (၁၉၉၄) တို့ ဖြစ်ကြသည်။ \'နှင်းငွေ့ တထောင့် မိုးတမှောင့်\' ဖြင့် ၁၉၇၂ ခုနှစ်တွင် အမျိုးသား စာပေဆု ရရှိခဲ့သည်။'),
(2, 'သော်တာ‌‌ဆွေ', 'thawdarswe.jpg', ' စာရေးဆရာကြီး သော်တာဆွေကို ၁၉၁၉ ခုနှစ် မေလ ၂၆ရက် တနင်္လာနေ့တွင် ပေါင်းတည်မြို့ အလယ်ပိုင်း ကြို့ပင်ရွာနေ အဖ လယ်သမားကြီး ဦးဖိုးဆယ် အမိ ဒေါ်လှရင်တို့က ဖွားမြင်သည်။ မွေးချင်း ၈ ယောက်တွင် တတိယမြောက် ဖြစ်သည်။ ဇာတာအမည်မှာ မောင်ချစ်လှိုင် ဖြစ်ပြီး ငယ်မည်မှာ ဘိုနီ ဖြစ်သည်။ ကျောင်းနေရွယ် ကျောင်းအပ်သောအခါ မောင်ကျင်မောင် ဟူသောအမည်ဖြင့်ဖြစ်ပြီး ကြီးပြင်းလာသောအခါ မောင်ကြင်ဆွေဟု အမည်တွင်သည်။\r\n\r\n၁၉၂၆ ခုနှစ် ၇ နှစ်သား အရွယ်တွင် ကြို့ပင်ရွာ ဘုန်းတော်ကြီးကျောင်းတွင် ဖွင့်လှစ်သည့် မြန်မာစာသက်သက်သင်သော လောကဓာတ်ကျောင်းတွင် ပညာစသင်ခဲ့ရသည်။ ၁၄ နှစ်သားအရွယ်တွင် ကြို့ပင်ရွာ ဘုန်းကြီးကျောင်းတွင်ဖွင့်သည့် အထက်တန်းကျောင်းသို့ ပြောင်းရွှေ့ ပညာသင်ကာ ၁၉၃၈ ခုနှစ်တွင် မြန်မာစာ ၁၀ တန်းအောင်ခဲ့သည်။\r\n\r\nရန်ကုန်မြို့ ကြည့်မြင်တိုင် ဆရာဖြစ်သင်ကျောင်းတွင် ပညာဆက်လက် သင်ယူကာ ဆရာဖြစ်သင်တန်းအောင်မြင်ခဲ့သည်။ ၁၉၃၉ ခုနှစ်တွင် ထိုခေတ်က ဟိုက်ယားဂရိတ် ခေါ် အထက်တန်း မြန်မာစာ ဆရာဖြစ် သင်တန်းအောင်ခဲ့ပြီး စမ်းချောင်း မအူပင်လမ်းရှိ ဒေါ်မမ၏ ခေတ်အင်္ဂလိပ်စာ အလွတ်ပညာသင်ကျောင်းတွင် ဆက်လက်တက်ရောက်ခဲ့သည်။ ထိုကျောင်းတွင် မောင်ကြင်ဆွေဟု အမည်ပြောင်းလိုက်သည်။ နှစ်⁠နှစ်မျှ အင်္ဂလိပ်စာ သင်ကြားခဲ့ရသည်။'),
(3, 'မင်းလူ', 'minlu.jpg', 'မင်းလူကို စာရေးဆရာ ရုပ်ရှင် ဒါရိုက်တာ ဦးသာဓု၊ ကျောင်းအုပ် ဆရာမကြီး ဒေါ်ခင်ညို တို့မှ ရန်ကုန်မြို့ အမှတ် (၁၄၇) (၄၇)လမ်းတွင် မေ ၁၈ ရက်နေ့ ၁၉၅၄ ခုနှစ်၌ မွေးဖွားခဲ့သည်။ မွေးချင်းလေးယောက်အနက် အငယ်ဆုံး ဖြစ်သည်။ အမည်ရင်းမှာ မောင်ဉာဏ်ပေါ် ဖြစ်သည်။\r\n\r\n\r\n၁၉၅၉ ခုနှစ်မှ ၁၉၆၈ ခုနှစ် အထိ စိန်ပေါ အထက်တန်းကျောင်း (နောင် အထက (၆)၊ ဗိုလ်တထောင်) ၌ ပညာသင်ကြားခဲ့သည်။ ၁၉၆၈ မှ ၁၉၇၂ အထိ အထက (၁) သင်္ကန်းကျွန်းကျောင်းသို့ ပြောင်းရွှေ့ ပညာသင်ကြားခဲ့ပြီး အခြေခံပညာ အထက်တန်း အောင်မြင်ခဲ့သည်။ ကျောင်းသားဘဝတွင် စာပေ ဖွံ့ဖြိုး တိုးတက်ရေး အဖွဲ့ အတွင်းရေးမှူးနှင့် သိပ္ပံပညာအသင်း တွဲဖက်အတွင်းရေးမှူးအဖြစ် ဆောင်ရွက် ခဲ့သည်။\r\n\r\n\r\n၁၉၇၂ ခုနှစ်မှ ၁၉၇၇ ခုနှစ်ထိ ရန်ကုန် တက္ကသိုလ်တွင် တက်ရောက် သင်ကြားပြီး ဝိဇ္ဇာဘွဲ့ (ဒဿနိကဗေဒ) ကို ရရှိခဲ့သည်။ တက္ကသိုလ် နံရံကပ် စာစောင်နှင့် နှစ်ပတ်လည် မဂ္ဂဇင်း တို့တွင် တောကျောင်း ဘုန်းကြီး အမည်ဖြင့် ကဗျာများရေးသားခဲ့သည်။ '),
(4, 'မိုးမိုး (အင်းလျား)', 'momoinya.jpg', 'စာရေးဆရာမ မိုးမိုး (အင်းလျား) ကို ၁၉၄၄ ခုနှစ်၊ အောက်တိုဘာလတွင် အဖ ဦးထွန်း၊ အမိ ဒေါ်မြရှင်တို့မှ ပဲခူးတိုင်းဒေသကြီ:၊ ဒိုက်ဦးမြို့တွင် ဖွားမြင်သည်။ ၁၉၅၂ ခုနှစ်တွင် ဒိုက်ဦးမြို့ အစိုးရအထက်တန်းကျောင်းတွင် စတင်ပညာသင်ကြားသည်။ သတ္တမတန်းကျောင်းသူဘဝတွင် ကဗျာများ စတင်ရေးသားသည်။ ကျောင်းစာကြည့်တိုက်နှင့် နံရံကပ်စာစောင်ကော်မတီများတွင် အမှုဆောင်အဖြစ် ဆောင်ရွက်ခဲ့သည်။ အထက်တန်းကျောင်းသူဘဝတွင် ခရိုင်အလိုက် စာစီစာကုံးပြိုင်ပွဲများတွင် ဆုရရှိခဲ့သည်။\r\n\r\nတက္ကသိုလ်ဝင်တန်း အောင်မြင်ပြီးနောက် ၁၉၆၅ ခုနှစ်တွင် ရန်ကုန်ရှိ ဝိဇ္ဇာနှင့်သိပ္ပံတက္ကသိုလ်တွင် သင်္ချာအဓိကဖြင့် တက်ရောက်သင်ကြားသည်။ နေထိုင်ရာ အဆောင်အမည်ကို အစွဲပြု၍ မိုးမိုး (အင်းလျား) ဟူသော အမည်ဖြင့် ကဗျာ၊ ဆောင်းပါးများ စတင်ရေးသားသည်။ ၁၉၆၅ ခုနှစ်၊ မတ်လတွင် တိုင်းရင်းမေဂျာနယ်၌ \'ရွက်လှပန်းလေးကိုယ့်ဘဝ\' ကဗျာဖြင့် စာပေနယ်သို့ စတင်ဝင်ရောက်သည်။'),
(5, 'ရွှေဥဒေါင်း', 'shweoo.jpg', 'ရွှေဥဒေါင်း (၁၈၈၉- ၁၉၇၃) သည် မြန်မာနိုင်ငံသား စာရေးဆရာ ဖြစ်ပြီး ကျောင်းဆရာ၊ သစ်တောစာရေး၊ တောလိုက်စာရေး၊ မဂ္ဂဇင်းအယ်ဒီတာ၊ သတင်းစာအယ်ဒီတာချုပ်အဖြစ် ကျင်လည်ခဲ့သည်။ ပင်ကိုရေး၊ အမှီးနှင့် ဘာသာပြန်ဝတ္ထုတိုရှည်များ၊ ဗုဒ္ဓဝါဒ၊ တွေးခေါ်မြော်မြင်ရေး၊ အတ္ထုပ္ပတ္တိစာအုပ်များ ရေးသားခဲ့သည်။ အထူးသဖြင့် စုံထောင်မောင်စံရှား အမှီးဝတ္ထုများ၊ တစ်သက်တာမှတ်တမ်းနှင့် အတွေးအခေါ်များ၊ ဒိဋ္ဌေဒိဋ္ဌမတ္တံ လက်တွေ့ကျင့်စဉ် စာအုပ်များမှာ ထင်ရှားသည်။ မြန်မာစာပေနယ်တွင် အမှီးဝတ္ထုပုံစံကို ထူးချွန်ပြောင်မြောက်စွာ တိုးချဲ့ဆန်းသစ်ခဲ့သည်။ ရရှိခဲ့သည့် စာပေဗိမာန်ဆုများမှာ မျှော်တလင့်လင့်ဖြင့် ၁၉၅၂ ခု ဘာသာပြန်ဆု၊ သွေးစုပ်မြေဖြင့် ၁၉၅၅ခု ဘာသာပြန်ဆု၊ တစ်သက်တာမှတ်တမ်းနှင့် အတွေးအခေါ်များဖြင့် ၁၉၆၁ ခုနစ်တွင် သုတပဒေသာဆုများ ရရှိခဲ့သည်။');

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `book_id` int(11) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `genre_id` varchar(255) NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `publisher_id` varchar(255) NOT NULL,
  `publish_date` date NOT NULL,
  `url` varchar(255) NOT NULL,
  `registration_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`book_id`, `ISBN`, `title`, `cover`, `genre_id`, `author_id`, `publisher_id`, `publish_date`, `url`, `registration_date`) VALUES
(1, '956201817339', 'ညီမလေးကအချစ်ကိုကိုးကွယ်သတဲ့လား', 'nyimalayka.png', '1', '4', '3', '2009-03-31', 'မိုးမိုးအင်းလျား_ညီမ‌ေလးကအချစ်ကိုကိုးကွယ်သတဲ့လား.pdf', '22/08/24'),
(2, '1', 'ပျောက်သောလမ်းမှာစမ်းတဝါး', 'missingway.png', '1', '4', '1', '1989-07-09', 'မိုးမိုးအင်းလျား_ပျောက်သောလမ်းမှာစမ်းတဝါး.pdf', '24/08/24'),
(3, 'K0328', 'သူငယ်ချင်းလို့ပဲဆက်၍ခေါ်မည်ခိုင်', 'KKWY-012.jpg', '1', '1', '3', '2023-01-19', 'သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်.pdf', '25/08/24'),
(4, 'K0032', 'သူ့ကျွန်မခံပြီ', 'KKWY-031.jpg', '8', '1', '3', '2024-05-19', 'သူ့ကျွန်မခံပြီ.pdf', '25/08/24'),
(5, '-', 'သူငယ်ချင်းတစ်ယောက်အကြောင်း', 'a-friend-1-600x600.png', '2', '3', '5', '2017-05-27', 'သူငယ်ချင်းတစ်ယောက်အကြောင်း_မင်းလူ.pdf', '25/08/24'),
(6, '-', ' ပြန်ခေါ်သက်သေ', 'Pyan-Khaw-That-thay-600x600.png', '1', '3', '3', '2011-04-27', 'မင်းလူ၊_ပြန်ခေါ်သက်သေ.pdf', '26/08/24'),
(7, '-', ' ပန်းကျောင်း', 'Pann-Kyoung-600x600.png', '6', '3', '3', '2019-06-27', 'မင်းလူ၊ပန်းကျောင်း.pdf', '26/08/24'),
(8, '-', 'ကံ့ကော်နီ', 'Kant-Kaw-Ni-600x600.png', '6', '3', '3', '2020-10-27', 'မင်းလူ၊ကံ့ကော်နီ.pdf', '27/08/24'),
(9, '-', 'ကျွန်တော်ကျွန်မတို့သည်', 'kyoun-taw-kyoun-ma-600x600.png', '6', '3', '3', '2022-09-27', 'မင်းလူ၊ကျွန်တော်ကျွန်မတို့သည်.pdf', '27/08/24'),
(10, '-', 'မိညီမ', 'မင်းလူ-600x600.png', '2', '3', '3', '2023-05-27', 'မင်းလူ၊မိညီမ.pdf', '27/08/24');

-- --------------------------------------------------------

--
-- Table structure for table `ebook_borrow`
--

CREATE TABLE `ebook_borrow` (
  `borrow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` text NOT NULL,
  `due_date` text NOT NULL,
  `status` varchar(255) NOT NULL CHECK (`status` in ('Borrowed','Returned'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebook_borrow`
--

INSERT INTO `ebook_borrow` (`borrow_id`, `user_id`, `book_id`, `borrow_date`, `due_date`, `status`) VALUES
(1, 12, 1, '2024-08-25', '2024-08-25', 'Returned'),
(2, 12, 2, '2024-08-27', '2024-09-03', 'Borrowed'),
(3, 12, 3, '2024-08-27', '2024-09-03', 'Borrowed'),
(4, 12, 10, '2024-08-27', '2024-09-03', 'Borrowed'),
(5, 12, 1, '2024-08-27', '2024-09-03', 'Borrowed');

--
-- Triggers `ebook_borrow`
--
DELIMITER $$
CREATE TRIGGER `ebook_return_trigger` BEFORE UPDATE ON `ebook_borrow` FOR EACH ROW BEGIN
    
    IF NEW.due_date < CURDATE() THEN
        
        SET NEW.status = 'Returned';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction (Sci-Fi)'),
(4, 'Fantasy'),
(5, 'Mystery'),
(6, 'Romance'),
(7, 'Thriller'),
(8, 'Historical Fiction'),
(9, 'Biography/Autobiography'),
(10, 'Horror'),
(11, 'Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `physical_book`
--

CREATE TABLE `physical_book` (
  `book_id` int(11) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `genre_id` varchar(255) NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `publisher_id` varchar(255) NOT NULL,
  `publish_date` date NOT NULL,
  `shelf_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL CHECK (`status` in ('Available','Unavailable')),
  `registration_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physical_book`
--

INSERT INTO `physical_book` (`book_id`, `ISBN`, `title`, `cover`, `genre_id`, `author_id`, `publisher_id`, `publish_date`, `shelf_id`, `quantity`, `status`, `registration_date`) VALUES
(1, '956201817339', 'ညီမလေးကအချစ်ကိုကိုးကွယ်သတဲ့လား', 'nyimalayka.png', '1', '4', '1', '2009-03-31', 1, 0, 'Available', '22/08/24'),
(2, '9789998696914', 'သမုဒ္ဒရာခုနှစ်စင်း မြစ်မင်းတစ်ဆယ့်သုံးသွယ်', 'ociean.png', '1', '4', '1', '2021-12-30', 1, 9, 'Available', '22/08/24'),
(3, 'K0328', 'သူငယ်ချင်းလို့ပဲဆက်၍ခေါ်မည်ခိုင်', 'KKWY-012.jpg', '1', '1', '3', '2023-01-19', 1, 9, 'Available', '22/08/24'),
(4, 'K0032', 'သူ့ကျွန်မခံပြီ', 'KKWY-031.jpg', '8', '1', '3', '2024-05-19', 36, 10, 'Available', '22/08/24'),
(5, '1', 'ပျောက်သောလမ်းမှာစမ်းတဝါး', 'missingway.png', '1', '4', '1', '1989-07-09', 1, 10, 'Available', '22/08/24'),
(6, '-', 'လူ့ဘုံခန်းဝါ ဘဝသရုပ်ဖော်ဝတ္ထုတိုများ', 'TTSLuBoneKhan.jpg', '1', '2', '4', '2023-05-19', 1, 10, 'Available', '23/08/24'),
(7, '-', 'တစ်သက်တာမှတ်တမ်းနှင့်အတွေးအခေါ်များ', 'Tathet-Tar-Mhat-Tan-300x300.webp', '9', '5', '4', '2021-11-11', 41, 15, 'Available', '23/08/24'),
(8, '-', ' ဟစ်တလာလုပ်ခဲ့သမျှ', 'Hitler-300x300.png', '9', '5', '4', '2022-02-01', 41, 15, 'Available', '24/08/24'),
(9, '-', ' စုံထောက်၀တ္ထုတိုပေါင်းချုပ်သစ် (ပထမအုပ်)', 'Shwe-Ou-Down-300x300.png', '5', '5', '4', '2020-05-27', 21, 15, 'Available', '24/08/24'),
(10, '-', 'စုံထောက်၀တ္ထုတိုပေါင်းချုပ်သစ် (ဒုတိယအုပ်)', 'Sone-Htouk-withut-300x300.webp', '5', '5', '4', '2021-05-27', 21, 15, 'Available', '24/08/24'),
(11, '-', 'အဘရာဟမ်လင်းကွန်း', 'linn-kon-600x600.png', '9', '5', '4', '2024-06-27', 41, 10, 'Available', '25/08/24'),
(12, '-', 'သူငယ်ချင်းလို့ပဲဆက်၍ခေါ်မည်ခိုင်', 'khaing-600x600.png', '6', '1', '3', '2023-01-27', 26, 15, 'Available', '25/08/24'),
(13, '-', 'သာ၍ဝေးရာဆီကိုပါ', 'သာ၍ဝေးရာ-600x600.png', '1', '1', '3', '2023-06-27', 1, 10, 'Available', '26/08/24'),
(14, '-', 'ကံ့ကော်နီ', 'Kant-Kaw-Ni-600x600.png', '6', '3', '3', '2020-10-27', 26, 15, 'Available', '27/08/24'),
(15, '-', 'သူငယ်ချင်းတစ်ယောက်အကြောင်း', 'a-friend-1-600x600.png', '2', '3', '5', '2017-05-27', 6, 15, 'Available', '27/08/24'),
(16, '-', ' ပြန်ခေါ်သက်သေ', 'Pyan-Khaw-That-thay-600x600.png', '1', '3', '3', '2011-04-27', 1, 10, 'Available', '27/08/24'),
(17, '-', ' ပန်းကျောင်း', 'Pann-Kyoung-600x600.png', '6', '3', '3', '2019-06-27', 26, 15, 'Available', '27/08/24'),
(18, '-', 'ကျွန်တော်ကျွန်မတို့သည်', 'kyoun-taw-kyoun-ma-600x600.png', '6', '3', '3', '2022-09-01', 26, 15, 'Available', '27/08/24'),
(19, '-', 'မိညီမ', 'မင်းလူ-600x600.png', '2', '3', '3', '2023-05-27', 6, 15, 'Available', '27/08/24');

-- --------------------------------------------------------

--
-- Table structure for table `physical_borrow`
--

CREATE TABLE `physical_borrow` (
  `borrow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL CHECK (`status` in ('Borrowed','Returned')),
  `pay_amount` varchar(255) DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physical_borrow`
--

INSERT INTO `physical_borrow` (`borrow_id`, `user_id`, `book_id`, `borrow_date`, `due_date`, `return_date`, `status`, `pay_amount`, `fine`) VALUES
(1, 12, 1, '2024-08-24', '2024-08-30', '2024-08-24', 'Returned', '900.00', 0.00),
(2, 12, 2, '2024-08-24', '2024-08-30', '2024-08-24', 'Returned', '900.00', 0.00),
(3, 12, 5, '2024-08-24', '2024-08-28', '2024-08-24', 'Returned', '600.00', 0.00),
(4, 12, 4, '2024-08-24', '2024-08-27', '2024-08-24', 'Returned', '450.00', 0.00),
(5, 12, 6, '2024-08-24', '2024-08-31', '2024-08-24', 'Returned', '1050.00', 0.00),
(6, 12, 5, '2024-08-24', '2024-08-26', '2024-08-27', 'Returned', '600.00', 300.00),
(9, 12, 1, '2024-08-29', '2024-08-31', '2024-08-27', 'Returned', '900.00', 0.00),
(10, 12, 2, '2024-08-29', '2024-09-05', '2024-08-27', 'Returned', '900.00', 0.00),
(11, 12, 5, '2024-08-29', '2024-09-05', '2024-08-27', 'Returned', '600.00', 0.00),
(12, 12, 1, '2024-08-29', '2024-09-06', '2024-08-27', 'Returned', '900.00', 0.00),
(13, 12, 19, '2024-08-30', '2024-09-07', '2024-08-27', 'Returned', '1200.00', 0.00),
(14, 12, 6, '2024-08-30', '2024-09-06', '2024-08-27', 'Returned', '1050.00', 0.00),
(15, 12, 3, '2024-08-30', '2024-08-31', NULL, 'Borrowed', '150', 0.00),
(16, 12, 2, '2024-08-30', '2024-09-06', '2024-08-27', 'Returned', '900.00', 0.00);

--
-- Triggers `physical_borrow`
--
DELIMITER $$
CREATE TRIGGER `fine_trigger` BEFORE UPDATE ON `physical_borrow` FOR EACH ROW BEGIN
    DECLARE daily_rate DECIMAL(10,2);

    
    SELECT pay_amount INTO daily_rate
    FROM physical_borrow
    WHERE book_id = NEW.book_id
    LIMIT 1;  

    
    SET NEW.pay_amount = daily_rate;

    
    IF NEW.return_date > NEW.due_date THEN
        SET NEW.fine = DATEDIFF(NEW.return_date, NEW.due_date) * (daily_rate * 0.5);
    ELSE
        SET NEW.fine = 0;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `physical_borrow_trigger` BEFORE INSERT ON `physical_borrow` FOR EACH ROW BEGIN
    DECLARE available_quantity INT;

    
    SELECT quantity INTO available_quantity FROM physical_book WHERE book_id = NEW.book_id;

    
    IF available_quantity = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book is not available';
    ELSE
        
        UPDATE physical_book SET quantity = quantity - 1 WHERE book_id = NEW.book_id;

        
        IF available_quantity - 1 = 0 THEN
            UPDATE physical_book SET status = 'Unavailable' WHERE book_id = NEW.book_id;
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `physical_return_trigger` BEFORE UPDATE ON `physical_borrow` FOR EACH ROW BEGIN
    DECLARE current_quantity INT;

    
    IF NEW.status = 'Returned' AND OLD.status != 'Returned' THEN
        
        UPDATE physical_book 
        SET quantity = quantity + 1 
        WHERE book_id = NEW.book_id;

        
        SELECT quantity INTO current_quantity 
        FROM physical_book 
        WHERE book_id = NEW.book_id
        LIMIT 1;  

        
        IF current_quantity > 0 THEN
            UPDATE physical_book 
            SET status = 'Available' 
            WHERE book_id = NEW.book_id
            LIMIT 1;  
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(255) NOT NULL,
  `publisher_profile` varchar(255) NOT NULL,
  `publisher_address` varchar(255) NOT NULL,
  `publisher_email` varchar(255) NOT NULL,
  `publisher_phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `publisher_profile`, `publisher_address`, `publisher_email`, `publisher_phone_number`) VALUES
(1, 'စာပေလောက', 'sarpaylawka.png', 'အမှတ် ၂၆၂-၂၆၄ ၊ မြေညီထပ် ၊ ပန်းဆိုးတန်းကုန်းတံတားအနီး ၊ ရန်ကုန်မြို့ ။ ', 'sarpaylawka.onlinestore@gmail com', '+959446446119'),
(2, 'ပန်းဆက်လမ်း', 'pannsattlann.png', 'အမှတ် ၄၅၄ ၊ မြင်တော်သာလမ်း ၊ သာကေတမြို့နယ် ၊ ရန်ကုန်မြို့ ။', 'info@pannsattlann.com', '+95 9973374993'),
(3, 'ကံ့ကော်ဝတ်ရည်စာပေ', 'kantkawwuttyee.jpg', 'အမှတ် ၅၁ ၊ ရေကျော်လမ်း ၊ ပုဇွန်တောင်မြို့နယ် ၊ ရန်ကုန်မြို့ ။', 'kantkawwutyee@gmail.com', '+959250012348'),
(4, 'စိတ်ကူးချိုချို', 'photo_2024-08-19_21-02-28.jpg', 'အမှတ် ၇/၈ ၊ မြန်မာသီရိလင်္ကာရမကျောင်းလမ်း ၊ ရန်ကုန်မြို့ ။', 'skccph@gmail.com', '+959256690001'),
(5, 'ငါတို့ စာပေ', 'ndsp.jpg', 'ငါးလွာ၊ သံဈေး ၊ လမ်းမတော် ၊ ရန်ကုန်။', 'ndsp@gmail.com', '09767019926');

-- --------------------------------------------------------

--
-- Table structure for table `shelf_location`
--

CREATE TABLE `shelf_location` (
  `shelf_id` int(11) NOT NULL,
  `shelf_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shelf_location`
--

INSERT INTO `shelf_location` (`shelf_id`, `shelf_location`) VALUES
(1, 'F001'),
(2, 'F002'),
(3, 'F003'),
(4, 'F004'),
(5, 'F005'),
(6, 'NF001'),
(7, 'NF002'),
(8, 'NF003'),
(9, 'NF004'),
(10, 'NF005'),
(11, 'SF001'),
(12, 'SF002'),
(13, 'SF003'),
(14, 'SF004'),
(15, 'SF005'),
(16, 'FAN001'),
(17, 'FAN002'),
(18, 'FAN003'),
(19, 'FAN004'),
(20, 'FAN005'),
(21, 'MYS001'),
(22, 'MYS002'),
(23, 'MYS003'),
(24, 'MYS004'),
(25, 'MYS005'),
(26, 'ROM001'),
(27, 'ROM002'),
(28, 'ROM003'),
(29, 'ROM004'),
(30, 'ROM005'),
(31, 'THR001'),
(32, 'THR002'),
(33, 'THR003'),
(34, 'THR004'),
(35, 'THR005'),
(36, 'HIST001'),
(37, 'HIST002'),
(38, 'HIST003'),
(39, 'HIST004'),
(40, 'HIST005'),
(41, 'BIO001'),
(42, 'BIO002'),
(43, 'BIO003'),
(44, 'BIO004'),
(45, 'BIO005'),
(46, 'HOR001'),
(47, 'HOR002'),
(48, 'HOR003'),
(49, 'HOR004'),
(50, 'HOR005'),
(51, 'COM001'),
(52, 'COM002'),
(53, 'COM003'),
(54, 'COM004'),
(55, 'COM005');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_key` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL CHECK (`role` in ('Admin','Librarian','Member')),
  `status` varchar(255) NOT NULL CHECK (`status` in ('Active','Banned','Pending')),
  `registration_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `password_key`, `email`, `phone_number`, `profile`, `address`, `role`, `status`, `registration_date`) VALUES
(1, 'Aung Khant Kyaw', 'uritsMf+gJynI39kWwNF+w==', 'RQNUtSVjt2eOupH5qYhVjA==', 'aungkhantkyaw.info@gmail.com', '09421836385', 'photo_2023-07-03_23-48-31.jpg', 'No.806, Khaing Shwe War Street, Maubin', 'Admin', 'Active', ''),
(12, 'Kyaw Kyaw', 'ws394G4HfMv1zSCLLAheuQ==', '72nYIWH5vDklAaB84kj9UQ==', 'aungkhantkyaw.tech@gmail.com', '09421836385', 'photo_2024-06-24_10-37-55.jpg', 'No.806, Khaing Shwe War Street, Maubin', 'Member', 'Active', '23/08/24'),
(18, 'Aung Khant Kyaw', 'TcKM0aia9PpKhl7/4HV53w==', 'fEz/N7e2PB9mCp6l54e1Qw==', 'aungkhant160203@gmail.com', '+1 (294) 468-6364', 'photo_2023-07-03_23-48-31.jpg', 'No.806, Khaing Shwe War Street', 'Member', 'Pending', '27/08/24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `ebook_borrow`
--
ALTER TABLE `ebook_borrow`
  ADD PRIMARY KEY (`borrow_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `physical_book`
--
ALTER TABLE `physical_book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `physical_borrow`
--
ALTER TABLE `physical_borrow`
  ADD PRIMARY KEY (`borrow_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `shelf_location`
--
ALTER TABLE `shelf_location`
  ADD PRIMARY KEY (`shelf_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ebook_borrow`
--
ALTER TABLE `ebook_borrow`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `physical_book`
--
ALTER TABLE `physical_book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `physical_borrow`
--
ALTER TABLE `physical_borrow`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shelf_location`
--
ALTER TABLE `shelf_location`
  MODIFY `shelf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `update_overdue_books` ON SCHEDULE EVERY 1 DAY STARTS '2024-08-24 00:09:12' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE ebook_borrow
    SET status = 'Returned'
    WHERE due_date < CURDATE();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
