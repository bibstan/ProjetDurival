<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <!--<xsl:apply-templates select="//tei:listPerson"/>-->
        <xsl:apply-templates select="//tei:listPlace"/>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson">
        <xsl:text>@XML:ID,NOM,INFOS;
        </xsl:text>
        <xsl:for-each select="tei:person">
            <xsl:value-of select="@xml:id"/><xsl:text>,</xsl:text>
            <xsl:value-of select="tei:persName"/><xsl:text>,</xsl:text>
            <xsl:value-of select="tei:state/tei:p"/><xsl:text>;
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace">
        <xsl:text>@XML:ID,lieux;
        </xsl:text>
        <xsl:for-each select="tei:place">
            <xsl:value-of select="@xml:id"/><xsl:text>,</xsl:text>
            <xsl:value-of select="tei:placeName"/><xsl:text>;
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="//tei:listOrg">
        <xsl:text>@XML:ID,Org;
        </xsl:text>
        <xsl:for-each select="tei:org">
            <xsl:value-of select="@xml:id"/><xsl:text>,</xsl:text>
            <xsl:value-of select="tei:orgName"/><xsl:text>;
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>