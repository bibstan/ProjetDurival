<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    <xsl:output method="text" name="csv"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:listPerson"/>
        <xsl:apply-templates select="//tei:listPlace"/>
        <xsl:apply-templates select="//tei:listOrg"/>
        <xsl:apply-templates select="//tei:listBibl"/>
    </xsl:template>
    

    
    <xsl:template match="//tei:listPerson">
        <xsl:text>@XML:ID,NOM,PRENOM,TITRE/NOBLESSE,AUTRE,DATE DE NAISSANCE,DECES,AUTRES INFOS 1,AUTRES INFOS 2,AUTRES INFOS 3;

        </xsl:text>
        <xsl:for-each select="tei:person">
            <xsl:value-of select="normalize-space(@xml:id)"/><xsl:text>,</xsl:text>
            <xsl:value-of select="normalize-space(tei:persName)"/><xsl:text>,,,,,,</xsl:text>
            <xsl:value-of select="normalize-space(tei:state/tei:p)"/><xsl:text>;
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace">
        <xsl:result-document format="csv" encoding="UTF-8" href="listPlace.csv">
            <xsl:text>@XML:ID,Nom,rattachement (pour les sous ensembles),Département,Arrondissement,Canton,Pays (pour les lieux étrangers),Forme actuelle,Notes;

        </xsl:text>
            <xsl:for-each select="tei:place">
                <xsl:value-of select="normalize-space(@xml:id)"/><xsl:text>,</xsl:text>
                <xsl:value-of select="normalize-space(tei:placeName)"/><xsl:text>;
            </xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//tei:listOrg">
        <xsl:result-document format="csv" encoding="UTF-8" href="listOrg.csv">
            <xsl:text>@XML:ID,''RAISON SOCIAL'',TYPE (si besoin),Localisation (si besoin),NOTE (si besoin);

        </xsl:text>
            <xsl:for-each select="tei:org">
                <xsl:value-of select="normalize-space(@xml:id)"/><xsl:text>,</xsl:text>
                <xsl:value-of select="normalize-space(tei:orgName)"/><xsl:text>;
            </xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//tei:listBibl">
        <xsl:result-document format="csv" encoding="UTF-8" href="listBibl.csv">
            <xsl:text>@XML:ID,auteur,titre;
        </xsl:text>
            <xsl:for-each select="tei:bibl">
                <xsl:value-of select="normalize-space(@xml:id)"/><xsl:text>,</xsl:text>
                <xsl:value-of select="normalize-space(tei:author)"/><xsl:text>,</xsl:text>
                <xsl:value-of select="normalize-space(tei:title)"/><xsl:text>;
            </xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>
