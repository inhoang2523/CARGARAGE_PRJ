USE [master]
GO
/****** Object:  Database [CarManagement]    Script Date: 7/20/2023 7:00:28 PM ******/
CREATE DATABASE [CarManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarManagement', FILENAME = N'D:\CarManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarManagement_log', FILENAME = N'D:\CarManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CarManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [CarManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CarManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarManagement', N'ON'
GO
ALTER DATABASE [CarManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [CarManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CarManagement]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/20/2023 7:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderdetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[carid] [char](5) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderdetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/20/2023 7:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[status] [int] NULL,
	[userid] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCars]    Script Date: 7/20/2023 7:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCars](
	[id] [char](5) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[speed] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[image] [varchar](100) NULL,
	[origin] [nvarchar](50) NULL,
	[fuel] [nvarchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblCars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/20/2023 7:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](500) NOT NULL,
	[roleID] [char](2) NOT NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([orderdetailID], [orderid], [carid], [quantity]) VALUES (3, 3, N'C002 ', 1)
GO
INSERT [dbo].[OrderDetails] ([orderdetailID], [orderid], [carid], [quantity]) VALUES (4, 3, N'C004 ', 2)
GO
INSERT [dbo].[OrderDetails] ([orderdetailID], [orderid], [carid], [quantity]) VALUES (5, 4, N'C001 ', 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([id], [createdate], [status], [userid]) VALUES (3, CAST(N'2023-07-07' AS Date), 1, N'in')
GO
INSERT [dbo].[Orders] ([id], [createdate], [status], [userid]) VALUES (4, CAST(N'2023-07-07' AS Date), 1, N'in')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C001 ', N'ALPHARD LUXURY', N'Versatile design', 458000000, 7, 1, N'alpha', N'Japan', N'Gasoline', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C002 ', N'HILUX 2.4L 4X2 AT', N'Pickup', 852000000, 5, 1, N'hilux', N'Thailand', N'Oil', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C003 ', N'CAMRY 2.0G', N'Sedan', 1105000000, 5, 1, N'camry2g', N'Thailand', N'Gasoline', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C004 ', N'CAMRY 2.5HV', N'Sedan', 1495000000, 5, 1, N'camry25', N'Thailand', N'Gasoline + Electricity', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C005 ', N'COROLLA ALTIS 1.8V', N'Sedan', 765000000, 5, 1, N'corola', N'Thailand', N'Gasoline', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C006 ', N'COROLLA CROSS 1.8G', N'
Sporty Versatile Design', 755000000, 5, 1, N'corolacross', N'Thailand', N'Gasoline', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C007 ', N'FORTUNER 2.4MT 4X2', N'
Sporty Versatile Design', 1026000000, 7, 1, N'fortuner', N'Vietnam', N'Oil', 999)
GO
INSERT [dbo].[tblCars] ([id], [name], [description], [price], [speed], [status], [image], [origin], [fuel], [quantity]) VALUES (N'C008 ', N'VELOZ CROSS CVT', N'Versatile design', 658000000, 7, 1, N'veloz', N'Vietnam', N'Gasoline', 999)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'admin', N'Administrator', N'AD', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'ban', N'ban ban', N'US', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'gau', N'gaugau', N'AD', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'in', N'Yen', N'US', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'iweuriewur', N'fjkdfjklsj', N'US', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'pp', N'phuong', N'US', N'1')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'sdfdsf', N'gfgdf', N'US', N'1')
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_tblCars] FOREIGN KEY([carid])
REFERENCES [dbo].[tblCars] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_tblCars]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_tblUsers] FOREIGN KEY([userid])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [CarManagement] SET  READ_WRITE 
GO
