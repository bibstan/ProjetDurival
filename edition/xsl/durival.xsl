<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8" name="html"/>
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
                                    <a href="{./@xml:id}.html"><xsl:value-of select="tei:fw[@type='runningHead']/tei:date"/></a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
                <!-- pour fonction result-document -->
                <xsl:apply-templates select="//tei:body"/>
                <xsl:apply-templates select="//tei:div[@type='index']"/>
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
                        
                        <!-- css Pour personnalisation -->
                        <link rel="stylesheet" href="../css/app.css"/>
                        <!-- Css Foundation -->
                        <link rel="stylesheet" href="../css/foundation.css"/>
                                                
                        <!-- css Owl-Carousel -->
                        <link rel="stylesheet" href="../css/owl-carousel/owl.carousel.css"/>                         
                        <link rel="stylesheet" href="../css/owl-carousel/owl.theme.default.css"/>
                                                
                        <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>
                        <script src="../js/js/jquery.js">/*Pour transformation xslt*/</script>
                        <script src="../js/vendor/modernizr.js">/*xslt*/</script>                         
                    </head>
                    <body>
                        <header class="row border-top">
                            <nav class="top-bar" data-topbar="yes" role="navigation">
                                <section class="top-bar-section">                            
                                    <ul>                                    
                                        <li class="has-dropdown">
                                            <a href="#">Accès</a>
                                            <ul class="dropdown">
                                                <xsl:for-each select="//tei:body//tei:div[@type='month']">                                                                            
                                                    <li><a href="{./@xml:id}.html"><xsl:value-of select="tei:fw[@type='runningHead']/tei:date"/></a></li>                                    
                                                </xsl:for-each>
                                            </ul>
                                        </li> 
                                        <li><a href="list.html">Index</a></li>
                                    </ul>
                                </section>
                            </nav>
                        </header>
                        <div class="row">
                            <div class="large-12 center">                            
                                <div class="owl-carousel">
                                    <xsl:apply-templates/>
                                </div> 
                            </div>
                        </div>                         
                        <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                        <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>
                        
                        <script src="../js/owl-carousel/owl.js"></script>                        
                        <script src="../js/owl-carousel/owlConfig.js"></script>                        
                        <script>$(document).foundation();</script>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='year']">
        <xsl:apply-templates select="tei:div[@type='month']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='month']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='day']">        
        <xsl:variable name="id" select="@xml:id"/>
        <div class="item" data-hash="{$id}">
            <div class="row">
                <div class="large-4 columns"><xsl:apply-templates select="tei:dateline/tei:date[@type='entry']" mode="date"/></div>
                <div class="large-8 columns">                                                            
                    <xsl:apply-templates/>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='insert']">
        <xsl:variable name="id" select="@xml:id"/>
        <div class="item" data-hash="{$id}">
            <div class="row">
                <xsl:choose>
                    <xsl:when test="tei:div[@type='letter']"><!-- todo Vérifier si besoin d'ajouter des @class pour les <p> -->
                        <div class="large-4 columns"><p>Encart : lettre</p></div>
                        <div class="large-8 columns">
                            <p><xsl:apply-templates select="tei:div[@type='letter']/tei:dateline"/></p>
                            <xsl:for-each select="tei:div[@type='letter']/tei:p">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                            <p><xsl:apply-templates select="tei:div[@type='letter']/tei:closer/tei:salute"/></p>
                            <p class="right"><xsl:apply-templates select="tei:div[@type='letter']/tei:closer/tei:signed"/></p>
                        </div>
                    </xsl:when>
                    <xsl:when test="tei:div[@type='verse']">
                        <xsl:for-each select="./tei:div[@type='verse']">
                            <div class="large-4 columns"><p>Encart : vers</p></div>
                            <div class="large-8 columns">
                                <xsl:if test="tei:head">
                                    <h3><xsl:apply-templates select="tei:head"/></h3>
                                </xsl:if>
                                <xsl:for-each select="tei:p | tei:lg | tei:quote">
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="large-4 columns"><p>Encart</p></div>
                        <div class="large-8 columns">
                            <xsl:apply-templates select=".//tei:p"/>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>     
    
    <xsl:template match="tei:dateline/tei:date[@type='entry']"/>            
    <xsl:template match="tei:dateline/tei:date[@type='entry']" mode="date">
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
    
    <xsl:template match="tei:p"><!-- todo besoin des id pour les p ? -->
        <!--<xsl:variable name="id" select="@xml:id"/>-->
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:q | tei:quote">                            
        <xsl:choose>
            <xsl:when test="@type='report'">
                <xsl:variable name="id" select="@xml:id"/>
                <blockquote id="{$id}">
                    <p class="right"><xsl:apply-templates select="tei:seg[@type='dateline']"/></p>
                    <xsl:apply-templates select="tei:p"/>
                </blockquote>
            </xsl:when>
            <xsl:when test="@type='letter'">
                <xsl:variable name="id" select="@xml:id"/>
                <blockquote id="{$id}">
                    <xsl:if test="tei:seg[@type='opener']/tei:seg[@type='dateline']">
                        <p class="right"><xsl:apply-templates select="tei:seg[@type='opener']/tei:seg[@type='dateline']"/></p>
                    </xsl:if>
                    <xsl:if test="tei:seg[@type='opener']/tei:seg[@type='salute']">
                        <p><xsl:apply-templates select="tei:seg[@type='opener']/tei:seg[@type='salute']"/></p>                        
                    </xsl:if>
                    <xsl:apply-templates select="tei:p"/>
                    <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='salute']">
                        <p><xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='salute']"/></p>
                    </xsl:if>
                    <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='signed']">
                        <p class="right"><xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='signed']"/></p>
                    </xsl:if>
                    <xsl:if test="tei:seg[@type='closer']/tei:seg[@type='dateline']">
                        <p><xsl:apply-templates select="tei:seg[@type='closer']/tei:seg[@type='dateline']"/></p>
                    </xsl:if>
                </blockquote>
            </xsl:when>
            <xsl:when test="@type='verse'">                
                <blockquote><xsl:apply-templates select="tei:lg"/></blockquote>
            </xsl:when>
            <xsl:when test="parent::tei:p">
                <xsl:text>« </xsl:text><xsl:apply-templates/><xsl:text> »</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:lg">        
        <p>
            <xsl:for-each select="tei:l">
                <xsl:apply-templates select="."/>
                <br />
            </xsl:for-each>
        </p>        
    </xsl:template>
    
    <xsl:template match="tei:subst">
        <xsl:apply-templates/>
    </xsl:template>        
    
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
        
    <xsl:template match="tei:w">
        <xsl:value-of select="replace(.,'-','')"/>        
    </xsl:template>
        
    <xsl:template match="tei:sic">
        <xsl:apply-templates/><i>(sic)</i>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='super'"><sup><xsl:apply-templates/></sup></xsl:when>
            <xsl:when test="@rend='sub'"><sub><xsl:apply-templates/></sub></xsl:when>
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//*[@rend='underline']">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <xsl:template match="tei:title[ancestor::tei:p]">
        <cite><xsl:apply-templates/></cite>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr"/>
        <xsl:text> [</xsl:text><xsl:apply-templates select="tei:expan"/><xsl:text>]</xsl:text>
    </xsl:template>    
    
    <xsl:template match="tei:div[@type='transcription']//tei:list">
        <ul>
            <xsl:for-each select="tei:item">
                <li><xsl:apply-templates select="."/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:fw"/>
    
    <!-- ********** INDEX ********** -->
    <xsl:template match="//tei:div[@type='index']">
        <xsl:result-document format="html" encoding="UTF-8" href="list.html">
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
                            <xsl:apply-templates select="tei:listPerson"/> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-10 center">                            
                            <xsl:apply-templates select="tei:listplace"/> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-10 center">                            
                            <xsl:apply-templates select="tei:listOrg"/> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-10 center">                            
                            <xsl:apply-templates select="tei:listBibl"/> 
                        </div>
                    </div>                    
                </body>
            </html>
        </xsl:result-document>        
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listPerson">
        <ul>
            <xsl:for-each select="tei:person">
                <xsl:variable name="id" select=" concat('#',@xml:id)"/>
                <li>                    
                    <xsl:apply-templates select="tei:persName"/>
                    <ul>
                        <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'] | //tei:div[@type='transcription']//tei:div[@type='insert']">
                            <xsl:if test=".//tei:persName[@ref=$id] | .//tei:rs[@type='person' and @ref=$id]">
                                <xsl:variable name="id" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                <li>
                                    <a href="{$id}"><xsl:value-of select="@xml:id"/></a>                                    
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listPlace">
        <ul>
            <xsl:for-each select="tei:place">
                <xsl:variable name="id" select=" concat('#',@xml:id)"/>
                <li>                    
                    <xsl:apply-templates select="tei:placeName"/>
                    <ul>
                        <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'] | //tei:div[@type='transcription']//tei:div[@type='insert']">
                            <xsl:if test=".//tei:placeName[@ref=$id]">
                                <xsl:variable name="id" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                <li>
                                    <a href="{$id}"><xsl:value-of select="@xml:id"/></a>                                    
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listOrg">
        <ul>
            <xsl:for-each select="tei:org">
                <xsl:variable name="id" select=" concat('#',@xml:id)"/>
                <li>                    
                    <xsl:apply-templates select="tei:orgName"/>
                    <ul>
                        <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'] | //tei:div[@type='transcription']//tei:div[@type='insert']">
                            <xsl:if test=".//tei:orgName[@ref=$id]">
                                <xsl:variable name="id" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                <li>
                                    <a href="{$id}"><xsl:value-of select="@xml:id"/></a>
                                    
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listBibl">
        <ul>
            <xsl:for-each select="tei:bibl">
                <xsl:variable name="id" select=" concat('#',@xml:id)"/>
                <li>                    
                    <xsl:apply-templates select="tei:title"/>
                    <ul>
                        <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'] | //tei:div[@type='transcription']//tei:div[@type='insert']">
                            <xsl:if test=".//tei:title[@ref=$id] or .//tei:rs[@type='bibl' and @ref=$id]">
                                <xsl:variable name="id" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                <li>
                                    <a href="{$id}"><xsl:value-of select="@xml:id"/></a>                                    
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <!-- pour vérification d'encodage à supprimer par la suite -->
    
    <!--<xsl:template match="tei:div[@type='transcription']//tei:persName[@ref]">
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
    </xsl:template>-->
    
    
</xsl:stylesheet>