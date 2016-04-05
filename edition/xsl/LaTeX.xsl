<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:ml="http://www.w3.org/1998/Math/MathML"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
<xsl:output method="text" indent="no" omit-xml-declaration="no" encoding="UTF-8"/>

<xsl:template match="/">
    <xsl:apply-templates/>  
</xsl:template>    

    <xsl:template match="//tei:div[@type='year']">
        <xsl:text>\part*{</xsl:text><xsl:apply-templates select="tei:head"></xsl:apply-templates><xsl:text>}</xsl:text>
        <xsl:text>\addcontentsline{toc}{part}{</xsl:text><xsl:apply-templates select="tei:head"></xsl:apply-templates><xsl:text>}</xsl:text>
        <xsl:apply-templates select="tei:div[@type='month']"/>
    </xsl:template>

    <xsl:template match="//tei:div[@type='month']">
        <xsl:variable name="monthDate" select="concat(./tei:fw[@type='runningHead']/tei:date/@when,'-01')"/>
        <xsl:variable name="test"><xsl:value-of select="$monthDate"/></xsl:variable>
        <xsl:text>\chapter*{</xsl:text><xsl:value-of select="format-date($test,'[MNn] [Y0001]')"/><xsl:text>}</xsl:text>
        <xsl:text>\addcontentsline{toc}{chapter}{</xsl:text><xsl:value-of select="format-date($test,'[MNn] [Y0001]')"/><xsl:text>}</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//tei:div[@type='day']">
        <xsl:text>\begin{diary}{</xsl:text><xsl:apply-templates select=".//tei:date[@type='entry']" mode="date"></xsl:apply-templates><xsl:text>}{}</xsl:text>
        <xsl:apply-templates/>        
        <xsl:text>\end{diary}</xsl:text>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='insert']">
        <xsl:choose>
            <xsl:when test="tei:div[@type='letter']">
                <xsl:text>\begin{diary}{Encart}{}</xsl:text>
                <xsl:apply-templates select="tei:div[@type='letter']/tei:dateline"/>
                <xsl:text>\bigskip
                
                </xsl:text>
                <xsl:for-each select="tei:div[@type='letter']/tei:p">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                
                <xsl:apply-templates select="tei:div[@type='letter']/tei:closer/tei:salute"/>
                <xsl:text>\bigskip
                
                </xsl:text>
                <xsl:text>\begin{flushright}</xsl:text>
                <xsl:apply-templates select="tei:div[@type='letter']/tei:closer/tei:signed"/>
                <xsl:text>\end{flushright}</xsl:text>
                <xsl:text>\end{diary}</xsl:text>
            </xsl:when>
            <xsl:when test="tei:div[@type='verse']">
                <xsl:text>\begin{diary}{Encart}{}</xsl:text>
                <xsl:for-each select="./tei:div[@type='verse']">
                    <xsl:if test="tei:head">
                        <xsl:text>\begin{Large}</xsl:text>
                        <xsl:apply-templates select="tei:head"/>
                        <xsl:text>\end{Large}</xsl:text>
                        <xsl:text>\bigskip
                
                        </xsl:text>                        
                    </xsl:if>
                    <xsl:for-each select="tei:p | tei:lg | tei:quote">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:text>\end{diary}</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>\begin{diary}{Encart}{}</xsl:text>
                <xsl:apply-templates select=".//tei:p"/>
                <xsl:text>\end{diary}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:date[@type='entry']"/>
    <xsl:template match="tei:date[@type='entry']" mode="date">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="format-date(@when,'[D01] [MNn] [Y0001]', 'fr', (), ())"/>        
            </xsl:when>
            <xsl:when test="@from and @to">
                <xsl:value-of select="format-date(@from,'[D01]', 'fr', (), ())"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="format-date(@to,'[D01] [MNn] [Y0001]', 'fr', (), ())"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
        <xsl:text>\bigskip</xsl:text>
        <xsl:text>
        
        </xsl:text>
    </xsl:template>
    <!-- todo fusionner la gestion des quote et q pour n'avoir qu'une seule instruction -->
    <xsl:template match="//tei:p/tei:quote[not(@rend='underline')] | //tei:p/tei:q"><xsl:text>\og </xsl:text><xsl:apply-templates/><xsl:text> \fg{}</xsl:text></xsl:template>
    <xsl:template match="tei:div[@type='day']/tei:q | tei:div[@type='day']/tei:quote">
        <xsl:choose>
            <xsl:when test="@type='report'">
                <xsl:text>\begin{quote}</xsl:text>
                <xsl:text>\begin{flushright}</xsl:text><xsl:apply-templates select="tei:seg[@type='dateline']"/><xsl:text>\end{flushright}</xsl:text>
                <xsl:apply-templates select="tei:p"/>
                <xsl:text>\end{quote}</xsl:text>
            </xsl:when>
            <xsl:when test="@type='letter'">
                <xsl:text>\begin{quote}</xsl:text>
                <xsl:if test="tei:seg[@type='opener']/tei:seg[@type='dateline']">
                    <xsl:text>\begin{flushright}</xsl:text><xsl:apply-templates select="tei:seg[@type='opener']/tei:seg[@type='dateline']"/><xsl:text>\end{flushright}</xsl:text>
                    <xsl:text>\bigskip
                    
                    </xsl:text>
                </xsl:if>
                <xsl:if test="tei:seg[@type='opener']/tei:seg[@type='salute']">
                    <xsl:apply-templates select="tei:seg[@type='opener']/tei:seg[@type='salute']"/>
                    <xsl:text>\bigskip
                    
                    </xsl:text>
                </xsl:if>
                <xsl:apply-templates select="tei:p"/>
                <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='salute']">
                    <xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='salute']"/>
                </xsl:if>
                <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='signed']">
                    <xsl:text>\begin{flushright}</xsl:text><xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='signed']"/><xsl:text>\end{flushright}</xsl:text>
                </xsl:if>
                <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='dateline']">
                    <xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='dateline']"/>
                </xsl:if>
                <xsl:text>\end{quote}</xsl:text>                
            </xsl:when>
            <xsl:when test="@type='verse'">
                <xsl:text>\begin{quote}</xsl:text>
                <xsl:apply-templates select="tei:lg"/>
                <xsl:text>\end{quote}</xsl:text>
            </xsl:when>
        </xsl:choose>    
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <xsl:text>\begin{verse}</xsl:text>
        <xsl:for-each select="tei:l">
            <xsl:apply-templates select="."/><xsl:text>\\</xsl:text>
        </xsl:for-each>
        <xsl:text>\end{verse}
        </xsl:text>
        <xsl:text>\bigskip</xsl:text>
        <xsl:text>
        
        </xsl:text>
    </xsl:template>        
        
    <xsl:template match="tei:subst">
        <xsl:choose>
            <xsl:when test="tei:del[@rend='overwritten']">
                <xsl:apply-templates select="tei:add"/>        
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>\sout{</xsl:text><xsl:apply-templates select="tei:del"/><xsl:text>} </xsl:text><xsl:apply-templates select="tei:add"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="tei:del[not(parent::tei:subst)]"><xsl:text>\sout{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text></xsl:template>

    <xsl:template match="tei:abbr"/>
    <xsl:template match="//tei:teiHeader"/>
    <xsl:template match="//tei:div[@type='index']"/>
    <xsl:template match="//tei:fw"/>
    
    <xsl:template match="tei:hi">
        <xsl:for-each select=".">
            <xsl:choose>
                <xsl:when test="@rend='super'"><xsl:text>\up{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text></xsl:when>
                <xsl:when test="@rend='sub'"><xsl:text>\textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text></xsl:when>
                <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:list">
        <xsl:text>\begin{itemize}</xsl:text>
        <xsl:for-each select="tei:item">
            <xsl:text>\item </xsl:text><xsl:apply-templates select="."/>
        </xsl:for-each>
        <xsl:text>\end{itemize}</xsl:text>
    </xsl:template>
    
    <xsl:template match="//*[@rend='underline'] | //tei:title"><xsl:text>\emph{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text></xsl:template>    
</xsl:stylesheet>