<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8" name="xml"/>
    
    <xsl:template match="@* | node()" mode="copyXML">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="copyXML"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:choice" mode="copyXML">
        <xsl:apply-templates select="tei:reg | tei:corr | tei:expan" mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:reg | tei:corr | tei:expan" mode="copyXML">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:persName | tei:placeName | tei:orgName | tei:rs" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:bibl" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:title[not(ancestor::tei:bibl)]" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:date" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <!--<xsl:variable name="lc" select="abcdefghijklmnopqrstuvwxyz"/>
    <xsl:variable name="uc" select="ABCDEFGHIJKLMNOPQRSTUVWXYZ"/>-->
    
    <xsl:template match="tei:del" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:supplied" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:hi" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:add" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:measure" mode="copyXML">
        <xsl:apply-templates mode="copyXML"/>
    </xsl:template>
    
    <xsl:template match="tei:quote" mode="copyXML">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:foreign" mode="copyXML">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@xml:id" mode="copyXML">
        <xsl:attribute name="id">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:ref" mode="copyXML"/>
    <xsl:template match="tei:lb | tei:pb | tei:cb" mode="copyXML"/>
    <xsl:template match="tei:fw" mode="copyXML"/>
</xsl:stylesheet>