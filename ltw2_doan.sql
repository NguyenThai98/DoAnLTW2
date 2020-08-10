-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Aug 09, 2020 at 06:25 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltw2_doan`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatID` int(11) NOT NULL,
  `CatName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Manager` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatID`, `CatName`, `Manager`) VALUES
(1, 'Thế Giới', 19),
(2, 'Kinh Doanh', 19),
(3, 'Giải Trí', 0),
(4, 'Thể Thao', 0),
(5, 'Pháp Luật', 0),
(6, 'Giáo Dục', 0),
(7, 'Sức Khỏe', 0),
(8, 'Đời Sống', 0),
(9, 'Du Lịch', 0),
(10, 'Thời Sự', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_child`
--

CREATE TABLE `category_child` (
  `CatChild_ID` int(11) NOT NULL,
  `CatChildName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_child`
--

INSERT INTO `category_child` (`CatChild_ID`, `CatChildName`, `CatID`) VALUES
(1, 'Tư Liệu', 1),
(2, 'Phân Tích', 1),
(3, 'Doanh Nghiệp', 2),
(4, 'Bất Động Sản', 2),
(5, 'Phim', 3),
(6, 'Ca Nhạc', 3),
(7, 'Bóng Đá', 4),
(8, 'Tennis', 4),
(9, 'Hồ Sơ Phá An', 5),
(10, 'Tư Vấn', 5),
(11, 'Tuyển Sinh', 6),
(12, 'Du Học', 6),
(13, 'Các Bệnh', 7),
(14, 'Tư Vấn', 7),
(15, 'Tổ ấm', 8),
(16, 'Bài Học Sống', 8),
(17, 'Điểm Đến', 9),
(18, 'Tư Vấn', 9),
(19, 'Giao Thông', 10),
(20, 'MeKong', 10);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CmtID` int(11) NOT NULL,
  `Content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `NewsID` int(11) NOT NULL,
  `DateTime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`CmtID`, `Content`, `UserID`, `NewsID`, `DateTime`) VALUES
(1, 'bai viet qua hay1', 18, 1, '\'22/12/2020\''),
(2, 'hay qua hâyh', 18, 1, '\'22/12/2020\''),
(3, 'bai viet qua hay3', 18, 1, '\'22/12/2020\''),
(4, 'bai viet qua hay4', 19, 1, '\'22/12/2020\''),
(5, 'nahdh dasda', 18, 1, '\'22/12/2020\''),
(6, 'binh luan moi nhat', 20, 1, '\'25/7/2020\''),
(7, 'binh luan moi nhat 2', 19, 1, '\'26/7/2020 3:47s\''),
(46, 'binh luan moi nhat 3', 18, 1, 'Jul-27-2020-00:17:38'),
(47, 'binh luan moi nhat 4', 18, 1, 'Jul-27-2020-00:18:39'),
(48, 'mung qua', 18, 1, 'Jul-27-2020-00:20:53'),
(49, 'mung qua 2', 18, 1, 'Jul-27-2020-00:21:08'),
(50, 'mung qua 3', 18, 1, 'Jul-27-2020-00:22:10'),
(51, 'mung qua 4', 18, 1, 'Jul-27-2020-00:22:45'),
(52, 'hay lam ban oi', 18, 5, 'Jul-27-2020-00:23:20'),
(53, 'hay lam ban oi 2', 18, 5, 'Jul-27-2020-00:23:47'),
(54, 'hay lam ban oi 3', 18, 5, 'Jul-27-2020-00:24:21'),
(55, 'hay lam ban oi 4', 18, 5, 'Jul-27-2020-00:24:26'),
(56, 'binh luan moi nhat 6', 18, 13, 'Jul-27-2020-00:24:38'),
(57, 'binh luan moi nhat 7', 18, 13, 'Jul-27-2020-00:24:44'),
(58, 'binh luan moi nhat 8', 18, 13, 'Jul-27-2020-00:24:53'),
(59, 'binh luan moi nhat 9', 18, 13, 'Jul-27-2020-00:25:01'),
(60, 'binh luan moi nhat 5', 18, 13, 'Jul-27-2020-00:25:15'),
(61, 'mung qua 5', 18, 1, 'Jul-27-2020-00:25:39'),
(62, 'binh luan moi nhat 6', 18, 37, 'Jul-27-2020-00:29:43'),
(63, 'binh luan moi nhat 5', 18, 37, 'Jul-27-2020-00:29:46'),
(64, 'binh luan moi nhat 6', 18, 9, 'Jul-27-2020-00:30:31'),
(65, 'binh luan moi nhat 5', 18, 9, 'Jul-27-2020-00:30:38'),
(66, 'aa', 18, 9, 'Jul-27-2020-00:30:43'),
(67, 'dd', 18, 9, 'Jul-27-2020-00:30:47'),
(68, 'binh luan moi nhat 6', 18, 9, 'Jul-27-2020-00:30:52'),
(69, 'binh luan moi nhat 6', 18, 22, 'Jul-27-2020-00:31:04'),
(70, 'd', 18, 22, 'Jul-27-2020-00:31:06'),
(71, 'dd', 18, 22, 'Jul-27-2020-00:31:10'),
(72, 'binh luan moi nhat 6', 18, 3, 'Jul-27-2020-00:31:39'),
(73, 'd', 18, 3, 'Jul-27-2020-00:31:42'),
(74, 'aaa', 18, 3, 'Jul-27-2020-00:31:45'),
(75, 'ffffffff', 18, 3, 'Jul-27-2020-00:31:50'),
(76, 'binh luan moi nhat 6', 18, 6, 'Jul-27-2020-00:35:36'),
(77, 'd', 18, 6, 'Jul-27-2020-00:35:40'),
(78, 'a', 18, 6, 'Jul-27-2020-00:35:54'),
(79, 'dd', 18, 6, 'Jul-27-2020-00:35:56'),
(80, 's', 18, 6, 'Jul-27-2020-00:35:58'),
(81, 'aaaaa', 18, 13, 'Jul-27-2020-00:36:11'),
(82, 'vvv', 18, 13, 'Jul-27-2020-00:36:14'),
(83, 'd', 18, 13, 'Jul-27-2020-00:36:19'),
(84, 'asdasdas', 18, 13, 'Jul-27-2020-00:36:23'),
(85, 'binh luan moi nhat 53', 18, 22, 'Jul-27-2020-00:36:39'),
(86, 'gom qua', 18, 25, 'Jul-27-2020-00:37:03'),
(87, 'ssss', 18, 25, 'Jul-27-2020-00:37:13'),
(88, 'ddd', 18, 25, 'Jul-27-2020-00:37:18'),
(89, 'dddd', 18, 25, 'Jul-27-2020-00:37:29'),
(90, 'd', 18, 38, 'Jul-27-2020-00:37:36'),
(91, 'aaaa', 18, 8, 'Jul-27-2020-00:38:57'),
(92, 'dddddd', 18, 8, 'Jul-27-2020-00:39:02'),
(93, 'binh luan moi nhat 4', 18, 8, 'Jul-27-2020-00:39:09'),
(94, 'dddd', 18, 8, 'Jul-27-2020-00:39:14'),
(95, 'a', 18, 13, 'Jul-27-2020-00:48:34'),
(96, 'sadsa', 18, 22, 'Jul-27-2020-00:48:40'),
(97, 'a', 18, 11, 'Jul-27-2020-00:51:12'),
(98, 'aaaa', 19, 53, 'Jul-29-2020-00:05:17'),
(99, 'a', 18, 37, 'Jul-29-2020-00:12:36'),
(100, 'binh luan moi nhat 6', 20, 44, 'Jul-30-2020-20:16:30'),
(101, 'dad', 19, 23, 'Aug-08-2020-13:07:42'),
(102, 'asdasdas', 19, 23, 'Aug-08-2020-13:07:44'),
(103, 'sadasd', 19, 23, 'Aug-08-2020-13:07:46'),
(104, 'dasd', 19, 23, 'Aug-08-2020-13:07:47'),
(105, '', 19, 23, 'Aug-08-2020-13:07:47'),
(106, 'd', 19, 23, 'Aug-08-2020-13:07:47'),
(107, 'as', 19, 23, 'Aug-08-2020-13:07:48'),
(108, 'd', 19, 23, 'Aug-08-2020-13:07:48'),
(109, 'sa', 19, 23, 'Aug-08-2020-13:07:48'),
(110, 'd', 19, 23, 'Aug-08-2020-13:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `editor_cat`
--

CREATE TABLE `editor_cat` (
  `EditorCat_ID` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `editor_cat`
--

INSERT INTO `editor_cat` (`EditorCat_ID`, `CatID`, `UserID`) VALUES
(1, 1, 19),
(2, 2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `NewsID` int(11) NOT NULL,
  `NewsTitle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DatePost` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CatChild_ID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL,
  `Abstract` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Author` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `View` int(11) DEFAULT NULL,
  `likee` int(11) DEFAULT NULL,
  `IsPremium` int(11) DEFAULT NULL,
  `Note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Links` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsDel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`NewsID`, `NewsTitle`, `DatePost`, `Avatar`, `CatChild_ID`, `TagID`, `Abstract`, `Content`, `Author`, `Status`, `View`, `likee`, `IsPremium`, `Note`, `Links`, `IsDel`) VALUES
