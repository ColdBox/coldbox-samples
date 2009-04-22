<!-----------------------------------------------------------------------Author 	 :	Your NameDate     :	September 25, 2005Description :	This is a ColdBox event handler where all implicit methods can go.	Thus its the main handler.Please note that the extends needs to point to the eventhandler.cfcin the ColdBox system directory.extends = coldbox.system.EventHandler-----------------------------------------------------------------------><cfcomponent name="main" extends="coldbox.system.EventHandler" output="false" autowire="true">	<!--- Dependency Injections --->	<cfproperty name="userService" type="ioc" scope="instance" />			<!--- This init is mandatory, including the super.init(). --->	<cffunction name="init" access="public" returntype="main" output="false">		<cfargument name="controller" type="any">		<cfset super.init(arguments.controller)>		<!--- Any constructor code here --->		<cfreturn this>	</cffunction>	<cffunction name="onAppInit" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- ON Application Start Here --->	</cffunction>	<!--- On Request Start Method --->	<cffunction name="onRequestStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfset var rc = Event.getCollection()>		<cfset var ss = getPlugin("sessionstorage")>				<!--- EXIT HANDLERS: --->		<cfset rc.xehSearch = "feed.doSearchByTerm">				<cfif not ss.exists("oUserBean")>			<cfset ss.setVar("oUserBean",instance.userService.createUserBean())>		</cfif>					<cfset rc.oUserBean = ss.getVar("oUserBean")>		</cffunction>		<cffunction name="onRequestEnd" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- ON Request End Here --->	</cffunction>		<cffunction name="onSessionStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- ON session start Here --->	</cffunction>		<cffunction name="onSessionEnd" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- ON session End Here --->		<cfset var sessionScope = event.getValue("sessionReference")>		<cfset var applicationScope = event.getValue("applicationReference")>			</cffunction>	<!--- On Exceptions --->	<cffunction name="onException" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfset var exceptionBean = Event.getValue("ExceptionBean")>		<cfset getPlugin("logger").logErrorWithBean(exceptionBean)>	</cffunction></cfcomponent>