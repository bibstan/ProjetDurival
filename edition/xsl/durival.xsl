<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8" name="html"/>
    <xsl:output method="text" indent="yes" encoding="UTF-8" name="frise"/>
    
    <xsl:variable name="header">
        <header class="row">
            <img src="../images/header/header.jpg" alt="header" />
            <div class="top-bar">
                <div class="top-bar-left">
                    <ul class="dropdown menu" data-dropdown-menu="true">
                        <li><a href="../index.html">Accueil</a></li>                                        
                        <li>
                            <a href="#">Le journal</a>
                            <ul class="menu">
                                <!--<li><a href="#">Accès par année</a>
                                                    <ul class="menu">
                                                        <xsl:for-each select="//tei:body//tei:div[@type='year']">
                                                            <li>
                                                                <a href="#"><xsl:value-of select="./tei:head"/></a>
                                                                <ul class="menu">
                                                                    <xsl:for-each select=".//tei:div[@type='month']">
                                                                        <xsl:variable name="when" select="./tei:fw[@type='runningHead']/tei:date/@when"/>
                                                                        <xsl:variable name="date"><xsl:value-of select="concat($when,'-01')"/></xsl:variable>                                                                
                                                                        <li><a href="{./@xml:id}.html"><xsl:value-of select="format-date($date,'[Mn] [Y0001]')"/></a></li>                                                                 
                                                                    </xsl:for-each>
                                                                </ul>
                                                            </li>
                                                        </xsl:for-each>                                                                                                
                                                    </ul>
                                                </li>-->
                                <li><a href="calendrier.html">Accès calendaire</a></li>                                                
                            </ul>
                        </li>
                        <li><a target="_blank" href="cartographie.html">Nancy au XVIII<sup>e</sup></a></li>
                        <li><a href="galerie.html">Galerie</a></li>
                        <li>
                            <a href="#">Ressources</a>
                            <ul class="menu">
                                <li>
                                    <a href="#">Biographies</a>
                                    <ul class="menu">
                                        <li><a href="stanislas.html">Stanislas</a></li>
                                        <li><a href="durival.html">Durival</a></li>
                                    </ul>
                                </li>                                                
                                <li><a href="">Bibliographie</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="top-bar-right">
                    <ul class="dropdown menu" data-dropdown-menu="true">                                                                             
                        <li><a href="list.html">Index</a></li>
                        <li><a href="apropos.html">À propos</a></li>
                    </ul>
                </div>                                
            </div>                                                                                        
        </header>
    </xsl:variable>        
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Édition du journal de Nicolas Durival ß</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>                
                <link rel="stylesheet" href="css/foundation.css"/>
                <!-- Pour personnalisation -->
                <link rel="stylesheet" href="css/app.css"></link>                                                                                
            </head>
            <body>
                <div class="row">
                    <div class="large-12">
                        <ul>
                            <xsl:for-each select="//tei:body//tei:div[@type='month']">
                                <li>
                                    <a href="html/{./@xml:id}.html"><xsl:value-of select="tei:fw[@type='runningHead']/tei:date"/></a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
                <!-- pour fonction result-document -->
                <xsl:apply-templates select="//tei:body"/>
                <xsl:apply-templates select="//tei:div[@type='index']"/>
                <xsl:apply-templates select="//tei:div[@type='transcription']" mode="frise"/>
                <xsl:apply-templates select="//tei:div[@type='transcription']" mode="calendrier"/>
                <xsl:apply-templates select="//tei:listPlace[@xml:id='listPlace']" mode="cartographie"/>
                <script src="js/vendor/modernizr.js">/*pour transformation XSL*/</script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tei:body">
        <xsl:for-each select=".//tei:div[@type='month']">
            <xsl:result-document format="html" encoding="UTF-8" href="html/{./@xml:id}.html">
                <html>
                    <head>
                        <title>Édition du journal de Nicolas Durival ß</title>
                        <meta charset="utf-8"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
                        
                        <!-- css Pour personnalisation -->
                        <link rel="stylesheet" href="../css/app.css"/>
                        <!-- css Foundation -->
                        <link rel="stylesheet" href="../css/foundation.css"/>
                                                
                        <!-- css Owl-Carousel -->
                        <link rel="stylesheet" href="../css/owl-carousel/owl.carousel.css"/>                         
                        <link rel="stylesheet" href="../css/owl-carousel/owl.theme.default.css"/>
                        
                        <!-- css Lightbox -->                                                
                        <link href="../css/lightbox/lightbox.css" rel="stylesheet" />                        
                    </head>
                    <body class="text-justify">
                        <xsl:copy-of select="$header"/>                                                                                                                                                                                               
                        <div class="row">                            
                            <div class="large-12 tabs-content" data-tabs-content="example-tabs">
                                <div class="row">
                                    <div class="large-2 columns">
                                        <label><input type="checkbox" class="checkbox_abbr" value="abbr" />Abbr</label>
                                    </div>
                                    <div class="large-10 columns clearfix">
                                        <ul class="tabs float-right" data-tabs="true" id="example-tabs">                                
                                            <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">transcriptions</a></li>
                                            <li class="tabs-title"><a href="#panel2">facsimilés</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tabs-panel is-active border-top" id="panel1">         
                                    <!--<h1>
                                        <xsl:variable name="when" select="concat(tei:fw[@type='runningHead']/tei:date/@when,'-01')"/>
                                        <xsl:variable name="date"><xsl:value-of select="$when"/></xsl:variable>
                                        <xsl:value-of select="format-date($date,'[MNn] [Y0001]')"/>
                                        <!-\-<xsl:value-of select="concat(upper-case(substring(tei:fw[@type='runningHead']/tei:date,1,1)),lower-case(substring(tei:fw[@type='runningHead']/tei:date, 2)),' '[not(last())])"/>-\->
                                    </h1>-->                                    
                                    <div class="large-12 center">                            
                                        <div class="owl-carousel owl-theme">
                                            <xsl:apply-templates/>
                                        </div> 
                                    </div>
                                </div>
                                <div class="tabs-panel border-top" id="panel2">
                                    <xsl:for-each select=".//tei:pb/@facs">
                                        <xsl:variable name="facs" select="concat(.,'.jpg')"/>
                                        <xsl:choose>
                                            <xsl:when test=".[ancestor::tei:div[@xml:id='d1765']]">
                                                <img src="../images/1765/{$facs}" alt="facs" />        
                                            </xsl:when>
                                            <xsl:when test=".[ancestor::tei:div[@xml:id='d1766']]">
                                                <img src="../images/1766/{$facs}" alt="facs" />        
                                            </xsl:when>
                                        </xsl:choose>                                                                                
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>                
                        <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>                        
                        
                        <script src="../js/foundation.min.js"></script>
                        <script src="../js/vendor/modernizr.js"></script>                                                
                        
                        <script src="../js/owl-carousel/owl.js"></script>                        
                        <script src="../js/owl-carousel/owlConfig.js"></script>

                        <script src="../js/modernisation/modernisation.js"></script>
                        
                        <script src="../js/lightbox/lightbox.js"></script>
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
                <div class="large-12 columns">
                    <h2><xsl:apply-templates select="tei:dateline/tei:date[@type='entry']" mode="dateComplete"/></h2>
                </div>
            </div>
            <div class="row">                
                <div class="large-8 columns day">                                                            
                    <xsl:apply-templates/>
                    <xsl:if test="not(following-sibling::tei:div[@type='day'] or tei:pb or tei:fw or tei:div[@type='insert'])">
                        <xsl:if test="./following::tei:div[@type='month'][1]/@xml:id">
                            <xsl:variable name="nextMonth" select="./following::tei:div[@type='month'][1]/@xml:id"/>
                            <p class="float-right">
                                <a href="{$nextMonth}.html">Mois suivant</a>
                            </p>
                        </xsl:if>                        
                    </xsl:if>                    
                </div>
                <div class="large-4 columns">                    
                    <xsl:for-each select=".//tei:ref[@type='note']">
                        <xsl:variable name="id" select="substring-after(@target,'#')"/>
                        <xsl:variable name="number"><xsl:number select="." level="any" from="tei:div[@type='day']"/></xsl:variable>
                        <p class="note"><sup>[<xsl:value-of select="$number"/>]</sup> <xsl:apply-templates select="//tei:back//tei:note[@xml:id=$id]/tei:p"/></p>
                    </xsl:for-each>
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
                        <div class="large-4 columns">
                            <h2>Encart : lettre</h2>
                            <xsl:for-each select=".//tei:ref[@type='note']">
                                <xsl:variable name="id" select="substring-after(@target,'#')"/>
                                <xsl:variable name="number"><xsl:number select="." level="any" from="tei:div[@type='day']"/></xsl:variable>
                                <p class="note"><sup>[<xsl:value-of select="$number"/>]</sup> <xsl:apply-templates select="//tei:back//tei:note[@xml:id=$id]/tei:p"/></p>
                            </xsl:for-each>
                        </div>
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
                            <div class="large-4 columns">
                                <h2>Encart : vers</h2>
                                <xsl:for-each select=".//tei:ref[@type='note']">
                                    <xsl:variable name="id" select="substring-after(@target,'#')"/>
                                    <xsl:variable name="number"><xsl:number select="." level="any" from="tei:div[@type='day']"/></xsl:variable>
                                    <p class="note"><sup>[<xsl:value-of select="$number"/>]</sup> <xsl:apply-templates select="//tei:back//tei:note[@xml:id=$id]/tei:p"/></p>
                                </xsl:for-each>
                            </div>
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
                        <div class="large-4 columns">
                            <h2>Encart</h2>
                            <xsl:for-each select=".//tei:ref[@type='note']">
                                <xsl:variable name="id" select="substring-after(@target,'#')"/>
                                <xsl:variable name="number"><xsl:number select="." level="any" from="tei:div[@type='day']"/></xsl:variable>
                                <p class="note"><sup>[<xsl:value-of select="$number"/>]</sup> <xsl:apply-templates select="//tei:back//tei:note[@xml:id=$id]/tei:p"/></p>
                            </xsl:for-each>
                        </div>
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
                <xsl:value-of select="format-date(@when,'[D01] [Mn]', 'fr', (), ())"/>        
            </xsl:when>
            <xsl:when test="@from and @to">
                <xsl:value-of select="format-date(@from,'[D01]', 'fr', (), ())"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="format-date(@to,'[D01] [Mn]', 'fr', (), ())"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="tei:dateline/tei:date[@type='entry']" mode="dateComplete">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="format-date(@when,'[D01] [Mn] [Y0001]', 'fr', (), ())"/>        
            </xsl:when>
            <xsl:when test="@from and @to">
                <xsl:value-of select="format-date(@from,'[D01]', 'fr', (), ())"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="format-date(@to,'[D01] [Mn] [Y0001]', 'fr', (), ())"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="tei:p[ancestor::tei:div[@type='transcription']]"><!-- todo besoin des id pour les p ? -->
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
        <xsl:apply-templates/><xsl:text>&#160;</xsl:text><i>(sic)</i>
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
        <span class="abbr"><xsl:apply-templates select="tei:abbr"/></span><span class="expan"><xsl:apply-templates select="tei:expan"/></span>
    </xsl:template>    
    
    <xsl:template match="tei:div[@type='transcription']//tei:list">
        <ul>
            <xsl:for-each select="tei:item">
                <li><xsl:apply-templates select="."/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:fw"/>
    
    <xsl:template match="tei:ref[@type='note']">
        <xsl:for-each select=".">
            <xsl:variable name="number"><xsl:number select="." level="any" from="tei:div[@type='day']"/></xsl:variable>
            <sup>[<xsl:value-of select="$number"/>]</sup>
        </xsl:for-each>
    </xsl:template>
    
    <!-- ********** INDEX ********** -->
    <xsl:template match="//tei:div[@type='index']">
        <xsl:result-document format="html" encoding="UTF-8" href="html/list.html">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival ß</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/app.css" />
                    <link rel="stylesheet" href="../css/foundation.css" />                                
                </head>
                <body>
                    <xsl:copy-of select="$header"/>
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
                    <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                    <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>                                        
                    <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>                                
                    <script>$(document).foundation();</script>
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
                <xsl:variable name="id" select="concat('#',@xml:id)"/>
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
    
    <!-- ********** Frise ********** -->
    <xsl:template match="//tei:div[@type='transcription']" mode="frise">
        <xsl:result-document format="frise" encoding="UTF-8" href="csv/frise.csv">
            <xsl:text>Year@Month@Day@Time@End Year@End Month@End Day@End Time@Display Date@Headline@Text@Media@Media Credit@Media Caption@Media ThumbNail@Type@Group@Background
                </xsl:text>
            <xsl:for-each select="//*[@type='report'][descendant::tei:seg[@type='dateline']]">
                <xsl:choose>
                    <xsl:when test="substring-after(.//tei:seg[@type='dateline']/tei:date/@when,'T')">
                        <xsl:variable name="date" select="replace(.//tei:seg[@type='dateline']/tei:date/@when,'-','@')"/>
                        <xsl:variable name="time" select="replace($date,'T','@')"/>
                        <xsl:value-of select="$time"/><xsl:text>@@@@@@</xsl:text><xsl:apply-templates select=".//tei:seg[@type='dateline']" mode="frise"/><xsl:text>@</xsl:text><xsl:apply-templates select=".//tei:p" mode="frise"/><xsl:text>
                        </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="date" select="replace(.//tei:seg[@type='dateline']/tei:date/@when,'-','@')"/>                        
                        <xsl:value-of select="$date"/><xsl:text>@@@@@@@</xsl:text><xsl:apply-templates select=".//tei:seg[@type='dateline']" mode="frise"/><xsl:text>@</xsl:text><xsl:apply-templates select=".//tei:p" mode="frise"/><xsl:text>
                        </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>                                                
            </xsl:for-each>
            <xsl:for-each select="//tei:p[contains(@ana,'#stan')]">
                <xsl:variable name="date" select="replace(ancestor::tei:div[@type='day']/tei:dateline/tei:date/@when,'-','@')"/>
                <xsl:value-of select="$date"/><xsl:text>@@@@@@@</xsl:text><xsl:apply-templates select="ancestor::tei:div[@type='day']/tei:dateline/tei:date" mode="date"/><xsl:text>@</xsl:text><xsl:apply-templates select="." mode="frise"/><xsl:text>
                </xsl:text>
            </xsl:for-each>
            <!--<xsl:for-each select=" | tei:seg[@type='event']">
                
            </xsl:for-each>-->
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:p" mode="frise">
        <xsl:variable name="p"><xsl:apply-templates mode="frise"/></xsl:variable>
        <xsl:value-of select="normalize-space($p)"/>
    </xsl:template>
    
    <xsl:template match="tei:choice" mode="frise">
        <xsl:apply-templates select="tei:expan"/>
    </xsl:template>
    
    
    <!-- *************** Calendrier Timeliner **************** -->
    
    <xsl:template match="//tei:div[@type='transcription']" mode="calendrier">
        <xsl:result-document format="html" encoding="UTF-8" href="html/calendrier.html">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival ß</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/app.css" />
                    <link rel="stylesheet" href="../css/foundation.css" />            
                    <link rel="stylesheet" href="../css/timeliner/timelinerCal.css" type="text/css" media="screen"/>
                    <link rel="stylesheet" href="../js/timeliner/vendor/venobox/venobox.css" type="text/css" media="screen"/>                    
                </head>
                <body>
                    <xsl:copy-of select="$header"/>
                    <div class="row">
                        <div class="large-12">            
                            <h1>Accès calendaire</h1>                                                            
                            <div id="timeline" class="timeline-container">                  
                                <button class="timeline-toggle">+ expand all</button>                  
                                <br class="clear" />
                                <xsl:for-each select="./tei:div[@type='year']">
                                    <xsl:variable name="when" select="./tei:head/tei:date/@when"/>
                                    <xsl:variable name="date"><xsl:value-of select="concat($when,'-01-01')"/></xsl:variable>
                                    <div class="timeline-wrapper">
                                        <h2 class="timeline-time">
                                            <span><xsl:value-of select="format-date($date,'[Y0001]')"/></span>                                            
                                        </h2>
                                        <dl class="timeline-series">
                                            <xsl:for-each select="./tei:div[@type='month']">
                                                <xsl:variable name="when" select="./tei:fw[@type='runningHead']/tei:date/@when"/>
                                                <xsl:variable name="date"><xsl:value-of select="concat($when,'-01')"/></xsl:variable>
                                                <xsl:variable name="month" select="@xml:id"/>
                                                <dt class="timeline-event" id="{$month}">
                                                    <a><xsl:value-of select="format-date($date,'[MNn]')"/></a>
                                                </dt>
                                                <dd class="timeline-event-content" id="{$month}EX">
                                                    <ul>
                                                        <xsl:for-each select="tei:div[@type='day']">
                                                            <xsl:variable name="day" select="@xml:id"/>
                                                            <li>
                                                                <a href="{$month}.html#{$day}"><xsl:apply-templates select="tei:dateline/tei:date[@type='entry']" mode="date"/></a>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </dd>
                                                <br class="clear" />
                                            </xsl:for-each>
                                        </dl>
                                    </div>
                                    <br class="clear" />
                                </xsl:for-each>
                                <!--<div class="timeline-wrapper">
                                    <h2 class="timeline-time"><span>2000</span></h2>
                                    <dl class="timeline-series">                        
                                        <dt class="timeline-event" id="event01"><a>Robots</a></dt>                        
                                        <dd class="timeline-event-content" id="event01EX">                                                      
                                            <blockquote>
                                                <p>The world is very different ever since the robotic uprising of the mid-nineties. There is no more unhappiness.</p>
                                                <p>Affirmative.</p>
                                                <p>We no longer say yes, instead we say affirmative.</p>
                                                <p>Yes, affirmative.</p>
                                                <p>Unless its a more colloquial situation with a few robo friends.</p>
                                                <p>There is only one type of dance, the robot.</p>
                                                <p>And the robo-boogie.</p>
                                                <p>Oh yes, two kinds of dances.</p>
                                            </blockquote>                           
                                            <br class="clear" />
                                        </dd><!-\- /.timeline-event-content -\->                                                
                                    </dl><!-\- /.timeline-series -\->
                                    <dl class="timeline-series">                        
                                        <dt class="timeline-event" id="event02"><a>ciborg</a></dt>                        
                                        <dd class="timeline-event-content" id="event02EX">                                                      
                                            <blockquote>
                                                <p>
                                                    lorem ipsum
                                                </p>
                                            </blockquote>                           
                                            <br class="clear" />
                                        </dd><!-\- /.timeline-event-content -\->                                                
                                    </dl>
                                </div>--><!-- /.timeline-wrapper -->
                                <!--<button class="timeline-toggle">+ expand all</button>-->                  
                                <br class="clear" />                  
                            </div><!-- /#timeline -->                           
                        </div>
                    </div>
                    <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                    <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>
                    <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>                                                                                                         
                    <script type="text/javascript" src="../js/timeliner/timeliner.min.js"></script>
                    <script type="text/javascript" src="../js/timeliner/vendor/venobox/venobox.min.js"></script>
                    <script>$(document).foundation();</script>
                    <script>
                        $(document).ready(function() {
                        $.timeliner({});
                        });
                    </script>                    
                </body>
            </html>           
        </xsl:result-document>        
    </xsl:template>
    
    <!-- **************** Cartographie **************** -->
    
    <xsl:template match="//tei:listPlace[@xml:id='listPlace']" mode="cartographie">        
        <xsl:result-document format="html" encoding="UTF-8" href="html/cartographie.html">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival ß</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/foundation.css" />
                    <link rel="stylesheet" href="../css/app.css" />                    
                    <link rel="stylesheet" href="../js/leaflet/leaflet.css" />                    
                </head>
                <body>
                    <header data-sticky-container="true">
                        <div class="top-bar full-width sticky" data-sticky="true" data-margin-top="0">
                            <div class="top-bar-left">
                                <ul class="dropdown menu" data-dropdown-menu="true">
                                    <li><a href="../index.html">Accueil</a></li>
                                    <li><a href="#">Le journal</a><ul class="menu">
                                        <li><a href="calendrier.html">Accès calendaire</a></li>
                                    </ul>
                                    </li>
                                    <li><a href="cartographie.html">Nancy au XVIII<sup>e</sup></a></li>
                                    <li><a href="galerie.html">Galerie</a></li>
                                    <li><a href="#">Ressources</a><ul class="menu">
                                        <li><a href="#">Biographies</a><ul class="menu">
                                            <li><a href="stanislas.html">Stanislas</a></li>
                                            <li><a href="durival.html">Durival</a></li>
                                        </ul>
                                        </li>
                                        <li><a href="">Bibliographie</a></li>
                                    </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="top-bar-right">
                                <ul class="dropdown menu" data-dropdown-menu="true">
                                    <li><a href="list.html">Index</a></li>
                                    <li><a href="apropos.html">À propos</a></li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    <div id="mapid"></div>
                    <script src="../js/leaflet/leaflet.js"></script>
                    <script src="../js/cartographie/cartographie.js"></script>
                    <xsl:result-document format="frise" href="js/cartographie/cartographie.js">
                        var mymap = L.map('mapid').setView([48.692054, 6.184417], 15);
                        //http://mapwarper.net/maps/tile/13564/{z}/{x}/{y}.png
                        //https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw
                        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
                        maxZoom: 20, attribution: 'Map data &#169;; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
                        id: 'mapbox.streets'
                        }).addTo(mymap);
                        
                        
                        L.polygon(
                        [
                        [
                        
                        48.700336511159286,6.178371906280517
                        ],
                        [
                        
                        48.70103044460664,6.180174350738525
                        ],
                        [
                        
                        48.700039108181784,6.180174350738525
                        ],
                        [
                        
                        48.699288511900996,6.1806464195251465
                        ],
                        [
                        
                        48.69991164922492,6.183071136474609
                        ],
                        [
                        
                        48.70039315914625,6.184787750244141
                        ],
                        [
                        
                        48.70076136950753,6.186268329620361
                        ],
                        [
                        
                        48.69792891278156,6.1882853507995605
                        ],
                        [
                        
                        48.69672507040967,6.189079284667968
                        ],
                        [
                        
                        48.69557785265497,6.190195083618164
                        ],
                        [
                        
                        48.69420398958636,6.189594268798828
                        ],
                        [
                        
                        48.692688447661205,6.189508438110352
                        ],
                        [
                        
                        48.69195190614077,6.188392639160156
                        ],
                        [
                        
                        48.68974221693151,6.189208030700684
                        ],
                        [
                        
                        48.68785823865308,6.18903636932373
                        ],
                        [
                        
                        48.686300007873044,6.188371181488037
                        ],
                        [
                        
                        48.68560587136641,6.186847686767578
                        ],
                        [
                        
                        48.68529421512887,6.184358596801758
                        ],
                        [
                        
                        48.68552087440201,6.182384490966797
                        ],
                        [
                        
                        48.686030854036765,6.180968284606934
                        ],
                        [
                        
                        48.688665666546264,6.178951263427734
                        ],
                        [
                        
                        48.68896313671706,6.176869869232177
                        ],
                        [
                        
                        48.6903088131528, 6.17556095123291
                        ],
                        [
                        
                        48.691116201752365,6.174981594085693
                        ],
                        [
                        
                        48.69176776907712, 6.17556095123291
                        ],
                        [
                        
                        48.69274510425496,6.176290512084961
                        ],
                        [
                        
                        48.69356661769983, 6.176462173461914
                        ],
                        [
                        
                        48.69404818831477, 6.177771091461182
                        ],
                        [
                        
                        48.69503964272374,6.17506742477417
                        ],
                        [
                        
                        48.69655511387344, 6.17605447769165
                        ],
                        [
                        
                        48.69724909945107,6.174252033233643
                        ],
                        [
                        
                        48.69832546631806, 6.175603866577148
                        ],
                        [
                        
                        48.69883531627474, 6.176483631134033
                        ],
                        [
                        
                        48.69960008152723, 6.176333427429199
                        ],
                        [
                        
                        48.70047813100715, 6.176204681396484
                        ],
                        [
                        
                        48.700336511159286,6.178371906280517
                        ]
                        ],{color:'black', opacity:0.5}
                        ).bindPopup('<b>Limites approximatives de la ville en 1766</b>').addTo(mymap);
                        
                        var popup = L.popup();
                        <xsl:for-each select="tei:place[descendant::tei:location]">
                            <xsl:variable name="id" select="@xml:id"/>
                            <xsl:variable name="href">&lt;a href='list.html<xsl:value-of select="concat('#',$id)"/>'&gt;<xsl:value-of select="normalize-space(tei:placeName)"/>&lt;/a&gt;</xsl:variable>
                            <xsl:text>L.marker([</xsl:text>                                
                            <xsl:value-of select="normalize-space(.//tei:geo)"/>
                            <xsl:text>])</xsl:text>
                            <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                            <xsl:choose>
                                <xsl:when test="tei:desc">                                        
                                    <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                    <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                    <xsl:text>").addTo(mymap); </xsl:text>                                        
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>").addTo(mymap); </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>                                                                        
                        </xsl:for-each> 
                        
                        var imageUrl = '../images/plansNancy/nancy_2.jpg',
                        imageBounds = [[
                        48.698976940346256,6.197233200073242],[
                        
                        48.67179198222903,6.230599880218506]];
                        
                        L.imageOverlay(imageUrl, imageBounds).addTo(mymap);
                        
                        
                        // function onMapClick(e) {
                        //    popup
                        //       .setLatLng(e.latlng)
                        //       .setContent("You clicked the map at " + e.latlng.toString())
                        //       .openOn(mymap);
                        // }
                        
                        
                        // mymap.on('click', onMapClick);
                    </xsl:result-document>
                    <script src="../js/vendor/jquery.js"></script>
                    <script src="../js/foundation.min.js"></script>                    
                    <script src="../js/vendor/modernizr.js"></script>
                    <script src="../js/modernisation/modernisation.js"></script>                    
                    <script>$(document).foundation();</script>
                </body>                
            </html>
        </xsl:result-document>
        
        <!-- Hosting24 Analytics Code -->
        <script type="text/javascript" src="http://stats.hosting24.com/count.php"></script>
        <!-- End Of Analytics Code -->                
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