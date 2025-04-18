USE [APLATAM]
GO
/****** Object:  Table [dbo].[STG_APLATAM_OPENWEATHERMAP]    Script Date: 14/04/2025 07:25:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_APLATAM_OPENWEATHERMAP](
	[lon] [varchar](1000) NULL,
	[lat] [varchar](1000) NULL,
	[type] [varchar](1000) NULL,
	[id] [varchar](1000) NULL,
	[country] [varchar](1000) NULL,
	[sunrise] [varchar](1000) NULL,
	[sunset] [varchar](1000) NULL,
	[id1] [varchar](1000) NULL,
	[main] [varchar](1000) NULL,
	[description] [varchar](1000) NULL,
	[icon] [varchar](1000) NULL,
	[name] [varchar](1000) NULL,
	[timezone] [varchar](1000) NULL,
	[base] [varchar](1000) NULL
) ON [PRIMARY]
GO
