<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <!-- *************** Calendrier Timeliner **************** -->
  
  <xsl:template match="//tei:div[@type='transcription']" mode="calendrier">
    <xsl:result-document format="html" encoding="UTF-8" href="html/calendrier.html">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title>Édition du journal de Nicolas Durival 1765-1766</title>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <link rel="stylesheet" href="../css/app.css" />
          <link rel="stylesheet" href="../css/foundation.css" />            
          <link rel="stylesheet" href="../css/timeliner/timelinerCal.css" type="text/css" media="screen"/>
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
          <div class="row">
            <div class="large-12">            
              <h1 class="text-center edito2">Accès calendaire</h1>                                                            
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
                        <xsl:variable name="facs" select="tei:pb[1]/@facs"/>
                        <dt class="timeline-event" id="{$month}">
                          <a><xsl:value-of select="format-date($date,'[MNn]')"/></a>
                        </dt>
                        <dd class="timeline-event-content" id="{$month}EX">
                          <ul class="no-bullet">
                            <xsl:for-each select="tei:div[@type='day']">
                              <xsl:variable name="day" select="@xml:id"/>
                              <xsl:variable name="year" select="substring(./tei:dateline/tei:date/@when | ./tei:dateline/tei:date/@from,1,4)"/>
                              <xsl:choose>
                                <xsl:when test="position()=1">
                                  <li>
                                    <a href="{$month}.html#{$day}"><xsl:apply-templates select="tei:dateline/tei:date[@type='entry']" mode="date"/></a>
                                    <div class="media">
                                      <a href="{$month}.html#{$day}" class="venobox" data-type="iframe" data-overlay="rgba(0,0,0,0.5)">
                                        <img src="../images/{$year}/{$facs}.jpg" alt="Stanislas"/>
                                      </a>
                                    </div>
                                  </li> 
                                </xsl:when>
                                <xsl:otherwise>
                                  <li>
                                    <a href="{$month}.html#{$day}"><xsl:apply-templates select="tei:dateline/tei:date[@type='entry']" mode="date"/></a>
                                  </li>
                                </xsl:otherwise>
                              </xsl:choose>                                                                                                                        
                            </xsl:for-each>
                          </ul>
                        </dd>
                        <br class="clear" />
                      </xsl:for-each>
                    </dl>
                  </div>
                  <br class="clear" />
                </xsl:for-each>                                                                                  
                <br class="clear" />                  
              </div>                           
            </div>
          </div>
          <xsl:copy-of select="$footer"/>
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