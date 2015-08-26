<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <style>
          body, table { font-size: 10pt; }
          table { border-collapse: collapse; page-break-inside: auto; }
          tr { page-break-inside: avoid; page-break-after: auto; }
          td, th {
          border: solid 1px black;
          padding: 5px 5px 5px 5px;
          text-align: center;
          vertical-align: middle;
          text-transform: uppercase;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates></xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Accommodation">
    <xsl:for-each select="Batch">
      <xsl:variable name="Rooms" select="Rooms/Room"/>
      <h1>
        <xsl:value-of select="@Type" />
        <br/>
        <small>
          <xsl:value-of select="count(Unit)"/>
          of
          <xsl:value-of select="@Quantity"/>
          units allocated
        </small>
      </h1>
      <table cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th>#</th>
            <xsl:for-each select="$Rooms">
              <th colspan="2">
                <xsl:value-of select="."/>
              </th>
            </xsl:for-each>
          </tr>
        </thead>
        <xsl:for-each select="Unit">
          <xsl:variable name="UnitRooms" select="Room" />
          <tr>
            <th>
              <xsl:value-of select="position()" />
            </th>
            <xsl:for-each select="$Rooms">
              <xsl:variable name="RoomIndex" select="position()" />
              <xsl:variable name="Guests" select="$UnitRooms[$RoomIndex]/Guest" />
              <xsl:choose>
                <xsl:when test="count($Guests) = 0">
                  <td colspan="2"></td>
                </xsl:when>
                <xsl:when test="count($Guests) = 1">
                  <xsl:call-template name="Guest">
                    <xsl:with-param name="ThisGuest" select="$Guests[1]" />
                    <xsl:with-param name="ColSpan" select="'2'" />
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="count($Guests) = 2">
                  <xsl:call-template name="Guest">
                    <xsl:with-param name="ThisGuest" select="$Guests[1]" />
                  </xsl:call-template>
                  <xsl:call-template name="Guest">
                    <xsl:with-param name="ThisGuest" select="$Guests[2]" />
                  </xsl:call-template>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Guest">
    <xsl:param name="ThisGuest" />
    <xsl:param name="ColSpan" />
    <xsl:variable name="BGColor">
      <xsl:choose>
        <xsl:when test="$ThisGuest/@Artist">#FFA</xsl:when>
        <xsl:when test="$ThisGuest/@OrderNo">#AEF</xsl:when>
      </xsl:choose>
    </xsl:variable>
    <td>
      <xsl:attribute name="colspan">
        <xsl:value-of select="$ColSpan"/>
      </xsl:attribute>
      <xsl:attribute name="style">
        background-color:
        <xsl:value-of select="$BGColor"/>
      </xsl:attribute>
      <b>
        <xsl:value-of select="$ThisGuest/@Name"/>
      </b>
      <xsl:if test="$ThisGuest/@OrderNo">
        <br/>
        <small>
          #<xsl:value-of select="$ThisGuest/@OrderNo"/>
        </small>
      </xsl:if>
      <xsl:if test="$ThisGuest/@Artist">
        <br/>
        <small>
          <i>
            <xsl:value-of select="$ThisGuest/@Artist"/>
          </i>
        </small>
      </xsl:if>
    </td>
  </xsl:template>

</xsl:stylesheet>
