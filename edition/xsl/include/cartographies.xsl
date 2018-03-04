<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="/" mode="carte">
        <xsl:result-document format="html" encoding="UTF-8" href="html/cartes.html">
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
                    <div class="row">
                        <div class="large-12">
                            <h1 class="text-center edito2">Cartes</h1>
                            <p class="edito"/>
                            <div class="large-4 medium-12 columns">
                                <div>
                                    <!-- <h3 class="text-center edito2">Nancy en 1754</h3> -->
                                    <br/>
                                </div>
                                <a href="belprey.html" target="blank">
                                    <img class="float-center" src="../images/vignettes/vignetteBelprey.gif"/>
                                </a>
                                <h3 class="text-center edito2">Nancy en 1754</h3>
                                <br/>
                                <h4 class="edito">Thomas Belprey (1713-1786)</h4>
                                <cite class="edito">Plan général des deux villes de Nancy et des
                                    nouveaux édifices que sa Majesté le roy de Pologne, duc de
                                    Lorraine et de Bar etc... y a fait construire. Levé par
                                    Belprey... en 1754.</cite>
                                <br/>
                                <p class="edito">Ce plan de Thomas Belprey présente une vue en
                                    perspective de la ville en 1754, soit avant l'achèvement de tous
                                    les travaux voulus par Stanislas. Il comporte douze vignettes
                                    qui représentent les principaux nouveaux bâtiments de la ville.
                                </p>
                            </div>
                            <div class="large-4 medium-12 columns">
                                <div>
                                    <br/>
                                    <a href="mique.html" target="blank"><img class="float-center" src="../images/vignettes/vignetteB543956101_H_FG_ES_00014.gif" /></a>
                                </div>
                                <h3 class="text-center edito2">Nancy en 1778</h3>
                                <br/>
                                <h4 class="edito">Claude Mique (1714-1796)</h4>
                                <cite class="edito">Plan des villes, citadelle et faubourgs de
                                    Nancy, dédié à la Reine par... C. Mique, architecte de feu Roi
                                    de Pologne à Nancy.</cite>
                                <p class="edito">Sur ce plan de l'architecte du roi, l'essentiel des
                                    transformations voulues par Stanislas ont été réalisées. On y
                                    voit l'université (actuelle bibliothèque Stanislas), et le début
                                    de la destruction des bastions. Celui des Michottes a déjà
                                    disparu, laissant place à la nouvelle place de Grève.</p>
                            </div>
                            <div class="large-4 medium-12 columns">
                                <div>
                                    <br/>
                                    <a href="cartographie.html" target="blank"><img class="float-center" src="../images/vignettes/vignetteCarte.gif"/></a>
                                    <h3 class="text-center edito2">Nancy aujourd'hui</h3>
                                    <br/>
                                    <cite class="edito">La ville de Nancy telle qu'évoquée par
                                        Durival en 1765-1766 sur un plan contemporain.</cite>
                                    <p class="edito"> Sur ce plan de nancy, les lieux cités par
                                        Durival sont signalés par une icône (avec une distinction
                                        pour le civil, le religieux et le militaire). </p>
                                    <p class="edito">Cette superposition redessine la ville telle que Durival l'a
                                        parcouru et donne accès à des informations sur des lieux qui
                                        sont toujours visibles, ont été transformés ou qui parfois
                                        ont disparu.</p>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                    <!-- FOOTER -->
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
    
    <xsl:template match="/" mode="belprey">
        <xsl:result-document format="html" encoding="UTF-8" href="html/belprey.html">
            <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/foundation.css" />
                    <link rel="stylesheet" href="../css/app.css" />
                    <link rel="stylesheet" href="../js/leaflet/leaflet.css" />
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="zoomify">
                    <xsl:copy-of select="$mapHeader"/>
                    <div id="photo"></div>
                    <script src="../js/leaflet/leafletZ.js"></script>
                    <script type="text/javascript" src="../js/leaflet/L.TileLayer.Zoomify.js"></script>
                    <script type="text/javascript" src="../js/cartographie/belprey.js"></script>
                    <script src="../js/vendor/jquery.js"></script>
                    <script src="../js/foundation.min.js"></script>
                    <script src="../js/vendor/modernizr.js"></script>
                    <script src="../js/modernisation/modernisation.js"></script>
                    <script>$(document).foundation();</script>
                </body>
            </html>
        </xsl:result-document> 
    </xsl:template>
    
    <xsl:template match="/" mode="mique">
        <xsl:result-document format="html" encoding="UTF-8" href="html/mique.html">
            <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/foundation.css" />
                    <link rel="stylesheet" href="../css/app.css" />
                    <link rel="stylesheet" href="../js/leaflet/leaflet.css" />
                    <script>
                        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                        
                        ga('create', 'UA-78667211-1', 'auto');
                        ga('send', 'pageview');                            
                    </script>
                </head>
                <body class="zoomify">
                    <xsl:copy-of select="$mapHeader"/>
                    <div id="photo"></div>
                    <script src="../js/leaflet/leafletZ.js"></script>
                    <script type="text/javascript" src="../js/leaflet/L.TileLayer.Zoomify.js"></script>
                    <script src="../js/cartographie/mique.js"></script>
                    <script src="../js/vendor/jquery.js"></script>
                    <script src="../js/foundation.min.js"></script>
                    <script src="../js/vendor/modernizr.js"></script>
                    <script src="../js/modernisation/modernisation.js"></script>
                    <script>$(document).foundation();</script>
                </body>
            </html>
        </xsl:result-document> 
    </xsl:template>        
    
    <xsl:template match="//tei:div[@type='index'][descendant::tei:listPlace[@xml:id='listPlace']][descendant::tei:listOrg[@xml:id='listOrg']]" mode="cartographie">
        <!--<xsl:template match="//tei:listPlace[@xml:id='listPlace']" mode="cartographie">-->        
        <xsl:result-document format="html" encoding="UTF-8" href="html/cartographie.html">
            <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
