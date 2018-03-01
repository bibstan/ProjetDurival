<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:reg | tei:corr | tei:expan"/>
    </xsl:template>
    
    <xsl:template match="tei:reg | tei:corr | tei:expan">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:persName | tei:placeName | tei:orgName | tei:rs">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:title[not(ancestor::tei:bibl)]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:date">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--<xsl:variable name="lc" select="abcdefghijklmnopqrstuvwxyz"/>
    <xsl:variable name="uc" select="ABCDEFGHIJKLMNOPQRSTUVWXYZ"/>-->
    
    <xsl:template match="tei:del">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:supplied">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:supplied">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:add">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:measure">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:foreign">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@xml:id">
        <xsl:attribute name="id">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:ref"/>
    <xsl:template match="tei:lb | tei:pb | tei:cb"/>
    <xsl:template match="tei:fw"/>
</xsl:stylesheet>