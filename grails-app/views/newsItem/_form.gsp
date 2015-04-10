<%@ page import="grailsnewsletter.NewsItem" %>



<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="newsItem.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${newsItemInstance?.author}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="newsItem.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" required="" value="${newsItemInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'newsletter', 'error')} required">
	<label for="newsletter">
		<g:message code="newsItem.newsletter.label" default="Newsletter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newsletter" name="newsletter.id" from="${grailsnewsletter.Newsletter.list()}" optionKey="id" required="" value="${newsItemInstance?.newsletter?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="newsItem.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${newsItemInstance?.title}"/>

</div>

