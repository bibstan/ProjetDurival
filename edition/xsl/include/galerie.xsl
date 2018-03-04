<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="tei:div[@type='pictures']" mode="galerie">
    <xsl:result-document format="html" encoding="UTF-8" href="html/galerie.html">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
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
        <body>
          <xsl:copy-of select="$header"/>
          <div class="row content">
            <div class="large-12">
              <h1 class="text-center edito2">Galerie</h1>
              <h2 class="edito">Portraits</h2>
              <xsl:for-each select="tei:figure[@type='portrait']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Recueil de Emmanuel Héré, architecte du roi</h2>
              <xsl:for-each select="tei:figure[@type='emmanuelHere']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Oeuvres de Dominique Collin, graveur du roi</h2>
              <xsl:for-each select="tei:figure[@type='dominiqueCollin']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Édifices civils</h2>
              <xsl:for-each select="tei:figure[@type='civil']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Édifices religieux</h2>
              <xsl:for-each select="tei:figure[@type='eglise']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Édifices militaires</h2>
              <xsl:for-each select="tei:figure[@type='porte'] | tei:figure[@type='militaire']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="militaire" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Livres</h2>
              <xsl:for-each select="tei:figure[@type='livre']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <h2 class="edito">Résidences</h2>
              <xsl:for-each select="tei:figure[@type='luneville'] | tei:figure[@type='residence']">
                <xsl:variable name="picture" select="./tei:graphic/@url"/>
                <xsl:variable name="cartel" select="./tei:desc"/>
                <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="residence" data-title="{$cartel}">
                  <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                </a>
              </xsl:for-each>
              <!--<xsl:for-each-group select="tei:figure" group-by="@type">                                
                                    <div>
                                        <xsl:choose>
                                            <xsl:when test="@type='portrait'">
                                                <h2 class="edito">Portraits</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='civil'">
                                                <h2 class="edito">Édifices civils</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='militaire'">
                                                <h2 class="edito">Édifices militaires</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='eglise'">
                                                <h2 class="edito">Édifices religieux</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='dominiqueCollin'">
                                                <h2 class="edito">Oeuvres de Dominique Collin, graveur du roi</h2>
                                            </xsl:when>                                            
                                            <xsl:when test="@type='emmanuelHere'">
                                                <h2 class="edito">Oeuvres de Emmanuel Héré, architecte du roi</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='livre'">
                                                <h2 class="edito">Livres</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='luneville'">
                                                <h2 class="edito">Lunéville</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='porte'">
                                                <h2 class="edito">Portes</h2>
                                            </xsl:when>
                                            <xsl:when test="@type='residence'">
                                                <h2 class="edito">Résidences</h2>
                                            </xsl:when>                                            
                                        </xsl:choose>
                                        <xsl:for-each select="current-group()">
                                            <xsl:variable name="picture" select="./tei:graphic/@url"/>
                                            <xsl:variable name="cartel" select="./tei:desc"/>
                                            <a class="miniatures" href="../images/illustrations/{$picture}.jpg" data-lightbox="{@type}" data-title="{$cartel}">
                                                <img src="../images/illustrations/thumbs/T{$picture}.png" alt="{$cartel}"/>
                                            </a>
                                        </xsl:for-each>
                                    </div>                                                                                                    
                            </xsl:for-each-group>-->                            
            </div>
          </div>
          <!-- FOOTER -->
          <xsl:copy-of select="$footer"></xsl:copy-of>
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
  
</xsl:stylesheet>