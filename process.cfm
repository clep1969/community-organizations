<cfparam name="url.guid" default="" type="string">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<body>
    <cffile action="read" file="D:\philtest2\community-development\community-profiles\philadelphia_pa-counties\community-organizations.xml" variable="objGet" />
    <cfset communityOrgs_xml=XMLParse(objGet)>
    <cfset numOfOrgs = ArrayLen(communityOrgs_xml.document.XmlChildren)>
    <cfoutput>
        <cfloop index="x" from="1" to="#numOfOrgs#">
        	<cfif url.guid eq communityOrgs_xml.document.communityOrg[x].guid.xmlText>
				<cfset address2=communityOrgs_xml.document.communityOrg[x].contactInfo.address2.xmlText>
                <cfset fax=communityOrgs_xml.document.communityOrg[x].contactInfo.fax.xmlText>
                <cfset email=communityOrgs_xml.document.communityOrg[x].contactInfo.email.xmlText>
                <cfset website=communityOrgs_xml.document.communityOrg[x].contactInfo.website.xmlText>
            	<a name="#communityOrgs_xml.document.communityOrg[x].guid.xmlText#"></a>
                <h2 class="Subheader575px">#communityOrgs_xml.document.communityOrg[x].orgName.xmlText#</h2>
                <h3>Mission</h3>
                <p>#communityOrgs_xml.document.communityOrg[x].mission.xmlText#</p>
                <h3>Year of Origin</h3>
                <p>#communityOrgs_xml.document.communityOrg[x].yearFounded.xmlText#</p>
                <h3>Core Programs</h3>
                <ul>
                	<cfset programs = ArrayLen(communityOrgs_xml.document.communityOrg[x].corePrograms.XmlChildren)>
                    <cfloop index="y" from="1" to="#programs#">
                    <li>#communityOrgs_xml.document.communityOrg[x].corePrograms.coreProgram[y].xmlText#</li>
                    </cfloop>
                </ul>
                <a href="" id="jumpLink" style="border:0px;"></a>
                <h3>Service Area</h3>
                <p>#communityOrgs_xml.document.communityOrg[x].serviceArea.xmlText#</p>
                <h3>Contact Information</h3>
                <p>#communityOrgs_xml.document.communityOrg[x].orgName.xmlText#<br />
                #communityOrgs_xml.document.communityOrg[x].contactInfo.address1.xmlText#<br />
                <cfif #address2# neq ""><cfoutput>#communityOrgs_xml.document.communityOrg[x].contactInfo.address2.xmlText#<br /></cfoutput></cfif>
                #communityOrgs_xml.document.communityOrg[x].contactInfo.cityState.xmlText#<br />
                Phone: #communityOrgs_xml.document.communityOrg[x].contactInfo.phone.xmlText#<br />
                <cfif #fax# neq "">Fax: #communityOrgs_xml.document.communityOrg[x].contactInfo.fax.xmlText#<br /></cfif>
                <cfif #email# neq "">Email: <a href="mailto:#communityOrgs_xml.document.communityOrg[x].contactInfo.email.xmlText#">#communityOrgs_xml.document.communityOrg[x].contactInfo.email.xmlText#</a> <img src="/_images/icon_e-mail.gif" width="12" height="9" border="0" alt="E-mail" /><br /></cfif>
                <cfif #website# neq "">Homepage: <a href="#communityOrgs_xml.document.communityOrg[x].contactInfo.website.xmlText#">#communityOrgs_xml.document.communityOrg[x].contactInfo.website.xmlText#</a> <img src="/_images/icon_external-link.gif" width="10" height="10" border="0" alt="External Link" /></cfif></p>
            </cfif>
        </cfloop>
    </cfoutput>
</body>

</html>
