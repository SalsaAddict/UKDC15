DECLARE @Filename NVARCHAR(max)

--SET @Filename = N'C:\Users\pierre.WHITESPACE\Documents\UKDC15\UKDC15\xml\accommodation.xml'
SET @Filename = N'C:\Users\Pierre\Documents\GitHub\UKDC15\UKDC15\xml\accommodation.xml'

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