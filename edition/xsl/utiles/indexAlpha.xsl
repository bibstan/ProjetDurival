<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson">
        <xsl:copy>            
            <xsl:apply-templates select="tei:person">
                <xsl:sort select="@xml:id" order="ascending" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace">
        <xsl:copy>            
            <xsl:apply-templates select="tei:place">
                <xsl:sort select="./@xml:id" order="ascending" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>