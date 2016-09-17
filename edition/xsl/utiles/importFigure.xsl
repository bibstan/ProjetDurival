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
        <div type="figure">
            <xsl:for-each select="//table:table-row">
                <xsl:variable name="id" select="concat('picture',normalize-space(table:table-cell[1]),'A')"/>
                <xsl:variable name="type" select="normalize-space(table:table-cell[5])"/>
                <figure xml:id="{$id}" type="{$type}">                    
                    <graphic mimeType="image/jpeg" url="{normalize-space(substring-before(table:table-cell[2],'.jpg'))}"/>
                    <desc><xsl:value-of select="normalize-space(table:table-cell[3])"/></desc>
                    <xsl:if test="table:table-cell[4] != ''">
                        <xsl:comment><xsl:value-of select="normalize-space(table:table-cell[4])"/></xsl:comment>
                    </xsl:if>
                </figure>
                
            </xsl:for-each>
        </div>        
    </xsl:template>        
    
</xsl:stylesheet>