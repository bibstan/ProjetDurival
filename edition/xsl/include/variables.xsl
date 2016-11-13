<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:variable name="header">
    <header class="row">            
      <div data-sticky-container="true">
        <div class="nav" data-sticky="true" data-options="marginTop:0;">
          <div class="title-bar" data-responsive-toggle="menu-responsive" data-hide-for="medium">
            <button class="menu-icon" type="button" data-toggle="true"><xsl:comment>button pour foundation responsive</xsl:comment></button>
            <div class="title-bar-title">Menu</div>
          </div>
          <div class="top-bar" id="menu-responsive">
            <div class="top-bar-left">
              <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">
                <li><a href="../index.html">Accueil</a></li>                                        
                <li><a href="calendrier.html">Le journal</a></li>
                <li>
                  <a href="cartes.html">Cartes</a>
                  <ul class="vertical menu">
                    <li><a target="_blank" href="belprey.html">Nancy en 1754</a></li>
                    <li><a target="_blank" href="mique.html">Nancy en 1778</a></li>
                    <li><a target="_blank" href="cartographie.html">Nancy aujourd'hui</a></li>                                        
                  </ul>
                </li>
                <li><a href="galerie.html">Galerie</a></li>
                <li>
                  <a href="focus.html">Focus</a>
                  <ul class="vertical menu">
                    <li>
                      <a href="#">Biographies</a>
                      <ul class="vertical menu">
                        <li><a href="durival.html">Durival</a></li>
                        <li><a href="girardet.html">Girardet</a></li>
                        <!--<li><a href="stanislas.html">Stanislas</a></li>-->                                                
                      </ul>
                    </li>
                    <li>
                      <a href="#">Histoires</a>
                      <ul class="vertical menu">
                        <li><a href="bibliotheque.html">Histoire de la Bibliothèque</a></li>
                      </ul>
                    </li>
                    <li><a href="bibliographie.html">Bibliographie générale</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="top-bar-right">
              <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">                                                                             
                <li>
                  <a href="#">Index</a>
                  <ul class="vertical menu">
                    <li><a href="listPerson.html">Personnes</a></li>
                    <li><a href="listPlace.html">Lieux</a></li>
                    <li><a href="listOrg.html">Institutions</a></li>
                    <li><a href="listbib.html">Œuvres citées</a></li>                                        
                  </ul>
                </li>
                <li><a href="apropos.html">À propos</a></li>
              </ul>
            </div>                                
          </div>
        </div>
      </div>
      <img src="../images/header/header.jpg" alt="header" />
    </header>
  </xsl:variable>
  
  <xsl:variable name="mapHeader">
    <header data-sticky-container="true">            
      <div class="full-width sticky" data-sticky="true" data-options="marginTop:0;">
        <div class="nav">
          <div class="title-bar" data-responsive-toggle="menu-responsive" data-hide-for="medium">
            <button class="menu-icon" type="button" data-toggle="true"><xsl:comment>button pour foundation responsive</xsl:comment></button>
            <div class="title-bar-title">Menu</div>
          </div>
          <div class="top-bar" id="menu-responsive">
            <div class="top-bar-left">
              <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">
                <li><a href="../index.html">Accueil</a></li>                                        
                <li><a href="calendrier.html">Le journal</a></li>
                <li>
                  <a href="cartes.html">Cartes</a>
                  <ul class="vertical menu">
                    <li><a target="_blank" href="belprey.html">Nancy en 1754</a></li>
                    <li><a target="_blank" href="mique.html">Nancy en 1778</a></li>
                    <li><a target="_blank" href="cartographie.html">Nancy aujourd'hui</a></li>                                        
                  </ul>
                </li>
                <li><a href="galerie.html">Galerie</a></li>
                <li>
                  <a href="focus.html">Focus</a>
                  <ul class="vertical menu">
                    <li>
                      <a href="#">Biographies</a>
                      <ul class="vertical menu">
                        <li><a href="durival.html">Durival</a></li>
                        <li><a href="girardet.html">Girardet</a></li>
                        <!--<li><a href="stanislas.html">Stanislas</a></li>-->                                                
                      </ul>
                    </li>
                    <li>
                      <a href="#">Histoires</a>
                      <ul class="vertical menu">
                        <li><a href="bibliotheque.html">Histoire de la Bibliothèque</a></li>
                      </ul>
                    </li>
                    <li><a href="bibliographie.html">Bibliographie générale</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="top-bar-right">
              <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">                                                                             
                <li>
                  <a href="#">Index</a>
                  <ul class="vertical menu">
                    <li><a href="listPerson.html">Personnes</a></li>
                    <li><a href="listPlace.html">Lieux</a></li>
                    <li><a href="listOrg.html">Institutions</a></li>
                    <li><a href="listbib.html">Œuvres citées</a></li>                                        
                  </ul>
                </li>
                <li><a href="apropos.html">À propos</a></li>
              </ul>
            </div>                                
          </div>
        </div>
      </div>
    </header>
  </xsl:variable>
  
  <xsl:variable name="footer">
    <div class="row footer">
      <div class="large-8 medium-12 columns">
        <ul class="menu">
          <li class="logo"><a target="_blank" href="http://www.nancy.fr"><img class="logo" src="../images/logo/logo-ville-de-nancy.jpg" /></a></li>
          <li class="logo"><a target="_blank" href="http://www.reseau-colibris.fr/iguana/www.main.cls?surl=accueil"><img class="logo" src="../images/logo/BN-logo-blanc-fond-or-B15mm-30x60mm.jpg" /></a></li>
          <li class="logo"><a target="_blank" href="http://www.pactelorraine.eu/"><img class="logo" src="../images/logo/pacte Lorraine.png" /></a></li>
          <li class="logo"><a target="_blank" href="https://musee-lorrain.nancy.fr/"><img class="logo" src="../images/logo/MuseeLorrain-LOGO.jpg" /></a></li>
          <li class="logo"><img class="logo" src="../images/logo/LOGO CMJN 250e FR-LOR.jpg" /></li>
        </ul>                
        <a class="float-left" target="_blanck" href="../latex/durival.pdf">Télécharger la version pdf du Journal</a>
      </div>
      <div class="large-4 medium-12 columns">
        <div class="row edito">
          <div class="small-6 columns">
            Bibliothèques&#160;de&#160;Nancy<br />43,&#160;rue&#160;Stanislas<br />54&#160;000&#160;Nancy<br />&#x260E; 03 83 87 38 83 
          </div>
          <div class="small-6 columns">
            <a class="float-right" href="mailto:bibliotheque@nancy.fr">Contact</a>
            <br />
            <a class="float-right" href="apropos.html">Crédits</a>
          </div>
        </div>
      </div>
    </div>
  </xsl:variable>
  
</xsl:stylesheet>