<cfparam name="url.sorttype" default="">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="topic" content="" />
    <meta name="type" content="" />
    <title></title>
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
		    	
		    	var orgs = document.getElementById('foo');
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
        	<cfinclude template="../_includes/REDACTED.cfm">
            <div id="center-content">
            	<p class="Breadcrumbs"><a href="/">Home</a> &gt; Bread Crumb Path</p>
                <h1>Heading 1</h1> 
                <h2>Heading 2</h2>
                <form action="" method="post" name="SortOptions" id="SortOptions">
                	<label for="SortType" class="MultiplePartQuestionLabel">Select an option from the menu below and click the &quot;View&quot; button.</label>
                    <p>
                    	<select name="SortType" id="SortType">
                        	<option value="" selected="selected">show all</option>
                            <option value="ah"<cfif url.sorttype is "ah"> selected</cfif>>Option A</option>
                            <option value="ss"<cfif url.sorttype is "ss"> selected</cfif>>Option B</option>
                            <option value="ed"<cfif url.sorttype is "ed"> selected</cfif>>Option C</option>
                            <option value="rev"<cfif url.sorttype is "rev"> selected</cfif>>Option D</option>
                        </select>
                        <input name="buttonS" type="button" id="buttonS" value="View" onclick="javascript:sortFunding(document.SortOptions)" />
                    </p>
                </form>
                <cffile action="read" file="path\to\REDACTED.xml" variable="objGet" />
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
                <ul id="foo">
                	<cfloop index="x" from="1" to="#listLen(displayList)#">
                		<cfset y = listGetAt(displayList,x)>
                            <cfoutput><li><a href="javascript:ajaxpage('process.cfm?guid=#getLinks_xml.document.communityOrg[y].guid.xmlText#','resultText','jumpLink');">#getLinks_xml.document.communityOrg[y].orgName.xmlText#</a></li></cfoutput>
                            <!---	cfoutput><li><a href="process.cfm?guid=#getLinks_xml.document.communityOrg[y].guid.xmlText#">#getLinks_xml.document.communityOrg[y].orgName.xmlText#</a></li></cfoutput	--->
                	</cfloop>
                </ul>
	                <div id="resultText"></div>
                <span style="text-align:right; display:block;"><span class="moreInfo"><a href="#skip-navigation">Back to top</a><br />&nbsp;</span></span>
            </div>
            <div id="right-navigation">
                <!--	Right Navigation Contents	-->
            </div>
        </div>
        <cfinclude template="../_includes/footer.cfm">
    </div>
</body>

</html>
