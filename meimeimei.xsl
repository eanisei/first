<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
  <html>
  <body>
  <h2>Parts WebStore</h2>
  <h3>Records are sorted by amount it descending order. Customers that paid more than 150 highlithed with yellow color. For those who paid less than 150 with green.</h3>
    <table border="2">
      <tr bgcolor="#EAEAEA">
        <th>Nickname</th>
        <th>Email</th>
        <th>Amount</th>
        <th>category</th>
        <th>code</th>
      </tr>
      <xsl:for-each select="webstore/customer">
        <xsl:sort select="amount" />
      <tr>
        <td><xsl:value-of select="nickname"/></td>
        <td><xsl:value-of select="email"/></td>
        <td><xsl:value-of select="boughtItemInfo/category"/></td>
        <xsl:choose>
            <xsl:when test="amount>150">
                <td style="background-color:#FFFF00">
                    <xsl:value-of select="amount" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td style="background-color:#ADFF2F	">
                    <xsl:value-of select="amount" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="boughtItemInfo/category" >
                <td>
                    <xsl:value-of select="boughtItemInfo/category" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td style="background-color:#FF0000">
                    <xsl:value-of select="boughtItemInfo/category" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>