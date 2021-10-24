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

<xsl:template name="gen-user-styles">
  <xsl:apply-templates select="." mode="gen-user-styles"/>
  <xsl:apply-templates select="." mode="gen-common-extended-style"/>
</xsl:template>
  
</xsl:stylesheet>
