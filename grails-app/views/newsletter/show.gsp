
<%@ page import="grailsnewsletter.Newsletter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsletter.label', default: 'Newsletter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsletter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsletter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsletter">
			
				<g:if test="${newsletterInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newsletter.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newsletterInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsletterInstance?.dateSent}">
				<li class="fieldcontain">
					<span id="dateSent-label" class="property-label"><g:message code="newsletter.dateSent.label" default="Date Sent" /></span>
					
						<span class="property-value" aria-labelledby="dateSent-label"><g:formatDate date="${newsletterInstance?.dateSent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsletterInstance?.newsitems}">
				<li class="fieldcontain">
					<span id="newsitems-label" class="property-label"><g:message code="newsletter.newsitems.label" default="Newsitems" /></span>
					
						<g:each in="${newsletterInstance.newsitems}" var="n">
						<span class="property-value" aria-labelledby="newsitems-label"><g:link controller="newsItem" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsletterInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsletter.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsletterInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsletterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsletterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
