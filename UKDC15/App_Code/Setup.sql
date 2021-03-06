--USE [master]; DROP DATABASE [MYDC]; CREATE DATABASE [MYDC]
USE [MYDC]
GO

IF OBJECT_ID(N'apiWorkshopsImportFile', N'P') IS NOT NULL DROP PROCEDURE [apiWorkshopsImportFile]
IF OBJECT_ID(N'apiWorkshopsImport', N'P') IS NOT NULL DROP PROCEDURE [apiWorkshopsImport]
IF OBJECT_ID(N'apiWorkshopsExport', N'P') IS NOT NULL DROP PROCEDURE [apiWorkshopsExport]
IF OBJECT_ID(N'apiTimetable', N'P') IS NOT NULL DROP PROCEDURE [apiTimetable]
IF OBJECT_ID(N'Workshop', N'U') IS NOT NULL DROP TABLE [Workshop]
IF OBJECT_ID(N'Activity', N'U') IS NOT NULL DROP TABLE [Activity]
IF OBJECT_ID(N'EventDateTime', N'U') IS NOT NULL DROP TABLE [EventDateTime]
IF OBJECT_ID(N'EventDateRoom', N'U') IS NOT NULL DROP TABLE [EventDateRoom]
IF OBJECT_ID(N'EventDate', N'U') IS NOT NULL DROP TABLE [EventDate]
IF OBJECT_ID(N'EventArtist', N'U') IS NOT NULL DROP TABLE [EventArtist]
IF OBJECT_ID(N'Event', N'U') IS NOT NULL DROP TABLE [Event]
IF OBJECT_ID(N'Level', N'U') IS NOT NULL DROP TABLE [Level]
IF OBJECT_ID(N'Style', N'U') IS NOT NULL DROP TABLE [Style]
IF OBJECT_ID(N'Artist', N'U') IS NOT NULL DROP TABLE [Artist]
GO

CREATE TABLE [Artist] (
  [Name] NVARCHAR(50) NOT NULL
		CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([Name])
 )
GO

CREATE TABLE [Style] (
  [Id] AS N'S' + RIGHT(N'000' + CONVERT(NVARCHAR(3), [Sort]), 3) PERSISTED,
  [Name] NVARCHAR(25) NOT NULL,
		[R] TINYINT NOT NULL,
		[G] TINYINT NOT NULL,
		[B] TINYINT NOT NULL,
		[RGB] AS CONVERT(NVARCHAR(3), [R]) + N',' + CONVERT(NVARCHAR(3), [G]) + N',' + CONVERT(NVARCHAR(3), [B]) PERSISTED,
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_Style] PRIMARY KEY NONCLUSTERED ([Name]),
		CONSTRAINT [UQ_Style_Id] UNIQUE ([Id]),
		CONSTRAINT [UQ_Style_Sort] UNIQUE CLUSTERED ([Sort])
 )
GO

INSERT INTO [Style] ([Name], [R], [G], [B], [Sort])
VALUES
	(N'Salsa On1', 170, 255, 170, 1),
	(N'Salsa On2', 68, 170, 255, 2),
	(N'Cuban Salsa', 255, 255, 128, 3),
	(N'Colombian Salsa', 255, 102, 150, 4),
	(N'Bachata', 180, 170, 255, 5),
	(N'Kizomba & Afro-Luso', 255, 100, 100, 6),
	(N'Lindy', 255, 174, 51, 7),
	(N'Other', 187, 187, 187, 8)
GO

CREATE TABLE [Level] (
  [Name] NVARCHAR(25) NOT NULL,
		[Code] NVARCHAR(5) NOT NULL,
		[Opacity] DECIMAL(3,2) NOT NULL CONSTRAINT [DF_Level_Opacity] DEFAULT (1),
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_Level] PRIMARY KEY NONCLUSTERED ([Name]),
		CONSTRAINT [UQ_Level_Sort] UNIQUE CLUSTERED ([Sort])
 )
GO

