--USE [master]; DROP DATABASE [MYDC]; CREATE DATABASE [MYDC]
USE [MYDC]
GO

IF OBJECT_ID(N'Workshop', N'U') IS NOT NULL DROP TABLE [Workshop]
IF OBJECT_ID(N'EventDateTime', N'U') IS NOT NULL DROP TABLE [EventDateTime]
IF OBJECT_ID(N'EventDateRoom', N'U') IS NOT NULL DROP TABLE [EventDateRoom]
IF OBJECT_ID(N'EventDate', N'U') IS NOT NULL DROP TABLE [EventDate]
IF OBJECT_ID(N'Event', N'U') IS NOT NULL DROP TABLE [Event]
IF OBJECT_ID(N'Level', N'U') IS NOT NULL DROP TABLE [Level]
IF OBJECT_ID(N'Style', N'U') IS NOT NULL DROP TABLE [Style]
GO

CREATE TABLE [Style] (
  [Name] NVARCHAR(25) NOT NULL,
		[R] TINYINT NOT NULL,
		[G] TINYINT NOT NULL,
		[B] TINYINT NOT NULL,
		[RGB] AS CONVERT(NVARCHAR(3), [R]) + N',' + CONVERT(NVARCHAR(3), [G]) + N',' + CONVERT(NVARCHAR(3), [B]) PERSISTED,
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_Style] PRIMARY KEY NONCLUSTERED ([Name]),
		CONSTRAINT [UQ_Style_Sort] UNIQUE CLUSTERED ([Sort])
 )
GO

CREATE TABLE [Level] (
  [Name] NVARCHAR(25) NOT NULL,
		[Opacity] DECIMAL(3,2) NOT NULL CONSTRAINT [DF_Level_Opacity] DEFAULT (1),
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_Level] PRIMARY KEY NONCLUSTERED ([Name]),
		CONSTRAINT [UQ_Level_Sort] UNIQUE CLUSTERED ([Sort])
 )
GO

CREATE TABLE [Event] (
  [Id] INT NOT NULL IDENTITY (1, 1),
		[Name] NVARCHAR(255) NOT NULL,
		[StartDate] DATE NOT NULL,
		[EndDate] DATE NOT NULL,
		CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([Id]),
		CONSTRAINT [UQ_Event_Name] UNIQUE ([Name]),
		CONSTRAINT [UQ_Event_Period] UNIQUE ([Id], [StartDate], [EndDate]),
		CONSTRAINT [CK_Event_EndDate] CHECK ([EndDate] >= [StartDate])
	)
GO

CREATE TABLE [EventDate] (
  [EventId] INT NOT NULL,
		[Date] DATE NOT NULL,
		[StartDate] DATE NOT NULL,
		[EndDate] DATE NOT NULL,
		CONSTRAINT [PK_EventDate] PRIMARY KEY CLUSTERED ([EventId], [Date]),
		CONSTRAINT [FK_EventDate_Event] FOREIGN KEY ([EventId], [StartDate], [EndDate])
		 REFERENCES [Event] ([Id], [StartDate], [EndDate]) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [CK_EventDate_Date] CHECK ([Date] BETWEEN [StartDate] AND [EndDate])
 )
GO

CREATE TABLE [EventDateRoom] (
  [EventId] INT NOT NULL,
		[Date] DATE NOT NULL,
		[Room] NVARCHAR(25) NOT NULL,
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_EventDateRoom] PRIMARY KEY NONCLUSTERED ([EventId], [Date], [Room]),
		CONSTRAINT [UQ_EventDateRoom_Sort] UNIQUE CLUSTERED ([EventId], [Date], [Sort]),
		CONSTRAINT [FK_EventDateRoom_EventDate] FOREIGN KEY ([EventId], [Date])
		 REFERENCES [EventDate] ([EventId], [Date]) ON UPDATE CASCADE ON DELETE CASCADE
 )
GO

CREATE TABLE [EventDateTime] (
  [EventId] INT NOT NULL,
		[Date] DATE NOT NULL,
		[Time] TIME NOT NULL,
		CONSTRAINT [PK_EventDateTime] PRIMARY KEY CLUSTERED ([EventId], [Date], [Time]),
		CONSTRAINT [FK_EventDateTIme_EventDate] FOREIGN KEY ([EventId], [Date])
		 REFERENCES [EventDate] ([EventId], [Date]) ON UPDATE CASCADE ON DELETE CASCADE
 )
GO

CREATE TABLE [Workshop] (
  [Id] INT NOT NULL IDENTITY (1, 1),
  [EventId] INT NOT NULL,
		[Date] DATE NOT NULL,
		[Time] TIME NOT NULL,
		[Room] NVARCHAR(25) NOT NULL,
		[Artist] NVARCHAR(50) NULL,
		[Title] NVARCHAR(50) NULL,
		[Style] NVARCHAR(25) NULL,
		[Level] NVARCHAR(25) NULL,
		CONSTRAINT [PK_Workshop] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [FK_Workshop_EventDateRoom] FOREIGN KEY ([EventId], [Date], [Room])
		 REFERENCES [EventDateRoom] ([EventId], [Date], [Room]),
		CONSTRAINT [FK_Workshop_EventDateTime] FOREIGN KEY ([EventId], [Date], [Time])
		 REFERENCES [EventDateTime] ([EventId], [Date], [Time]),
		CONSTRAINT [FK_Workshop_Style] FOREIGN KEY ([Style]) REFERENCES [Style] ([Name]),
		CONSTRAINT [FK_Workshop_Level] FOREIGN KEY ([Level]) REFERENCES [Level] ([Name])
 )
GO

CREATE INDEX [IX_Workshop_Time_Room] ON [Workshop] ([EventId], [Date], [Time], [Room])
GO