<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs tei office style text table xlink #default"    
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:person">
        <xsl:variable name="id" select="@xml:id"/>
        <xsl:choose>
            <xsl:when test="document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]">
                <person xml:id="{$id}" type="indexVal">                                        
                    <persName>
                        <surname><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[2])"/></surname>
                        
                        <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3]) != 'c'">
                            <forename><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3])"/></forename>
                        </xsl:if>
                        
                        <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[4]) != 'd'">
                            <roleName><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[4])"/></roleName>
                        </xsl:if>                          
                    </persName>  
                    <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[5]) != 'e'">
                        <state><p><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[5])"/></p></state>
                    </xsl:if>
                    <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[6]) != 'f'">
                        <xsl:variable name="birth" select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[6])"/>
                        <birth when="{$birth}"/>
                    </xsl:if>
                    <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[7]) != 'g'">
                        <xsl:variable name="death" select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[7])"/>
                        <death when="{$death}"/>
                    </xsl:if>
                    <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[8]) != 'h'">                        
                        <listEvent>
                            <event>
                                <p><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[8])"/></p>
                            </event>
                            
                            <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[9]) != 'i'">
                                <event>
                                    <p><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[9])"/></p>
                                </event>
                            </xsl:if>
                            
                            <xsl:if test="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[10]) != 'j'">
                                <event>
                                    <p><xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[10])"/></p>
                                </event>
                            </xsl:if>
                        </listEvent>
                    </xsl:if>
                </person>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>                        
    </xsl:template>
    
    <!--<xsl:template match="//tei:place">
        <xsl:for-each select=".">
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:variable name="placeName" select="normalize-space(tei:placeName)"/>
            <xsl:choose>
                <xsl:when test="document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id][table:table-cell[3 or 4] != '']">
                    <place xml:id="{$id}">
                        <placeName><xsl:value-of select="$placeName"/></placeName>
                        <xsl:if test="document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3] != ''">
                            <location>
                                <geo><xsl:value-of select="replace(normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[3]),' ','')"/></geo>
                            </location>
                        </xsl:if>
                        <xsl:if test="document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[4] != ''">
                            <desc>
                                <xsl:value-of select="normalize-space(document('listPerson.xml')//table:table-row[normalize-space(descendant::table:table-cell[1])=$id]/table:table-cell[4])"/>
                            </desc>
                        </xsl:if>                        
                    </place>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>-->
    
    <!--<xsl:template match="//tei:location"/>-->
    
</xsl:stylesheet>