<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Extend CSS Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0"
>

<!-- Define a newline character -->
<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>



<xsl:template name="generateCssLinks">
  <xsl:variable name="childlang">
      <xsl:choose>
        <!-- Update with DITA 1.2: /dita can have xml:lang -->
        <xsl:when test="self::dita[not(@xml:lang)]">
          <xsl:for-each select="*[1]"><xsl:call-template name="getLowerCaseLang"/></xsl:for-each>
        </xsl:when>
        <xsl:otherwise><xsl:call-template name="getLowerCaseLang"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="direction">
      <xsl:apply-templates select="." mode="get-render-direction">
        <xsl:with-param name="lang" select="$childlang"/>
      </xsl:apply-templates>
    </xsl:variable>
    <xsl:variable name="urltest" as="xs:boolean"> <!-- test for URL -->
      <xsl:call-template name="url-string">
        <xsl:with-param name="urltext" select="concat($CSSPATH, $CSS)"/>
      </xsl:call-template>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$direction = 'rtl' and $urltest ">
        <link rel="stylesheet" type="text/css" href="{$CSSPATH}{$bidi-dita-css}"/>
      </xsl:when>
      <xsl:when test="$direction = 'rtl' and not($urltest)">
        <link rel="stylesheet" type="text/css" href="{$PATH2PROJ}{$CSSPATH}{$bidi-dita-css}"/>
      </xsl:when>
      <xsl:when test="$urltest">
        <link rel="stylesheet" type="text/css" href="{$CSSPATH}{$dita-css}"/>
      </xsl:when>
      <xsl:otherwise>
        <link rel="stylesheet" type="text/css" href="{$PATH2PROJ}{$CSSPATH}{$dita-css}"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$newline"/>
    <!-- Add user's style sheet if requested to -->
    <xsl:if test="string-length($CSS) > 0">
      <xsl:choose>
        <xsl:when test="$urltest">
          <link rel="stylesheet" type="text/css" href="{$CSSPATH}{$CSS}"/>
        </xsl:when>
        <xsl:otherwise>
          <link rel="stylesheet" type="text/css" href="{$PATH2PROJ}{$CSSPATH}{$CSS}"/>
        </xsl:otherwise>
      </xsl:choose><xsl:value-of select="$newline"/>
    </xsl:if>

    <!-- ↓ Add an additional extended stylesheet ↑ -->
    <xsl:apply-templates select="." mode="gen-common-extended-style"/>
    <!-- ↑ End customization · Continue with DITA-OT defaults ↓ -->
</xsl:template>
  
</xsl:stylesheet>
