USE [krasota]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 13.04.23 9:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id_emp] [int] NOT NULL,
	[fio] [nvarchar](50) NOT NULL,
	[post] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entry]    Script Date: 13.04.23 9:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entry](
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_entry] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zakaz]    Script Date: 13.04.23 9:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz](
	[id_zakaz] [int] NOT NULL,
	[id_emp] [int] NOT NULL,
	[date_zakaz] [datetime] NULL,
	[fio] [nvarchar](50) NULL,
	[uslugi] [nvarchar](50) NULL,
 CONSTRAINT [PK_zakaz] PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[employee] ([id_emp], [fio], [post], [login]) VALUES (1, N'Ибрагимов О.С.', N'Охранник', N'user1')
INSERT [dbo].[employee] ([id_emp], [fio], [post], [login]) VALUES (2, N'Олегов О.И.', N'Парихмахер', N'user2')
INSERT [dbo].[employee] ([id_emp], [fio], [post], [login]) VALUES (3, N'Иванов А.М.', N'Визажист', N'user3')
INSERT [dbo].[employee] ([id_emp], [fio], [post], [login]) VALUES (4, N'Мужиков А.Ю.', N'Охранник', N'user4')
INSERT [dbo].[employee] ([id_emp], [fio], [post], [login]) VALUES (5, N'Неплохов И.А.', N'Охранник', N'user5')
GO
INSERT [dbo].[entry] ([login], [password]) VALUES (N'user1', N'qwerty')
INSERT [dbo].[entry] ([login], [password]) VALUES (N'user2', N'qwerty123')
INSERT [dbo].[entry] ([login], [password]) VALUES (N'user3', N'qwerty321')
INSERT [dbo].[entry] ([login], [password]) VALUES (N'user4', N'qwerty1234')
INSERT [dbo].[entry] ([login], [password]) VALUES (N'user5', N'qwerty512')
GO
INSERT [dbo].[zakaz] ([id_zakaz], [id_emp], [date_zakaz], [fio], [uslugi]) VALUES (1, 1, CAST(N'2023-04-13T00:00:00.000' AS DateTime), N'Сомов И.Ю.', N'Подстричь кончики')
INSERT [dbo].[zakaz] ([id_zakaz], [id_emp], [date_zakaz], [fio], [uslugi]) VALUES (2, 1, CAST(N'2023-04-13T00:00:00.000' AS DateTime), N'Ильин А.М.', N'Педикюр')
INSERT [dbo].[zakaz] ([id_zakaz], [id_emp], [date_zakaz], [fio], [uslugi]) VALUES (3, 1, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Михайлов И.И.', N'Покрасить волосы')
INSERT [dbo].[zakaz] ([id_zakaz], [id_emp], [date_zakaz], [fio], [uslugi]) VALUES (4, 2, CAST(N'2023-04-13T00:00:00.000' AS DateTime), N'Максименко М.М.', N'Вправить сустав')
INSERT [dbo].[zakaz] ([id_zakaz], [id_emp], [date_zakaz], [fio], [uslugi]) VALUES (5, 2, CAST(N'2023-04-12T00:00:00.000' AS DateTime), N'Антонов И.М.', N'Побрить ноги')
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_entry] FOREIGN KEY([login])
REFERENCES [dbo].[entry] ([login])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_entry]
GO
ALTER TABLE [dbo].[zakaz]  WITH CHECK ADD  CONSTRAINT [FK_zakaz_employee] FOREIGN KEY([id_emp])
REFERENCES [dbo].[employee] ([id_emp])
GO
ALTER TABLE [dbo].[zakaz] CHECK CONSTRAINT [FK_zakaz_employee]
GO
