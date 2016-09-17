<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <!-- la normalisation des patronymes impacte également les notes de survole (@mode='tooltip') -->
  
  <xsl:template match="tei:persName[ancestor::tei:person and ancestor::tei:persName] | tei:surname[ancestor::tei:person] | tei:roleName[ancestor::tei:person]">
    <xsl:choose>
      <xsl:when test="
        following-sibling::tei:roleName[1] |
        following-sibling::tei:forename[1] |
        following-sibling::tei:surname[1] |
        following-sibling::tei:addName[1] | 
        following-sibling::tei:persName[1]">
        <xsl:apply-templates/><xsl:text>, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:forename[ancestor::tei:person]">
    <xsl:choose>
      <xsl:when test="following-sibling::tei:surname[1]">
        <xsl:apply-templates/><xsl:text> </xsl:text>
      </xsl:when>
      <xsl:when test="
        following-sibling::tei:roleName[1] |
        following-sibling::tei:forename[1] |
        following-sibling::tei:addName[1] |                
        following-sibling::tei:persName[1]">
        <xsl:apply-templates/><xsl:text>, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/><xsl:if test="ancestor::tei:persName[@ref]"><xsl:text>,</xsl:text></xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:addName[@type='say']">
    <xsl:if test="preceding-sibling::tei:addName[1]"><xsl:text>, </xsl:text></xsl:if>
    <xsl:text>dit &#171;&#160;</xsl:text><xsl:apply-templates/><xsl:text>&#160;&#187;</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:birth | tei:death">
    <xsl:choose>
      <xsl:when test="@when">
        <xsl:apply-templates select="@when"/>
      </xsl:when>
      <xsl:when test="@notBefore and @notAfter">
        <xsl:variable name="notBefore" select="@notBefore"/>
        <xsl:variable name="notAfter" select="substring(@notAfter,3)"/>
        <xsl:value-of select="concat($notBefore,'/',$notAfter)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="//tei:div[@type='index']/tei:listPerson" mode="index">
        <xsl:result-document format="html" encoding="UTF-8" href="html/listPerson.html">
            <html>
                <head>
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
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
                    
                    <!-- Font -->
                    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700' rel='stylesheet' type='text/css'/>                     
                    <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'/>
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="text-justify">
                    <xsl:copy-of select="$header"/>                                                                                                                                                                                               
                    <div class="row content">                            
                        <div class="large-12">
                            <h1 class="text-center edito2">Personnes citées ou évoquées dans le Journal</h1>
                            <ul class="no-bullet">
                                <xsl:for-each select="tei:person">
                                    <xsl:sort select="tei:persName" order="ascending" case-order="upper-first"/>
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:variable name="links" select="concat('#',@xml:id)"/>
                                    <xsl:variable name="idref" select="concat($links,'-')"/>
                                    <!--<li class="vedette" id="{$id}">-->                    
                                        <!--<xsl:apply-templates select="." mode="tooltip"/>-->
                                        <!--<xsl:apply-templates select="tei:persName"/>-->
                                        <xsl:choose>
                                            <xsl:when test="//tei:div[@type='transcription'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                <li class="vedette" id="{$id}">
                                                    <!--<xsl:if test="//tei:div[@type='transcription'][descendant::*[contains(@ref,$links)]]">-->
                                                    <ul class="accordion" data-accordion="true" data-allow-all-closed="true">
                                                        <li class="accordion-item" data-accordion-item="true">
                                                            <a href="#" class="accordion-title vedette"><xsl:apply-templates select="." mode="tooltip"/></a>
                                                            <div class="accordion-content" data-tab-content="true">
                                                                <xsl:if test="./tei:listEvent">
                                                                    <div class="note">
                                                                        <xsl:for-each select="./tei:listEvent/tei:event">                                                                            
                                                                            <xsl:choose><!-- force la capitale pour le premier event, et les minus pour les autres -->
                                                                                <xsl:when test="position() = 1">                                                                                    
                                                                                    <xsl:value-of select="normalize-space(concat(upper-case(substring(tei:p,1,1)),substring(tei:p, 2),' '[not(last())]))"/><xsl:choose><xsl:when test="following-sibling::tei:event[1]"/><xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise></xsl:choose>
                                                                                </xsl:when>
                                                                                <xsl:when test="position() != last()">
                                                                                    <xsl:text> - </xsl:text><xsl:value-of select="normalize-space(concat(lower-case(substring(tei:p,1,1)),substring(tei:p, 2),' '[not(last())]))"/>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:text> - </xsl:text><xsl:value-of select="normalize-space(concat(lower-case(substring(tei:p,1,1)),substring(tei:p, 2),' '[not(last())]))"/><xsl:text>.</xsl:text>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>                                                                                
                                                                        </xsl:for-each>                                                                        
                                                                    </div>
                                                                </xsl:if>
                                                                <ul class="index">
                                                                    <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">                                                                                                                                                
                                                                        <xsl:variable name="date"><xsl:apply-templates select="./tei:dateline/tei:date" mode="dateComplete"/></xsl:variable>
                                                                        <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                        <xsl:choose>
                                                                            <xsl:when test="position() = last()">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                                        <li>                                                            
                                                                                            <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                                                                             
                                                                                        </li>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <li>                                                            
                                                                                            <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a>                                                                                             
                                                                                        </li>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <li>
                                                                                    <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                     
                                                                                </li>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>                                            
                                                                    </xsl:for-each>
                                                                    <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                        <xsl:variable name="number">
                                                                            <xsl:number count="tei:div[@type='insert']" from="tei:div[@type='transcription']" level="any"/>
                                                                        </xsl:variable>
                                                                        <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>                                                                        
                                                                        <xsl:choose>
                                                                            <xsl:when test="position() = last()">
                                                                                <li>
                                                                                    <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a>
                                                                                </li>    
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <li>
                                                                                    <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a> - 
                                                                                </li>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>                                                                        
                                                                    </xsl:for-each>                                                                    
                                                                </ul>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <!--</xsl:if>-->
                                                </li>
                                            </xsl:when>
                                            <xsl:when test="./tei:persName[@ref]">
                                                <li class="vedette" id="{$id}"><span class="vedette"><xsl:text>&#x2013;&#160;&#160;</xsl:text><xsl:apply-templates select="." mode="tooltip"/></span></li>
                                            </xsl:when>
                                            <xsl:otherwise/>
                                        </xsl:choose>
                                    <!--</li>-->
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>   
                    <xsl:copy-of select="$footer"/>
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
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listPlace" mode="index">
        <xsl:result-document format="html" encoding="UTF-8" href="html/listPlace.html">
            <html>
                <head>
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
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
                    
                    <!-- Font -->
                    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700' rel='stylesheet' type='text/css'/>                     
                    <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'/>
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="text-justify">
                    <xsl:copy-of select="$header"/>                                                                                                                                                                                               
                    <div class="row content">                            
                        <div class="large-12">
                            <h1 class="text-center edito2">Lieux cités ou évoqués dans le Journal</h1>
                            <ul class="no-bullet">
                                <xsl:for-each select="tei:place">
                                    <xsl:sort select="tei:placeName[1]" order="ascending" case-order="upper-first"/>
                                    <xsl:sort select="tei:placeName[2][not(@type='today')]" order="ascending" case-order="upper-first"/>
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:variable name="links" select=" concat('#',@xml:id)"/>
                                    <xsl:variable name="idref" select="concat($links,'-')"/>
                                    <xsl:choose>
                                        <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]"><!-- todo ajout @when quand présent dans l'introduction -->
                                            <li class="vedette" id="{$id}">                                                            
                                                <ul class="accordion" data-accordion="true" data-allow-all-closed="true">
                                                    <li class="accordion-item" data-accordion-item="true">
                                                        <a href="#" class="accordion-title vedette"><xsl:apply-templates select="." mode="tooltip"/></a>
                                                        <div class="accordion-content" data-tab-content="true">
                                                            <xsl:if test="./tei:desc">
                                                                <div class="note">
                                                                    <xsl:apply-templates select="./tei:desc"/>                                                                        
                                                                </div>
                                                            </xsl:if>
                                                            <ul class="index">
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                    <xsl:variable name="date"><xsl:apply-templates select="./tei:dateline/tei:date" mode="dateComplete"/></xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <xsl:choose>
                                                                                <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                                    </li>                                                                
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a>                                   
                                                                                    </li>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                            </li>                                                        
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                           
                                                                </xsl:for-each>
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">                                                
                                                                    <xsl:variable name="number"><xsl:number count="tei:div[@type='insert']" from="tei:div[@type='transcription']" level="any"/></xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a>
                                                                            </li>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a> -
                                                                            </li>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                                                                                
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div> 
                    <xsl:copy-of select="$footer"/>
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
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listOrg" mode="index">
        <xsl:result-document format="html" encoding="UTF-8" href="html/listOrg.html">           
            <html>
                <head>
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
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
                    
                    <!-- Font -->
                    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700' rel='stylesheet' type='text/css'/>                     
                    <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'/>
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="text-justify">
                    <xsl:copy-of select="$header"/>                                                                                                                                                                                               
                    <div class="row content">                            
                        <div class="large-12">
                            <h1 class="text-center edito2">Institutions citées ou évoquées dans le Journal</h1>
                            <ul class="no-bullet">
                                <xsl:for-each select="tei:org">
                                    <xsl:sort select="tei:orgName" order="ascending" case-order="upper-first"/>
                                    <xsl:sort select="tei:location" order="ascending" case-order="upper-first"/>
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:variable name="links" select="concat('#',@xml:id)"/>
                                    <xsl:variable name="idref" select="concat($links,'-')"/>
                                    <xsl:choose>
                                        <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]"><!-- todo ajout @when quand présent dans introduction -->
                                            <li class="vedette" id="{$id}">                                                            
                                                <ul class="accordion" data-accordion="true" data-allow-all-closed="true">
                                                    <li class="accordion-item" data-accordion-item="true">
                                                        <a href="#" class="accordion-title vedette">
                                                            <xsl:apply-templates select="." mode="tooltip"/>
                                                        </a>
                                                        <div class="accordion-content" data-tab-content="true">
                                                            <xsl:if test="./tei:desc">
                                                                <div class="note">
                                                                    <xsl:apply-templates select="./tei:desc"/>                                                                        
                                                                </div>
                                                            </xsl:if>
                                                            <ul class="index">
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                    <xsl:variable name="date"><xsl:apply-templates select="./tei:dateline/tei:date" mode="dateComplete"/></xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <xsl:choose>
                                                                                <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                                    </li>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a>                                    
                                                                                    </li>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                            </li>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                            
                                                                </xsl:for-each>
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                    <xsl:variable name="number">
                                                                        <xsl:number count="tei:div[@type='insert']" from="tei:div[@type='transcription']" level="any"/>
                                                                    </xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a>
                                                                            </li>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>                                                        
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small><small>encart n°<xsl:value-of select="$number"/></small></small></a> -
                                                                            </li>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                                                                                                        
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>  
                    <xsl:copy-of select="$footer"/>
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
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='index']/tei:listBibl" mode="index">
        <xsl:result-document format="html" encoding="UTF-8" href="html/listbib.html">           
            <html>
                <head>
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
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
                    
                    <!-- Font -->
                    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700' rel='stylesheet' type='text/css'/>                     
                    <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'/>
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="text-justify">
                    <xsl:copy-of select="$header"/>                                                                                                                                                                                               
                    <div class="row content">                            
                        <div class="large-12">
                            <h1 class="text-center edito2">Œuvres citées ou évoquées dans le Journal</h1>
                            <ul class="no-bullet">
                                <xsl:for-each select="tei:bibl">
                                    <xsl:sort select="tei:title" order="ascending" case-order="upper-first"/>                                    
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:variable name="links" select="concat('#',@xml:id)"/>
                                    <xsl:variable name="idref" select="concat($links,'-')"/>
                                    <xsl:choose>
                                        <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]"><!-- todo ajout @when quand présent dans introduction -->
                                            <li class="vedette" id="{$id}">                                                            
                                                <ul class="accordion" data-accordion="true" data-allow-all-closed="true">
                                                    <li class="accordion-item" data-accordion-item="true">
                                                        <a href="#" class="accordion-title vedette">
                                                            <xsl:apply-templates select="." mode="tooltip"/>
                                                        </a>
                                                        <div class="accordion-content" data-tab-content="true">
                                                            <xsl:if test="./tei:note">
                                                                <div class="note">
                                                                    <xsl:apply-templates select="./tei:note"/>                                                                        
                                                                </div>
                                                            </xsl:if>
                                                            <ul class="index">
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                    <xsl:variable name="date"><xsl:apply-templates select="./tei:dateline/tei:date" mode="dateComplete"/></xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <xsl:choose>
                                                                                <xsl:when test="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                                    </li>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <li>
                                                                                        <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a>                                    
                                                                                    </li>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small><xsl:value-of select="$date"/></small></a> -                                    
                                                                            </li>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                            
                                                                </xsl:for-each>
                                                                <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='insert'][descendant::*[contains(concat(replace(@ref,' ','-'),'-'),$idref)]]">
                                                                    <xsl:variable name="number">
                                                                        <xsl:number count="tei:div[@type='insert']" from="tei:div[@type='transcription']" level="any"/>
                                                                    </xsl:variable>
                                                                    <xsl:variable name="links" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = last()">
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small>encart n°<xsl:value-of select="$number"/></small></a>
                                                                            </li>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>                                                        
                                                                            <li>
                                                                                <a class="index" href="{$links}"><small><small>encart n°<xsl:value-of select="$number"/></small></small></a> -
                                                                            </li>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>                                                                                                                        
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>  
                    <xsl:copy-of select="$footer"/>
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
        <!--<ul>
            <xsl:for-each select="tei:bibl">
                <xsl:variable name="id" select="concat('#',@xml:id)"/>
                <li>                    
                    <xsl:apply-templates select="tei:title"/>
                    <ul>
                        <xsl:for-each select="//tei:div[@type='transcription']//tei:div[@type='day'] | //tei:div[@type='transcription']//tei:div[@type='insert']">
                            <xsl:if test=".//tei:title[@ref=$id] or .//tei:rs[@type='bibl' and @ref=$id]">
                                <xsl:variable name="id" select="concat(../@xml:id,'.html#',@xml:id)"/>
                                <li>
                                    <a class="index" href="{$id}"><xsl:value-of select="@xml:id"/></a>                                    
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </li>
            </xsl:for-each>
        </ul>-->
    </xsl:template>        
  
</xsl:stylesheet>