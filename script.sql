USE [master]
GO
/****** Object:  Database [Book_Reviewing]    Script Date: 12/7/2019 1:28:06 PM ******/
CREATE DATABASE [Book_Reviewing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book_Reviewing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Book_Reviewing.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Book_Reviewing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Book_Reviewing_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Book_Reviewing] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_Reviewing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_Reviewing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_Reviewing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_Reviewing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_Reviewing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_Reviewing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_Reviewing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book_Reviewing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_Reviewing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_Reviewing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_Reviewing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_Reviewing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_Reviewing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_Reviewing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_Reviewing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_Reviewing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Book_Reviewing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_Reviewing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_Reviewing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_Reviewing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_Reviewing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_Reviewing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_Reviewing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_Reviewing] SET RECOVERY FULL 
GO
ALTER DATABASE [Book_Reviewing] SET  MULTI_USER 
GO
ALTER DATABASE [Book_Reviewing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_Reviewing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_Reviewing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_Reviewing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Book_Reviewing] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Book_Reviewing', N'ON'
GO
USE [Book_Reviewing]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/7/2019 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Image] [nvarchar](500) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/7/2019 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[client]    Script Date: 12/7/2019 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/7/2019 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [ntext] NOT NULL,
	[BookID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (2, N'The Caribbean of Costa Rica', 7, N'13.jpg', N'Gill PheLan', N'Cuốn sách nói về 
cung cấp cho bạn một cái nhìn bên trong về lý do tại sao phía caribbean của costa rica có thể nắm giữ một số cơ hội bất động sản tốt nhất và cơ hội để sống một lối sống thư giãn và giá cả phải chăng')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (3, N'Harry Potter', 1, N'14.jpg', N'J.K.Rowling', N'Bộ tiểu thuyết Harry Potter là câu chuyện xoay quanh ba người bạn phù thuỷ thân thiết với nhau: Harry Potter, Ron Weasley và Hermione Granger. Họ đã vô tình gặp nhau tại trường Phù thủy và Pháp sư Hogwarts. Câu chuyện xảy ra trong thế giới pháp thuật nhưng được liên kết với thế phi pháp thuật một cách khéo léo, tinh tế. 

Kể từ khi ra đời Harry đã là một đứa trẻ nổi tiếng bởi sự đặc biệt của mình. Vết sẹo trên trán minh chứng điều đó – Harry là người duy nhất chúa tể hắc ám Voldemort không đánh bại được. Sau khi lời nguyền Chết chóc Avada Kedavra bị bật lại, chúa tể hắc ám biến mất đột ngột thì không ai biết hắn còn sống hay đã chết. Các tử thần thực tử vẫn luôn đi tìm hắn với ước vọng sẽ khôi phục lại sức mạnh và thống trị thế giới pháp thuật một lần nữa. 

Sau khi cha mẹ của Harry là James Potter và Lily bị chúa tể hắc ám giết chết tại thung lũng Godric – nơi Harry được sinh ra, bác Hagrid đã mang cậu đến nhà dì dượng gửi gắm. Đây cũng chính là nơi cậu trải qua 10 năm đau khổ thời thơ ấu: không tình thương, không sự quan tâm và không hiểu vì sao.

Khi lên mười cậu được Hiệu trưởng trường Hogwarts – Albus Dumbledore nhận về trường. Ở đây cậu đã gặp được những người bạn tốt và  bắt đầu cuộc phiêu liêu kỳ thú của mình ở thế giới pháp thuật thần kỳ.

Câu chuyện đấu tranh thiện – ác vẫn chưa đến hồi kết khi chúa tể hắc ám Voldemort một lần nữa làm đảo lộn thế giới pháp thuật. Lần trở về đầy thù hận này, quyết tâm thống trị thế giới của chúa tể hắc ám càng thêm mạnh mẽ. Harry bị lôi vào cuộc chiến như một nhân tố quan trọng quyết định thắng bại. Cậu và những người bạn đã gặp không ít khó khăn trong cuộc chiến sinh tồn nhưng với sự dũng cảm, thông minh và tình thương bao la họ đã cùng nhau tiêu diệt chúa tể hắc ám, đập tan mọi âm mưu đen tối của tử thần thực tử.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (4, N'Shaping Humanity', 1, N'16.jpg', N'Rachel Feelman', N'Định hình nhân loại: Làm thế nào chúng ta có thể vẽ một bức tranh của một người đã sống và chết sáu triệu năm trước, được thông báo ít hơn so với các cổ vật thô sơ và các bộ xương hiếm, không đầy đủ? Mô hình hóa bình minh của con người thông qua sự xuất hiện và hành vi của tổ tiên chúng ta không chỉ là phỏng đoán đơn giản. Shaping Humanity tiết lộ những bí mật về cách nghệ sĩ Gurche tái tạo lại tổ tiên linh trưởng ban đầu của chúng ta từ những mảnh xương đơn thuần. Sử dụng những hình ảnh và hình ảnh tuyệt đẹp, ông mô tả chính xác cách ông rút ra từ các nghiên cứu về cơ bắp thời hiện đại và thậm chí các đặc điểm trên khuôn mặt của mình để biến những bộ xương vỡ vụn thành những tác phẩm điêu khắc và hình ảnh gợi cảm xuất hiện trong các bảo tàng, tạp chí, tạp chí và sách giáo khoa trên toàn thế giới.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (5, N'Creating your own Destiny', 1, N'17.jpg', N'Patrick Snow', N'Tạo số phận của riêng bạn giải thích và chứng minh cho đa số cách mơ ước, lập kế hoạch và thực hiện một tương lai tốt hơn - bất chấp những thách thức của nền kinh tế và hoàn cảnh sống.

Dựa trên các nguyên tắc, lý thuyết và nghiên cứu trường hợp được tôn trọng theo thời gian Cung cấp Bản đồ thành công cho tất cả những người đang tìm cách đạt được thành công nhưng những người không hài lòng với nghề nghiệp của họ. Được viết với giọng điệu dễ nghe và dễ tiếp cận bởi Patrick Snow, người được mệnh danh là "Trưởng khoa định mệnh"
Với các công cụ mạnh mẽ và thiết thực có trong hướng dẫn cần thiết này, bạn sẽ thấy mình mới được trao quyền và tiếp thêm năng lượng để đạt được kết quả phi thường.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (6, N'Blue Like Jazz', 1, N'18.jpg', N'Donald Miller', N'Tôi không thể phủ nhận rằng có một chút e ngại về cuốn sách này trước khi tôi bắt đầu nó, mặc dù tôi đã không đọc bất kỳ đánh giá chi tiết nào và có ít ý tưởng về nội dung. Chỉ vài ngày trước khi tôi bắt đầu đọc, tôi dường như đã có một cuộc phỏng vấn với tác giả, Donald Miller, trong Tạp chí The Door Magazine, trong đó anh ta đã mỉa mai và khá thô thiển (đánh giá bằng số lượng từ phải viết ngoài). Nó để lại cho tôi một ấn tượng về tác giả không hoàn toàn thuận lợi.

Mặc dù có những hiểu lầm, tôi thấy rằng tôi thích cuốn sách này hơn tôi nghĩ tôi có thể. Điều đó không có nghĩa là nó không có vấn đề và không có vấn đề nghiêm trọng nào. Nhưng tôi rất thích giai điệu lan man, đàm thoại của cuốn sách, ngay cả khi đôi lúc hơi khó theo dõi. Trong thực tế, có những lúc nó hết sức khó chịu khi tác giả tung ra những câu chuyện về những người Cộng hòa hoặc Cơ đốc giáo truyền thống. Ông khéo léo tán thưởng Bill Clinton trong khi chê bai George Bush. Ông cười nhạo báng tại các nhà thờ truyền thống, nhưng khẳng định việc ông thích Thánh lễ Công giáo và Nhà thờ Chính thống Hy Lạp. Và trong suốt thời gian đó, anh ta tự nhận xét về bản thân và thể hiện bản thân bằng những từ ngữ thường bị coi là không phù hợp với một cuốn sách Cơ đốc giáo (đá đá vào mông, đắm đuối, đắm đuối, vụng, v.v.

Vì vậy, những gì tôi đã thích về cuốn sách? Màu xanh như Jazzđược xây dựng xung quanh một tiền đề âm thanh - rằng đức tin Kitô giáo tiếp tục có liên quan ngay cả trong một nền văn hóa hậu hiện đại. Miller viết, tôi không nghĩ rằng bất kỳ nhà thờ nào cũng có liên quan đến văn hóa, với cuộc đấu tranh của con người, trừ khi họ tin vào Chúa Giêsu và sức mạnh của Phúc âm của ông (trang 111). Tôi hoàn toàn đồng ý rằng nhà thờ chỉ có thể liên quan đến văn hóa nếu nó duy trì tính trung tâm của phúc âm và vẫn không hổ thẹn với thông điệp đơn giản đó. Thật không may, thông điệp phúc âm trở nên hơi mờ nhạt trong cuốn sách này. Tiết [Thông điệp trung tâm của Chúa Kitô] là con người phạm tội chống lại Thiên Chúa và Thiên Chúa đã ban thế giới cho con người, và nếu ai đó muốn được giải cứu khỏi đó, nếu ai đó thấy tất cả đều trống rỗng, thì Chúa Kitô sẽ giải cứu họ nếu họ muốn đỉnh chíp (trang 124). Kinh thánh, tuy nhiên, dạy rằng không ai muốn được giải cứu. Thiên Chúa cần phải bắt đầu một công việc trước đó để thu hút mọi người đến với chính mình. Miller, mặt khác, dạy rằng có một cái gì đó bên trong chúng ta thu hút Thiên Chúa đến với chúng ta. Tôi nhận ra, sau khi đọc những Tin Mừng đó, Chúa Giêsu không yêu tôi theo nguyên tắc; Anh ấy không chỉ yêu tôi vì đó là điều đúng đắn. Thay vào đó, có một cái gì đó bên trong tôi khiến Ngài yêu tôi, (trang 238). Khi chúng ta thừa nhận rằng có một cái gì đó bên trong chúng ta thu hút Thiên Chúa đến với chúng ta, chúng ta phủ nhận rằng chính ân sủng của Ngài đã cứu chúng ta, vì theo định nghĩa, ân sủng là vô hạn. Không có gì trong chúng ta làm cho chúng ta xứng đáng với Chúa. Ngài yêu thương chúng ta vì một điều gì đó bên trong chính Ngài chứ không phải bên trong chúng ta. sau khi đọc những Tin Mừng đó, Chúa Giê-su không yêu tôi theo nguyên tắc; Anh ấy không chỉ yêu tôi vì đó là điều đúng đắn. Thay vào đó, có một cái gì đó bên trong tôi khiến Ngài yêu tôi, (trang 238). Khi chúng ta thừa nhận rằng có một cái gì đó bên trong chúng ta thu hút Thiên Chúa đến với chúng ta, chúng ta phủ nhận rằng chính ân sủng của Ngài đã cứu chúng ta, vì theo định nghĩa, ân sủng là vô hạn. Không có gì trong chúng ta làm cho chúng ta xứng đáng với Chúa. Ngài yêu thương chúng ta vì một điều gì đó bên trong chính Ngài chứ không phải bên trong chúng ta. sau khi đọc những Tin Mừng đó, Chúa Giê-su không yêu tôi theo nguyên tắc; Anh ấy không chỉ yêu tôi vì đó là điều đúng đắn. Thay vào đó, có một cái gì đó bên trong tôi khiến Ngài yêu tôi, (trang 238). Khi chúng ta thừa nhận rằng có một cái gì đó bên trong chúng ta thu hút Thiên Chúa đến với chúng ta, chúng ta phủ nhận rằng chính ân sủng của Ngài đã cứu chúng ta, vì theo định nghĩa, ân sủng là vô hạn. Không có gì trong chúng ta làm cho chúng ta xứng đáng với Chúa. Ngài yêu thương chúng ta vì một điều gì đó bên trong chính Ngài chứ không phải bên trong chúng ta. theo định nghĩa, ưu ái Không có gì trong chúng ta làm cho chúng ta xứng đáng với Chúa. Ngài yêu thương chúng ta vì một điều gì đó bên trong chính Ngài chứ không phải bên trong chúng ta. theo định nghĩa, ưu ái Không có gì trong chúng ta làm cho chúng ta xứng đáng với Chúa. Ngài yêu thương chúng ta vì một điều gì đó bên trong chính Ngài chứ không phải bên trong chúng ta.

Tôi cũng thích các khía cạnh khác của cuốn sách. Gian hàng xưng tội ngược giúp cho việc đọc tuyệt vời, cũng như nhiều câu chuyện khác của Miller. Mặc dù có một số nền thần học kém, ông đã cho tôi rất nhiều suy nghĩ, đặc biệt là liên quan đến việc đưa thần học vượt ra khỏi cửa nhà thờ và thực sự biến nó thành thực hành.

Tuy nhiên, tôi tin rằng sự thất bại lớn của cuốn sách này là niềm tin của tác giả rằng Cơ đốc giáo là một cảm giác, và không phải là thứ có thể giải thích hay hiểu một cách hợp lý. Đầu cuốn sách, ở trang 54, Miller viết rằng Chúa không có ý nghĩa gì. Chỉ vài trang sau, ông viết rằng Linh đạo Kitô giáo là thứ không thể giải thích được, nhưng là thứ chỉ có thể cảm nhận được. Không thể giải thích được, nhưng nó rất đẹp và chân thực. Đó là một cái gì đó bạn cảm thấy, và nó đến từ linh hồn (trang 57). Sau đó, ông viết, vào cuối ngày, khi tôi đang nằm trên giường và tôi biết cơ hội của bất kỳ nền thần học nào của chúng ta là chính xác là một triệu đối với một, tôi cần biết rằng Chúa có những điều đã tìm ra, rằng nếu Toán của tôi sai, chúng tôi vẫn sẽ ổn. Và tự hỏi là cảm giác mà chúng ta có được khi buông những câu trả lời ngớ ngẩn của mình, chúng tôi đã vạch ra những quy tắc mà chúng tôi muốn Chúa tuân theo. Tôi không nghĩ có sự thờ phượng nào tốt hơn kỳ diệu (trang 206).

Cách tiếp cận phi lý, dựa trên cảm xúc này đối với Kitô giáo phù hợp với tư tưởng hậu hiện đại, nơi kinh nghiệm hơn là một tiêu chuẩn khách quan là trọng tài của sự thật. Miller hiếm khi trở lại Kinh thánh, và thay vào đó, giải thích niềm tin của mình thông qua lăng kính kinh nghiệm của chính mình. Anh ta dường như tin tưởng vào kinh nghiệm thay vì có một niềm tin hợp lý vào một Thiên Chúa hợp lý, người thực sự có chủ quyền. Trên thực tế, tôi không nhớ bất kỳ tài liệu tham khảo cụ thể nào từ Kinh thánh - một điều kỳ lạ khi cho rằng cuốn sách tuyên bố là những suy nghĩ về Tâm linh Kitô giáo. Nhưng có lẽ những suy nghĩ về phi tôn giáo của người Viking đã ngăn cản việc sử dụng văn bản chứng minh Kinh thánh.

Thật kỳ lạ, khi đến cuối bài đánh giá này, tôi không hào hứng với cuốn sách hơn là khi đọc nó và suy ngẫm về nó sau đó. Mặc dù tôi có thể nói rằng tôi đã nhận được một số lợi ích từ việc đọc nó, tôi sẽ do dự khi giới thiệu nó cho người khác. Có một số giá trị được tìm thấy, nhưng người ta phải đào sâu bên dưới các lớp lan man không trung thực và thần học nghèo nàn để tìm thấy chúng. Có nhiều cuốn sách khác chứa nhiều kho báu hơn thế này.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (7, N'Web', 2, N'19.jpg', N'Nguyễn Việt Hà', N'Cuốn sách nói về các kĩ thuật lập trình web')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (8, N'Vợ nhặt1', 1, N'13.jpg', N'Nam Cao', N'Sau hai tháng đọc sách lịch sử châu Âu, mình nhớ và thèm lắm một chút hương vị Việt Nam. Ngày thi xong, tìm không thấy sách "Nạn đói 1945 ở Việt Nam - Những chứng tích lịch sử" nên đọc tạm "Vợ nhặt". Truyện như viên kẹo ngậm, chẳng đợi được tan đã bị mình cắn, nhai, nuốt rồi. Chưa đủ liều, mình đọc luôn cả bài phân tích mà Kim Lân nhận xét "nâng tầm Vợ Nhặt" của Nguyễn Thị Thu Trang.  Chẳng có gì ngỡ ngàng, một lần nữa mình được khẳng định bản thân là một sản phẩm thất bại của hệ thống giáo dục môn Ngữ văn. Đối với mình 12 năm học chỉ có "sinh tồn", không có cảm thụ văn học đích thực. Mình thấy tiếc cho những tác phẩm Việt Nam bị mình gắn mác "văn chương sách giáo khoa", có lẽ đã đến lúc đọc lại dưới một lăng kính khác, cho chúng cơ hội để khiến mình thực sự yêu thích hoặc ghét bỏ.  Trở lại với truyện ngắn, nếu tưởng tượng nạn đói năm Ất Dậu là một bức ảnh đen trắng cỡ bự thì "Vợ nhặt" chỉ chiếm một góc rất nhỏ. Hiện thực thảm khốc vẫn còn đó, ảnh đen trắng thì vẫn là ảnh đen trắng nhưng nhận thức của mình tự động thêm một chút xanh của cây, ánh vàng le lói của ngọn đèn dầu và lờ mờ sắc hồng của tình người. Đây có lẽ cũng là cách nhận thức đánh lừa xúc giác hay văn chương thay đổi góc nhìn xã hội vậy. Một thời gian nữa e là mình cũng chỉ lơ mơ nhớ về sự tồn tại của bà cụ Tứ, Tràng và vợ Tràng nhưng mình sẽ luôn nhớ về sắc màu đã xuất hiện đâu đó trong bức ảnh u ám ấy.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (9, N'Vợ nhặt2', 1, N'11.jpg', N'Nam Cao', N'Sau hai tháng đọc sách lịch sử châu Âu, mình nhớ và thèm lắm một chút hương vị Việt Nam. Ngày thi xong, tìm không thấy sách "Nạn đói 1945 ở Việt Nam - Những chứng tích lịch sử" nên đọc tạm "Vợ nhặt". Truyện như viên kẹo ngậm, chẳng đợi được tan đã bị mình cắn, nhai, nuốt rồi. Chưa đủ liều, mình đọc luôn cả bài phân tích mà Kim Lân nhận xét "nâng tầm Vợ Nhặt" của Nguyễn Thị Thu Trang.  Chẳng có gì ngỡ ngàng, một lần nữa mình được khẳng định bản thân là một sản phẩm thất bại của hệ thống giáo dục môn Ngữ văn. Đối với mình 12 năm học chỉ có "sinh tồn", không có cảm thụ văn học đích thực. Mình thấy tiếc cho những tác phẩm Việt Nam bị mình gắn mác "văn chương sách giáo khoa", có lẽ đã đến lúc đọc lại dưới một lăng kính khác, cho chúng cơ hội để khiến mình thực sự yêu thích hoặc ghét bỏ.  Trở lại với truyện ngắn, nếu tưởng tượng nạn đói năm Ất Dậu là một bức ảnh đen trắng cỡ bự thì "Vợ nhặt" chỉ chiếm một góc rất nhỏ. Hiện thực thảm khốc vẫn còn đó, ảnh đen trắng thì vẫn là ảnh đen trắng nhưng nhận thức của mình tự động thêm một chút xanh của cây, ánh vàng le lói của ngọn đèn dầu và lờ mờ sắc hồng của tình người. Đây có lẽ cũng là cách nhận thức đánh lừa xúc giác hay văn chương thay đổi góc nhìn xã hội vậy. Một thời gian nữa e là mình cũng chỉ lơ mơ nhớ về sự tồn tại của bà cụ Tứ, Tràng và vợ Tràng nhưng mình sẽ luôn nhớ về sắc màu đã xuất hiện đâu đó trong bức ảnh u ám ấy.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (10, N'Web1', 2, N'10.jpg', N'Nguyễn Việt Hà', N'Cuốn sách nói về các kĩ thuật lập trình web')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (11, N'Cơ sở dữ liệu2', 2, N'14.jpg', N'Lê Đăng Hưng', N'Cơ sở dữ liệu là nền tảng cho các hệ thống tính toán và xử lý thông tin. Cơ sở dữ liệu là một môn cơ bản trong ngành Khoa học Máy tính nói riêng và Công nghệ Thông tin nói chung ở cả bậc Đại học và Sau Đại học. Nghiên cứu và ứng dựng cơ sở dữ liệu bao gồm việc phát triển mô hình, xây dựng hệ quản trị và triển khai ứng dụng trong các hệ thống cụ thể.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (12, N'The Last Lecture', 1, N'15.jpg', N'Randy Pausch', N'Randy Pausch nguyên là giáo sư Khoa học Máy tính tại Đại học Carnegie Mellon, phân ngành Tương tác Người - Máy. Năm 2006, khi mới 46 tuổi, ông được chẩn đoán ung thư tụy và, không lâu sau, di căn sang gan và các cơ quan khác. Biết mình không còn sống được bao lâu, ông và vợ đã thu xếp cuộc sống như để bắt đầu chuyến đi xa, làm những điều mà ông muốn mọi người, đặc biệt là 3 đứa con, nhớ về mình. Nếu ông là họa sĩ, ông sẽ vẽ; nếu ông là nhà thơ, ông sẽ làm thơ tặng các con. Nhưng ông là nhà giáo, vậy nên ông giảng bài. Dự án to lớn nhất chính là Bài Giảng Cuối Cùng trên giảng đường Carnegie Mellon. Bải giảng mang tên “Để đạt được những ước mơ tuổi thơ”')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (13, N'The Last Lecture1 ', 2, N'13.jpg', N'Randy Pausch', N'Randy Pausch nguyên là giáo sư Khoa học Máy tính tại Đại học Carnegie Mellon, phân ngành Tương tác Người - Máy. Năm 2006, khi mới 46 tuổi, ông được chẩn đoán ung thư tụy và, không lâu sau, di căn sang gan và các cơ quan khác. Biết mình không còn sống được bao lâu, ông và vợ đã thu xếp cuộc sống như để bắt đầu chuyến đi xa, làm những điều mà ông muốn mọi người, đặc biệt là 3 đứa con, nhớ về mình. Nếu ông là họa sĩ, ông sẽ vẽ; nếu ông là nhà thơ, ông sẽ làm thơ tặng các con. Nhưng ông là nhà giáo, vậy nên ông giảng bài. Dự án to lớn nhất chính là Bài Giảng Cuối Cùng trên giảng đường Carnegie Mellon. Bải giảng mang tên “Để đạt được những ước mơ tuổi thơ”')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (30, N'Lão Hạc', 1, N'10.jpg', N'Nam Cao', N'Lão Hạc được đánh giá là một trong những truyện ngắn khá tiêu biểu của dòng văn học hiện thực, nội dung truyện đã phần nào phản ánh được hiện trạng xã hội Việt Nam trong giai đoạn trước Cách mạng tháng Tám.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (31, N'Vợ nhặt', 1, N'19.jpg', N'Nam Cao', N'Sau hai tháng đọc sách lịch sử châu Âu, mình nhớ và thèm lắm một chút hương vị Việt Nam. Ngày thi xong, tìm không thấy sách "Nạn đói 1945 ở Việt Nam - Những chứng tích lịch sử" nên đọc tạm "Vợ nhặt". Truyện như viên kẹo ngậm, chẳng đợi được tan đã bị mình cắn, nhai, nuốt rồi. Chưa đủ liều, mình đọc luôn cả bài phân tích mà Kim Lân nhận xét "nâng tầm Vợ Nhặt" của Nguyễn Thị Thu Trang.  Chẳng có gì ngỡ ngàng, một lần nữa mình được khẳng định bản thân là một sản phẩm thất bại của hệ thống giáo dục môn Ngữ văn. Đối với mình 12 năm học chỉ có "sinh tồn", không có cảm thụ văn học đích thực. Mình thấy tiếc cho những tác phẩm Việt Nam bị mình gắn mác "văn chương sách giáo khoa", có lẽ đã đến lúc đọc lại dưới một lăng kính khác, cho chúng cơ hội để khiến mình thực sự yêu thích hoặc ghét bỏ.  Trở lại với truyện ngắn, nếu tưởng tượng nạn đói năm Ất Dậu là một bức ảnh đen trắng cỡ bự thì "Vợ nhặt" chỉ chiếm một góc rất nhỏ. Hiện thực thảm khốc vẫn còn đó, ảnh đen trắng thì vẫn là ảnh đen trắng nhưng nhận thức của mình tự động thêm một chút xanh của cây, ánh vàng le lói của ngọn đèn dầu và lờ mờ sắc hồng của tình người. Đây có lẽ cũng là cách nhận thức đánh lừa xúc giác hay văn chương thay đổi góc nhìn xã hội vậy. Một thời gian nữa e là mình cũng chỉ lơ mơ nhớ về sự tồn tại của bà cụ Tứ, Tràng và vợ Tràng nhưng mình sẽ luôn nhớ về sắc màu đã xuất hiện đâu đó trong bức ảnh u ám ấy.')
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [Image], [Author], [Description]) VALUES (35, N'The Things They Carried', 1, N'8.jpg', N'Tim O''Brient', N'Một câu chuyện chân thực về chiến tranh, đó là mục đích của Tim O’Brien khi viết Những thứ họ mang, cho tới nay vẫn được đánh giá là một trong những tác phẩm văn chương hay nhất về cuộc chiến Việt Nam. Là Nỗi buồn chiến tranh phiên bản Mỹ, những Jimmy Cross, Chuột Kiley, Mitchell Sanders, Henry Dobbins hay Kiowa mang theo mình những vật dụng và vũ khí nặng nề cho các cuộc hành quân, và họ còn gánh vác cả những gì vô hình, có thể là tình yêu nhưng cũng có thể là niềm thù hận, nỗi sợ, và cả sự hèn nhát. “Cố cứu cuộc đời” sau này “bằng một câu chuyện kể”, Những thứ họ mang, trong niềm tuyệt vọng không sao thoát ra quá khứ của nó, xuất phát từ một thôi thúc nội tâm không thể kiểm soát và kết thúc bằng một niềm thanh thản tương đối, khi những câu chuyện ấy đã được kể ra, “những gì họ mang” đã nhẹ đi một phần.')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'Văn Học')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'Khoa học- Công nghệ')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (7, N'Du lịch')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (8, N'Giáo dục')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [username], [password], [email], [role]) VALUES (2, N'trang', N'123', N'trinhtrangmysk@gmail.com', 0)
INSERT [dbo].[client] ([id], [username], [password], [email], [role]) VALUES (4, N'thu', N'123456', N'lhq25998@gmail.com', 0)
INSERT [dbo].[client] ([id], [username], [password], [email], [role]) VALUES (5, N'admin', N'11111', N'example@gmail.com', 1)
INSERT [dbo].[client] ([id], [username], [password], [email], [role]) VALUES (6, N'an', N'123', N'n16dccn163@student.ptithcm.edu.vn', 0)
INSERT [dbo].[client] ([id], [username], [password], [email], [role]) VALUES (157, N'minh vu', N'235', N'example1@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[client] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [Comment], [BookID], [ClientID]) VALUES (4, N'Một cuốn sách hay đáng để đọc.', 13, 2)
INSERT [dbo].[Comment] ([ID], [Comment], [BookID], [ClientID]) VALUES (5, N'Sách hay', 13, 6)
INSERT [dbo].[Comment] ([ID], [Comment], [BookID], [ClientID]) VALUES (6, N'Sách hay nên tìm đọc', 9, 6)
INSERT [dbo].[Comment] ([ID], [Comment], [BookID], [ClientID]) VALUES (8, N'Sách hay có ích', 7, 2)
INSERT [dbo].[Comment] ([ID], [Comment], [BookID], [ClientID]) VALUES (9, N'Sách hay nên đọc', 13, 2)
SET IDENTITY_INSERT [dbo].[Comment] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Book]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_client]
GO
USE [master]
GO
ALTER DATABASE [Book_Reviewing] SET  READ_WRITE 
GO
