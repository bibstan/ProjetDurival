<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="tei:div[@type='bibl']//tei:author" mode="bibl">
    <xsl:choose>
      <xsl:when test="tei:forename and tei:surname">
        <span class="smallCaps"><xsl:apply-templates select="tei:surname"/></span><xsl:text> (</xsl:text><xsl:apply-templates select="tei:forename"/><xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <span class="smallCaps"><xsl:apply-templates select="tei:surname"/></span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:div[@type='bibl']//tei:monogr[ancestor::*[@type='book' or @type='manuscript' or @type='document']]" mode="bibl">
    <xsl:for-each select="tei:author"><xsl:apply-templates select="." mode="bibl"/><xsl:text>, </xsl:text></xsl:for-each><cite><xsl:apply-templates select="tei:title[@level='m']"/></cite><xsl:text>, </xsl:text><xsl:apply-templates select="tei:imprint" mode="bibl"/>
  </xsl:template>
  
  <xsl:template match="tei:div[@type='bibl']//tei:imprint[ancestor::*[@type='book' or @type='manuscript' or @type='document']]" mode="bibl">
    <xsl:if test="tei:pubPlace"><xsl:apply-templates select="tei:pubPlace"/><xsl:text>, </xsl:text></xsl:if>
    <xsl:if test="tei:publisher"><xsl:for-each select="tei:publisher"><xsl:apply-templates select="."/><xsl:text>, </xsl:text></xsl:for-each></xsl:if>
    <xsl:apply-templates select="tei:date"/><xsl:text>.</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct[@type='book' or @type='manuscript' or @type='document']" mode="bibl">
    <xsl:apply-templates select="tei:monogr" mode="bibl"/>
  </xsl:template>
  
  
  <xsl:template match="tei:div[@type='bibl']//tei:analytic" mode="bibl">
    <xsl:for-each select="tei:author"><xsl:apply-templates select="." mode="bibl"/><xsl:text>, </xsl:text></xsl:for-each><xsl:text>&#171; </xsl:text><xsl:apply-templates select="tei:title[@level='a']"/><xsl:text> &#187;</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:div[@type='bibl']//tei:monogr[ancestor::*[@type='journalArticle' or @type='conferencePaper']]" mode="bibl">
    <cite><xsl:apply-templates select="tei:title[@level='j' or @level='m']"/></cite><xsl:text>, </xsl:text><xsl:apply-templates select="tei:imprint" mode="bibl"/>
  </xsl:template>
  
  <xsl:template match="tei:div[@type='bibl']//tei:imprint[ancestor::*[@type='journalArticle' or @type='conferencePaper']]" mode="bibl">
    <xsl:if test="tei:pubPlace"><xsl:apply-templates select="tei:pubPlace"/><xsl:text>, </xsl:text></xsl:if>
    <xsl:if test="tei:publisher"><xsl:apply-templates select="tei:publisher"/><xsl:text>, </xsl:text></xsl:if>
    <xsl:apply-templates select="tei:date"/><xsl:if test="tei:biblScope"><xsl:text>, p. </xsl:text><xsl:apply-templates select="tei:biblScope"/></xsl:if><xsl:text>.</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct[@type='journalArticle' or @type='conferencePaper']" mode="bibl">
    <xsl:apply-templates select="tei:analytic" mode="bibl"/><xsl:text>, </xsl:text><xsl:apply-templates select="tei:monogr" mode="bibl"/>
  </xsl:template>
  
  
  <xsl:template match="tei:div[@type='bibl']" mode="bibl">
    <xsl:result-document format="html" encoding="UTF-8" href="html/bibliographie.html">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title>Édition du journal de Nicolas Durival 1765-1766</title>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <link rel="stylesheet" href="../css/app.css" />
          <link rel="stylesheet" href="../css/foundation.css" />
          <link rel="stylesheet" href="../css/timeliner/timeliner.css" type="text/css" media="screen" />
          <link rel="stylesheet" href="../js/timeliner/vendor/venobox/venobox.css" type="text/css" media="screen" />
          <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700" rel="stylesheet" type="text/css" />
          <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900,300" rel="stylesheet" type="text/css" />
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
              <h1 class="text-center edito2">Bibliographie</h1>
              <xsl:for-each select="./tei:listBibl">
                <xsl:choose>
                  <xsl:when test="@xml:id='BiblioGenerale'">
                    <h2 class="edito2">Bibliographie générale</h2>
                    <ul class="no-bullet">
                      <xsl:for-each select=".//tei:biblStruct">
                        <xsl:sort select=".[descendant::tei:author]//tei:author[1]/tei:surname | .[not(descendant::tei:author)]//tei:title[1]"  order="ascending"/>                                    
                        <li class="bibl">
                          <xsl:apply-templates select="." mode="bibl"/>
                        </li>
                      </xsl:for-each>                                
                    </ul>
                  </xsl:when>
                  <xsl:when test="@xml:id='œuvresDurival'">
                    <h2 class="edito2">Ouvrages de Nicolas Durival</h2>
                    <ul class="no-bullet">
                      <xsl:for-each select=".//tei:biblStruct">
                        <xsl:sort select=".[descendant::tei:author]//tei:author[1]/tei:surname | .[not(descendant::tei:author)]//tei:title[1]" order="ascending"/>                                    
                        <li class="bibl">
                          <xsl:apply-templates select="." mode="bibl"/>
                        </li>
                      </xsl:for-each>                                
                    </ul>
                  </xsl:when>
                  <xsl:when test="@xml:id='œuvresCitees'">
                    <h2 class="edito2">Ouvrages cités dans le Journal de Durival</h2>
                    <ul class="no-bullet">
                      <xsl:for-each select=".//tei:biblStruct">
                        <xsl:sort select=".[descendant::tei:author]//tei:author[1]/tei:surname | .[not(descendant::tei:author)]//tei:title[1]" order="ascending"/>                                    
                        <li class="bibl">
                          <xsl:apply-templates select="." mode="bibl"/>
                        </li>
                      </xsl:for-each>                                
                    </ul>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>                            
            </div>
          </div>
          <!-- FOOTER -->
          <xsl:copy-of select="$footer"></xsl:copy-of>
          <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
          <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>
          <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>
          <script type="text/javascript" src="../js/timeliner/timeliner.min.js"></script>
          <script type="text/javascript" src="../js/timeliner/vendor/venobox/venobox.min.js"></script>
          <script>$(document).foundation();</script><script>
            $(document).ready(function() {
            $.timeliner({});
            });
          </script>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>
  
</xsl:stylesheet>