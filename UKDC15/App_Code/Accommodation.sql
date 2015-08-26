USE [MYDC]
GO

DECLARE @Filename NVARCHAR(max)

SET @Filename = N'C:\Users\pierre.WHITESPACE\Documents\UKDC15\UKDC15\xml\accommodation.xml'
--SET @Filename = N'C:\Users\Pierre\Documents\GitHub\UKDC15\UKDC15\xml\accommodation.xml'

DECLARE @SQL NVARCHAR(max), @XML XML
SET @SQL = N'SELECT @XML = CONVERT(XML, [BulkColumn]) FROM OPENROWSET(BULK ' + QUOTENAME(@Filename, N'''') + N', SINGLE_BLOB) AS [xml]'
EXEC sp_executesql @SQL, N'@XML XML OUTPUT', @XML OUT

SELECT
 [Type] = b.value(N'@Type', N'NVARCHAR(255)'),
	[Quantity] = b.value(N'@Quantity', N'INT'),
	[Allocated] = b.value(N'count(Unit)', N'INT')
FROM @XML.nodes(N'//Batch') bat (b)


;WITH [Accommodation] AS (
		SELECT a.[Artist], [Beds] = COUNT(*)
		FROM @XML.nodes(N'//Guest') acc (u)
		 CROSS APPLY (SELECT u.value(N'@Artist', N'NVARCHAR(100)')) a ([Artist])
		GROUP BY a.[Artist]
 )
SELECT *
FROM [Accommodation] acc
 FULL OUTER JOIN [EventArtist] ea ON ea.[EventId] = 1 AND acc.[Artist] = ea.[Artist]

;WITH [Accommodation] AS (
		SELECT a.[Artist], [Beds] = COUNT(*)
		FROM @XML.nodes(N'//Guest') acc (u)
		 CROSS APPLY (SELECT u.value(N'@Artist', N'NVARCHAR(100)')) a ([Artist])
		GROUP BY a.[Artist]
 )
SELECT *
FROM [Accommodation] acc
 FULL OUTER JOIN [EventArtist] ea
	  LEFT JOIN (VALUES
			  (N'Christian Jean-Francois'),
					(N'Joana Carvalho'),
					(N'Joseph Davids'),
					(N'Lisa & Mark'),
					(N'Nadia Yammine'),
					(N'Neville Ashman'),
					(N'Phil Kaila'),
					(N'Pierre & Zoe'),
					(N'Pierre Henry'),
					(N'Zoe Hodges')
			 ) exc ([Artist]) ON ea.[Artist] = exc.[Artist]
	 ON ea.[EventId] = 1 AND acc.[Artist] = ea.[Artist]
WHERE ea.[Artist] IS NULL
 OR (acc.[Artist] IS NULL AND exc.[Artist] IS NULL)

;WITH [Units] AS (
		SELECT
			[Type] = u.value(N'../@Type', N'NVARCHAR(255)'),
			[Rooms] = u.query(N'..').value(N'count(Batch/Rooms/Room)', N'TINYINT'),
			[RoomType1] = u.value(N'../Rooms[1]/Room[1]', N'NVARCHAR(25)'),
			[RoomType2] = u.value(N'../Rooms[1]/Room[2]', N'NVARCHAR(25)'),
			[RoomType3] = u.value(N'../Rooms[1]/Room[3]', N'NVARCHAR(25)'),
			[AllocatedRooms] = u.value(N'count(Room)', N'TINYINT'),
			[AllocatedRoomType1] = u.value(N'Room[1]/@Type', N'NVARCHAR(25)'),
			[AllocatedRoomType2] = u.value(N'Room[2]/@Type', N'NVARCHAR(25)'),
			[AllocatedRoomType3] = u.value(N'Room[3]/@Type', N'NVARCHAR(25)'),
			[Unit] = u.query(N'.')
		FROM @XML.nodes(N'//Unit') acc (u)
 )
SELECT *
FROM [Units]
WHERE ISNULL([Rooms], 0) < ISNULL([AllocatedRooms], 0)
 OR ISNULL([RoomType1], N'') <> COALESCE([AllocatedRoomType1], [RoomType1], N'')
	OR ISNULL([RoomType2], N'') <> COALESCE([AllocatedRoomType2], [RoomType2], N'')
	OR ISNULL([RoomType3], N'') <> COALESCE([AllocatedRoomType3], [RoomType3], N'')

-- Check that guests in a double room have the same OrderNo
SELECT [Unit] = r.query(N'..')
FROM @XML.nodes(N'//Room[@Type="Double"]') acc (r)
WHERE r.value(N'count(Guest/@OrderNo)', N'TINYINT') = 2
 AND r.value(N'count(Guest)', N'TINYINT') = 2
	AND r.value(N'Guest[1]/@OrderNo', N'INT') <> r.value(N'Guest[2]/@OrderNo', N'INT')

SELECT *
FROM [checkin]
WHERE [bed] LIKE N'[23] Bed Apartment'