USE [UKDC]
GO

DECLARE @Filename NVARCHAR(max)

SET @Filename = N'C:\Users\pierre.WHITESPACE\Documents\UKDC15\UKDC15\xml\accommodation.xml'
--SET @Filename = N'C:\Users\Pierre\Documents\GitHub\UKDC15\UKDC15\xml\accommodation.xml'

DECLARE @SQL NVARCHAR(max), @XML XML
SET @SQL = N'SELECT @XML = CONVERT(XML, [BulkColumn]) FROM OPENROWSET(BULK ' + QUOTENAME(@Filename, N'''') + N', SINGLE_BLOB) AS [xml]'
EXEC sp_executesql @SQL, N'@XML XML OUTPUT', @XML OUT

;WITH [Accommodation] AS (
		SELECT
			[name] = g.value(N'@Name', N'NVARCHAR(255)'),
			[orderno] = g.value(N'@OrderNo', N'FLOAT'),
			[guests] = g.query(N'..').value(N'count(Room/Guest)', N'TINYINT'),
			[type] = g.value(N'../@Type', N'NVARCHAR(25)')
		FROM @XML.nodes(N'//Guest') acc (g)
		WHERE g.exist(N'@OrderNo') = 1
	)
SELECT *
FROM [Accommodation] acc
 FULL JOIN [checkin] chk ON acc.[name] = chk.[name] AND acc.[orderno] = chk.[orderno]
WHERE ISNULL(chk.[bed], N'') <> N'No'
 AND acc.[Guests] > 1
	AND chk.[bed] = N'Single Room'

;WITH [Accommodation] AS (
		SELECT
			[name] = g.value(N'@Name', N'NVARCHAR(255)'),
			[orderno] = g.value(N'@OrderNo', N'FLOAT'),
			[guests] = g.query(N'..').value(N'count(Guest)', N'TINYINT')
		FROM @XML.nodes(N'//Guest') acc (g)
		WHERE g.exist(N'@OrderNo') = 1
	)
SELECT *,
 (SELECT [@Name] = chk.[name], [@OrderNo] = CONVERT(NVARCHAR(10), chk.[orderno]) WHERE chk.[orderno] IS NOT NULL FOR XML PATH (N'Guest'))
FROM [Accommodation] acc
 FULL JOIN [checkin] chk ON acc.[name] = chk.[name] AND acc.[orderno] = chk.[orderno]
WHERE ISNULL(chk.[bed], N'') <> N'No'
 AND (acc.[name] IS NULL OR chk.[name] IS NULL)

;WITH [Accommodation] AS (
		SELECT
			[name] = g.value(N'@Name', N'NVARCHAR(255)'),
			[orderno] = g.value(N'@OrderNo', N'FLOAT'),
			[guests] = g.query(N'..').value(N'count(Room/Guest)', N'TINYINT'),
			[type] = g.value(N'../@Type', N'NVARCHAR(25)')
		FROM @XML.nodes(N'//Guest') acc (g)
		WHERE g.exist(N'@OrderNo') = 1
	)
SELECT *
FROM [Accommodation] acc
 FULL JOIN [checkin] chk ON acc.[name] = chk.[name] AND acc.[orderno] = chk.[orderno]
WHERE ISNULL(chk.[bed], N'') <> N'No'