</xsl:text>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" href="../css/foundation.css" />
                    <link rel="stylesheet" href="../css/app.css" />                    
                    <link rel="stylesheet" href="../js/leaflet/leaflet.css" />  
                    
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
                    <xsl:copy-of select="$mapHeader"/>                    
                    <div id="mapid">
                        <xsl:comment>carte OSM</xsl:comment>
                    </div>
                    <script src="../js/leaflet/leaflet.js"></script>
                    <script src="../js/cartographie/cartographie.js"></script>
                    <xsl:result-document format="frise" href="js/cartographie/cartographie.js">
                        var mymap = L.map('mapid').setView([48.692054, 6.184417], 15);
                        //http://mapwarper.net/maps/tile/13564/{z}/{x}/{y}.png
                        //https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw
                        var base1 = L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZW5ibW4iLCJhIjoiY2lvMDF6dmJjMDB0dXdkbHlrcnhpeWF1ZiJ9.si6DnhDmGd4jCIzX_Haqtg', {
                        maxZoom: 20, attribution: 'Map data ©; OpenStreetMap contributors, ' +
                        'CC-BY-SA, ' +
                        'Imagery © Mapbox',
                        id: 'mapbox.streets'
                        }).addTo(mymap);
                        
                        //var base2 = L.tileLayer('http://mapwarper.net/maps/tile/13564/{z}/{x}/{y}.png', {
                        //maxZoom: 20, attribution: 'Map data ©; OpenStreetMap contributors, ' +
                        //'CC-BY-SA, ' +
                        //'Imagery © Mapbox',
                        //id: 'mapbox.streets'
                        //})/*.addTo(mymap)*/;                                                
                        
                        // ICONES SUPPLEMENTAIRES
                        var iconA = L.icon({
                        iconUrl: '../js/leaflet/images/marker-icon-A.png',

                        iconRetinaUrl: '../js/leaflet/images/marker-icon-A2x.png',
                        iconSize: [32, 37],
                        iconAnchor:[16,36],
                        popupAnchor: [-3, -30]

                        });
                        
                        var iconB = L.icon({
                        iconUrl: '../js/leaflet/images/marker-icon-B.png',

                        iconRetinaUrl: '../js/leaflet/images/marker-icon-B2x.png',
                        iconSize: [32, 37],
                        iconAnchor:[16,36],
                        popupAnchor: [-3, -30]

                        });
                        
                        
                        var polygon = L.polygon(
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
                        ],{color:'#fc0', opacity:0.5}
                        ).bindPopup('<b>Limites approximatives de la ville en 1766</b>').addTo(mymap);
                        
                        var religious = new L.LayerGroup().addTo(mymap);
                        var civil = new L.LayerGroup().addTo(mymap);
                        var military = new L.LayerGroup().addTo(mymap);
                        
                        <xsl:for-each select="//tei:org[descendant::tei:geo]">
                            <xsl:variable name="id" select="@xml:id"/>
                            <xsl:variable name="href">&lt;a href='listPlace.html<xsl:value-of select="concat('#',$id)"/>'&gt;<xsl:value-of select="normalize-space(tei:orgName)"/>&lt;/a&gt;</xsl:variable>
                            <xsl:choose>
                                <xsl:when test="@type='religious'">
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>], {icon:iconB})</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(religious); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(religious); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="@type='military'">
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>], {icon:iconA})</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(military); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(military); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>])</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(civil); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(civil); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>                                                                        
                        </xsl:for-each>
                        
                        <!--var popup = L.popup();-->
                        <xsl:for-each select="//tei:place[descendant::tei:geo]">
                            <xsl:variable name="id" select="@xml:id"/>
                            <xsl:variable name="href">&lt;a href='listPlace.html<xsl:value-of select="concat('#',$id)"/>'&gt;<xsl:value-of select="normalize-space(tei:placeName[2][not(@type='today')])"/>&lt;/a&gt;</xsl:variable>
                            <xsl:choose>
                                <xsl:when test="@type='religious'">
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>], {icon:iconB})</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(religious); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(religious); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="@type='military'">
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>], {icon:iconA})</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(military); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(military); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>L.marker([</xsl:text>                                
                                    <xsl:value-of select="normalize-space(.//tei:geo)"/>
                                    <xsl:text>])</xsl:text>
                                    <xsl:text>.bindPopup("</xsl:text><xsl:value-of select="$href"/>                            
                                    <xsl:choose>
                                        <xsl:when test="tei:desc">                                        
                                            <xsl:text>&lt;br /&gt;</xsl:text>                                      
                                            <xsl:value-of select="normalize-space(tei:desc)"/>                                    
                                            <xsl:text>").addTo(civil); </xsl:text>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>").addTo(civil); </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>                                                                        
                        </xsl:for-each>
                        
                        var baseLayers = null;
                        /*var baseLayers = {
                            'Fond de carte contemporain': base1,
                            'Carte ancienne': base2
                        };*/                                                
                        
                        var overlayMaps = {
                        "Établissements religieux": religious,
                        "Établissements civils": civil,
                        "Établissements militaires": military,
                        "Limites de la ville en 1766": polygon
                        };
                        
                                                                                                                                                
                        L.control.layers(baseLayers, overlayMaps).addTo(mymap);
                        
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
  
</xsl:stylesheet>