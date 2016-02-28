<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    <xsl:output method="html" indent="yes" encoding="UTF-8" name="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Édition du journal de Nicolas Durival ß</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>                
                <link rel="stylesheet" href="../css/foundation.css"/>
                <!-- Pour personnalisation -->
                <link rel="stylesheet" href="../css/app.css"></link>                                                                
                <script src="../js/vendor/modernizr.js">/*pour transformation XSL*/</script>
            </head>
            <body>
                <div class="row">
                    <div class="large12">
                        <ul>
                            <xsl:for-each select="//tei:body//tei:div[@type='month']">
                                <li>
                                    <a href="{./@xml:id}.html"><xsl:value-of select="tei:fw[@type='runningHead']/tei:date"/><!--<xsl:value-of select="./@xml:id"/>--></a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
                <xsl:apply-templates select="//tei:body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tei:body">
        <xsl:for-each select=".//tei:div[@type='month']">
            <xsl:result-document format="html" encoding="UTF-8" href="{./@xml:id}.html">
                <html>
                    <head>
                        <title>Édition du journal de Nicolas Durival ß</title>
                        <meta charset="utf-8"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>                
                        <link rel="stylesheet" href="../css/foundation.css"/>
                        <!-- Pour personnalisation -->
                        <link rel="stylesheet" href="../css/app.css"></link>                                                                        
                        <script src="../js/vendor/modernizr.js">/*pour transformation XSL*/</script>
                    </head>
                    <body>
                        <div class="row">
                            <div class="large-10 center">                            
                                <xsl:apply-templates/> 
                            </div>
                        </div>                    
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='year']">
        <xsl:apply-templates select="tei:div[@type='month']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='month']">
        <xsl:apply-templates select="tei:div[@type='day']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='day']">
        <div class="row">
            <div class="large-4 columns">
                <!--<xsl:choose>
                    <xsl:when test="tei:p/tei:date[@type='entry']/@when">
                        <xsl:value-of select="format-date(tei:p/tei:date[@type='entry']/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>        
                    </xsl:when>
                    <xsl:when test="tei:p/tei:date[@type='entry']/@from">
                        <xsl:value-of select="format-date(tei:p/tei:date[@type='entry']/@from,'[D01]', 'fr', (), ())"/>
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="format-date(tei:p/tei:date[@type='entry']/@to,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                    </xsl:when>
                </xsl:choose>-->
                <xsl:apply-templates select="tei:p/tei:date[@type='entry']" mode="date"/>
                <!--<xsl:if test="tei:p/tei:pb[@facs] | tei:pb[@fac]">
                    <xsl:variable name="img" select="/tei:pb/@facs"/>
                    <img src="../images/complet/{$img}.jpg" alt="Durival"/>
                </xsl:if>-->
            </div>
            <div class="large-8 columns">
                <xsl:for-each select="tei:p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='super'">
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:when test="@rend='sub'">
                <sub>
                    <xsl:apply-templates/>
                </sub>
            </xsl:when>
            <xsl:when test="@rend='underline'">
                <u>
                    <xsl:apply-templates/>
                </u>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:subst">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <xsl:text>« </xsl:text><xsl:apply-templates/><xsl:text> »</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:add[@place='above']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <strike><xsl:apply-templates/></strike>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr"/>
        <xsl:text> [</xsl:text>
        <xsl:apply-templates select="tei:expan"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:persName[@ref]">
        <span class="identPers"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:rs[@type='person' and @ref]">
        <span class="identPers"><u><xsl:apply-templates/></u></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:placeName[@ref]">
        <span class="identPlace"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:orgName[@ref]">
        <span class="identOrg"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:placeName[not(@ref)] | tei:div[@type='transcription']//tei:persName[not(@ref)] | tei:div[@type='transcription']//tei:orgName[not(@ref)] | tei:div[@type='transcription']//tei:rs[not(@ref) and not(@type='memoir')]">
        <span class="identRef"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:date[not(@type='entry')]">
        <span class="identDate"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']//tei:title | tei:div[@type='transcription']//tei:rs[@type='memoir']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="tei:fw[@type='pageNum']"/>
    
    <xsl:template match="tei:div[@type='transcription']//tei:list">
        <ul>
            <xsl:for-each select="tei:item">
                <li>
                    <xsl:apply-templates select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:date[@type='entry']"/>
    <xsl:template match="tei:date[@type='entry']" mode="date">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="format-date(@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>        
            </xsl:when>
            <xsl:when test="@from and @to">
                <xsl:value-of select="format-date(@from,'[D01]', 'fr', (), ())"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="format-date(@to,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
</xsl:stylesheet>