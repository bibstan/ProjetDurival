<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:ml="http://www.w3.org/1998/Math/MathML"
    exclude-result-prefixes="xs tei"    
    version="2.0">
    
<xsl:output method="text" indent="no" omit-xml-declaration="no" encoding="UTF-8"/>

<xsl:template match="/">
\documentclass[12pt,a4paper,oneside]{book} % ou article, memoir, report, etc.
    
%usepackage permet d'utiliser un module complémentaire.
    
% Marges, retraits et espacement
\usepackage[margin=2.5cm]{geometry}
%espacement des lignes
\usepackage{setspace}
\onehalfspacing
\setlength\parindent{1cm}
    
%Le package Babel permet de gérer différentes normes linguistiques et typographiques
\usepackage[english,italian,french]{babel}
    
    
%Nouvelle syntaxe ici: une commande avec une option entre []
\usepackage[utf8]{inputenc}
    
%Gérer l'encodage des caractères en sortie
\usepackage[T1]{fontenc}
    
%Changer la fonte de caractère
\usepackage{lmodern}
%\usepackage{charter}
%Pour les maniaques du Times \usepackage{txfonts}
%Palatino \usepackage{mathpazo}
    
%Métadonnées du document
%Auteur
\author{}
\title{}
%La commande date est optionnelle
%\date{2 janvier 1950}
\date{Version du \today}
    
    
%Écrire les mots inconnus du dictionnaire pour la césure/l'hyphénation
%\hyphenation{Ajou-t-ons}
%Autres modules complémentaires
\usepackage{lettrine}
\usepackage[pdftex]{graphicx}
    
%pour le mode paysage je dois utiliser deux packages
%\usepackage{lscape}%pour le mode paysage
%\usepackage{pdflscape}%pour l'indiquer dans les métadonnées du pdf.
    
%pour le dessin
\usepackage{tikz}%pour le dessin
\usepackage{tikz-qtree}%pour les arbres 
    
\usepackage{caption}%pour ne pas numéroter les figures (on ajoute une étoile après caption)
    
%pour créer un Index
\usepackage{makeidx}
%pour activer la création de l'index.
\makeindex 
    
%Appeller le package pour les bibliographies
%\usepackage[backend=biber, sorting=nyt, style=inha]{biblatex}
%appel de la ressource bibliographique.
%\addbibresource{•}
%pour les guillemets
\usepackage[babel]{csquotes}
    
\begin{document}
<xsl:apply-templates/>  
\end{document}    
</xsl:template>    

    <xsl:template match="//tei:div[@type='year']">
        <xsl:text>\part{</xsl:text><xsl:apply-templates select="tei:head"></xsl:apply-templates><xsl:text>}</xsl:text>
        <xsl:apply-templates select="tei:div[@type='month']"/>
    </xsl:template>

    <xsl:template match="//tei:div[@type='month']">
        <xsl:text>\chapter{</xsl:text><xsl:apply-templates select="tei:fw[@type='runningHead']"></xsl:apply-templates><xsl:text>}</xsl:text>
        <xsl:apply-templates select="tei:div[@type='day']"/>
    </xsl:template>

    <xsl:template match="//tei:div[@type='day']">
        <xsl:text>\section*{</xsl:text><xsl:apply-templates select=".//tei:date[@type='entry']" mode="date"></xsl:apply-templates><xsl:text>}</xsl:text>
        <xsl:for-each select="tei:p">
            <xsl:apply-templates select="."/>
            <xsl:text>\bigskip</xsl:text>
            <xsl:text>
        
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:date[@type='entry']"/>
    <xsl:template match="tei:date[@type='entry']" mode="date">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="format-date(@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>        
            </xsl:when>
            <xsl:when test="@from and @to">
                <xsl:value-of select="format-date(@from,'[D01]', 'fr', (), ())"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="format-date(@to,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="tei:abbr"/>

</xsl:stylesheet>