(1, 'Cuộc gặp 7 tiếng kỳ vọng \'phá băng\' Mỹ - Trung', '1999-02-02', '1.jpg', 1, 1, 'Bắc Kinh cho biết cuộc gặp \"mang tính xây dựng\", nói rằng ông Dương đã nêu rành mạch quan điểm của Trung Quốc về vấn đề Hong Kong, Đài Loan và Tân Cương, tái khẳng định Mỹ nên dừng can thiệp vào công việc nội bộ nước này, theo thông báo từ Bộ Ngoại giao Trung Quốc.', 'Bắc Kinh cho biết cuộc gặp \"mang tính xây dựng\", nói rằng ông Dương đã nêu rành mạch quan điểm của Trung Quốc về vấn đề Hong Kong, Đài Loan và Tân Cương, tái khẳng định Mỹ nên dừng can thiệp vào công việc nội bộ nước này, theo thông báo từ Bộ Ngoại giao Trung Quốc.\r\n\r\nNhững vấn đề nhạy cảm kể trên lại không được nêu trong một thông báo ngắn gọn do Bộ Ngoại giao Mỹ công bố. Thay vào đó, họ cho hay Ngoại trưởng Pompeo đã nhấn mạnh rằng \"hai nước cần phối hợp chặt chẽ qua các tương tác về thương mại, an ninh và ngoại giao\", đồng thời \"cần duy trì tính minh bạch và chủ động chia sẻ thông tin trong nỗ lực chống Covid-19 cũng như ngăn những đại dịch tương tự bùng phát trong tương lai\".', '0', '2', 12, 1, 1, '', 'https://vnexpress.net/cuoc-gap-7-tieng-ky-vong-pha-bang-my-trung-4117828.html', 0),
(2, 'Người Ấn Độ sục sôi lửa giận với Trung Quốc', '1999-02-03', '2.jpg', 1, 2, 'Quan chức Ấn Độ đòi đóng cửa nhà hàng Trung Quốc, trong khi người dân đập phá TV \"made in China\" sau vụ đụng độ biên giới đẫm máu.', 'Cơn thịnh nộ với Trung Quốc đang bùng nổ khắp Ấn Độ, xuất phát từ việc 20 binh sĩ nước này thiệt mạng trong vụ xô xát ở biên giới tranh chấp tại thung lũng Galwan thuộc vùng Ladakh trên dãy Himalaya vào tối 15/6. Các nguồn tin tiết lộ sau khi đại tá Bikkumalla Santosh Babu, chỉ huy đội tuần tra Ấn Độ, bị lính Trung Quốc đẩy xuống vực, hàng trăm binh sĩ hai nước đã lao vào ẩu đả bằng gạch đá và gậy.\r\n\r\nSonam Joldan, một giáo viên sống tại khu vực Ladakh gần biên giới, bày tỏ lòng yêu nước khi chứng kiến đoàn xe tải 100 chiếc của quân đội Ấn Độ hướng về tiền tuyến, đi lên dãy Himalaya hôm 18/6. \"Ấn Độ không thể mãi nhìn Trung Quốc lấn tới. Họ phải bị ngăn chặn ở mức độ nào đó\", Joldan cho hay, nói thêm rằng cái chết của những binh sĩ Ấn Độ là \"điều không thể tha thứ được\".', '0', '3', 21, 2, 1, '', 'https://vnexpress.net/nguoi-an-do-suc-soi-lua-gian-voi-trung-quoc-4117891.html', 0),
(3, 'Chuyên gia: Bắc Kinh có thể kiểm soát tốt đợt bùng phát dịch mới', '2020-02-04', '3.jpg', 2, 1, 'Giới nghiên cứu cho rằng cụm dịch mới ở Trung Quốc có thể không nghiêm trọng như cụm ở Vũ Hán, khi giới chức Bắc Kinh thực hiện các biện pháp kiểm soát sớm.', 'Trong đợt bùng phát Covid-19 đầu tiên ở Vũ Hán, tỉnh Hồ Bắc, cuối năm ngoái, giới chức Trung Quốc bị nhiều nước cáo buộc giấu dịch, không công bố sớm khiến Covid-19 nhanh chóng lan ra toàn cầu, gây thiệt hại nghiêm trọng về người và kinh tế. Hiện thế giới ghi nhận gần 8,3 triệu ca nhiễm nCoV, hơn 445.000 ca tử vong. \r\n\r\nTuy nhiên, khi có dấu hiệu xuất hiện cụm dịch mới đầu tháng 6, Bắc Kinhđã nhanh chóng thực hiện các biện pháp kiểm soát. Chính quyền địa phương đóng cửa nhiều khu chợ, phong tỏa gần 30 khu dân cư, hoãn cho học sinh đến trường học; cấm các hoạt động đông người, dừng các tour du lịch, xét nghiệm sàng lọc hơn 200.000 người, khuyến cáo người dân không ra khỏi thủ đô. Giới chức cũng tăng cảnh báo Covid-19 lên cấp hai, mức cao thứ hai trong thang cảnh báo 4 cấp, cảnh báo tình hình dịch bệnh ở thủ đô \"cực kỳ nghiêm trọng\", và nhiệm vụ cấp bách là \"kiên quyết ngăn chặn và kiểm soát dịch bệnh\".', '0', '2', 32, 3, 0, '', 'https://vnexpress.net/chuyen-gia-bac-kinh-co-the-kiem-soat-tot-dot-bung-phat-dich-moi-4117034.html', 0),
(4, 'Sắc lệnh cải cách cảnh sát của Trump bị chê hời hợt', '1999-02-05', '4.jpg', 2, 3, 'Trump ký sắc lệnh tăng cường huấn luyện và lập hồ sơ theo dõi cảnh sát vi phạm, nhưng biện pháp này bị chê là thiếu triệt để.', 'Tại Nhà Trắng hôm 16/6, Tổng thống Mỹ Donald Trump đặt bút ký sắc lệnh hành pháp cải cách cảnh sát, sau nhiều tuần nước Mỹ rung chuyển vì biểu tình chống phân biệt chủng tộc và các hành vi bạo lực của lực lượng hành pháp đối với người da màu.\r\n\r\nMở đầu lễ ký sắc lệnh, Trump bày tỏ cảm thông với các gia đình nạn nhân phải chịu bạo lực cảnh sát. \"Tôi không bao giờ có thể cảm nhận hết nỗi đau đớn của các bạn, nhưng tôi có thể hứa rằng sẽ đấu tranh đòi công lý cho tất cả người dân Mỹ\", ông nói. Trump cam kết những cái chết của người Mỹ gốc Phi vì bạo lực cảnh sát sẽ \"không vô nghĩa\".', '0', '3', 41, 4, 1, '', 'https://vnexpress.net/sac-lenh-cai-cach-canh-sat-cua-trump-bi-che-hoi-hot-4116758.html', 0),
(5, 'Vinamilk tự tin chinh phục thị trường Hàn Quốc bằng sữa hạt', '1999-02-06', '5.jpg', 3, 3, 'Đây là một trong những dòng sản phẩm chủ lực được đẩy mạnh trong thời gian tới của Vinamilk, cùng nhiều yếu tố được nghiên cứu, đầu tư kỹ lưỡng nhằm phục vụ người tiêu dùng Hàn Quốc.', 'Vinamilk dành nhiều năm nghiên cứu, phát triển bộ ba sữa đậu nành hạt đậm vị, giàu dinh dưỡng, hợp thị hiếu người tiêu dùng, tự tin chinh phục xứ sở kim chi.\r\n\r\nVinamilk vừa ký hợp đồng xuất khẩu trị giá 1,2 triệu USD gồm 85 container sản phẩm sữa đậu nành hạt và trà sữa sang Hàn Quốc. Đây là một hợp đồng giá trị lớn trong bối cảnh kinh tế thế giới vẫn còn chịu tác động của Covid-19. Là đất nước phát triển với mức sống cao, Hàn Quốc được xem là một thị trường khó chinh phục. Tuy nhiên đại diện Vinamilk cho biết, doanh nghiệp này tự tin các sản phẩm sữa hạt của Vinamilk sẽ \"làm nên chuyện\" tại thị trường khó và rất cạnh tranh này. Đây là một trong những dòng sản phẩm chủ lực được đẩy mạnh trong thời gian tới của Vinamilk, cùng nhiều yếu tố được nghiên cứu, đầu tư kỹ lưỡng nhằm phục vụ người tiêu dùng Hàn Quốc.', '0', '2', 5, 5, 0, '', 'https://vnexpress.net/vinamilk-tu-tin-chinh-phuc-thi-truong-han-quoc-bang-sua-hat-4118040.html', 0),
(6, '\'Blockchain giúp doanh nghiệp giữ chân khách hàng\'', '1999-02-07', '6.png', 3, 4, 'Tại sao khách hàng thân thiết lại là nhân tố sống còn với doanh nghiệp, đặc biệt trong bối cảnh hậu Covid-19 thưa ông? ', '- Trong bối cảnh bình thường mới, mọi hoạt động đều thay đổi theo một cách thức và tiêu chuẩn hoàn toàn mới. Có quá nhiều nhân tố, biến số khó lường, doanh nghiệp cần một vùng an toàn để tạo điểm tựa tài chính, và nhóm khách hàng thân thiết sẽ là trọng tâm cho điểm tựa này. Nếu được phục vụ, chăm sóc chu đáo, nhóm này sẽ tiếp tục duy trì lòng trung thành và tạo ra doanh số ổn định, thậm chí là tăng trưởng, đồng thời gia tăng hiệu ứng truyền miệng (word-of-mouth) mạnh mẽ mà không công cụ marketing nào có thể làm được.\r\n\r\nTheo một nghiên cứu của Harvard Business Review, những công ty dẫn đầu về chăm sóc khách hàng thân thiết tăng doanh thu nhanh hơn 2,5 lần so với những đối thủ cùng ngành. Khách hàng thân thiết khơi dậy nguồn lực sáng tạo của doanh nghiệp bằng cách phát triển những mô hình mới dựa trên thói quen, sở thích của tập khách hàng.', '0', '2', 6, 331, 1, '', 'https://vnexpress.net/fpt-van-hanh-so/blockchain-giup-doanh-nghiep-giu-chan-khach-hang-4117910.html', 0),
(7, 'Vinhomes Ocean Park mở bán tòa tháp S1.07 trên 3 kênh', '1999-02-08', '7.jpg', 4, 5, 'Khách hàng quan tâm đến căn hộ tòa S1.07 có thể mua trực tiếp, qua kênh livestream trực tuyến trên fanpage dự án hoặc trên sàn giao dịch.', 'Khách hàng quan tâm đến căn hộ tòa S1.07 có thể mua trực tiếp, qua kênh livestream trực tuyến trên fanpage dự án hoặc trên sàn giao dịch.\r\n\r\nVinhomes sẽ tổ chức lễ mở bán tòa tháp S1.07 thuộc phân khu Sapphire 1 của thành phố biển hồ Vinhomes Ocean Park (Gia Lâm, Hà Nội) vào 20/6 tới. Đây là sự kiện \"3 trong 1\", diễn ra đồng thời trên 3 kênh: tổ chức trực tiếp, livestream trực tuyến trên fanpage dự án và đặt mua trên sàn giao dịch', '0', '2', 7, 7, 0, '', 'https://vnexpress.net/vinhomes-ocean-park-mo-ban-toa-thap-s1-07-tren-3-kenh-4117880.html', 0),
(8, 'Tiềm năng đầu tư vào khu đô thị Buôn Ma Thuột', '1999-02-09', '8.png', 4, 6, 'Chính sách hút vốn đầu từ và đẩy mạnh phát triển cơ sở hạ tầng giúp thành phố đón đầu xu hướng phát triển bất động sản.', 'Giới địa ốc đánh giá, Buôn Ma Thuột hiện là một trong những thị trường giàu tiềm năng để phát triển bất động sản, nhất là những dự án đô thị đồng bộ, đa dạng tiện ích. Nhờ kinh tế phát triển, chính sách thuận lợi và hạ tầng đồng bộ, nơi đây xuất hiện ngày càng nhiều dự án quy mô lớn.\r\n\r\nChính sách hút vốn đầu tư\r\n\r\nSau 10 năm thực hiện chủ trương xây dựng và phát triển TP Buôn Ma Thuột thành đô thị trung tâm vùng Tây Nguyên giai đoạn 2010-2020, tầm nhìn đến năm 2045, TP Buôn Ma Thuột đạt được nhiều thành tựu. Tăng trưởng kinh tế bình quân giai đoạn 2010-2018 đạt 9,38%, tổng thu ngân sách năm 2018 đạt hơn 1.545 tỷ đồng, tăng 46% so với năm 2009. Các công trình, dự án trọng điểm được triển khai đầu tư, hạ tầng giao thông đô thị tương đối hoàn thiện... Tuy nhiên, các chuyên gia đánh giá quy mô phát triển của nền kinh tế vẫn chưa tương xứng với tiềm năng.', '0', '2', 99, 8, 1, '', 'https://vnexpress.net/tiem-nang-dau-tu-vao-khu-do-thi-dong-bo-tai-buon-ma-thuot-4117466.html', 0),
(9, 'Chuỗi rạp lớn nhất thế giới mở lại giữa tháng 7', '1999-02-10', '9.jpg', 5, 7, 'Ở những địa phương yêu cầu khách đeo khẩu trang trong phòng chiếu, AMC sẽ thông báo cho người xem.', 'AMC - hệ thống rạp lớn nhất thế giới - sẽ mở cửa ngày 15/7, trước thềm khởi chiếu bom tấn \"Mulan\" và \"Tenet\".\r\n\r\nTheo Hollywood Reporter, đơn vị sẽ hoạt động lại ở 450 (trên 600) địa điểm vào giữa tháng 7, số còn lại mở cửa ngày 24/7. Một số quy định được áp dụng để tránh lây Covid-19, như chỉ bán 30% số ghế. Sau đó, nếu tình hình thuận lợi, họ sẽ dần nâng tổng số ghế được bán, với ngày lễ Phục Sinh năm nay (26/11) là mốc dự tính để bán 100% số ghế. Ngoài ra, rạp sẽ có các thiết bị để rửa tay cùng khẩu trang (được bán với giá 1 USD). Ở những địa phương yêu cầu khách đeo khẩu trang trong phòng chiếu, AMC sẽ thông báo cho người xem.', '0', '2', 92, 9, 0, '', 'https://vnexpress.net/chuoi-rap-lon-nhat-the-gioi-mo-lai-giua-thang-7-4118224.html', 0),
(10, 'Phim về hành trình thành công của BTS', '1999-02-11', '10.jpg', 5, 8, 'Hiện êkíp tuyển chọn diễn viên vào vai bảy thành viên BTS. Toàn bộ diễn viên chính của phim đều là gương mặt mới. Phim khai máy vào tháng 9 và dự kiến ra mắt năm 2021 trên các nền tảng ứng dụng online. ', 'Tác phẩm xoay quanh câu chuyện bảy thành viên nuôi dưỡng ước mơ trở thành ca sĩ, họ gặp nhau ra sao và trải qua những gì từ khi ra mắt đến nay. Tên các thành viên được thay đổi, một số chi tiết về quá khứ của họ được hư cấu nhằm tạo nên sự mới lạ.\r\n\r\nBlue Sky là phim dài tập đầu tiên về BTS, do Bighit cùng Chorokbaem Media - công ty sản xuất loạt phim Hồi ức Alhambra, Lại là Oh Hae Young... - phối hợp thực hiện. Trước đó, nhóm nhạc hàng đầu Hàn Quốc thường ra mắt các phim tài liệu về âm nhạc như Bring the Soul: The Movie, Burn the stage: The movie,  Love Yourself in Seoul... ', '0', '2', 120, 10, 1, '', 'https://vnexpress.net/phim-ve-hanh-trinh-thanh-cong-cua-bts-4117905.html', 0),
(11, 'Con gái Michael Jackson phát hành nhạc', '1999-02-12', '11.jpg', 6, 9, 'Paris Jackson - con gái duy nhất của Michael Jackson - phát hành mini album đầu tay cùng bạn trai Gabriel Glenn.', 'Paris Jackson - con gái duy nhất của Michael Jackson - phát hành mini album đầu tay cùng bạn trai Gabriel Glenn.\r\n\r\nNgày 17/6, Paris Jackson viết trên Instagram: \"Thật hào hứng vì EP (mini album) đầu tay của chúng tôi sẽ ra mắt ngày 23/6 sau hai năm chuẩn bị. Tôi chân thành biết ơn những sự ủng hộ của các bạn trong suốt thời gian qua. Hy vọng các bạn sẽ thích sản phẩm này\". Cô cũng phát hành một dòng vật phẩm như áo phông, phụ kiện và dùng toàn bộ lợi nhuận ủng hộ cho các tổ chức xã hội về phụ nữ và người da màu.', '0', '2', 11, 11, 0, '', 'https://vnexpress.net/con-gai-michael-jackson-phat-hanh-nhac-4117600.html', 0),
(12, '\'Oanh vàng\' của quân đội Anh qua đời', '1999-02-13', '12.jpg', 6, 10, 'Sự quyến rũ đến ma mị của giọng hát Vera Lynn mở đường và nâng đỡ cả nước Anh qua giai đoạn đen tối. Các ca khúc của bà sẽ sống mãi, tiếp tục khiến hàng triệu con tim nhiều thế hệ thổn thức\".', 'Danh ca Vera Lynn - nổi tiếng với các buổi diễn cho binh sĩ Anh trong Thế chiến thứ hai - qua đời ở tuổi 103. \r\n\r\nTheo Guardian, ngày 18/6, gia đình cho biết ca sĩ mất tại nhà riêng ở hạt Đông Sussexh. Thủ tướng Boris Johnson gửi lời chia buồn trên Twitter: \"Sự quyến rũ đến ma mị của giọng hát Vera Lynn mở đường và nâng đỡ cả nước Anh qua giai đoạn đen tối. Các ca khúc của bà sẽ sống mãi, tiếp tục khiến hàng triệu con tim nhiều thế hệ thổn thức\".', '0', '2', 122, 12, 0, '', 'https://vnexpress.net/oanh-vang-cua-quan-doi-anh-qua-doi-4117682.html', 0),
(13, 'Kane sẽ đá chính trước Man Utd', '1999-02-14', '13.jpg', 7, 11, 'Chỉ trận đấu mới cho biết chính xác điều đó. Cậu ấy có đạt phong độ đỉnh cao hay không? Tôi cũng chẳng rõ. Đây không phải là một buổi tập nhỏ', 'HLV Jose Mourinho khẳng định sẽ tung Harry Kane vào từ đầu trận tiếp Man Utd hôm nay, sau nửa năm tiền đạo này nghỉ dưỡng thương.\r\n\r\n*Tottenham - Man Utd: 2h15 thứ Bảy 20/6, giờ Hà Nội.\r\n\r\n\"Kane đang tập luyện rất tốt. Tôi có thể nói rằng sẽ chẳng có vấn đề gì nếu tung cậu ấy vào sân đá chính trận gặp Man Utd. Cậu ấy sẽ chơi 90, 80, 70, hay 60 phút? Tôi không rõ. Chỉ trận đấu mới cho biết chính xác điều đó. Cậu ấy có đạt phong độ đỉnh cao hay không? Tôi cũng chẳng rõ. Đây không phải là một buổi tập nhỏ, và cậu ấy thì đã không thi đấu sáu tháng liền. Nhưng cậu ấy đã tập rất tốt. Cậu ấy là một cầu thủ chuyên nghiệp đáng kinh ngạc và sẽ đá chính\", Mourinho chia sẻ.', '0', '2', 13, 222, 1, '', 'https://vnexpress.net/kane-se-da-chinh-truoc-man-utd-4118076.html', 0),
(14, 'Chị gái Ronaldo: \'Em tôi không thể thắng đơn độc\'', '1999-02-15', '14.jpg', 7, 12, 'Tôi không hiểu sao Juventus có thể thi đấu như vậy. Dù sao thì hãy ngẩng cao đầu nhé em trai. Không phải việc gì chúng ta cũng làm được\".', 'Tiền đạo Cristiano Ronaldo được chị gái Elma bênh vực sau khi Juventus thua Napoli ở chung kết Cup Italy hôm 17/6.\r\n\r\n\"Em trai có thể làm được gì nữa\", Elma viết trên Instagram hôm 18/6. \"Nó đã cố gắng cật lực rồi. Nó không thể giành chiến thắng đơn độc. Nó không tạo được phép màu. Tôi không hiểu sao Juventus có thể thi đấu như vậy. Dù sao thì hãy ngẩng cao đầu nhé em trai. Không phải việc gì chúng ta cũng làm được\".', '0', '2', 14, 14, 0, '', 'https://vnexpress.net/chi-gai-ronaldo-em-toi-khong-the-thang-don-doc-4117984.html', 0),
(15, 'Quần vợt ATP trở lại ngày 14/8  trường tiểu học Times School', '1999-02-16', '15.jpg', 8, 13, 'Giải ATP 1000 đầu tiên sau quãng nghỉ kéo dài năm tháng là Cincinnati Masters, diễn ra ngày 22/8 tại Flushing Meadows, New York, thay vì Ohio như thường lệ. Sau đó chín ngày, Mỹ Mở rộng khởi tranh cũng tại Flushing Meadows.', 'Theo thông báo hôm 17/6 của Hiệp hội quần vợt chuyên nghiệp (ATP), Washington Mở rộng - khởi tranh ngày 14/8 - sẽ đánh dấu sự trở lại của quần vợt đỉnh cao nam.\r\n\r\nGiải ATP 1000 đầu tiên sau quãng nghỉ kéo dài năm tháng là Cincinnati Masters, diễn ra ngày 22/8 tại Flushing Meadows, New York, thay vì Ohio như thường lệ. Sau đó chín ngày, Mỹ Mở rộng khởi tranh cũng tại Flushing Meadows.', '0', '2', 15, 15, 0, '', 'https://vnexpress.net/quan-vot-atp-tro-lai-ngay-14-8-4117253.html', 0),
(16, 'Tay vợt Mỹ khuyên Djokovic nên đánh giải \'cỏ\'', '1999-02-17', '16.jpg', 8, 14, 'Tất nhiên anh ta có quyền đòi mang nhiều người đi cùng, nhưng đó là quy định của giải đấu. Nếu phải hạn chế vài điều để tennis có thể diễn ra, tôi nghĩ đó không phải vấn đề lớn\".', 'Sachia Vickery, số 158 thế giới, tỏ ý mỉa mai khi Novak Djokovic dự định không đến New York dự Mỹ Mở rộng 2020.\r\n\r\n\"Anh ta nên tham dự giải 60k (giải đấu cấp thấp) ở Troy, Alabama và sau đó nói xem điều kiện thi đấu ở đó khó khăn thế nào\", Sachia Vickery nói với Sky Sports hôm 15/6. \"Anh ta thật là ích kỷ. Đâu phải ai cũng có đủ khả năng mang theo đội ngũ gồm bảy hay tám người. Hầu hết các tay vợt chỉ đi cùng một hoặc hai người. Tất nhiên anh ta có quyền đòi mang nhiều người đi cùng, nhưng đó là quy định của giải đấu. Nếu phải hạn chế vài điều để tennis có thể diễn ra, tôi nghĩ đó không phải vấn đề lớn\".', '0', '2', 16, 16, 1, '', 'https://vnexpress.net/tay-vot-my-khuyen-djokovic-nen-danh-giai-co-4116391.html', 0),
(17, 'Đòn trả thù của bác sĩ với đồng nghiệp', '1998-07-07', '17.jpg', 9, 15, 'Stidham được người qua đường phát hiện tại một bãi đỗ xe gần văn phòng khám của bác sĩ ở thành phố Tucson, bang Arizona. Khi nhân viên y tế tới nơi, Brian đã tử vong vài giờ trước.', 'Khoảng 22h30 ngày 5/10/2004, thi thể của Stidham được người qua đường phát hiện tại một bãi đỗ xe gần văn phòng khám của bác sĩ ở thành phố Tucson, bang Arizona. Khi nhân viên y tế tới nơi, Brian đã tử vong vài giờ trước.\r\n\r\nChiếc xe của nạn nhân biến mất, gần thi thể là miếng bánh pizza cắn dở. Các đồ vật giá trị bên người Brian còn nguyên vẹn nên có thể loại trừ khả năng đây là vụ cướp của giết người.\r\n\r\nNhân viên tại phòng khám cho biết chiều tối hôm đó, Brian làm xong việc rồi tranh thủ giảng bài cho nhóm sinh viên y khoa. Như vậy, có thể Brian bị tấn công khi đang chuẩn bị lái xe về nhà. Không may, khu đỗ xe khá tối tăm và bị khuất tầm nhìn, không có camera an ninh, cũng không có nhân chứng trông thấy hung thủ.\r\n\r\nCảnh sát liên hệ với Daphe Stidham, vợ của Brian nhưng không có hồi âm, khi đến tận nhà kiểm tra cũng không có ai mở cửa. Sau khi phá cửa, cảnh sát thấy Daphe cùng hai con nhỏ đang ngủ say.', '0', '2', 17, 17, 0, '', 'https://vnexpress.net/don-tra-thu-cua-bac-si-voi-dong-nghiep-4116639.html', 0),
(18, 'Lừa bán cục đất sét hơn 5 tỷ đồng', '1998-07-08', '18.jpg', 9, 16, 'Trương Văn Sơn, 49 tuổi, cùng đồng phạm lấy đất sét sơn màu đen giả làm thiên thạch, lừa bán cho đại gia ở Sài Gòn hơn 5 tỷ đồng.', 'Trương Văn Sơn, 49 tuổi, cùng đồng phạm lấy đất sét sơn màu đen giả làm thiên thạch, lừa bán cho đại gia ở Sài Gòn hơn 5 tỷ đồng.', '0', '2', 18, 18, 0, '', 'https://vnexpress.net/lua-ban-cuc-dat-set-hon-5-ty-dong-4116012.html', 0),
(19, 'Dắt bộ xe máy vượt đèn đỏ, có bị phạt?', '1998-07-09', '19.jpg', 10, 17, 'Luật Giao thông đường bộ năm 2008, khi tín hiệu đèn giao thông hiện màu đỏ, người tham gia giao thông không được đi. Ai vượt đèn đỏ sẽ bị xử phạt theo Nghị định 100/2019/NĐ-CP. ', 'Căn cứ điểm b khoản 3 điều 10 Luật Giao thông đường bộ năm 2008, khi tín hiệu đèn giao thông hiện màu đỏ, người tham gia giao thông không được đi. Ai vượt đèn đỏ sẽ bị xử phạt theo Nghị định 100/2019/NĐ-CP. \r\n\r\nTheo đó, người điều khiển xe máy thấy đèn đỏ mà xuống xe dắt bộ qua bên kia đường được coi như người đi bộ vượt đèn đỏ. Vì thế, họ sẽ bị phạt từ 60.000 đến 100.000 đồng, theo điểm b khoản 1 điều 9.\r\n\r\nNếu người điều khiển xe máy vượt đèn đỏ một đoạn rồi mới xuống xe dắt bộ qua bên kia đường vẫn bị coi là người điều khiển xe máy vượt đèn đỏ. Trong trường hợp này, họ sẽ bị phạt từ 600.000 đến một triệu đồng, theo điểm e khoản 4 điều 6.\r\n\r\nViệc vượt đèn đỏ như trên là rất nguy hiểm, dễ xảy ra tai nạn giao thông. Tài xế vượt đèn đỏ gây ra tai nạn giao thông mà dẫn đến chết người, gây tổn thương cơ thể nạn nhân 61% trở lên... sẽ bị truy cứu trách nhiệm hình sự về tội Vi phạm quy định về tham gia giao thông đường bộ theo điều 260 Bộ luật Hình sự năm 2015 (đã được sửa đổi, bổ sung năm 2017). Khung hình phạt thấp nhất là phạt tiền từ 30 triệu đến 100 triệu đồng, phạt cải tạo không giam giữ đến 3 năm hoặc phạt tù từ một năm đến 5 năm', '0', '2', 19, 19, 0, '', 'https://vnexpress.net/dat-bo-xe-may-vuot-den-do-co-bi-phat-4116810.html', 0),
(20, 'Khi nào doanh nghiệp được giảm tiền đóng bảo hiểm xã hội?', '1998-07-10', '20.jpg', 10, 18, 'Công ty chúng tôi hoạt động trong lĩnh vực thi công công trình xây dựng có được giảm mức đóng bảo hiểm xã hội bắt buộc hay không? (Đỗ Văn Toàn)', 'Theo điều 5 Nghị định 58/2020/NĐ–CP về mức đóng bảo hiểm xã hội bắt buộc vào Quỹ bảo hiểm tai nạn lao động, bệnh nghề nghiệp, doanh nghiệp hoạt động trong các ngành nghề có nguy cơ cao về tai nạn lao động, bệnh nghề nghiệp được áp dụng mức đóng thấp hơn mức đóng bình thường vào quỹ Bảo hiểm tai nạn lao động, bệnh nghề nghiệp khi đáp ứng các điều kiện sau:\r\n\r\n- Trong vòng 3 năm tính đến thời điểm đề xuất không bị xử phạt vi phạm hành chính bằng hình thức phạt tiền, không bị truy cứu trách nhiệm hình sự về hành vi vi phạm pháp luật về an toàn, vệ sinh lao động và bảo hiểm xã hội;\r\n\r\n- Thực hiện việc báo cáo định kỳ tai nạn lao động và báo cáo về an toàn, vệ sinh lao động chính xác, đầy đủ, đúng thời hạn trong 3 năm liền kề trước năm đề xuất;\r\n\r\n- Tần suất tai nạn lao động của năm liền kề trước năm đề xuất phải giảm từ 15% trở lên so với tần suất tai nạn lao động trung bình của 3 năm liền kề trước năm đề xuất hoặc không để xảy ra tai nạn lao động tính từ 3 năm liền kề trước năm đề xuất, bệnh nghề nghiệp.\r\n\r\nCũng theo điểm a khoản 1 điều 4 Nghị định 58/2020/NĐ-CP, mức đóng với những doanh nghiệp đáp ứng các điều kiện tại điều 5 Nghị định này là 0,3% quỹ tiền lương làm căn cứ đóng bảo hiểm xã hội.\r\n\r\nNhư vậy, nếu công ty của bạn muốn giảm mức đóng bảo hiểm xã hội bắt buộc vào quỹ bảo hiểm tai nạn lao động phải đáp ứng các điều kiện nêu trên; mức đóng là 0,3% quỹ tiền lương làm căn cứ đóng bảo hiểm xã hội.', '0', '2', 20, 20, 1, '', 'https://vnexpress.net/khi-nao-doanh-nghiep-duoc-giam-tien-dong-bao-hiem-xa-hoi-4115592.html', 0),
(21, 'Quận Hai Bà Trưng có thêm trường tiểu học Times School', '1998-07-11', '21.png', 11, 19, 'Trường Tiểu học Times School dự kiến sẽ tuyển sinh lớp 1, 2, 3, chuẩn bị cho khai giảng năm học đầu tiên 2020-2021.', 'Trường Tiểu học Times School hiện tuyển sinh lớp 1, 2, 3, chuẩn bị cho khai giảng năm học đầu tiên 2020-2021.\r\n\r\nTọa lạc tại ngõ 622 phố Minh Khai, Hai Bà Trưng, Hà Nội, trên khuôn viên rộng 4.200m2, được đầu tư cơ sở vật chất đồng bộ và hiện đại, Trường Tiểu học Times School là một trong những địa chỉ giáo dục để phụ huynh và học sinh lựa chọn trong năm học mới.\r\n\r\nTrường có 25 phòng học tiêu chuẩn, hệ thống các phòng chức năng và phòng học chuyên biệt, hai sân bóng rổ, một sân bóng đá mini, bếp ăn, canteen và dịch vụ học đường chuyên nghiệp, đảm bảo phục vụ nhu cầu giảng dạy của giáo viên, học tập và vui chơi của học sinh bậc tiểu học.', '0', '4', 21, 21, 0, '', 'https://vnexpress.net/quan-hai-ba-trung-co-them-truong-tieu-hoc-times-school-4113239.html', 0),
(22, 'Học tiếng Anh online, offline thế nào cho hiệu quả?', '1998-07-12', '22.jpg', 11, 20, 'Học tiếng Anh online hay offline đều có những điểm mạnh và hạn chế riêng, có thể kết hợp cả hai để khai thác hết lợi thế của mỗi mô hình.', 'Học trên nền tảng Yola Smart Learning, với giáo trình đã được tải sẵn lên \"bảng đen điện tử\", cả lớp trả lời câu hỏi và tranh luận theo sự dẫn dắt của thầy giáo. Các bạn còn giơ tay phát biểu, chia nhóm làm bài, thuyết trình trước lớp và giành huy chương sau mỗi lần hoàn thành đề bài.\r\n\r\nBài tập về nhà đã có sẵn trên edX - phần mềm hỗ trợ được phát triển từ các trường Đại học lớn của Mỹ (Harvard, MIT...), giúp Quang Nhật và bố mẹ có thể theo dõi tiến trình học và sự tiến bộ mỗi ngày. Nếu Nhật có thắc mắc, đã có Tutoring, các anh chị sẽ xuất hiện và hướng dẫn em hoàn thành bài tập được giao.\r\n\r\nTheo chị Hương Mai, mẹ của Quang Nhật, con học ở nhà nhưng hiệu quả không kém trên lớp. Chị có thể quan sát và hỗ trợ con khi cần, nắm được tình hình học của con qua thống kê trên hệ thống của Yola. \"Tôi sẽ cân nhắc cho con học online, vì giúp con thoải mái hơn, không phải chạy từ trường đến trung tâm kia như trước nữa\", chị Hương nói.', '0', '2', 22, 432, 0, '', 'https://vnexpress.net/hoc-tieng-anh-online-offline-the-nao-cho-hieu-qua-4113385.html', 0),
(23, 'Điểm cộng của Trường Cao đẳng Cộng đồng Everett, Mỹ', '1998-07-13', '23.png', 12, 21, 'Trường cấp bằng kép trung học và cao đẳng cộng đồng cho học sinh từ 16 tuổi, cơ hội chuyển tiếp và tốt nghiệp ĐH trường top Mỹ năm 20 tuổi, học phí hợp lý', 'Trường cấp bằng kép trung học và cao đẳng cộng đồng cho học sinh từ 16 tuổi, cơ hội chuyển tiếp và tốt nghiệp ĐH trường top Mỹ năm 20 tuổi, học phí hợp lý.\r\n\r\nEverett là trường cao đẳng công lập, nằm tại thành phố Everett, bang Washington, Mỹ, cách thành phố Seattle 30 phút. Trường thành lập năm 1941, được kiểm định chất lượng, cung cấp các chương trình chuyển tiếp đại học (2+2), đào tạo nghề và chương trình cao đẳng. Mục tiêu của trường là mang đến nền giáo dục chất lượng, cổ vũ sinh viên vươn tới ước mơ.\r\n\r\nTrường chuẩn bị con đường học tập suốt đời cho sinh viên thông qua chương trình học hiệu quả, hỗ trợ sinh viên, cộng đồng gắn kết, tạo nên những công dân toàn cầu. Hiện có 271 sinh viên quốc tế từ 31 quốc gia hiện học tập tại Cao đẳng cộng đồng Everett.', '0', '2', 23, 23, 1, '', 'https://vnexpress.net/diem-cong-cua-truong-cao-dang-cong-dong-everett-my-4116005.html', 0),
(24, 'Trẻ luyện tư duy với khóa học tranh biện bằng tiếng Anh', '1998-07-14', '24.jpg', 12, 22, 'Học tranh biện bằng tiếng Anh giúp trẻ nâng cao trình độ ngoại ngữ, đồng thời phát triển khả năng phản biện, nghiên cứu, làm việc nhóm.', 'Học tranh biện bằng tiếng Anh giúp trẻ nâng cao trình độ ngoại ngữ, đồng thời phát triển khả năng phản biện, nghiên cứu, làm việc nhóm.\r\n\r\nLà phụ huynh của bé Minh Ngọc, 9 tuổi, chị Liên (quận Cầu Giấy, Hà Nội) cho biết, từ nhỏ Ngọc đã theo học một trường quốc tế tại Hà Nội. Hiện, cháu có thể nói và viết tiếng Anh trôi chảy, đúng ngữ pháp. Do muốn con tự tin thuyết trình và bày tỏ quan điểm trước đám đông, mới đây, chị Liên đã đăng ký cho Ngọc tham gia một khóa học tranh biện bằng tiếng Anh.', '0', '2', 24, 24, 0, '', 'https://vnexpress.net/tre-luyen-tu-duy-voi-khoa-hoc-tranh-bien-bang-tieng-anh-4116312.html', 0),
(25, 'Triệu chứng ngứa trên da có thể cảnh báo ung thư', '2020-02-05', '25.jpg', 13, 23, 'Người bỗng nhiên cảm thấy ngứa, da bứt rứt khó chịu có thể là triệu chứng ngầm cảnh báo ung thư.', 'Vì sao ngứa là nguyên nhân cảnh báo ung thư?\r\n\r\nVới ung thư tuyến tụy, khi khối u phát triển sẽ chặn ống mật gây suy giảm chức năng mật. Lúc này, hóa chất trong mật có thể xâm nhập vào da và gây ngứa. Bên cạnh đó, người ung thư tụy cũng gặp tình tràng vàng da hoặc da nhợt nhạt.\r\n\r\nKhi mắc bệnh ung thư hạch, người bệnh cảm thấy ngứa vì hệ thống miễn dịch phản ứng với các tế bào ung thư hạch sẽ giải phóng các hóa chất có hại. Bệnh nhân có khối u lympho da, u lympho tế bào T và u lympho Hodgkin sẽ thấy ngứa nhiều hơn. Với các loại ung thư hạch không Hodgkin, hiện tượng ngứa sẽ ít thấy và dễ bị người bệnh bỏ qua.\r\n\r\nTrong bệnh đa hồng cầu (một trong những bệnh ung thư máu phát triển chậm trong một nhóm được gọi là u nguyên bào tủy), người bệnh thấy ngứa sau khi tắm nước nóng hoặc tắm nước quá lạnh.\r\n\r\nNgoài ra, những người đang điều trị ung thư cũng dễ gặp tình trạng ngứa ngáy khó chịu do cơ thể phản ứng với thuốc hoặc các loại hóa chất dùng trong xạ trị.', '0', '2', 25, 25, 0, '', 'https://vnexpress.net/suc-khoe/trieu-chung-ngua-tren-da-co-the-canh-bao-ung-thu-4116829.html', 0),
(26, 'Cô gái ung thư máu: \'Chỉ có một con đường là chiến đấu\'', '1998-07-16', '26.jpg', 13, 24, 'Khi ấy là tháng 9/2019, chị Đinh Thị Tuyết Trinh, 28 tuổi, biết mình bị bệnh bạch cầu cấp dòng lympho B - ung thư máu cấp.', 'Ba ngày mà xoay vòng cả một số phận. Khi ấy là tháng 9/2019, chị Đinh Thị Tuyết Trinh, 28 tuổi, biết mình bị bệnh bạch cầu cấp dòng lympho B - ung thư máu cấp.\r\n\r\nBác sĩ tư vấn bệnh của Trinh nếu không chữa, tiên lượng sống chỉ 4 tháng. Nếu chọn điều trị, chi phí ít nhất vài tỷ đồng. Tuy nhiên, bệnh nhân có đáp ứng thuốc và kéo dài được sự sống hay không, bác sĩ không dám hứa.\r\n\r\nTrinh sốc, ôm chồng khóc mấy tiếng đồng hồ ở hành lang bệnh viện. Công việc đang trên đà thăng tiến, hai vợ chồng đã sẵn sàng có em bé, Trinh không chấp nhận để cuộc sống trôi tuột qua lãng xẹt như thế. \r\n\r\n\"Tôi không muốn chết. Tôi còn quá trẻ, tôi còn người chồng tuyệt vời muốn chung sống suốt đời, còn cha mẹ, hai em gái. Tôi không thể buông xuôi\", Trinh nói. \r\n\r\nKhát khao sống mãnh liệt đã vực Trinh dậy. Chị xin nghỉ việc marketing lương cao, ổn định, để tập trung chiến đấu với ung thư. Trước khi vào Bệnh viện Huyết học và Truyền máu TP HCM  hóa trị, Trinh luôn tin mình sẽ khỏi. Chị động viên bố mẹ: \"Bệnh của con chữa được, đừng lo\".\r\n\r\nTrinh bảo chị tin tưởng hoàn toàn vào phác đồ điều trị của bác sĩ. Tình yêu thương, động viên của gia đình cũng giúp chị mạnh mẽ hơn.', '0', '2', 26, 26, 1, '', 'https://vnexpress.net/co-gai-ung-thu-mau-chi-co-mot-con-duong-la-chien-dau-4116120.html', 0),
(27, '3 triệu trẻ Việt mắc tật khúc xạ', '1998-07-17', '27.jpg', 14, 25, 'Ba bệnh mắt phổ biến ở trẻ gồm tật khúc xạ, bệnh sụp mi và lác, có thể tự phát hiện và phòng ngừa sớm', 'Khoảng 3 triệu trẻ mắc tật khúc xạ như cận thị, viễn thị, loạn thị, cần được chỉnh kính; trong đó tỷ lệ trẻ mắc khúc xạ ở các thành phố lớn lên tới 60-70%.\r\n\r\nBa bệnh mắt phổ biến ở trẻ gồm tật khúc xạ, bệnh sụp mi và lác, có thể tự phát hiện và phòng ngừa sớm.\r\n\r\nCận thị xảy ra ở những người trẻ như học sinh, sinh viên.., thường không được quan tâm đúng mực. Nhiều người cho rằng đây là tình trạng quá bình thường, không có gì nguy hiểm. Trong khi đó, độ tuổi học sinh là giai đoạn cận thị tiến triển nhanh, có thể dẫn tới các biến chứng gây mù lòa.', '0', '4', 27, 338, 1, '', 'https://vnexpress.net/3-trieu-tre-viet-mac-tat-khuc-xa-4117856.html', 0),
(28, 'Nấm thức thần độc hơn ma túy đá', '1998-07-18', '28.jpg', 14, 26, 'Thoát ly thực tại, nhìn cái gì cũng đẹp. Nếu không may sẽ trải qua \"một chuyến du lịch xui xẻo\" (bad trip), khiến người mất sức lực, mệt mỏi...', 'Bác sĩ Nguyễn Ngọc Hưng, Trưởng khoa Nội Tổng hợp, Bệnh viện 09, chuyên điều trị bệnh nhân HIV/AIDS, cho biết nấm thức thần còn gọi là nấm ma túy, mọc phổ biến những vùng khí hậu nhiệt đới như Bắc Mỹ, Mexico. Nấm chứa chất psilocine và psilocybine, là chất gây ảo giác có trong danh mục chất ma túy bị cấm tại hầu hết quốc gia. Tại Việt Nam, nấm thức thần bị cấm sử dụng,  theo Nghị định 73 quy định về danh mục chất ma túy và tiền chất. \r\n\r\nBác sĩ cho biết khoảng hai năm nay nấm thức thần xuất hiện ở Việt Nam, được trồng lén, phát triển nhanh. Người ta ăn nấm thức thần để tìm cảm giác \"lạc vào một thế giới khác\". Một số người trẻ ăn nấm, với ý nghĩ nếu may mắn sẽ có một \"chuyến du lịch tốt đẹp\" (good trip) bởi cảm giác bay bổng, thoát ly thực tại, nhìn cái gì cũng đẹp. Nếu không may sẽ trải qua \"một chuyến du lịch xui xẻo\" (bad trip), khiến người mất sức lực, mệt mỏi...', '0', '2', 28, 28, 0, '', 'https://vnexpress.net/nam-thuc-than-doc-hon-ma-tuy-da-4117851.html', 0),
(29, 'Dạy chữ sớm là làm hại trẻ', '1998-07-19', '29.jpg', 15, 27, 'Mỹ lúc nào cũng có những khám phá kỳ lạ và đi trước. Không dạy trẻ biết chữ trước khi vào lớp 1 ở Mỹ thì ok', 'Một nghiên cứu kéo dài nhiều năm của đại học Yale (Mỹ) chỉ ra: Cho trẻ biết chữ sớm chẳng ích lợi gì.\r\n\r\nNhiều phụ huynh có suy nghĩ nên dạy trẻ biết chữ từ sớm, để khi chúng bước vào lớp 1 có thể đọc thông viết thạo, sẽ có lợi thế so với các bạn đồng trang lứa. Thậm chí, vì sợ con \"thua trên vạch xuất phát\", không ít người dạy con biết chữ từ 4-5 tuổi.', '0', '2', 29, 29, 0, '', 'https://vnexpress.net/day-chu-som-la-lam-hai-tre-4117742.html', 0),
(30, 'Những bà mẹ ghét chơi với con', '1998-07-20', '30.jpg', 15, 28, 'Tôi không thích đi tàu lượn, xe hơi hay những trò tưởng tượng. Thay vào đó tôi dành thời gian ra ngoài với con hoặc cùng nhau đọc sách ... những việc tôi thực sự tận hưởng\", bà mẹ hai con chia sẻ.', 'Khi con trai út của Louise Westra, bé Tyler, 4 tuổi, yêu cầu mẹ đẩy những chiếc ôtô trên sàn nhà với nó, Louise nói: \"Không\".\r\n\r\nCô giải thích đang bận đọc sách và cậu bé nên đợi cho đến khi bố về. Có thể nhiều người cảm thấy tội lỗi trước những lời cầu xin của con, nhưng Louise không hề có cảm giác ấy, vì cô ghét chơi với con mình. Và cô không ngại thừa nhận điều đó.\r\n\r\n\"Tôi thà che mắt lại còn hơn chơi với con\", cô cười nói. \"Tôi không thích đi tàu lượn, xe hơi hay những trò tưởng tượng. Thay vào đó tôi dành thời gian ra ngoài với con hoặc cùng nhau đọc sách ... những việc tôi thực sự tận hưởng\", bà mẹ hai con chia sẻ.\r\n\r\nNaturopath 46 tuổi, đến từ Crieff ở Perthshire, Scotland nghĩ rằng nhiều bà mẹ sợ phải thừa nhận họ cũng cảm thấy như Louise. \r\n\r\n\"Là phụ nữ, chúng tôi hay đặt nhu cầu của của mọi người lên trên nhu cầu của bản thân và sẽ gây tranh cãi khi ai đó hạ tiêu chuẩn này xuống. Trong thời gian giãn cách 3 tháng, nhiều bậc cha mẹ đang cảm thấy bị áp lực giữa một bên phải đáp ứng con mình và một bên khước từ để tìm một phút riêng tư cho bản thân\", cô chia sẻ.', '0', '2', 30, 30, 0, '', 'https://vnexpress.net/nhung-ba-me-ghet-choi-voi-con-4117488.html', 0),
(31, 'Geisha Nhật vật lộn kiếm sống thời hậu dịch', '1998-07-21', '31.jpg', 16, 29, 'giàu có, những người sẽ dõi theo buổi diễn một cách đầy trân trọng, trong những phòng khách truyền thống được trải bằng những chiếc chiếu tatami.', 'Chacha quỳ gối trên sàn gỗ, các ngón tay đặt nhẹ nhàng, cử chỉ duyên dáng cúi chào các khán giả - những người đang xem qua chương trình trực tuyến.\r\n\r\nThông thường, dưới ánh đèn sân khấu, cô geisha 32 tuổi này sẽ duyên dáng thực hiện một điệu nhảy truyền thống với những bước di chuyển nhẹ nhàng như cánh bướm, sau đó nở xòe ra một cách đầy nghệ thuật và \"hớp hồn\" những người hâm mộ.\r\n\r\nKhán giả của Chacha thường là một nhóm những người đàn ông lớn tuổi, giàu có, những người sẽ dõi theo buổi diễn một cách đầy trân trọng, trong những phòng khách truyền thống được trải bằng những chiếc chiếu tatami.', '0', '2', 31, 31, 0, '', 'https://vnexpress.net/geisha-nhat-vat-lon-kiem-song-thoi-hau-dich-4117704.html', 0),
(32, '7 tình huống nói dối nên khuyến khích', '1998-07-22', '32.jpg', 16, 30, 'Chacha thường là một nhóm những người đàn ông lớn tuổi, giàu có, những người sẽ dõi theo buổi diễn một cách đầy trân trọng, trong những phòng khách truyền thống được trải bằng những chiếc chiếu tatami.', 'Bạn gái hoặc bạn trai hay đặt câu hỏi: Em/anh đã từng yêu ai hơn tôi chưa? Bạn có thấy anh/cô ấy hấp dẫn không?... Nếu chuyện tình hiện tại của bạn đang tốt đẹp và xác định sẽ lâu dài, tốt nhất nên trả lời \"không\", dù nó là sự thật hay không.\r\n\r\nBạn có thể đã yêu ai đó nhiều hơn trong quá khứ. Đôi khi, bạn có thể bị thu hút bởi những người khác. Tuy nhiên, mối quan hệ của hai người trong hiện tại và cảm xúc của người yêu là thứ quan trọng nhất bạn cần giữ gìn.\r\n\r\nKhi bạn chia tay và không muốn làm người đó tổn thương thêm\r\n\r\nChủ động nói chia tay không hề dễ dàng. Bạn cần tìm ra cách tốt nhất để nói chuyện với đối phương. Đừng đem vào cuộc trò chuyện danh sách dài những lời buộc tội và chỉ trích, vì nó chỉ có thể làm tổn thương người bạn từng yêu.\r\n\r\nBạn có thể nhận lỗi về mình hay nói rằng mối quan hệ của hai người đến sai thời điểm. Điều này giúp người chủ động giữ gìn sự tôn trọng và nhân cách. Hai người chia tay trong hòa bình, thay vì cảm giác tội lỗi hoặc trong xung đột gay gắt.', '0', '2', 32, 32, 0, '', 'https://vnexpress.net/geisha-nhat-vat-lon-kiem-song-thoi-hau-dich-4117704.html', 0),
(33, '5 trải nghiệm mát mẻ ở Sa Pa  chơi với con', '1998-07-23', '33.jpg', 17, 31, 'Bể bơi nằm ngoài trời trên tầng cao nhất của khách sạn, hướng về dãy núi Fansipan và thung lũng Mường Hoa mờ ảo trong sương.', 'Trải nghiệm hồ bơi view núi rừng\r\n\r\nVới khung cảnh núi non hùng vĩ, những ruộng bậc thang quanh co uốn khúc, điểm xuyết những ngôi nhà người dân tộc vùng cao, Sa Pa ngày càng phát triển nhiều khu nghỉ dưỡng, resort có hồ bơi vô cực ngắm cảnh trên cao.      Gợi ý đầu tiên cho du khách là hồ bơi \"dát vàng\" khách sạn Pistachio, trên đường Thác Bạc. Bể bơi nằm ngoài trời trên tầng cao nhất của khách sạn, hướng về dãy núi Fansipan và thung lũng Mường Hoa mờ ảo trong sương. Ở góc là chiếc ghế bể sục, nơi dành riêng cho du khách tạo dáng chụp ảnh. Mới đi vào hoạt động, bể bơi chưa có hệ thống làm nóng nước, vì vậy du khách lưu ý làm ấm cơ thể và mang theo khăn choàng. Phòng ở đây có giá từ 1.200.000 đồng. Ảnh: Maria Tuyền.  ', '0', '2', 33, 33, 1, '', 'https://vnexpress.net/5-trai-nghiem-mat-me-o-sa-pa-4113552.html', 0),
(34, 'Khám phá thung lũng hoa trên đèo Pha Đin', '2000-01-01', '34.jpg', 17, 32, 'Nơi đây có thung lũng ngàn sắc hoa, phù hợp cho du ngoạn, chụp ảnh và nghỉ ngơi, ăn uống.', 'Với diện tích hơn 50 ha, hàng ngàn bông hoa và khung cảnh núi rừng trên đèo Pha Đin là điểm đến lý tưởng với du khách.  \r\n\r\nĐược mệnh danh là một trong \"tứ đại đỉnh đèo\", Pha Đin là nơi du khách thường ghé thăm khi đến với những cung đường Tây Bắc quanh co. Điểm dừng chân không nên bỏ qua khi đến đỉnh đèo là khu du lịch Pha Đin Pass, với diện tích khoảng 50 ha. Nơi đây có thung lũng ngàn sắc hoa, phù hợp cho du ngoạn, chụp ảnh và nghỉ ngơi, ăn uống.', '0', '2', 34, 34, 0, '', 'https://vnexpress.net/kham-pha-thung-lung-hoa-tren-deo-pha-din-4117730.html', 0),
(35, 'Vi vu Cao Bằng với hơn 1 triệu đồng hơn 1 triệu đồng', '2000-01-02', '35.png', 18, 33, 'Đến thành phố Cao Bằng lúc 5h sáng, Ngân và bạn di chuyển về homestay ở khu trung tâm nhận phòng. 8h, nhóm bạn thuê xe máy đi núi Mắt Thần và thác Bản Giốc.', 'Ngày 1: Thành phố Cao Bằng - núi Mắt Thần - thác Bản Giốc \r\n\r\nĐến thành phố Cao Bằng lúc 5h sáng, Ngân và bạn di chuyển về homestay ở khu trung tâm nhận phòng. 8h, nhóm bạn thuê xe máy đi núi Mắt Thần và thác Bản Giốc. \r\n\r\nNúi Mắt Thần cách thành phố khoảng 39 km, còn có tên gọi khác là núi Thủng. Đoạn rẽ vào núi hơi khó tìm, du khách nên hỏi trước người dân địa phương để không bị lạc. Nơi đây còn khá hoang sơ, yên bình và tĩnh lặng, được núi bao bọc xung quanh còn ở giữa là thung lũng nhỏ xanh mát. Trên đường đến núi, du khách sẽ đi ngang qua đèo Mã Phục, một điểm ngắm cảnh đẹp khi di chuyển bằng xe máy. ', '0', '2', 35, 35, 0, '', 'https://vnexpress.net/vi-vu-cao-bang-voi-hon-1-trieu-dong-4112866.html', 0),
(36, ' tham quan đỉnh Thới Lới, hang Câu, hòn Mù Cu.', '2000-01-03', '36.jpg', 18, 34, 'Phương tiện di chuyển chính là tàu thủy từ cảng Sa Kỳ. Ở đây có nhiều hãng tàu cao tốc đưa du khách tới đảo Lý Sơn với giá vé', 'Du lịch quần đảo trong 3 – 4 ngày, du khách sẽ đắm mình trong những bãi biển nước xanh trong, tham quan đỉnh Thới Lới, hang Câu, hòn Mù Cu.\r\n\r\nHuyện đảo Lý Sơn gồm 3 đảo là Cù Lao Ré (đảo Lớn), đảo An Bình (đảo nhỏ) và hòn Mù Cu, nằm cách đất liền khoảng 30 km. Với lợi thế khung cảnh hoang sơ, chi phí du lịch tiết kiệm, trong những năm gần đây, Lý Sơn luôn là điểm đến được nhiều du khách lựa chọn.\r\n\r\nThời điểm đẹp nhất để đến Lý Sơn là mùa khô, từ tháng 4 - 8 hàng năm. Tháng 9 - 12 là mùa mưa, bão và biển động, du khách nên tránh du lịch lúc này.', '0', '2', 36, 36, 0, '', 'https://vnexpress.net/cam-nang-lan-dau-toi-ly-son-4114764.html', 0),
(37, 'Hơn 560 ôtô bị phạt \'nguội\' bằng camera  hòn Mù Cu.', '2000-01-04', '37.jpg', 19, 35, ' Quá thời gian này, người được yêu cầu không đến sẽ bị đưa vào diện không cho đăng kiểm xe do chưa hoàn thành xử lý vi phạm.', 'Sau 3 tháng thực hiện xử phạt bằng camera, 565 ôtô bị phạt do dừng đỗ sai quy định tại 14 tuyến đường trung tâm thành phố.\r\n\r\nTrong số này, 94 trường hợp nộp phạt hơn 54 triệu đồng; 4 trường hợp bị tước giấy phép lái xe; 467 trường hợp chờ giải quyết (thời hạn 30 ngày). Quá thời gian này, người được yêu cầu không đến sẽ bị đưa vào diện không cho đăng kiểm xe do chưa hoàn thành xử lý vi phạm.', '0', '2', 37, 37, 1, '', 'https://vnexpress.net/hon-560-oto-bi-phat-nguoi-bang-camera-4117961.html', 0),
(38, 'Hơn chục lỗi vi phạm bị đề xuất trừ điểm bằng lái', '2000-01-05', '38.jpg', 19, 36, ' những lỗi vi phạm giao thông khiến tài xế có thể bị trừ điểm vào giấy phép lái xe, theo Dự thảo Luật đảm bảo trật tự an toàn giao thông.Trông giống vườn cọ miền trung du Phú Thọ quả cọ thì màu tím đen, đem om lên ăn béo ngậy', 'Sử dụng điện thoại, chạy quá tốc độ... là những lỗi vi phạm giao thông khiến tài xế có thể bị trừ điểm vào giấy phép lái xe, theo Dự thảo Luật đảm bảo trật tự an toàn giao thông.', '0', '2', 38, 38, 0, '', 'https://vnexpress.net/hon-chuc-loi-vi-pham-bi-de-xuat-tru-diem-bang-lai-4117740.html', 0),
(39, 'Vườn chà là 2.000 m2 ở miền Tây', '2000-01-06', '39.jpg', 20, 22, 'Trông giống vườn cọ miền trung du Phú Thọ quả cọ thì màu tím đen, đem om lên ăn béo ngậy', 'ĐỒNG THÁPHơn 100 gốc chà là được một nhà vườn ở làng hoa Sa Đéc trồng ra trái vàng ươm, thu hút nhiều người đến tham quan, chụp ảnh.', '0', '2', 39, 39, 1, '', 'https://video.vnexpress.net/tin-tuc/nhip-song/vuon-cha-la-2-000-m2-o-mien-tay-4114861.html', 0),
(40, 'Cao tốc Trung Lương - Mỹ Thuận hoàn thành 50%', '2000-01-07', '40.jpg', 20, 33, ' Phần đường đã hoàn thành công tác cắm bấc thấm chỉnh tuyến, gia tải, xử lý đất yếu 10/19 gói thầu', 'Sau nhiều năm thi công chậm tiến độ, cao tốc Trung Lương - Mỹ Thuận đã hoàn thành 50% khối lượng, đảm bảo thông tuyến cuối năm nay.\r\n\r\nLàm việc với Thứ trưởng Bộ Giao thông Vận tải Nguyễn Nhật ngày 11/6, Ban điều hành Công ty Cổ phần BOT Trung Lương - Mỹ Thuận cho biết, đến nay dự án đã triển khai thi công 27/36 gói thầu xây lắp trên tuyến chính. Phần đường đã hoàn thành công tác cắm bấc thấm chỉnh tuyến, gia tải, xử lý đất yếu 10/19 gói thầu. Phần cầu đã thi công thi công 161/283 mố trụ, hoàn thành 41/216 nhịp...', '0', '2', 40, 40, 0, '', 'https://vnexpress.net/cao-toc-trung-luong-my-thuan-hoan-thanh-50-4114081.html', 0),
(44, 'bai viet do qua cc', '17/03/2020', '204da429aef874cd788d0949ac0fe464', 2, 42, 'bai viet do qua', '<p>bai viet do qua</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '2', NULL, NULL, 0, NULL, NULL, NULL),
(45, 'thainguyen1', '17/07/2020', '5d62ba588b6dccf6ef23b4b76f0afeed', 1, 43, 'thainguyen1', '<p>thainguyen1</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(46, 'thainguyen2', '17/07/2020', 'c289e0a61f67af79f4c03f82e3b5d0fd', 1, 44, 'thainguyen2', '<p>thainguyen2</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '2', NULL, NULL, 0, NULL, NULL, NULL),
(47, 'test lan cuoi', '17/07/2020', '4d44b5e3acc2ead0aeea20fb42aed2a6', 1, 45, 'test lan cuoi', '<p>test lan cuoi</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '2', NULL, NULL, 0, NULL, NULL, NULL),
(48, 'test lai', '28/06/2020', '992a05b0918933a2896306b532443982', 19, 46, 'test lai', '<p>test lai</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(49, 'test lai 1', '28/07/2020', 'ee4121782fcfbb4efb231c7da86ba97e', 19, 47, 'test lai 1', '<p>test lai 1</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(50, 'aaaaadddd', '28/07/2020', 'ef40657e56683636220b22952d89fda2', 19, 48, 'aaaaadddd', '<p>aaaaadddd</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(51, 'dathaydoi2121232 asss22222222222222', '28/07/2020', '1f3c35dd51c44d718d62281e2c78e829', 20, 49, 'dathaydoi2121232 asss22222222222222', '<p>dathaydoi2121232 asss22222222222222</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(52, 'aaaaaad', '28/07/2020', '4079fbe84be5ac18337a57271c4b13d7', 20, 50, 'aaaaaad', '<p>aaaaaad</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '1', '4', NULL, NULL, 0, NULL, NULL, NULL),
(53, 'thainguyen111111111111111', '28/07/2020', '742e187f819362048a4c10066b70fe97', 1, 52, 'thainguyen111111111111111', '<p>thainguyen111111111111111</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '2', NULL, NULL, 0, NULL, NULL, NULL),
(54, 'test lan nua xem sao', '29/07/2020', '8cac4b181ed35c26a621485a9cd07e51', 2, 52, 'test lan nua xem sao', '<p>test lan nua xem sao</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '2', NULL, NULL, 0, NULL, NULL, NULL),
(55, 'bai viet moi nhatdddd', '29/07/2020', 'f11740cec1e3b66b9bc4dabb90462fec', 3, 53, 'bai viet moi nhat', '<p>bai viet moi nhat</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '4', NULL, NULL, 0, NULL, NULL, NULL),
(56, 'bai viet moi nhat 2', '30/07/2020', '50128bac02741070c22bd4804fa5900e', 1, 54, 'bai viet moi nhat 2', '<p>bai viet moi nhat 2</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '2', NULL, NULL, 0, NULL, NULL, NULL),
(57, 'dathaydoiddddddddddddddddddddddddd', '29/07/2020', 'c4e4d7e05bea10f748babd7382ec5ad1', 3, 55, 'dathaydoiddddddddddddddddddddddddd', '<p>dathaydoiddddddddddddddddddddddddd</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '2', NULL, NULL, 0, NULL, NULL, NULL),
(58, 'bai viet nay moi viet hom qua', '09/08/2020', '75ea77c07a8256a84212ecb30c7b6717', 1, 56, 'bai viet nay moi viet hom qua', '<p>bai viet nay moi viet hom qua</p><div id=\"eJOY__extension_root\" class=\"eJOY__extension_root_class\" style=\"all: unset;\"></div>', '20', '3', NULL, NULL, 0, 'quá dỡ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_status`
--

CREATE TABLE `news_status` (
  `StatusID` int(11) NOT NULL,
  `StatusName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news_status`
--

INSERT INTO `news_status` (`StatusID`, `StatusName`) VALUES
(1, 'Đã Được Duyệt và Chờ Xuất Bản'),
(2, 'Đã Xuất Bản'),
(3, 'Bị Từ Chối'),
(4, 'Chưa Được Duyệt');

-- --------------------------------------------------------

--
-- Table structure for table `premium`
--

CREATE TABLE `premium` (
  `PreID` int(11) NOT NULL,
  `ExpriryDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `TagID` int(11) NOT NULL,
  `TagName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NewsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`TagID`, `TagName`, `NewsID`) VALUES
(1, 'Thời Sự', 36),
(2, 'Kinh Tế', 37),
(3, 'Đời Sống', 38),
(4, 'Du Lịch', 40),
(5, 'Tuổi Trẻ', 35),
(6, 'Thành Công', 34),
(7, 'Sự Nghiệp', 33),
(8, 'Tiền Tài', 32),
(9, 'Hiếu Kỳ', 31),
(10, 'Pháp Luật', 30),
(11, 'Đời Sống', 1),
(12, 'Pháp Luật', 2),
(13, 'Hiếu Kỳ', 3),
(14, 'Thành Công', 4),
(15, 'Tuổi Trẻ', 5),
(16, 'Sư Nghiệp', 6),
(17, 'Du Lịch', 7),
(18, 'Thời Sự', 8),
(19, 'Kinh Tế', 9),
(20, 'Tiền Tài', 10),
(21, 'Du Lịch', 11),
(22, 'Sự Nghiệp', 12),
(23, 'Đời Sống', 13),
(24, 'Pháp Luật', 14),
(25, 'Giải Trí', 15),
(26, 'Thể Thao', 16),
(27, 'Hiếu Kỳ', 17),
(28, 'Tiền Tài', 18),
(29, 'Kinh Tế', 19),
(30, 'Tuổi Trẻ', 20),
(31, 'Giải Trí', 21),
(32, 'Khó Khăn', 22),
(33, 'Kỷ Luật', 23),
(34, 'Bất Động Sản', 24),
(35, 'Nghề Ngiệp', 25),
(36, 'Du Học', 26),
(37, 'Kinh Tế', 27),
(38, 'Thành Công', 28),
(39, 'Dịch Bệnh', 29),
(42, 'Thời Sự', 39),
(43, 'Thời Sự', 44),
(44, 'Thời Sự', 45),
(45, 'Thời Sự', 46),
(46, 'Thời Sự', 47),
(47, 'Thời Sự', 48),
(48, 'Kinh', 49),
(49, 'Thời', 50),
(50, 'Thời', 51),
(51, 'Kinh', 52),
(52, 'Thời Sự', 53),
(53, 'Thời Sự', 54),
(54, 'Thời Sự', 55),
(55, 'Kinh Tế', 56),
(56, 'Kinh Tế', 57),
(57, 'Thời Sự', 58);

-- --------------------------------------------------------

--
-- Table structure for table `type_of_user`
--

CREATE TABLE `type_of_user` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `type_of_user`
--

INSERT INTO `type_of_user` (`TypeID`, `TypeName`) VALUES
(-1, 'guest'),
(0, 'subscriber'),
(1, 'writer'),
(2, 'editor'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BirthDay` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeOfUser` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PenName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `IsDel` int(11) DEFAULT NULL,
  `TimeRegister` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Name`, `Password`, `BirthDay`, `Phone`, `Email`, `TypeOfUser`, `PenName`, `IsActive`, `IsDel`, `TimeRegister`) VALUES
(9, 'ngthai', NULL, '$2a$08$e3A1BAA231r6EQ0eMZTmjuH.JzTTsC4ugcpJP..PONnGvxA0cX4e2', NULL, NULL, 'nguyenthai492018@gmail.com', '0', NULL, NULL, NULL, '-1'),
(14, 'ngthaiz', NULL, '$2a$08$Y3I0eW7i09aSUXMx25avq.HW12skjwpxhwnjisBldU.', NULL, NULL, 'nguyenthai@gmail.com', '0', NULL, NULL, NULL, '1593916166251'),
(15, 'ngthaia', NULL, '$2a$08$/Q3SRqbtN97qwwQuKAosHuTszUz9HFPsu8Pc1U.qPeZ', NULL, NULL, 'nguyenthai492018@gmail.com', '0', NULL, NULL, NULL, '1593917415062'),
(17, 'ngthaix', NULL, '$2a$08$ar44.oDzVuC6BKDKHQZlee/UCAkXpBFI5eIBKT5S8ThXt7EGhEDce', NULL, NULL, 'nguyenthai492018@gmail.com', '-1', NULL, NULL, NULL, '1594015373628'),
(18, 'ngthaixx', NULL, '$2a$08$Kk3OwAQFfdg5Un33lVuXVeNCMxaLSy04uqBTLELjSfVisEibL/QcG', NULL, NULL, 'nguyenthai492018@gmail.com', '0', NULL, NULL, NULL, '1595687122125'),
(19, 'thinhcc', NULL, '$2a$08$WZvGggq9aSxaCuvn4MLR0uMIHj/nPpfitAVWAsd/GW4PrKUKt7VhG', NULL, NULL, 'nguyenthai492018@gmail.com', '3', NULL, NULL, NULL, '1596866844630'),
(20, 'thaicc', NULL, '$2a$08$KLqghk/x9V/PxfjUvn11BegAxkrkjTal4YpPEAKFNfHwx3OQV7l9W', NULL, NULL, 'nguyenthai492018@gmail.com', '2', NULL, NULL, NULL, '1596874727177'),
(21, 'trangcc', NULL, '$2a$08$.fls3Zfrkkd6e9dCfGEgr.E3F8pBqGush7xe2M8QPc.3iUlYtQKGq', NULL, NULL, 'nguyen1223@gmail.com', '0', NULL, NULL, NULL, '1596607721906'),
(22, 'thinhc', 'Huynh Kieu Thinh', '$2a$08$N44cExZHJk7KvWbkpkvELuJ4.j8B/D/SVcR.CQf5O9aIYSWw9cPtu', '14/08/2020', NULL, 'ngoctri492017@gmail.com', '0', 'HKT', NULL, NULL, '1596874397018'),
(23, 'tiencc', NULL, '$2a$08$CdBnwuoHW7j4ong7adRJOeKTiMN0p8I7LwCqAMgbUIf5NIgGYZ6mS', NULL, NULL, 'nguyenthai492018@gmail.com', '0', NULL, NULL, NULL, '1596618264612'),
(24, 'minh', NULL, '$2a$08$Slt3jpZkn0hHh3yzeTAR4uMIj53kzrJcSotpWmEZN1YUFwagmDUIO', NULL, NULL, 'nguyenthai492018@gmail.com', '0', NULL, NULL, NULL, '1596705326603'),
(25, 'aaa', NULL, '$2a$08$9gTBto5VqyeF610apKCY7ebDnEl0fVCDTUhVORr8E7i/q0l1YUDU2', NULL, NULL, 'nguyen1223@gmail.com', '0', NULL, NULL, NULL, '-1'),
(26, 'ddd', NULL, '$2a$08$GtKMqG5WQ28QbhCVpro4UuZyr.vVlBHDq9115nKgsNO4Yc3UMf4w6', NULL, NULL, 'ngoctri5@gmail.com', '0', NULL, NULL, NULL, '1596980339378'),
(27, 'nguyenthai12', NULL, '$2a$08$XWh5QllvtT5QeavipUScA.2v9CymJFHGXMTDAaa7V9MUQHa/Nih92', NULL, NULL, 'ngoctri5@gmail.com', '0', NULL, NULL, NULL, '-1'),
(28, 'ngthaiii', NULL, '$2a$08$x7g38MH.hZaWgNuq.5uwoOPX.zoJgmA36ZMQKPmFwyOOtWOyT0L0e', NULL, NULL, 'nguyen1223@gmail.com', '0', NULL, NULL, NULL, '1596985124501');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatID`) USING BTREE,
  ADD KEY `FK_Cat_User` (`Manager`) USING BTREE;

--
-- Indexes for table `category_child`
--
ALTER TABLE `category_child`
  ADD PRIMARY KEY (`CatChild_ID`) USING BTREE,
  ADD KEY `FK_CatChild_Cat` (`CatID`) USING BTREE;

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CmtID`) USING BTREE,
  ADD KEY `FK_Cmt_User` (`UserID`) USING BTREE,
  ADD KEY `FK_Cmt_News` (`NewsID`) USING BTREE;

--
-- Indexes for table `editor_cat`
--
ALTER TABLE `editor_cat`
  ADD PRIMARY KEY (`EditorCat_ID`) USING BTREE,
  ADD KEY `FK_EditCat_User` (`UserID`) USING BTREE,
  ADD KEY `FK_EditCat_Cat` (`CatID`) USING BTREE;

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`NewsID`) USING BTREE,
  ADD KEY `FK_News_Status` (`Status`) USING BTREE,
  ADD KEY `FK_News_CatChild` (`CatChild_ID`) USING BTREE,
  ADD KEY `FK_News_User` (`Author`) USING BTREE;
ALTER TABLE `news` ADD FULLTEXT KEY `ft_NewsTitle` (`NewsTitle`);

--
-- Indexes for table `news_status`
--
ALTER TABLE `news_status`
  ADD PRIMARY KEY (`StatusID`) USING BTREE;

--
-- Indexes for table `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`PreID`) USING BTREE,
  ADD KEY `FK_Pre_User` (`UserID`) USING BTREE;

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`TagID`) USING BTREE,
  ADD KEY `FK_Tag_News` (`NewsID`) USING BTREE;

--
-- Indexes for table `type_of_user`
--
ALTER TABLE `type_of_user`
  ADD PRIMARY KEY (`TypeID`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`) USING BTREE,
  ADD KEY `FK_Type_User` (`TypeOfUser`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_child`
--
ALTER TABLE `category_child`
  MODIFY `CatChild_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CmtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `editor_cat`
--
ALTER TABLE `editor_cat`
  MODIFY `EditorCat_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `NewsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `news_status`
--
ALTER TABLE `news_status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `premium`
--
ALTER TABLE `premium`
  MODIFY `PreID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `type_of_user`
--
ALTER TABLE `type_of_user`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_child`
--
ALTER TABLE `category_child`
  ADD CONSTRAINT `FK_CatChild_Cat` FOREIGN KEY (`CatID`) REFERENCES `category` (`CatID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_Cmt_News` FOREIGN KEY (`NewsID`) REFERENCES `news` (`NewsID`),
  ADD CONSTRAINT `FK_Cmt_User` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `editor_cat`
--
ALTER TABLE `editor_cat`
  ADD CONSTRAINT `FK_EditCat_Cat` FOREIGN KEY (`CatID`) REFERENCES `category` (`CatID`),
  ADD CONSTRAINT `FK_EditCat_User` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `FK_Pre_User` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `FK_Tag_News` FOREIGN KEY (`NewsID`) REFERENCES `news` (`NewsID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
