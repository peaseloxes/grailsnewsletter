
<%@ page import="grailsnewsletter.NewsItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsItem">
			
				<g:if test="${newsItemInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="newsItem.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${newsItemInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="newsItem.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${newsItemInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.newsletter}">
				<li class="fieldcontain">
					<span id="newsletter-label" class="property-label"><g:message code="newsItem.newsletter.label" default="Newsletter" /></span>
					
						<span class="property-value" aria-labelledby="newsletter-label"><g:link controller="newsletter" action="show" id="${newsItemInstance?.newsletter?.id}">${newsItemInstance?.newsletter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
