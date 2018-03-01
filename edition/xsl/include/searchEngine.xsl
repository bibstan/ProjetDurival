<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei" version="2.0">

    <xsl:template match="/" mode="searchEngine">
        <xsl:result-document format="html" encoding="UTF-8" href="html/query.php">
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>Édition du journal de Nicolas Durival 1765-1766</title>
                    <meta charset="utf-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <link rel="stylesheet" href="../css/app.css"/>
                    <link rel="stylesheet" href="../css/foundation.css"/>
                    <link rel="stylesheet" href="../css/timeliner/timeliner.css" type="text/css" media="screen"/>
                    <link rel="stylesheet" href="../js/timeliner/vendor/venobox/venobox.css" type="text/css" media="screen"/>
                    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,900,700" rel="stylesheet" type="text/css"/>
                    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900,300" rel="stylesheet" type="text/css"/>
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
                            <h1 class="text-center edito2">Rechercher</h1>
                            <form action="query.php" method="post">
                                <input type="text" name="string"/>
                                <select name="date">
                                    <option value="null">Date</option>
                                    <xsl:text disable-output-escaping="yes">
                                        <![CDATA[
                                        <?php $date = simplexml_load_file("durivallc.tei.xml");
                                        $date->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                        foreach ($date->xpath("//tei:div[@type='year']") as $result) {
                                            echo "<option value='".substr($result['id'],1,5)."'>".$result->head."</option>";
                                         }
                                    ?>
                                        ]]>
                                    </xsl:text>
                                </select>
                                <select name="theme">
                                    <option value="null">Thème</option>
                                    <xsl:text disable-output-escaping="yes">
                                        <![CDATA[
                                        <?php $theme = simplexml_load_file("durivallc.tei.xml");
                                        $theme->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                        foreach ($theme->xpath("//tei:interp") as $result) {
                                            echo "<option value='".$result['id']."'>".$result."</option>";
                                        }
                                    ?>
                                        ]]>
                                    </xsl:text>
                                </select>
                                <!--<input type="number" min="1763" max="1766" step="1" name="date">-->
                                <input type="submit" class="button" value="rechercher"/>
                            </form>
                            <xsl:text disable-output-escaping="yes">
                                <![CDATA[
                                <?php 
                                $string = $_POST['string'];
                                $stringlc = stripslashes(strtolower($string));//RMQ échappement de l'apostrophe
                                //$search = stripslashes(strtolower($keyword));
                                $stringQuery = addslashes($stringlc);
                                $xmlstr = simplexml_load_file("durivallc.tei.xml");
                                $xmlstr->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                date_default_timezone_set('Europe/Paris');
                                setlocale(LC_TIME, 'fr_FR.UTF-8');
                                if (($_POST['string']=="" && $_POST['theme']=='null' && $_POST['date']=='null') OR ($_POST['string']=="" && $_POST['theme']=='null' && $_POST['date']!=='null')) {
                                    echo "Merci de renseigner le formulaire";
                                }
                                else {
                                    if ($_POST['string']!=="" && $_POST['date']=='null' && $_POST['theme']=='null') {
                                        //TODO echappement de l'apostrophe dans la requête.
                                        if ($xmlstr->xpath('//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]]')) {
                                            foreach ($xmlstr->xpath('//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]]') as $result) {
                                            echo "<br />";
                    
                                            //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                            $year = substr($result['id'], 1,4);
                                            $month = substr($result['id'], 5,2);
                                            $day = substr($result['id'], 7,2);
                                            $date = $year."-".$month."-".$day;
                                            $date = $date;
                    
                                            echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                            echo "<br />";
                                            $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                            foreach ($result->xpath('./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]') as $p) {
                                            echo "<p>".str_ireplace($stringlc, "<b>$string</b>", $p)."</p>";
                                            //echo "<p>".$p."</p>";
                                        }
                                        //echo $result->dateline->date;
                                        //echo $div->xpath("./@xml:id"), PHP_EOL;
                                    }
                                }
                                else {
                                    echo "<p>Il n'y a pas de résultat.</p>";
                                }
                            }//FIN if ($_POST['date']=='null')
                            elseif ($_POST['string']!=="" && $_POST['date']!=='null' && $_POST['theme']=='null') {
                                $date = $_POST['date'];
                                if ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]]')) {
                                    foreach ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]]') as $result) {
                                    echo "<br />";
                    
                                    //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                    $year = substr($result['id'], 1,4);
                                    $month = substr($result['id'], 5,2);
                                    $day = substr($result['id'], 7,2);
                                    $date = $year."-".$month."-".$day;
                                    $date = $date;
                    
                                    echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                    echo "<br />";
                                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                    foreach ($result->xpath('./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")]') as $p) {
                                        echo "<p>".str_ireplace($stringlc, "<b>$string</b>", $p)."</p>";
                                        //echo "<p>".$p."</p>";
                                    }
                                    //echo $result->dateline->date;
                                    //echo $div->xpath("./@xml:id"), PHP_EOL;
                                }
                            }
                            else {
                                echo "<p>Il n'y a pas de résultat.</p>";
                            }
                        }//FIN elseif ($_POST['date']!=='null' && $_POST['theme']=='null')
                        elseif ($_POST['string']!=="" && $_POST['theme']!=='null' && $_POST['date']=='null') {
                            $theme = $_POST['theme'];
                            if ($xmlstr->xpath('//tei:div[@type="year"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]]')) {
                                foreach ($xmlstr->xpath('//tei:div[@type="year"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]]') as $result) {
                                    echo "<br />";
                                
                                    //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                    $year = substr($result['id'], 1,4);
                                    $month = substr($result['id'], 5,2);
                                    $day = substr($result['id'], 7,2);
                                    $date = $year."-".$month."-".$day;
                                    $date = $date;
                    
                                    echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                    echo "<br />";
                                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                    foreach ($result->xpath('./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]') as $p) {
                                        echo "<p>".str_ireplace($stringlc, "<b>$string</b>", $p)."</p>";
                                        //echo "<p>".$p."</p>";
                                    }
                                    //echo $result->dateline->date;
                                    //echo $div->xpath("./@xml:id"), PHP_EOL;
                                }
                            }
                            else {
                                echo "<p>Il n'y a pas de résultat.</p>";
                            }
                        }//FIN $_POST['theme']!=='null' && $_POST['date']=='null'
                        elseif ($_POST['string']!=="" && $_POST['theme']!=='null' && $_POST['date']!=='null') {
                            $date = $_POST['date'];
                            $theme = $_POST['theme'];
                            if ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]]')) {
                                foreach ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]]') as $result) {
                                    echo "<br />";
                    
                                    //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                    $year = substr($result['id'], 1,4);
                                    $month = substr($result['id'], 5,2);
                                    $day = substr($result['id'], 7,2);
                                    $date = $year."-".$month."-".$day;
                                    $date = $date;
                    
                                    echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                    echo "<br />";
                                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                    foreach ($result->xpath('./tei:p[contains(translate(.,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz"),"'.$stringlc.'")][contains(@ana,"'.$theme.'")]') as $p) {
                                        echo "<p>".str_ireplace($stringlc, "<b>$string</b>", $p)."</p>";
                                        //echo "<p>".$p."</p>";
                                    }
                                    //echo $result->dateline->date;
                                    //echo $div->xpath("./@xml:id"), PHP_EOL;
                                }
                            }
                            else {
                                echo "<p>Il n'y a pas de résultat.</p>";
                            }
                        }//FIN $_POST['theme']!=='null' && $_POST['date']!=='null'
                        elseif ($_POST['string']=="" && $_POST['theme']!=='null' && $_POST['date']!=='null') {
                            $date = $_POST['date'];
                            $theme = $_POST['theme'];
                            if ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(@ana,"'.$theme.'")]]')) {
                                foreach ($xmlstr->xpath('//tei:div[@type="year"][@id="d'.$date.'"]//tei:div[@id][./tei:p[contains(@ana,"'.$theme.'")]]') as $result) {
                                    echo "<br />";
                    
                                    //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                    $year = substr($result['id'], 1,4);
                                    $month = substr($result['id'], 5,2);
                                    $day = substr($result['id'], 7,2);
                                    $date = $year."-".$month."-".$day;
                                    $date = $date;
                    
                                    echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                    echo "<br />";
                                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                    foreach ($result->xpath('./tei:p[contains(@ana,"'.$theme.'")]') as $p) {
                                        echo "<p>".$p."</p>";
                                        //echo "<p>".$p."</p>";
                                    }
                                    //echo $result->dateline->date;
                                    //echo $div->xpath("./@xml:id"), PHP_EOL;
                                }
                            }
                            else {
                                echo "<p>Il n'y a pas de résultat.</p>";
                            }
                        }//FIN $_POST['string']=="" && $_POST['theme']!=='null' && $_POST['date']!=='null'
                        elseif ($_POST['string']=="" && $_POST['theme']!=='null' && $_POST['date']=='null') {
                            $date = $_POST['date'];
                            $theme = $_POST['theme'];
                            if ($xmlstr->xpath('//tei:div[@type="year"]//tei:div[@id][./tei:p[contains(@ana,"'.$theme.'")]]')) {
                                foreach ($xmlstr->xpath('//tei:div[@type="year"]//tei:div[@id][./tei:p[contains(@ana,"'.$theme.'")]]') as $result) {
                                    echo "<br />";
                    
                                    //TODO aller récupérer la date dans le <dateline>-><date>->@when/@from
                                    $year = substr($result['id'], 1,4);
                                    $month = substr($result['id'], 5,2);
                                    $day = substr($result['id'], 7,2);
                                    $date = $year."-".$month."-".$day;
                                    $date = $date;
                    
                                    echo "<a href='".substr($result['id'], 0,7).".html#".$result['id']."'/>".strftime('%e %B %G',strtotime($date))."</a>";
                                    echo "<br />";
                                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                                    foreach ($result->xpath('./tei:p[contains(@ana,"'.$theme.'")]') as $p) {
                                        echo "<p>".$p."</p>";
                                        //echo "<p>".$p."</p>";
                                    }
                                    //echo $result->dateline->date;
                                    //echo $div->xpath("./@xml:id"), PHP_EOL;
                                }
                            }
                            else {
                                echo "<p>Il n'y a pas de résultat.</p>";
                            }
                        }//FIN $_POST['string']=="" && $_POST['theme']!=='null' && $_POST['date']=='null'
                    }
                    //$elements = $xpath->query("/html/body/div[@id='yourTagIdHere']");
                    /*foreach ($div->xpath("./tei:p[contains(.,'$string')]/@xml:id") as $result) {
                    $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                    echo $result, PHP_EOL;
                    }*/
                    /*$string = $_POST['string'];
                    $xmlstr = simplexml_load_file("durival.tei.xml");
                    $xmlstr->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");

                    foreach ($xmlstr->xpath("//tei:div[@xml:id]") as $row) {
                        $row->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                        foreach ($row->xpath("./tei:p[contains(.,'$string')]/@xml:id") as $result) {
                            $result->registerXPathNamespace("tei", "http://www.tei-c.org/ns/1.0");
                            echo $result, PHP_EOL;
                        }
                    }*/
                    ?>
                                ]]>
                            </xsl:text>
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
