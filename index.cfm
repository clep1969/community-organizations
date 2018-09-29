<cfparam name="url.sorttype" default="">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="federal reserve bank of philadelphia, philadelphia fed, federal reserve system, third district, third federal reserve district, community profiles, metropolitan statistical areas, msa, msas, historical information, historical overview, demographics, population, housing, poverty levels, unemployment rate, local industries, economic data, financial institutions, market share data, home mortgage lending, community organizations, social service, community revitalization, funding sources, social service" />
    <meta name="topic" content="Community Development" />
    <meta name="type" content="community profile" />
    <title>Community Profile: Philadelphia, PA Metropolitan Division (MD) - Philadelphia Fed.</title>
    <cfinclude template="../_includes/stylesheets.cfm">
    <cfinclude template="../_includes/scripts.cfm">
    <script language="javascript" type="text/javascript">
    	/*	<![CDATA[	*/
		function sortFunding(form) {
			form.action = "index.cfm?sorttype=" + form.SortType.options[form.SortType.selectedIndex].value;
			form.submit(); return true;
		}
    	/*	]]>	*/
    </script>
    <script src="ajax.js" type="text/javascript"></script>
    <script type="text/javascript">
    	/*	<![CDATA[	*/
	    	function injectHTML()	{
		    	if (!document.getElementsByTagName)	return false;
		    	
		    	var orgs = document.getElementById('communityOrganizations');
		    	var lis = orgs.getElementsByTagName('li');
		    	
		    	for (var i = 0; i < lis.length; i++)	{
			    	lis[i].onClick = function()	{
				    	ajaxpage(this.firstChild.getAttribute("href"),"resultText","jumpLink");
			    	}
		    	}
	    	}
	    	
	    	addLoadEvent(injectHTML);
    	/*	]]>	*/
	</script>
			    	
</head>

<body>
	<div id="container">
    	<cfinclude template="../_includes/header.cfm">
        <div id="page-body">
        	<cfinclude template="../_includes/left-navigation_community-development.cfm">
            <div id="center-content">
            	<p class="Breadcrumbs"><a href="/">Home</a> &gt; <a href="../community-development">Community Development</a> &gt; <a href="../community-development/community-profiles">Community Profiles</a> &gt; <a href="../community-development/community-profiles/philadelphia_pa-counties">Philadelphia, PA Metropolitan Division (MD)</a> &gt; Community Organizations</p>
                <h1>Community Profile: Philadelphia, PA Metropolitan Division (MD)</h1> 
                <h2>Community Organizations</h2>
                <p>This section provides information about affordable housing,  social service, economic development, and community revitalization  organizations in the area whose interests, activities, and initiatives improve  the housing conditions and employment opportunities of residents. These groups  represent potential partners for bankers seeking to more fully address the  credit needs of each region&rsquo;s low- and moderate-income people and communities.</p>
                <p>The information in this section is obtained directly from  the websites of the community organizations.</p>
                <form action="" method="post" name="SortOptions" id="SortOptions">
                	<label for="SortType" class="MultiplePartQuestionLabel">To view community organizations for a specific community development expertise, select an option from the menu below and click the &quot;View&quot; button. </label>
                    <p>
                    	<select name="SortType" id="SortType">
                        	<option value="" selected="selected">show all community organizations</option>
                            <option value="ah"<cfif url.sorttype is "ah"> selected</cfif>>Affordable Housing for Low- and Moderate-Income Individuals</option>
                            <option value="ss"<cfif url.sorttype is "ss"> selected</cfif>>Services to Low- and Moderate-Income Individuals</option>
                            <option value="ed"<cfif url.sorttype is "ed"> selected</cfif>>Economic Development</option>
                            <option value="rev"<cfif url.sorttype is "rev"> selected</cfif>>Revitalization of Low- and Moderate-Income Communities
                            <!--- , Designated Disaster Areas, or Distressed or Underserved Areas --->
                            </option>
                        </select>
                        <input name="buttonS" type="button" id="buttonS" value="View" onclick="javascript:sortFunding(document.SortOptions)" />
                    </p>
                </form>
                <cffile action="read" file="D:\philtest2\community-development\community-profiles\philadelphia_pa-counties\community-organizations.xml" variable="objGet" />
                <cfset getLinks_xml=XMLParse(objGet)>
                <cfset ahList="1,2,3,5,6,7,8,9,10,11,15,16,18,19,20,23,25,28,30,35,36,37,41,42,44,45,46,47,48,49,50,51,52,55,56,57,58,59,61,62,63,64,68,69,70,71,73,74,76,77,79,83,84,85,86,87,88,89,91,94,95,96,97,101,102,105,107,109,111,112,114">
                <cfset ssList="1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,18,19,21,22,25,26,28,29,30,31,32,33,35,36,37,40,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,59,60,63,64,65,66,69,70,71,73,77,78,79,83,85,86,87,88,89,91,92,93,94,96,97,100,101,102,103,105,106,107,108,109,111,112,113,114,115">
                <cfset edList="2,5,7,8,12,13,14,16,21,24,27,30,37,38,39,40,44,50,60,63,64,68,69,73,74,77,81,82,83,84,85,87,89,90,91,98,101,103,104,105,109,110,113,114,115">
                <cfset revList="2,5,6,7,8,14,17,20,27,30,33,35,38,44,49,50,57,62,64,65,67,68,69,72,73,74,75,76,77,80,81,83,84,85,87,91,95,98,99,101,109,110,114">
                <cfset allList="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115">
                <cfswitch expression="#url.sorttype#">
                	<cfcase value="ah">
                    	<cfset displayList = ahList>
                    </cfcase>
                    <cfcase value="ss">
                    	<cfset displayList = ssList>
                    </cfcase>
                    <cfcase value="ed">
                    	<cfset displayList = edList>
                    </cfcase>
                    <cfcase value="rev">
                    	<cfset displayList = revList>
                    </cfcase>
                    <cfdefaultcase>
                    	<cfset displayList = allList>
                    </cfdefaultcase>
                </cfswitch>
                <ul id="communityOrganizations">
                	<cfloop index="x" from="1" to="#listLen(displayList)#">
                		<cfset y = listGetAt(displayList,x)>
                            <cfoutput><li><a href="javascript:ajaxpage('process.cfm?guid=#getLinks_xml.document.communityOrg[y].guid.xmlText#','resultText','jumpLink');">#getLinks_xml.document.communityOrg[y].orgName.xmlText#</a></li></cfoutput>
                            <!---	cfoutput><li><a href="process.cfm?guid=#getLinks_xml.document.communityOrg[y].guid.xmlText#">#getLinks_xml.document.communityOrg[y].orgName.xmlText#</a></li></cfoutput	--->
                	</cfloop>
                </ul>
	                <div id="resultText"></div>
                <span style="text-align:right; display:block;"><span class="moreInfo"><a href="#skip-navigation">Back to top</a><br />&nbsp;</span></span>
                <ul class="Footnote">
                	<li>Last updated: Friday, November 21, 2008</li>
                </ul>
            </div>
            <div id="right-navigation">
                <cfinclude template="../community-development/community-profiles/harrisburg/_report-sections.cfm">
                <cfinclude template="../_includes/contact-us_community-development.cfm">
            </div>
        </div>
        <cfinclude template="../_includes/footer.cfm">
    </div>
</body>

</html>
