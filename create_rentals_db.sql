USE [master]
GO
/****** Object:  Database [Rentals]    Script Date: 31.08.2021 19:36:27 ******/
CREATE DATABASE [Rentals]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rentals', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Rentals.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rentals_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Rentals_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Rentals] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Rentals]
GO
/****** Object:  Table [dbo].[Access]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Access](
	[AccessID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](100) NULL,
	[Password] [nchar](100) NULL,
	[Role] [nchar](10) NULL,
	[LanguageID] [int] NULL,
 CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 31.08.2021 19:36:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageCode] [varchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 31.08.2021 19:36:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 31.08.2021 19:36:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[TranslationID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Tag] [nchar](50) NOT NULL,
	[Text] [nchar](500) NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Access] ON 
GO
INSERT [dbo].[Access] ([AccessID], [UserName], [Password], [Role], [LanguageID]) VALUES (1, N'rune                                                                                                ', N'4c7a68e57f77681c97f34670f505e6230fead48948350d5d8685c7f652f044bd:bc59461f6675450a9d3039856b1d3a4c   ', N'ADMIN     ', 1)
GO
INSERT [dbo].[Access] ([AccessID], [UserName], [Password], [Role], [LanguageID]) VALUES (2, N'ivar                                                                                                ', N'3009b0c8aba8dc7be358aeed08a11a5895e104dfbd8da44fccb265c1f0ef9eaf:583e7bac4a5241739aa4da2936b6680c   ', N'SUPER     ', 1)
GO
INSERT [dbo].[Access] ([AccessID], [UserName], [Password], [Role], [LanguageID]) VALUES (3, N'lotte                                                                                               ', N'5982e3e8d698bc0c17e3d353548e34527e4ff53022f4197ca3a014906ddca27b:68b6bef26a694c95858ea07397d7701d   ', N'USER      ', 14)
GO
SET IDENTITY_INSERT [dbo].[Access] OFF
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
INSERT [dbo].[Equipment] ([EquipmentID], [Barcode], [Type], [Name], [Status], [Description], [Accessories]) VALUES (8, CAST(1234 AS Numeric(18, 0)), NULL, N'2134      ', N'Lager:    ', N'2134      ', N'3214      ')
GO
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 
GO
INSERT [dbo].[Language] ([LanguageID], [LanguageCode]) VALUES (1, N'EN')
GO
INSERT [dbo].[Language] ([LanguageID], [LanguageCode]) VALUES (4, N'FI')
GO
INSERT [dbo].[Language] ([LanguageID], [LanguageCode]) VALUES (14, N'GE')
GO
SET IDENTITY_INSERT [dbo].[Language] OFF
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
INSERT [dbo].[Person] ([PersonID], [IdentityNumber], [Name], [Mobile], [Role], [Class]) VALUES (46, CAST(999 AS Numeric(18, 0)), N'Serine    ', N'123 45 678', N'ELEV      ', N'FAM       ')
GO
INSERT [dbo].[Person] ([PersonID], [IdentityNumber], [Name], [Mobile], [Role], [Class]) VALUES (48, CAST(999 AS Numeric(18, 0)), N'Serine    ', N'123 45 678', N'ELEV      ', N'FAM       ')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Translation] ON 
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (1, 1, N'TYPEPWD                                           ', N'Please type your password:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (2, 1, N'TYPEUSERNAME                                      ', N'Please type your username:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (3, 1, N'WELCOME                                           ', N'*** Welcome to ITM rentals sytem ***                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (7, 1, N'USERNAME                                          ', N'*** Username:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (8, 1, N'ACCESSLEVEL                                       ', N'*** Access:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (9, 1, N'LANGUAGE                                          ', N'*** User language:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (10, 1, N'LOGIN                                             ', N'*** Logon for  ITM Rentals system***                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (11, 1, N'USERAUTH                                          ', N'*** User authentication:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (12, 1, N'REGLOAN                                           ', N'01. Register loan*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (13, 1, N'RETURN                                            ', N'02. Return*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (14, 1, N'VIEWLOANS                                         ', N'03. View loans*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (70, 4, N'TYPEPWD                                           ', N'Kirjoita salasanasi:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (71, 4, N'TYPEUSERNAME                                      ', N'Kirjoita käyttäjätunnuksesi:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (72, 4, N'WELCOME                                           ', N'*** Tervetuloa ITM -vuokrausjärjestelmään ***                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (73, 4, N'USERNAME                                          ', N'*** Käyttäjätunnus:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (74, 4, N'ACCESSLEVEL                                       ', N'*** Pääsy:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (75, 4, N'LANGUAGE                                          ', N'*** Käyttäjän kieli:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (76, 4, N'LOGIN                                             ', N'*** Kirjautuminen ITM -vuokrausjärjestelmään ***                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (77, 4, N'USERAUTH                                          ', N'*** Käyttäjän todennus:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (78, 4, N'REGLOAN                                           ', N'01. Rekisteröi laina*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (79, 4, N'RETURN                                            ', N'02. Paluu*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (80, 4, N'VIEWLOANS                                         ', N'03. Näytä lainat*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (96, 1, N'AUTOTRANSMENUS                                    ', N'35. Auto translate menues                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (99, 4, N'AUTOTRANSMENUS                                    ', N'35. Automaattiset valikot                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (100, 1, N'PRESSENTER                                        ', N'Press ENTER to continue                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (103, 4, N'PRESSENTER                                        ', N'Jatka painamalla ENTER                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (104, 14, N'TYPEPWD                                           ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (105, 14, N'TYPEUSERNAME                                      ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (106, 14, N'WELCOME                                           ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (107, 14, N'USERNAME                                          ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (108, 14, N'ACCESSLEVEL                                       ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (109, 14, N'LANGUAGE                                          ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (110, 14, N'LOGIN                                             ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (111, 14, N'USERAUTH                                          ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (112, 14, N'REGLOAN                                           ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (113, 14, N'RETURN                                            ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (114, 14, N'VIEWLOANS                                         ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (115, 14, N'AUTOTRANSMENUS                                    ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Translation] ([TranslationID], [LanguageID], [Tag], [Text]) VALUES (116, 14, N'PRESSENTER                                        ', N'NOT_TRANSLATED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
SET IDENTITY_INSERT [dbo].[Translation] OFF
GO
ALTER TABLE [dbo].[Access]  WITH CHECK ADD  CONSTRAINT [FK_Access_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Access] CHECK CONSTRAINT [FK_Access_Language]
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
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Translation] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Translation]
GO
/****** Object:  StoredProcedure [dbo].[GetTextsToTranslate]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTextsToTranslate]
	-- Add the parameters for the stored procedure here
	@DestLanguage varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tag], [Text]
  FROM [Rentals].[dbo].[Translation]
  WHERE [TranslationID] = 1 -- EN
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddLanguage]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddLanguage] 
	-- Add the parameters for the stored procedure here
	@LanguageCode varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert new language
	INSERT INTO [dbo].[Language] ([LanguageCode])
    VALUES (@LanguageCode)


	declare @LanguageID int = @@Identity

	-- Clear out any Translations that already exists
	DELETE FROM [dbo].[Translation]
    WHERE [LanguageID] = @LanguageID

	-- Insert a row for each Translation for new language
	INSERT INTO [dbo].[Translation] ([LanguageID], [Tag], [Text])
	SELECT  @LanguageID AS [LanguageID], [Tag], 'NOT_TRANSLATED' AS [Text]
	FROM [Rentals].[dbo].[Translation]
	WHERE [LanguageID] = 1 /* EN */
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ChangePassword]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ChangePassword]
	-- Add the parameters for the stored procedure here
	@UserName varchar(100),
	@UserPassword varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		UPDATE [dbo].[Access]
		SET [Password] = @UserPassword
		WHERE [UserName] = @UserName
	END TRY
	BEGIN CATCH
		/*SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage	*/
	END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeletePerson]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Berg, Rune
