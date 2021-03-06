
<%@ page import="grailsnewsletter.NewsItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="author" title="${message(code: 'newsItem.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'newsItem.content.label', default: 'Content')}" />
					
						<th><g:message code="newsItem.newsletter.label" default="Newsletter" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'newsItem.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsItemInstanceList}" status="i" var="newsItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsItemInstance.id}">${fieldValue(bean: newsItemInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "content")}</td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "newsletter")}</td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
