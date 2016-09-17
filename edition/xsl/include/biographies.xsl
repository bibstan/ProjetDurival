<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="//tei:front/tei:div[@type='bio']" mode="bio">
    <xsl:for-each select="tei:div">
      <xsl:variable name="url" select="substring-before(@xml:id,'Bio')"/>
      <xsl:result-document format="html" encoding="UTF-8" href="html/{$url}.html">
        <html>
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Édition du journal de Nicolas Durival 1765-1766</title>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="../css/app.css" />
            <link rel="stylesheet" href="../css/foundation.css" />                                                                   
            <link href="../css/lightbox/lightbox.css" rel="stylesheet" />
            <link rel="stylesheet" href="../css/timeliner/timeliner.css" type="text/css" media="screen"/>
            <link rel="stylesheet" href="../js/timeliner/vendor/venobox/venobox.css" type="text/css" media="screen"/>
            
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
                <div class="container">
                  <h1 class="text-center edito2"><xsl:value-of select="./tei:head[@n=1]"/></h1>
                  <xsl:if test="./tei:p">
                    <xsl:for-each select="./tei:p">
                      <p class="lead">
                        <xsl:apply-templates select="."/>
                      </p>
                    </xsl:for-each>
                  </xsl:if>
                  <div id="timeline" class="timeline-container">
                    <button class="timeline-toggle">+ expand all</button>
                    <br class="clear" />
                    <xsl:for-each select="tei:div">
                      <div class="timeline-wrapper">
                        <h2 class="timeline-time"><span><xsl:value-of select="tei:head[@n='2']"/></span></h2>
                        <dl class="timeline-series">
                          <xsl:for-each select="tei:div">
                            <xsl:variable name="id" select="tei:head[@n='3']/@xml:id"/>
                            <span class="tick tick-before" />
                            <dt class="timeline-event" id="{$id}"><a><xsl:value-of select="tei:head[@n='3']"/></a></dt>
                            <span class="tick tick-after" />
                            <dd class="timeline-event-content" id="{$id}EX">
                              <xsl:if test=".//tei:graphic">
                                <div class="media">
                                  <a class="focus" href="../images/{.//tei:graphic/@url}.jpg" data-lightbox="bio">
                                    <img src="../images/{.//tei:graphic/@url}.jpg" alt="Placard"/>
                                  </a>
                                  <!--<a class="focus" href="../images/{.//tei:graphic/@url}.jpg" data-lightbox="#"><img src="../images/{.//tei:graphic/@url}.jpg" alt="Placard"/></a>-->                                                                    
                                </div><!-- /.media -->
                              </xsl:if>
                              <xsl:for-each select="tei:p">
                                <p>
                                  <xsl:apply-templates select="."/>
                                </p>
                              </xsl:for-each>
                              <br class="clear" />
                            </dd>
                          </xsl:for-each>                                                     
                        </dl> 
                      </div> 
                    </xsl:for-each>
                  </div>
                </div>                           
              </div>
            </div>
            <xsl:copy-of select="$footer"/>                        
            <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
            <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>
            <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>
            <script src="../js/lightbox/lightbox.js"></script>
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
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>