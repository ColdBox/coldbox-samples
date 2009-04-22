<cfoutput>
<div class="pageStats">
Page #rc.dspCurPage# of #rc.dspTotPage# - There was a total of #rc.dspResPage# results
</div>
<div class="feedImg">
<a href="#rc.ytdata.websiteurl#"><img src="#rc.ytdata.image.url#" alt="#rc.ytdata.title# logo" class="logo" /></a>
<h2>#rc.ytdata.title# results</h2>
<div class="keywords divider">YouTube Feed URL: <a href="#rc.getYoutubeURL#">#rc.getYoutubeURL#</a><br />
Last Search Result Revision: #TimeFormat(rc.ytdata.dateupdated,'h:mm tt')#, #DateFormat(rc.ytdata.dateupdated,'d mmm. yyyy')#
</div>
</cfoutput>
<cfloop from="1" to="#ArrayLen(rc.ytdata.items)#" index="rc.i">
<cfoutput>
  <div style="float:right">
  <cfloop from="1" to="#ArrayLen(rc.ytdata.items[rc.i].attachment)#" index="rc.ai">
  	<cfif rc.ytdata.items[rc.i].attachment[rc.ai].type is 'thumbnail' and rc.ytdata.items[rc.i].attachment[rc.ai].width lte 150>
    <img src="#rc.ytdata.items[rc.i].attachment[rc.ai].url#" alt="Thumbnail" />
    </cfif>
  </cfloop>
  </div>
	<h3><a href="#rc.ytdata.items[rc.i].url#">#rc.ytdata.items[rc.i].title#</a></h3>
  <blockquote>#rc.ytdata.items[rc.i].body#</blockquote>
  <cfif len(rc.ytdata.items[rc.i].comments.url)>
  <div style="padding-bottom:4px;"><a href="#rc.ytdata.items[rc.i].comments.url#">#getPlugin(plugin="Utilities",customPlugin=true).number1kSeparator(rc.ytdata.items[rc.i].comments.count)# comments</a></div>
  </cfif>
	<div class="itemstat">Id: #rc.ytdata.items[rc.i].id# - Last updated: #TimeFormat(rc.ytdata.items[rc.i].dateupdated,'h:mm tt')# #DateFormat(rc.ytdata.items[rc.i].dateupdated,'d mmm. yyyy')# - Author: #rc.ytdata.items[rc.i].author#</div>
  <div class="keywords divider">Keywords: #rc.ytdata.items[rc.i].keywords#</div>
</cfoutput>
</cfloop>
</div>