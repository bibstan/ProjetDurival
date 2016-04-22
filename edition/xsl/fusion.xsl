<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs tei office style text table xlink #default"    
    version="2.0">
    
    <xsl:template match="@*|node()" xpath-default-namespace="http://www.w3.org/1999/xhtml">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:place">
        <xsl:for-each select=".">
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:variable name="placeName" select="normalize-space(tei:placeName)"/>
            <xsl:choose>
                <xsl:when test="document('../xml/listPlace.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id][table:table-cell[3] != '']">
                    <place xml:id="{$id}">
                        <placeName><xsl:value-of select="$placeName"/></placeName>
                        <xsl:if test="document('../xml/listPlace.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3] != ''">
                            <location>
                                <geo><xsl:value-of select="replace(normalize-space(document('../xml/listPlace.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3]),' ','')"/></geo>
                            </location>
                        </xsl:if>                        
                    </place>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>