<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:div[@type='transcription']"/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='transcription']">        
        <xsl:for-each select="//tei:persName[@ref] | tei:rs[@ref]">
                <xsl:variable name="ref" select="substring-after(@ref,'#')"/>
                <xsl:choose>
                    <xsl:when test="//tei:person[@xml:id=$ref]"/>
                    <xsl:otherwise>
                        <xsl:element name="person">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="$ref"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:otherwise>            
            </xsl:choose>
            </xsl:for-each>
        
        <xsl:for-each select="//tei:placeName[@ref]">
            <xsl:variable name="ref" select="substring-after(@ref,'#')"/>
            <xsl:choose>
                <xsl:when test="//tei:place[@xml:id=$ref]"/>
                <xsl:otherwise>
                    <xsl:element name="place">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="$ref"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:otherwise>            
            </xsl:choose>
        </xsl:for-each>
        
        <xsl:for-each select="//tei:orgName[@ref]">
            <xsl:variable name="ref" select="substring-after(@ref,'#')"/>
            <xsl:choose>
                <xsl:when test="//tei:org[@xml:id=$ref]"/>
                <xsl:otherwise>
                    <xsl:element name="org">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="$ref"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:otherwise>            
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    
    
    

</xsl:stylesheet>