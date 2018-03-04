<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="/" mode="focus">
    <xsl:result-document format="html" encoding="UTF-8" href="html/focus.html">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <title>Édition du journal de Nicolas Durival 1765-1766</title>
          <meta charset="utf-8"/>
          <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
          <link rel="stylesheet" href="../css/app.css"/>
          <link rel="stylesheet" href="../css/foundation.css"/>
          <link rel="stylesheet" href="../css/timeliner/timeliner.css" type="text/css"
            media="screen"/>
          <link rel="stylesheet" href="../js/timeliner/vendor/venobox/venobox.css"
            type="text/css" media="screen"/>
          <link
            href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700"
            rel="stylesheet" type="text/css"/>
          <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900,300"
            rel="stylesheet" type="text/css"/>
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
              <h1 class="text-center edito2">Focus</h1>
              <br/>
              <div class="media-object">
                <div class="media-object-section">
                  <div class="thumbnail">
                    <a href="durival.html">
                      <img
                        src="../images/vignettes/vignetteM0514_39-22-2_b_MBo.png"
                        width="200"/>
                    </a>
                  </div>
                </div>
                <div class="media-object-section">
                  <h2 class="edito">Nicolas Durival (1713-1795)</h2>
                  <p class="edito">Fils d'un valet de garde-robe du duc Léopold,
                    Jacques Luton, Nicolas Durival met sa carrière au service du
                    nouveau souverain, Stanislas Leszczynski, roi de Pologne,
                    dès l'arrivée de celui-ci dans le duché de Lorraine. Homme
                    de confiance du duc, il exerce différentes fonctions au plus
                    près de la cour de Lunéville avant de devenir lieutenant
                    général de police de la ville de Nancy. Il mène
                    parallèlement une activité de statisticien et d'historien,
                    son Mémoire sur la Lorraine et le Barrois étant unanimement
                    salué dès sa parution.</p>
                </div>
              </div>
              <br/>
              <!--<div class="media-object">
                                <div class="media-object-section">
                                    <div class="thumbnail">
                                        <a href="stanislas.html">
                                            <img src="../images/vignettes/vignetteStanislasPortrait.png" width="200"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="media-object-section">
                                    <h2 class="edito">Stanislas Leszczynski (20 octobre 1677- 23
                                        février 1766)</h2>
                                    <p class="edito"> Les deux dernières années de Stanislas. </p>
                                </div>
                            </div>-->                            
              <div class="media-object">
                <div class="media-object-section">
                  <div class="thumbnail">
                    <a href="bibliotheque.html">
                      <img
                        src="../images/vignettes/vignetteStanislas_portrait.png"
                        width="200"/>
                    </a>
                  </div>
                </div>
                <div class="media-object-section">
                  <h2 class="edito">Histoire de la Bibliothèque de sa création à
                    1799</h2>
                  <p class="edito">Fondée par un édit de Stanislas du 28 décembre
                    1750, la Bibliothèque entend favoriser la diffusion des
                    idées nouvelles, le progrès des sciences et des arts. En un
                    demi-siècle, elle connaîtra trois déménagements et une
                    révolution.</p>
                </div>
              </div>
              
              <div class="media-object">
                <div class="media-object-section">
                  <div class="thumbnail">
                    <a href="girardet.html">
                      <img
                        src="../images/vignettes/vignetteSB543956101_FG3_GIRARDET1.png"
                        width="200"/>
                    </a>
                  </div>
                </div>
                <div class="media-object-section">
                  <h2 class="edito">Jean Girardet, peintre du roi Stanislas (1709-1778)</h2>
                  <p class="edito">
                    <p>
                      <persName ref="#girardet">Jean Girardet</persName> est un peintre dont le nom
                      reste étroitement associé au règne de <persName ref="#stanislas">Stanislas
                        Leszczynski</persName>. Devenu, en 1758, le peintre attitré du <persName
                          ref="#stanislas">Roi de Pologne</persName>, il a réalisé de nombreux
                      portraits du <persName ref="#stanislas">duc de Lorraine</persName> mais
                      également de sa cour, des lieux de vie et des nouvelles constructions
                      architecturales. </p></p>
                </div>
              </div>
            </div>
          </div>
          <!-- FOOTER -->
          <xsl:copy-of select="$footer"/>
          <script src="../js/vendor/jquery.js">/*Pour transformation xslt*/</script>
          <script src="../js/vendor/modernizr.js">/*Pour transformation xslt*/</script>
          <script src="../js/foundation.min.js">/*Pour transformation xslt*/</script>
          <script type="text/javascript" src="../js/timeliner/timeliner.min.js"/>
          <script type="text/javascript" src="../js/timeliner/vendor/venobox/venobox.min.js"/>
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