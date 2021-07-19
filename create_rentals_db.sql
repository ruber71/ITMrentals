USE [master]
GO
/****** Object:  Database [Rentals]    Script Date: 10.01.2021 15:45:55 ******/
CREATE DATABASE [Rentals]
GO
ALTER DATABASE [Rentals] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rentals].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rentals] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rentals] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rentals] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rentals] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rentals] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rentals] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rentals] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rentals] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rentals] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rentals] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rentals] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rentals] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rentals] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rentals] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rentals] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rentals] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rentals] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rentals] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rentals] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rentals] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rentals] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rentals] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rentals] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rentals] SET  MULTI_USER 
GO
ALTER DATABASE [Rentals] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rentals] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rentals] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rentals] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rentals] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rentals] SET QUERY_STORE = OFF
GO
USE [Rentals]
GO
/****** Object:  User [test]    Script Date: 10.01.2021 15:45:55 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 10.01.2021 15:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [numeric](18, 0) NULL,
	[Type] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[Description] [nchar](10) NULL,
	[Accessories] [nchar](10) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 10.01.2021 15:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NULL,
	[PersonID] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10.01.2021 15:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[IdentityNumber] [numeric](18, 0) NULL,
	[Name] [nchar](10) NULL,
	[Mobile] [nchar](10) NULL,
	[Role] [nchar](10) NULL,
	[Class] [nchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (1, CAST(123 AS Numeric(18, 0)), N'1         ', N'Canon     ', N'Lager     ', NULL, N'Minnekort ')
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (2, CAST(111 AS Numeric(18, 0)), N'2         ', N'Nixon     ', N'Lager     ', NULL, NULL)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (3, CAST(222 AS Numeric(18, 0)), N'1         ', N'Canon     ', N'Lager     ', NULL, NULL)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (4, CAST(333 AS Numeric(18, 0)), N'2         ', N'JVC       ', N'Studio    ', NULL, NULL)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (5, CAST(444 AS Numeric(18, 0)), N'1         ', N'Canon     ', N'Studio    ', NULL, NULL)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (6, CAST(666 AS Numeric(18, 0)), N'1         ', N'JVC       ', N'Lager     ', NULL, NULL)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (7, CAST(777 AS Numeric(18, 0)), N'2         ', N'Sony      ', N'Utlånt    ', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Loan] ON 
GO
INSERT [dbo].[Loan] ([LoanID], [EquipmentID], [PersonID], [FromDate], [ToDate]) VALUES (2, 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Loan] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([PersonID], [IdentityNumber], [Name], [Mobile], [Role], [Class]) VALUES (1, CAST(123 AS Numeric(18, 0)), N'Rune      ', N'959 88 150', N'Lærer     ', N'          ')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Equipment]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Person]
GO
USE [master]
GO
ALTER DATABASE [Rentals] SET  READ_WRITE 
GO
