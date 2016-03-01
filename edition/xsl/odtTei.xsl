<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <div type="month" xml:id="d176612">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="//body//p">
        <xsl:choose>
            <xsl:when test="font[@color='#cc0066']">
                <xsl:variable name="day">
                <xsl:for-each select=".">
                    <xsl:choose>
                        <xsl:when test="./text() = '1'">
                            <xsl:value-of select="concat('0',font[@color='#cc0066'])"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="font[@color='#cc0066']"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>                    
                </xsl:variable>
                <div type='day' xml:id="d176612{$day}">
                    <xsl:element name="p">
                        <xsl:attribute name="xml:id" select="concat('d176612',$day,'01')"/>
                            <xsl:apply-templates/>                        
                    </xsl:element>                    
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="p">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--<xsl:template match="//p//text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>-->
    
    <xsl:template match="//body//br">
        <xsl:element name="lb"/>
    </xsl:template>
    
    <xsl:template match="//body//sup">
        <xsl:element name="hi"><xsl:attribute name="rend">super</xsl:attribute><xsl:apply-templates/></xsl:element>
    </xsl:template>
    <xsl:template match="//body//sub">
        <xsl:element name="hi"><xsl:attribute name="rend">sub</xsl:attribute><xsl:apply-templates/></xsl:element>
    </xsl:template>
    
    <xsl:template match="//font[@color='#0000cc']">
        <persName><xsl:apply-templates/></persName>
    </xsl:template>
    <xsl:template match="//font[@color='#cc0066']">
        <xsl:variable name="date" select="."/>
        <date type="entry" when="1766-12-{$date}"><xsl:apply-templates/></date>
    </xsl:template>
    <xsl:template match="//font[@color='#cc00cc']">
        <placeName><xsl:apply-templates/></placeName>
    </xsl:template>
    <xsl:template match="//font[@color='#006600']">
        <orgName><xsl:apply-templates/></orgName>
    </xsl:template>
    
</xsl:stylesheet>