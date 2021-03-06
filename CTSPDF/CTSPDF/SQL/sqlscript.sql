USE [master]
GO
/****** Object:  Database [FeedbackApp]    Script Date: 4/30/2019 8:58:43 AM ******/
CREATE DATABASE [FeedbackApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FeedbackApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FeedbackApp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FeedbackApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FeedbackApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FeedbackApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FeedbackApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FeedbackApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FeedbackApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FeedbackApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FeedbackApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FeedbackApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [FeedbackApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FeedbackApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FeedbackApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FeedbackApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FeedbackApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FeedbackApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FeedbackApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FeedbackApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FeedbackApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FeedbackApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FeedbackApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FeedbackApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FeedbackApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FeedbackApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FeedbackApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FeedbackApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FeedbackApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FeedbackApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FeedbackApp] SET  MULTI_USER 
GO
ALTER DATABASE [FeedbackApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FeedbackApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FeedbackApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FeedbackApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FeedbackApp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FeedbackApp]
GO
/****** Object:  Table [dbo].[cse_summary_sixmonths_test]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cse_summary_sixmonths_test](
	[response_id] [int] IDENTITY(1,1) NOT NULL,
	[date_first] [datetime] NULL,
	[date_last] [datetime] NULL,
	[show_date] [datetime] NULL,
	[rock_star_winners] [varchar](max) NULL,
	[super_stars_winner] [varchar](150) NULL,
	[super_stars_winner_ave] [float] NULL,
	[super_stars_runnerup] [varchar](150) NULL,
	[super_stars_runnerup_ave] [float] NULL,
	[blazing_stars_winner] [varchar](150) NULL,
	[blazing_stars_winner_ave] [float] NULL,
	[blazing_stars_runnerup] [varchar](150) NULL,
	[blazing_stars_runnerup_ave] [float] NULL,
	[supporting_stars_winner] [varchar](150) NULL,
	[supporting_stars_winner_stars] [float] NULL,
	[supporting_stars_runnerup] [varchar](150) NULL,
	[supporting_stars_runnerup_stars] [float] NULL,
	[leading_stars_winners] [varchar](150) NULL,
	[leading_stars_winners_stars] [float] NULL,
	[leading_stars_runnerup] [varchar](150) NULL,
	[leading_stars_runnerup_stars] [float] NULL,
	[supporting_cast_winner] [varchar](150) NULL,
	[supporting_cast_winner_stars] [float] NULL,
	[supporting_cast_runnerup] [varchar](150) NULL,
	[supporting_cast_runnerup_stars] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CSEReduxResponses]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CSEReduxResponses](
	[response_id] [int] IDENTITY(1,1) NOT NULL,
	[submitter] [int] NOT NULL,
	[submitterdept] [int] NOT NULL,
	[employee] [int] NOT NULL,
	[employeedept] [int] NOT NULL,
	[rating1] [float] NULL,
	[rating2] [float] NULL,
	[rating3] [float] NULL,
	[rating4] [float] NULL,
	[rating5] [float] NULL,
	[commentpositive] [varchar](max) NULL,
	[commentnegative] [varchar](max) NULL,
	[star] [tinyint] NOT NULL CONSTRAINT [DF_CSEReduxResponses_commenttype]  DEFAULT ((1)),
	[commentdate] [datetime] NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_CSE_Responses_status]  DEFAULT ((0)),
	[approvedby] [int] NULL,
	[approveddate] [datetime] NULL,
	[execoffice_status] [int] NULL CONSTRAINT [DF_CSEReduxResponses_exeoffice_status]  DEFAULT ((0)),
	[execoffice_approvedby] [int] NULL CONSTRAINT [DF_CSEReduxResponses_execoffice_approvedby]  DEFAULT ((0)),
	[execoffice_date] [datetime] NULL,
 CONSTRAINT [PK_CSE_Responses] PRIMARY KEY CLUSTERED 
(
	[response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[donainsearch]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[donainsearch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainname] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_namefirst] [varchar](255) NOT NULL,
	[emp_namelast] [varchar](255) NOT NULL,
	[emp_status] [tinyint] NOT NULL,
	[emp_dept] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grouptable]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grouptable](
	[response_id] [int] IDENTITY(1,1) NOT NULL,
	[show_date] [datetime] NULL,
	[year] [int] NULL,
	[month] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[statussearch]    Script Date: 4/30/2019 8:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[statussearch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusname] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cse_summary_sixmonths_test] ON 

INSERT [dbo].[cse_summary_sixmonths_test] ([response_id], [date_first], [date_last], [show_date], [rock_star_winners], [super_stars_winner], [super_stars_winner_ave], [super_stars_runnerup], [super_stars_runnerup_ave], [blazing_stars_winner], [blazing_stars_winner_ave], [blazing_stars_runnerup], [blazing_stars_runnerup_ave], [supporting_stars_winner], [supporting_stars_winner_stars], [supporting_stars_runnerup], [supporting_stars_runnerup_stars], [leading_stars_winners], [leading_stars_winners_stars], [leading_stars_runnerup], [leading_stars_runnerup_stars], [supporting_cast_winner], [supporting_cast_winner_stars], [supporting_cast_runnerup], [supporting_cast_runnerup_stars]) VALUES (1, CAST(N'2019-04-04 00:00:00.000' AS DateTime), CAST(N'2019-10-10 00:00:00.000' AS DateTime), CAST(N'2019-10-10 00:00:00.000' AS DateTime), N'star rock winnders', N'superstarwinner', 5, N'superstarrunnerup', 5, N'blazzing start winner', 10, N'blazing star winner ', 10, N'supporting star winner', 15, N'supprting star rupperup', 2, N'leading srarwinners', 42, N'leading star runnerup', 432, N'supporting star runnerup', 23, N'supporting cartwinner', 42)
SET IDENTITY_INSERT [dbo].[cse_summary_sixmonths_test] OFF
SET IDENTITY_INSERT [dbo].[CSEReduxResponses] ON 

INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (1, 1, 1, 1, 1, 4, 5, 5, 5, 5, N'test', NULL, 4, CAST(N'2019-04-22 08:24:01.433' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (2, 1, 1, 1, 1, 5, 5, 4, 5, 5, N'test232', NULL, 5, CAST(N'2019-04-22 08:25:53.150' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (3, 1, 1, 1, 1, 5, 4, 4, 4, 4, N'test15213', NULL, 5, CAST(N'2019-04-22 08:32:01.610' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (4, 1, 1, 1, 1, 5, 4, 4, 4, 4, N'test15213', NULL, 5, CAST(N'2019-04-22 08:32:02.517' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (5, 1, 1, 1, 1, 3, 4, 2, 2, 2, N'my second recently', NULL, 3, CAST(N'2019-04-22 08:32:37.020' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (6, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'asd
', NULL, 1, CAST(N'2019-04-27 08:01:15.480' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CSEReduxResponses] ([response_id], [submitter], [submitterdept], [employee], [employeedept], [rating1], [rating2], [rating3], [rating4], [rating5], [commentpositive], [commentnegative], [star], [commentdate], [status], [approvedby], [approveddate], [execoffice_status], [execoffice_approvedby], [execoffice_date]) VALUES (7, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'Internet Exploerer test
', NULL, 1, CAST(N'2019-04-27 08:02:15.960' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CSEReduxResponses] OFF
SET IDENTITY_INSERT [dbo].[donainsearch] ON 

INSERT [dbo].[donainsearch] ([id], [domainname]) VALUES (1, N'1')
INSERT [dbo].[donainsearch] ([id], [domainname]) VALUES (2, N'2')
INSERT [dbo].[donainsearch] ([id], [domainname]) VALUES (3, N'3')
SET IDENTITY_INSERT [dbo].[donainsearch] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([emp_id], [emp_namefirst], [emp_namelast], [emp_status], [emp_dept]) VALUES (1, N'hitesh', N'sali', 1, 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[grouptable] ON 

INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (1, CAST(N'2018-12-21 03:31:39.000' AS DateTime), 2019, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (2, CAST(N'2018-09-01 15:36:49.000' AS DateTime), 2015, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (3, CAST(N'2018-05-21 09:33:11.000' AS DateTime), 2013, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (4, CAST(N'2017-08-24 07:05:29.000' AS DateTime), 2017, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (5, CAST(N'2018-08-06 15:17:54.000' AS DateTime), 2017, 12)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (6, CAST(N'2018-05-31 00:48:33.000' AS DateTime), 2018, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (7, CAST(N'2017-09-07 03:36:23.000' AS DateTime), 2017, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (8, CAST(N'2018-03-29 22:02:07.000' AS DateTime), 2011, 12)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (9, CAST(N'2018-11-07 06:15:40.000' AS DateTime), 2014, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (10, CAST(N'2017-07-19 00:22:03.000' AS DateTime), 2011, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (11, CAST(N'2019-03-27 08:48:50.000' AS DateTime), 2015, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (12, CAST(N'2017-12-17 16:07:56.000' AS DateTime), 2017, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (13, CAST(N'2017-07-19 09:42:01.000' AS DateTime), 2017, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (14, CAST(N'2019-04-24 03:43:01.000' AS DateTime), 2019, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (15, CAST(N'2019-01-25 21:16:28.000' AS DateTime), 2017, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (16, CAST(N'2017-10-21 12:47:52.000' AS DateTime), 2012, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (17, CAST(N'2019-04-17 23:33:57.000' AS DateTime), 2018, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (18, CAST(N'2018-06-23 03:20:49.000' AS DateTime), 2017, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (19, CAST(N'2018-03-18 17:22:05.000' AS DateTime), 2015, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (20, CAST(N'2018-08-09 10:03:07.000' AS DateTime), 2014, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (21, CAST(N'2017-06-22 11:00:25.000' AS DateTime), 2013, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (22, CAST(N'2017-11-02 18:01:06.000' AS DateTime), 2014, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (23, CAST(N'2017-09-29 08:22:01.000' AS DateTime), 2012, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (24, CAST(N'2018-04-14 21:53:30.000' AS DateTime), 2018, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (25, CAST(N'2017-09-24 02:30:28.000' AS DateTime), 2011, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (26, CAST(N'2018-11-30 09:56:11.000' AS DateTime), 2013, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (27, CAST(N'2018-07-26 11:14:13.000' AS DateTime), 2016, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (28, CAST(N'2018-10-18 10:30:39.000' AS DateTime), 2011, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (29, CAST(N'2018-09-04 19:52:24.000' AS DateTime), 2014, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (30, CAST(N'2018-10-10 03:01:31.000' AS DateTime), 2015, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (31, CAST(N'2018-10-31 17:53:36.000' AS DateTime), 2018, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (32, CAST(N'2017-08-23 19:45:34.000' AS DateTime), 2015, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (33, CAST(N'2018-12-08 06:03:43.000' AS DateTime), 2014, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (34, CAST(N'2017-10-25 02:43:14.000' AS DateTime), 2014, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (35, CAST(N'2018-07-04 12:47:13.000' AS DateTime), 2018, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (36, CAST(N'2017-10-19 05:47:11.000' AS DateTime), 2013, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (37, CAST(N'2017-10-08 06:44:42.000' AS DateTime), 2011, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (38, CAST(N'2018-08-12 00:48:21.000' AS DateTime), 2012, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (39, CAST(N'2019-03-19 16:48:40.000' AS DateTime), 2012, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (40, CAST(N'2017-08-24 11:35:31.000' AS DateTime), 2014, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (41, CAST(N'2019-03-16 19:35:27.000' AS DateTime), 2014, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (42, CAST(N'2017-12-20 16:08:12.000' AS DateTime), 2015, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (43, CAST(N'2018-01-26 23:31:12.000' AS DateTime), 2017, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (44, CAST(N'2017-08-16 12:13:08.000' AS DateTime), 2017, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (45, CAST(N'2018-03-08 17:45:12.000' AS DateTime), 2014, 12)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (46, CAST(N'2018-07-26 08:49:01.000' AS DateTime), 2019, 12)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (47, CAST(N'2019-03-09 01:46:14.000' AS DateTime), 2013, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (48, CAST(N'2018-06-11 10:57:45.000' AS DateTime), 2011, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (49, CAST(N'2018-09-23 04:28:45.000' AS DateTime), 2018, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (50, CAST(N'2018-07-14 09:05:38.000' AS DateTime), 2013, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (51, CAST(N'2019-03-29 15:34:15.000' AS DateTime), 2012, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (52, CAST(N'2017-12-05 17:53:51.000' AS DateTime), 2012, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (53, CAST(N'2019-02-01 22:28:47.000' AS DateTime), 2017, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (54, CAST(N'2017-11-09 18:08:33.000' AS DateTime), 2016, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (55, CAST(N'2019-02-23 00:57:19.000' AS DateTime), 2018, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (56, CAST(N'2018-08-04 09:07:48.000' AS DateTime), 2015, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (57, CAST(N'2019-04-23 05:14:41.000' AS DateTime), 2016, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (58, CAST(N'2019-01-15 08:24:31.000' AS DateTime), 2013, 12)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (59, CAST(N'2018-12-15 03:20:28.000' AS DateTime), 2016, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (60, CAST(N'2018-08-10 21:28:44.000' AS DateTime), 2012, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (61, CAST(N'2019-01-28 17:15:57.000' AS DateTime), 2013, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (62, CAST(N'2018-09-07 18:02:00.000' AS DateTime), 2014, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (63, CAST(N'2018-10-09 04:13:46.000' AS DateTime), 2019, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (64, CAST(N'2018-06-10 00:47:09.000' AS DateTime), 2015, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (65, CAST(N'2018-06-29 21:57:23.000' AS DateTime), 2014, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (66, CAST(N'2019-02-27 12:49:42.000' AS DateTime), 2013, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (67, CAST(N'2018-01-15 10:36:21.000' AS DateTime), 2018, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (68, CAST(N'2019-02-13 14:39:44.000' AS DateTime), 2011, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (69, CAST(N'2018-09-22 20:34:13.000' AS DateTime), 2017, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (70, CAST(N'2018-02-05 15:26:55.000' AS DateTime), 2012, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (71, CAST(N'2018-07-12 11:49:55.000' AS DateTime), 2016, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (72, CAST(N'2017-10-19 06:14:38.000' AS DateTime), 2016, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (73, CAST(N'2018-01-07 10:30:26.000' AS DateTime), 2012, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (74, CAST(N'2017-11-11 13:49:43.000' AS DateTime), 2014, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (75, CAST(N'2018-06-20 22:38:36.000' AS DateTime), 2019, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (76, CAST(N'2018-01-16 21:40:34.000' AS DateTime), 2019, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (77, CAST(N'2018-10-22 06:53:33.000' AS DateTime), 2016, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (78, CAST(N'2019-01-30 13:54:26.000' AS DateTime), 2012, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (79, CAST(N'2017-11-04 00:06:49.000' AS DateTime), 2014, 11)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (80, CAST(N'2017-07-16 05:02:48.000' AS DateTime), 2015, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (81, CAST(N'2018-04-09 04:30:18.000' AS DateTime), 2013, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (82, CAST(N'2017-10-05 11:37:08.000' AS DateTime), 2011, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (83, CAST(N'2018-07-25 00:41:16.000' AS DateTime), 2014, 7)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (84, CAST(N'2017-06-12 19:20:17.000' AS DateTime), 2017, 10)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (85, CAST(N'2018-05-07 08:55:06.000' AS DateTime), 2014, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (86, CAST(N'2019-03-27 11:48:37.000' AS DateTime), 2014, 8)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (87, CAST(N'2018-08-31 03:05:51.000' AS DateTime), 2013, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (88, CAST(N'2017-07-10 14:27:10.000' AS DateTime), 2017, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (89, CAST(N'2017-08-12 04:35:42.000' AS DateTime), 2014, 5)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (90, CAST(N'2019-04-25 12:09:44.000' AS DateTime), 2011, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (91, CAST(N'2019-04-10 07:22:08.000' AS DateTime), 2018, 6)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (92, CAST(N'2018-08-22 13:17:14.000' AS DateTime), 2014, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (93, CAST(N'2019-03-22 07:26:56.000' AS DateTime), 2011, 3)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (94, CAST(N'2019-03-21 10:04:53.000' AS DateTime), 2014, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (95, CAST(N'2019-03-04 08:34:22.000' AS DateTime), 2014, 1)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (96, CAST(N'2018-01-07 19:39:57.000' AS DateTime), 2011, 9)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (97, CAST(N'2017-11-03 22:31:33.000' AS DateTime), 2019, 2)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (98, CAST(N'2018-09-29 14:51:28.000' AS DateTime), 2011, 4)
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (99, CAST(N'2018-06-05 19:35:02.000' AS DateTime), 2018, 7)
GO
INSERT [dbo].[grouptable] ([response_id], [show_date], [year], [month]) VALUES (100, CAST(N'2018-04-27 03:14:48.000' AS DateTime), 2016, 5)
SET IDENTITY_INSERT [dbo].[grouptable] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [productName]) VALUES (1, N'1')
INSERT [dbo].[products] ([id], [productName]) VALUES (2, N'2')
INSERT [dbo].[products] ([id], [productName]) VALUES (3, N'3')
INSERT [dbo].[products] ([id], [productName]) VALUES (4, N'4')
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[statussearch] ON 

INSERT [dbo].[statussearch] ([id], [statusname]) VALUES (1, N'1')
INSERT [dbo].[statussearch] ([id], [statusname]) VALUES (2, N'2')
INSERT [dbo].[statussearch] ([id], [statusname]) VALUES (3, N'3')
INSERT [dbo].[statussearch] ([id], [statusname]) VALUES (4, N'4')
SET IDENTITY_INSERT [dbo].[statussearch] OFF
USE [master]
GO
ALTER DATABASE [FeedbackApp] SET  READ_WRITE 
GO