-- Create date: 19.97.2021
-- Description:	Deletes a spesicied person
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeletePerson] 
	-- Add the parameters for the stored procedure here
	@IdentityNumber numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	BEGIN TRY
	    DELETE FROM dbo.Person 
		WHERE IdentityNumber = @IdentityNumber
	END TRY
	BEGIN CATCH
		/*SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage	*/
	END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TRANS_AddTag]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TRANS_AddTag] 
	-- Add the parameters for the stored procedure here
	@tag varchar(100),
	@text_eng varchar(1000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @languageid int

	DECLARE lang_cursor CURSOR FOR 
	SELECT LanguageID 
	FROM Language 

	OPEN lang_cursor  
	FETCH NEXT FROM lang_cursor INTO @languageid  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		
		IF @languageid = 1
		BEGIN
			INSERT INTO Translation ([LanguageID], [Tag], [Text])		
			VALUES (@languageid
			   ,@tag
			   ,@text_Eng)
		END
		ELSE
		BEGIN
			INSERT INTO Translation ([LanguageID], [Tag], [Text])		
			VALUES (@languageid
			   ,@tag
			   ,'NOT_TRANSLATED')
		end

		FETCH NEXT FROM lang_cursor INTO @languageid 
	END 

	CLOSE lang_cursor  
	DEALLOCATE lang_cursor 

    -- Insert statements for procedure here

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TRANS_GetGetTranslatedText]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TRANS_GetGetTranslatedText]
	-- Add the parameters for the stored procedure here
	@tag varchar(50),
	@language_code varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [Text]
	FROM [Rentals].[dbo].[Translation]
	WHERE [Tag] = @tag
	AND [LanguageID] = 
		(SELECT [LanguageID]
        FROM [Rentals].[dbo].[Language]
		WHERE [LanguageCode] = @language_code)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TRANS_GetTranslationQueue]    Script Date: 31.08.2021 19:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TRANS_GetTranslationQueue]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP 5 a.TranslationID, a.LanguageID, b.LanguageCode, a.Tag, (SELECT TOP 1 Text FROM Translation WHERE LanguageID = 1 AND Tag = a.Tag) AS 'EngText'
	FROM Translation a, dbo.Language b
	WHERE a.LanguageID = b.LanguageID
	AND a.Text = 'NOT_TRANSLATED'


END
GO
USE [master]
GO
ALTER DATABASE [Rentals] SET  READ_WRITE 
GO
