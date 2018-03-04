<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="tei:projectDesc/tei:p" mode="projecDesc">
    <xsl:for-each select=".">
      <xsl:if test="tei:hi[not(@*)]">
        <xsl:apply-templates select="tei:hi" mode="projecDesc2"/>
      </xsl:if>
      <p class="edito"><xsl:apply-templates mode="projecDesc"/></p>
      <xsl:if test="tei:list">
        <xsl:apply-templates select="tei:list" mode="projecDesc2"/>
      </xsl:if>
    </xsl:for-each>        
  </xsl:template>
  <xsl:template match="tei:hi[@rend='super']" mode="projecDesc">
    <sup><xsl:apply-templates/></sup>
  </xsl:template>
  <xsl:template match="tei:hi[not(@*)]" mode="projecDesc"/>
  <xsl:template match="tei:hi[not(@*)]" mode="projecDesc2">
    <h2 class="edito2"><xsl:apply-templates mode="projecDesc"/></h2>
  </xsl:template>   
  
  <xsl:template match="tei:projectDesc//tei:list" mode="projecDesc"/>
  
  <xsl:template match="tei:projectDesc//tei:list" mode="projecDesc2">
    <ul class="no-bullet">
      <xsl:for-each select="tei:item">
        <li class="enum edito"><xsl:apply-templates select="." mode="projecDesc"/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="tei:projectDesc//tei:lb" mode="projecDesc">
    <br />
  </xsl:template>
  
  <xsl:template match="tei:projectDesc//tei:ref" mode="projecDesc">
    <xsl:for-each select=".">
      <xsl:choose>
        <xsl:when test="@type='mailto'">
          <a href="mailto:{@target}"><xsl:apply-templates mode="projecDesc"></xsl:apply-templates></a>
        </xsl:when>
        <xsl:when test="@type='externalLink'">
          <a target="_blank" href="{@target}"><xsl:apply-templates mode="projecDesc"></xsl:apply-templates></a>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>                
  
  <xsl:template match="tei:projectDesc" mode="projecDesc">
    <xsl:result-document format="html" encoding="UTF-8" href="html/apropos.html">
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
              <h1 class="text-center edito2">L'édition du Journal de Durival</h1>
              <xsl:apply-templates mode="projecDesc"/>
            </div>
          </div>
          <xsl:copy-of select="$footer"/>
          <!-- FOOTER -->                    
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
  
</xsl:stylesheet>