INSERT INTO [Level] ([Name], [Code], [Opacity], [Sort])
VALUES
	(N'All Levels', N'ALL', 1.00, 1),
	(N'Beginner', N'BEG', 1.00, 2),
	(N'Improver', N'IMP', 0.60, 3),
	(N'Intermediate', N'INT', 0.70, 4),
	(N'Int/Adv', N'I/A', 0.80, 5),
	(N'Advanced', N'ADV', 0.90, 6)
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

CREATE TABLE [EventArtist] (
  [EventId] INT NOT NULL,
  [Artist] NVARCHAR(50) NOT NULL,
		[Workshops] TINYINT NOT NULL CONSTRAINT [DF_EventArtist_Agreed] DEFAULT (0),
		CONSTRAINT [PK_EventArtist] PRIMARY KEY CLUSTERED ([EventId], [Artist]),
		CONSTRAINT [FK_EventArtist_Event] FOREIGN KEY ([EventId]) REFERENCES [Event] ([Id]) ON DELETE CASCADE,
		CONSTRAINT [FK_EventArtist_Artist] FOREIGN KEY ([Artist]) REFERENCES [Artist] ([Name]) ON UPDATE CASCADE ON DELETE CASCADE,
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

CREATE TABLE [Activity] (
  [EventId] INT NOT NULL,
		[Date] DATE NOT NULL,
		[Time] TIME NOT NULL,
		[Room] NVARCHAR(25) NOT NULL,
		[Description] NVARCHAR(255) NULL,
		[Span] TINYINT NULL,
		CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([EventId], [Date], [Time]),
		CONSTRAINT [FK_Activity_EventDateRoom] FOREIGN KEY ([EventId], [Date], [Room])
		 REFERENCES [EventDateRoom] ([EventId], [Date], [Room]),
		CONSTRAINT [FK_Activity_EventDateTime] FOREIGN KEY ([EventId], [Date], [Time])
		 REFERENCES [EventDateTime] ([EventId], [Date], [Time])
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
		CONSTRAINT [FK_Workshop_EventArtist] FOREIGN KEY ([EventId], [Artist])
		 REFERENCES [EventArtist] ([EventId], [Artist]) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [FK_Workshop_Style] FOREIGN KEY ([Style]) REFERENCES [Style] ([Name]),
		CONSTRAINT [FK_Workshop_Level] FOREIGN KEY ([Level]) REFERENCES [Level] ([Name])
 )
GO

CREATE INDEX [IX_Workshop_Time_Room] ON [Workshop] ([EventId], [Date], [Time], [Room])
GO

CREATE PROCEDURE [apiTimetable](@EventId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	;WITH XMLNAMESPACES (N'http://james.newtonking.com/projects/json' AS [json])
	SELECT
	 [Salsa_x0020_On1] = 'Hello',
		[Event] = e.[Name],
		[StartDate] = e.[StartDate],
		[EndDate] = e.[EndDate],
		(
				SELECT
				 [@json:Array] = N'true',
				 [Name],
					[RGB],
					[Sort],
					[Enabled] = CONVERT(BIT, 1)
				FROM [Style]
				ORDER BY [Sort]
				FOR XML PATH (N'Styles'), TYPE
		 ),
		(
		  SELECT
				 [@json:Array] = N'true',
					[Name],
					[Opacity],
					[Sort]
				FROM [Level]
				ORDER BY [Sort]
				FOR XML PATH (N'Levels'), TYPE
		 ),
		(
				SELECT
					[@json:Array] = N'true',
					[Date] = ed.[Date],
					(
							SELECT
								[@json:Array] = N'true',
								[Name] = edr.[Room]
							FROM [EventDateRoom] edr
							WHERE edr.[EventId] = ed.[EventId]
								AND edr.[Date] = ed.[Date]
							ORDER BY edr.[Sort]
							FOR XML PATH (N'Rooms'), TYPE
						),
					(
							SELECT
								[@json:Array] = N'true',
								[Time] = CONVERT(NCHAR(5), edt.[Time], 114),
								(
										SELECT
											[@json:Array] = N'true',
											[Description] = a.[Description],
											[Span] = ISNULL(a.[Span], 1),
           [CSS] = scss.[CSS],
											(
													SELECT
														[@json:Array] = N'true',
														[Artist] = ws.[Artist],
														[Title] = ws.[Title],
														[Style] = ws.[Style],
														[Level] = ws.[Level],
              [CSS] = CASE WHEN scss.[CSS] IS NULL THEN (
                SELECT N'background-color: rgba('
                 + ISNULL(wss.[RGB], N'255,255,255')
                 + N',' + ISNULL(CONVERT(NVARCHAR(6), wsl.[Opacity]), N'1') + N'); '
                 + N'padding: 5px 5px 5px 5px;'
                ) END
													FROM [Workshop] ws
              LEFT JOIN [Style] wss ON ws.[Style] = wss.[Name]
              LEFT JOIN [Level] wsl ON ws.[Level] = wsl.[Name]
													WHERE a.[Description] IS NULL 
													 AND ws.[EventId] = edt.[EventId]
														AND ws.[Date] = edt.[Date]
														AND ws.[Time] = edt.[Time]
														AND ws.[Room] = s.[Room]
													ORDER BY wsl.[Sort] DESC
													FOR XML PATH (N'Workshops'), TYPE
												)
										FROM [EventDateRoom] s
										 LEFT JOIN [Activity] a ON edt.[EventId] = a.[EventId]
											 AND edt.[Date] = a.[Date]
												AND edt.[Time] = a.[Time]
												AND s.[Room] = a.[Room]
           OUTER APPLY (
             SELECT N'background-color: rgba('
              + MIN(ISNULL(wss.[RGB], N'255,255,255'))
              + N',' + MIN(ISNULL(CONVERT(NVARCHAR(6), wsl.[Opacity]), N'1')) + N'); '
              + N'padding: 5px 5px 5px 5px;'
												 FROM [Workshop] ws
              LEFT JOIN [Style] wss ON ws.[Style] = wss.[Name]
              LEFT JOIN [Level] wsl ON ws.[Level] = wsl.[Name]
													WHERE a.[Description] IS NULL 
													 AND ws.[EventId] = edt.[EventId]
														AND ws.[Date] = edt.[Date]
														AND ws.[Time] = edt.[Time]
														AND ws.[Room] = s.[Room]
             HAVING COUNT(*) = 1
            ) scss ([CSS])
										WHERE s.[EventId] = ed.[EventId]
											AND s.[Date] = ed.[Date]
										ORDER BY s.[Sort]
										FOR XML PATH (N'Slots'), TYPE
									)
							FROM [EventDateTime] edt
							WHERE edt.[EventId] = ed.[EventId]
								AND edt.[Date] = ed.[Date]
							ORDER BY edt.[Time]
							FOR XML PATH (N'Times'), TYPE
						)
				FROM [EventDate] ed
				WHERE ed.[EventId] = e.[Id]
				ORDER BY ed.[Date]
				FOR XML PATH (N'Dates'), TYPE
			)
	FROM [Event] e
	WHERE [Id] = @EventId
	FOR XML PATH (N'Timetable')
	RETURN
END
GO

CREATE PROCEDURE [apiWorkshopsExport](@EventId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

	SELECT
		[@Name] = e.[Name],
		[@Start] = CONVERT(NCHAR(10), e.[StartDate], 120),
		[@End] = CONVERT(NCHAR(10), e.[EndDate], 120),
		[Artists] = (
				SELECT
					[@Name] = a.[Artist],
					[@Workshops] = a.[Workshops]
				FROM [EventArtist] a
				WHERE e.[Id] = a.[EventId]
				ORDER BY a.[Artist]
				FOR XML PATH (N'Artist'), TYPE
			),
		[Workshops] = (
				SELECT
					[@Date] = CONVERT(NCHAR(10), dte.[Date], 120),
					(
							SELECT
								[@Name] = edr.[Room],
								(
										SELECT
											[@Time] = CONVERT(NCHAR(5), edt.[Time], 114),
											(
													SELECT
														[@Artist] = w.[Artist],
														[@Title] = w.[Title],
														[@Style] = w.[Style],
														[@Level] = w.[Level]
													FROM [Workshop] w
													WHERE dte.[EventId] = w.[EventId]
														AND dte.[Date] = w.[Date]
														AND edt.[Time] = w.[Time]
														AND edr.[Room] = w.[Room]
													FOR XML PATH (N'Workshop'), TYPE
												)
										FROM [EventDateTime] edt
										WHERE dte.[EventId] = edt.[EventId]
											AND dte.[Date] = edt.[Date]
										ORDER BY edt.[Time]
										FOR XML PATH (N'Slot'), TYPE
									)
							FROM [EventDateRoom] edr
							WHERE dte.[EventId] = edr.[EventId]
								AND dte.[Date] = edr.[Date]
							ORDER BY edr.[Sort]
							FOR XML PATH (N'Room'), TYPE
						)
				FROM [EventDate] dte
				WHERE e.[Id] = dte.[EventId]
				ORDER BY dte.[Date]
				FOR XML PATH (N'Day'), TYPE
			)
	FROM [Event] e
	WHERE e.[Id] = @EventId
	FOR XML PATH (N'Event')

	RETURN
END
GO

CREATE PROCEDURE [apiWorkshopsImport](@Import XML)
AS
BEGIN
 SET NOCOUNT ON

 DECLARE @EventId INT

 SELECT @EventId = [Id] FROM [Event] WHERE [Name] = @Import.value(N'/Event[1]/@Name', N'NVARCHAR(255)')

 IF @EventId IS NULL BEGIN
  INSERT INTO [Event] ([Name], [StartDate], [EndDate])
	 SELECT
	  [Name] = n.value(N'@Name', N'NVARCHAR(255)'),
		 [StartDate] = n.value(N'@Start', N'DATE'),
		 [EndDate] = n.value(N'@End', N'DATE')
	 FROM @Import.nodes(N'/Event[1]') x (n)
	 SET @EventId = SCOPE_IDENTITY()
 END ELSE BEGIN
	 DELETE [Workshop] WHERE [EventId] = @EventId
		DELETE [Activity] WHERE [EventId] = @EventId
	 DELETE [EventDate] WHERE [EventId] = @EventId
	 DELETE [EventArtist] WHERE [EventId] = @EventId
 END

 ;WITH [Data] AS (
		 SELECT
			 [Name] = n.value(N'@Name', N'NVARCHAR(100)'),
			 [Workshops] = n.value(N'@Workshops', N'TINYINT')
		 FROM @Import.nodes(N'/Event[1]/Artists[1]/Artist') x (n)
	 )
 INSERT INTO [Artist] ([Name])
 SELECT d.[Name]
 FROM [Data] d
  LEFT JOIN [Artist] a ON d.[Name] = a.[Name]
 WHERE a.[Name] IS NULL

 INSERT INTO [EventArtist] ([EventId], [Artist], [Workshops])
 SELECT
  [EventId] = @EventId,
  [Artist] = n.value(N'@Name', N'NVARCHAR(100)'),
	 [Workshops] = n.value(N'@Workshops', N'TINYINT')
 FROM @Import.nodes(N'/Event[1]/Artists[1]/Artist') x (n)

 INSERT INTO [EventDate] ([EventId], [Date], [StartDate], [EndDate])
 SELECT
  [EventId] = @EventId,
	 [Date] = n.value(N'@Date', N'DATE'),
	 [StartDate] = n.value(N'../../@Start', N'DATE'),
	 [EndDate] = n.value(N'../../@End', N'DATE')
 FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day') x (n)

 INSERT INTO [EventDateRoom] ([EventId], [Date], [Room], [Sort])
 SELECT
  [EventId] = @EventId,
	 [Date] = n.value(N'../@Date', N'DATE'),
	 [Room] = n.value(N'@Name', N'NVARCHAR(50)'),
	 [Sort] = v.[number]
 FROM [master]..[spt_values] v
  CROSS APPLY @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room[sql:column("v.[number]")]') x (n)
 WHERE v.[type] = N'P'
  AND v.[number] BETWEEN 1 AND 255
 ORDER BY 1, 2, 4

 INSERT INTO [EventDateTime] ([EventId], [Date], [Time])
 SELECT DISTINCT
  [EventId] = @EventId,
	 [Date] = n.value(N'../../@Date', N'DATE'),
	 [Time] = n.value(N'@Time', N'TIME')
 FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room/Slot') x (n)

 INSERT INTO [Activity] ([EventId], [Date], [Time], [Room], [Description], [Span])
	SELECT
  [EventId] = @EventId,
	 [Date] = n.value(N'../../@Date', N'DATE'),
	 [Time] = n.value(N'@Time', N'TIME'),
		[Room] = n.value(N'../@Name', N'NVARCHAR(50)'),
		[Description] = n.value(N'@Description', N'NVARCHAR(255)'),
		[Span] = n.value(N'@Span', N'TINYINT')
 FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room/Slot') x (n)
	WHERE n.exist(N'@Desciption') | n.exist(N'@Span') = 1

 INSERT INTO [Workshop] ([EventId], [Date], [Time], [Room], [Artist], [Title], [Style], [Level])
 SELECT
  [EventId] = @EventId,
	 [Date] = n.value(N'../../../@Date', N'DATE'),
	 [Time] = n.value(N'../@Time', N'TIME'),
	 [Room] = n.value(N'../../@Name', N'NVARCHAR(50)'),
	 [Artist] = n.value(N'@Artist', N'NVARCHAR(100)'),
	 [Title] = n.value(N'@Title', N'NVARCHAR(100)'),
	 [Style] = n.value(N'@Style', N'NVARCHAR(50)'),
	 [Level] = n.value(N'@Level', N'NVARCHAR(50)')
 FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room/Slot/Workshop') x (n)

 RETURN @EventId
END
GO

CREATE PROCEDURE [apiWorkshopsImportFile](@Filename NVARCHAR(max))
AS
BEGIN
 SET NOCOUNT ON
	DECLARE @SQL NVARCHAR(max), @XML XML
	SET @SQL = N'SELECT @XML = CONVERT(XML, [BulkColumn]) FROM OPENROWSET(BULK ' + QUOTENAME(@Filename, N'''') + N', SINGLE_BLOB) AS [xml]'
	EXEC sp_executesql @SQL, N'@XML XML OUTPUT', @XML OUT
	EXEC [apiWorkshopsImport] @XML
	RETURN
END
GO

--EXEC [apiWorkshopsImportFile] N'C:\Users\pierre.WHITESPACE\Documents\UKDC15\UKDC15\xml\timetable1.xml'
EXEC [apiWorkshopsImportFile] N'C:\Users\Pierre\Documents\GitHub\UKDC15\UKDC15\xml\timetable1.xml'
GO

DECLARE @EventId INT; SET @EventId = 1

-- Activity/workshop clash
SELECT a.*, ws.[Artist], ws.[Title], ws.[Style], ws.[Level]
FROM [Activity] a
 JOIN [Workshop] ws ON a.[EventId] = ws.[EventId]
	 AND a.[Date] = ws.[Date]
		AND a.[Time] = ws.[Time]
		AND a.[Room] = ws.[Room]
WHERE a.[EventId] = @EventId

-- Workshop count mismatch
SELECT
 [Artist] = ea.[Artist],
	[Agreed] = ea.[Workshops],
	[Scheduled] = COUNT(ws.[Id])
FROM [EventArtist] ea
 LEFT JOIN [Workshop] ws ON ea.[EventId] = ws.[EventId] AND ea.[Artist] = ws.[Artist]
WHERE ea.[EventId] = @EventId
GROUP BY ea.[Artist], ea.[Workshops]
HAVING COUNT(ws.[Id]) <> ea.[Workshops]
ORDER BY ea.[Artist]

-- Incomplete workshop info
SELECT *
FROM [Workshop]
WHERE [EventId] = @EventId
 AND ([Artist] IS NULL OR [Title] IS NULL OR [Style] IS NULL OR [Level] IS NULL)
ORDER BY [Date], [Room], [Time]

-- Artist schedule conflicts
SELECT ws.*
FROM (
			SELECT [Date], [Time], [Artist]
			FROM [Workshop]
			GROUP BY [Date], [Time], [Artist]
			HAVING COUNT(*) > 1
		) c
	JOIN [Workshop] ws ON c.[Date] = ws.[Date] AND c.[Time] = ws.[Time] AND c.[Artist] = ws.[Artist]
ORDER BY c.[Date], c.[Time], c.[Artist]

-- Subsequent workshops in different rooms
;WITH [Data] AS (
		SELECT
			[Artist] = ws.[Artist],
			[Date] = ws.[Date],
			[Time] = ws.[Time],
			[Room] = ws.[Room],
			[Index] = edt.[Index]
		FROM [Workshop] ws
			JOIN (
					SELECT
						[EventId],
						[Date],
						[Time],
						[Index] = ROW_NUMBER() OVER (PARTITION BY [Date] ORDER BY [Time])
					FROM [EventDateTime]
				) edt ON ws.[EventId] = edt.[EventId] AND ws.[Date] = edt.[Date] AND ws.[Time] = edt.[Time]
		WHERE ws.[EventId] = @EventId
			AND ws.[Artist] IS NOT NULL
 )
SELECT
 [Artist] = d1.[Artist],
	[Date] = d1.[Date],
	[Time1] = d1.[Time],
	[Room1] = d1.[Room],
	[Time2] = d2.[Time],
	[Room2] = d2.[Room]
FROM [Data] d1
 JOIN [Data] d2 ON d1.[Artist] = d2.[Artist] AND d1.[Date] = d2.[Date]
WHERE d1.[Index] + 1 = d2.[Index]
 AND d1.[Room] <> d2.[Room]
ORDER BY d1.[Artist], d1.[Date], d1.[Index]
GO

SELECT
 ea.[Artist],
	ea.[Workshops],
	[Styles] = ISNULL(wn.[Styles], N'TBC')
FROM [EventArtist] ea
 OUTER APPLY (
	  SELECT ws.[Style]
			FROM [Workshop] ws
			 LEFT JOIN [Style] s ON ws.[Style] = s.[Name]
			WHERE ws.[EventId] = ea.[EventId]
			 AND ws.[Artist] = ea.[Artist]
			GROUP BY ws.[Style]
			ORDER BY MIN(s.[Sort])
			FOR XML PATH (N''), TYPE
	 ) w ([Styles])
	OUTER APPLY (SELECT REPLACE(REPLACE(REPLACE(REPLACE(CONVERT(NVARCHAR(max), w.[Styles]),
	 N'</Style><Style>', N', '), N'<Style>', N''), N'</Style>', N''), N'&amp;', N'&')) wn ([Styles])
WHERE ea.[EventId] = 1

DECLARE @EventId INT; SET @EventId = 1

SELECT
 ( -- Config
	  SELECT
			 ( -- Times
				  SELECT DISTINCT
						 [@id] = DENSE_RANK() OVER (ORDER BY edt.[Time]),
						 CONVERT(NVARCHAR(8), edt.[Time], 114)
						FROM [EventDateTime] edt
						ORDER BY 1
						FOR XML PATH (N'Time'), ROOT (N'Times'), TYPE
				 ),
				( -- Days
						SELECT
							[@id] = ROW_NUMBER() OVER (ORDER BY dte.[Date]),
							[@First] = MIN(edt.[Time]),
							[@Last] = MAX(edt.[Time]),
							DATENAME(weekday, dte.[Date])
						FROM [EventDate] dte
							JOIN [EventDateTime] edt ON dte.[EventId] = edt.[EventId] AND dte.[Date] = edt.[Date]
						WHERE dte.[EventId] = e.[Id]
						GROUP BY dte.[Date]
					 ORDER BY dte.[Date]
						FOR XML PATH (N'Day'), ROOT (N'Days'), TYPE
					),
				( -- Rooms
				  SELECT
						 [@id] = DENSE_RANK() OVER (ORDER BY MAX(edr.[Sort])),
							[@Description] = edr.[Room],
						 LTRIM(RTRIM(edr.[Room]))
						FROM [EventDateRoom] edr
						WHERE edr.[EventId] = e.[Id]
						GROUP BY edr.[Room]
						FOR XML PATH (N'Room'), ROOT (N'Rooms'), TYPE
				 ),
				( -- Styles
				  SELECT
						 [@id] = ROW_NUMBER() OVER (ORDER BY s.[Sort]) - 1,
							[@RGB] = CONVERT(NVARCHAR(3), s.[R]) + N',' + CONVERT(NVARCHAR(3), s.[G]) + N',' + CONVERT(NVARCHAR(3), s.[B]),
							LTRIM(RTRIM(s.[Name]))
						FROM [Style] s
						ORDER BY s.[Sort]
						FOR XML PATH (N'Style'), ROOT (N'Styles'), TYPE
				 ),
				( -- Levels
				  SELECT
						 [@id] = ROW_NUMBER() OVER (ORDER BY l.[Sort]) - 1,
							[@Code] = l.[Code],
							[@Opacity] = CONVERT(NVARCHAR(5), l.[Opacity]),
							LTRIM(RTRIM(l.[Name]))
						FROM [Level] l
						ORDER BY l.[Sort]
						FOR XML PATH (N'Level'), ROOT (N'Levels'), TYPE
				 ),
				( -- Artists
						SELECT
							[Name] = ea.[Artist]
						FROM [EventArtist] ea
						WHERE ea.[EventId] = e.[Id]
						ORDER BY ea.[Artist]
						FOR XML PATH (N'Artist'), ROOT (N'Artists'), TYPE
					)
			FOR XML PATH (N'Config'), TYPE
  ),
	( -- Workshops
	  SELECT
			 [@Name] = DATENAME(weekday, dte.[Date]),
				( -- Room
				  SELECT
						 [@Name] = edr.[Room],
							( -- Slot
							  SELECT
									 [@Time] = CONVERT(NVARCHAR(8), edt.[Time], 114),
										( -- Workshop
										  SELECT
												 [Style] = ws.[Style],
													[Title] = ws.[Title],
													[Artist] = ws.[Artist],
													[Level] = ISNULL(ws.[Level], NULL)
												FROM [Workshop] ws
												WHERE ws.[EventId] = dte.[EventId]
												 AND ws.[Date] = dte.[Date]
													AND ws.[Time] = edt.[Time]
													AND ws.[Room] = edr.[Room]
												FOR XML PATH (N'Workshop'), TYPE
										 )
									FROM [EventDateTime] edt
									WHERE edt.[EventId] = dte.[EventId]
									 AND edt.[Date] = dte.[Date]
									ORDER BY edt.[Time]
									FOR XML PATH (N'Slot'), TYPE
							 )
						FROM [EventDateRoom] edr
						WHERE edr.[EventId] = dte.[EventId]
						 AND edr.[Date] = dte.[Date]
						ORDER BY edr.[Sort]
						FOR XML PATH (N'Room'), TYPE
				 )
			FROM [EventDate] dte
			WHERE dte.[EventId] = e.[Id]
			ORDER BY dte.[Date]
			FOR XML PATH (N'Day'), ROOT (N'Workshops'), TYPE
	 )
FROM [Event] e
WHERE e.[Id] = @EventId
FOR XML PATH (N'UKDC')