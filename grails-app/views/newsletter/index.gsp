
<%@ page import="grailsnewsletter.Newsletter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsletter.label', default: 'Newsletter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsletter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsletter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'newsletter.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateSent" title="${message(code: 'newsletter.dateSent.label', default: 'Date Sent')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'newsletter.title.label', default: 'Title')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${newsletterInstanceList}" status="i" var="newsletterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsletterInstance.id}">${fieldValue(bean: newsletterInstance, field: "dateCreated")}</g:link></td>

						<g:if test="${newsletterInstance.dateSent==null}">
							<td><g:link action="send" id="${newsletterInstance.id}">Send</g:link></td>
						</g:if>
						<g:else>
							<td><g:formatDate date="${newsletterInstance.dateSent}" /></td>
						</g:else>
						<td>${fieldValue(bean: newsletterInstance, field: "title")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsletterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
