USE [master]
GO
/****** Object:  Database [Rentals]    Script Date: 30.07.2021 18:55:12 ******/
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
/****** Object:  Table [dbo].[Equipment]    Script Date: 30.07.2021 18:55:12 ******/
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
/****** Object:  Table [dbo].[Loan]    Script Date: 30.07.2021 18:55:13 ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 30.07.2021 18:55:13 ******/
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
/****** Object:  Table [dbo].[Translation]    Script Date: 30.07.2021 18:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[TranslationID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageCode] [nchar](10) NOT NULL,
	[Tag] [nchar](50) NOT NULL,
	[Text] [nchar](500) NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Translation] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Translation] ([TranslationID])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Translation]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeletePerson]    Script Date: 30.07.2021 18:55:13 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetGetTranslatedText]    Script Date: 30.07.2021 18:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetGetTranslatedText]
	-- Add the parameters for the stored procedure here
	@tag varchar(10),
	@language_code varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [Text]
	FROM [Rentals].[dbo].[Translation]
	WHERE [LanguageCode] = @language_code AND [Tag] = @tag
END
GO
USE [master]
GO
ALTER DATABASE [Rentals] SET  READ_WRITE 
GO
