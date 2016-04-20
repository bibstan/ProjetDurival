<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs office style text table xlink"
    version="2.0">
    
    <xsl:template match="/">                
        <TEI>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Title</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <div>
                        <listPerson>
                            <xsl:apply-templates select="//table:table-row"/>
                        </listPerson>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="//table:table-row">
        <xsl:for-each select=".">
        <xsl:variable name="xmlId" select="normalize-space(table:table-cell[1])"/>
            <person xml:id="{$xmlId}"><persName><xsl:value-of select="normalize-space(table:table-cell[3])"/></persName><!--<xsl:if test="table:table-cell[3]/text:p !='x'"><state><p><xsl:value-of select="normalize-space(table:table-cell[3])"/></p></state></xsl:if>--></person>              
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>