<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
    	<html>
        
        	<head>
            	<link rel="stylesheet" href="path/to/_css/global.css" />
            </head>
            
            <body>
                <xsl:for-each select="document/communityOrg">
                	<a><xsl:attribute name="name"><xsl:value-of select="guid" /></xsl:attribute></a>
                	<h2 class="Subheader575px"><xsl:value-of select="orgName" /></h2>
                    <h3>Mission</h3>
                    <p><xsl:value-of select="mission" /></p>
                    <h3>Year of Origin</h3>
                    <p><xsl:value-of select="yearFounded" /></p>
                    <h3>Core Programs</h3>
                    <ul>
                    	<xsl:for-each select="corePrograms/coreProgram">
                        	<li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                    <h3>Service Area</h3>
                    <p><xsl:value-of select="serviceArea" /></p>
                    <h3>Contact Information</h3>
                    <p>
                    	<xsl:value-of select="orgName" /><br />
                        <xsl:value-of select="contactInfo/address1" /><br />
                        <xsl:value-of select="contactInfo/address2" /><br />
                        <xsl:value-of select="contactInfo/cityState" /><br />
                        Phone:&#160;<xsl:value-of select="contactInfo/phone" /><br />
                        Fax:&#160;<xsl:value-of select="contactInfo/fax" /><br />
                        Email:&#160;<a><xsl:attribute name="href">mailto:<xsl:value-of select="contactInfo/email" /></xsl:attribute><xsl:value-of select="contactInfo/email" /></a>&#160;<img src="/_images/icon_e-mail.gif" width="12" height="9" border="0" alt="E-mail" /><br />
                        Homepage:&#160;<a><xsl:attribute name="href"><xsl:value-of select="contactInfo/website" /></xsl:attribute><xsl:value-of select="contactInfo/website" /></a>&#160;<img src="/_images/icon_external-link.gif" width="10" height="10" border="0" alt="External Link" />
                    </p>
                </xsl:for-each>
            </body>
            
        </html>
    </xsl:template>
</xsl:stylesheet>
