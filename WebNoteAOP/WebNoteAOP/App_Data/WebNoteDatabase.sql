/****** Object:  ForeignKey [FK_CategoryToNode_Category]    Script Date: 01/28/2011 22:00:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryToNode_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryToNode]'))
ALTER TABLE [dbo].[CategoryToNode] DROP CONSTRAINT [FK_CategoryToNode_Category]
GO
/****** Object:  ForeignKey [FK_CategoryToNode_Note]    Script Date: 01/28/2011 22:00:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryToNode_Note]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryToNode]'))
ALTER TABLE [dbo].[CategoryToNode] DROP CONSTRAINT [FK_CategoryToNode_Note]
GO
/****** Object:  Table [dbo].[CategoryToNode]    Script Date: 01/28/2011 22:00:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryToNode]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryToNode]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/28/2011 22:00:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 01/28/2011 22:00:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Note]') AND type in (N'U'))
DROP TABLE [dbo].[Note]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 01/28/2011 22:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Note]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Note](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Message] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Added] [datetime] NOT NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Note] ON
INSERT [dbo].[Note] ([NoteId], [Title], [Message], [Added]) VALUES (1, N'Mittag', N'da hat man am meisten Hunger!', CAST(0x00009E1C00CB14BE AS DateTime))
INSERT [dbo].[Note] ([NoteId], [Title], [Message], [Added]) VALUES (2, N'Frühstück', N'nicht vergessen!', CAST(0x00009E1C00CFE220 AS DateTime))
INSERT [dbo].[Note] ([NoteId], [Title], [Message], [Added]) VALUES (5, N'Kaffepause', N'essenziell!', CAST(0x00009E410144CC61 AS DateTime))
SET IDENTITY_INSERT [dbo].[Note] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 01/28/2011 22:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Color] [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryId], [Name], [Color]) VALUES (1, N'Normal Importance', N'green ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Color]) VALUES (2, N'High Importance', N'red   ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Color]) VALUES (3, N'Private', N'gray  ')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[CategoryToNode]    Script Date: 01/28/2011 22:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryToNode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryToNode](
	[CategoryId] [int] NOT NULL,
	[NoteId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryToNode] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[NoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[CategoryToNode] ([CategoryId], [NoteId]) VALUES (1, 1)
INSERT [dbo].[CategoryToNode] ([CategoryId], [NoteId]) VALUES (2, 5)
INSERT [dbo].[CategoryToNode] ([CategoryId], [NoteId]) VALUES (3, 2)
INSERT [dbo].[CategoryToNode] ([CategoryId], [NoteId]) VALUES (3, 5)
/****** Object:  ForeignKey [FK_CategoryToNode_Category]    Script Date: 01/28/2011 22:00:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryToNode_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryToNode]'))
ALTER TABLE [dbo].[CategoryToNode]  WITH CHECK ADD  CONSTRAINT [FK_CategoryToNode_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[CategoryToNode] CHECK CONSTRAINT [FK_CategoryToNode_Category]
GO
/****** Object:  ForeignKey [FK_CategoryToNode_Note]    Script Date: 01/28/2011 22:00:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryToNode_Note]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryToNode]'))
ALTER TABLE [dbo].[CategoryToNode]  WITH CHECK ADD  CONSTRAINT [FK_CategoryToNode_Note] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Note] ([NoteId])
GO
ALTER TABLE [dbo].[CategoryToNode] CHECK CONSTRAINT [FK_CategoryToNode_Note]
GO
