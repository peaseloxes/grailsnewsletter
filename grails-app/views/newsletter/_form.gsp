<%@ page import="grailsnewsletter.Newsletter" %>



%{--<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'dateSent', 'error')} required">--}%
	%{--<label for="dateSent">--}%
		%{--<g:message code="newsletter.dateSent.label" default="Date Sent" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:datePicker name="dateSent" precision="day"  value="${newsletterInstance?.dateSent}"  />--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'newsitems', 'error')} ">
	<label for="newsitems">
		<g:message code="newsletter.newsitems.label" default="Newsitems" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsletterInstance?.newsitems?}" var="n">
    <li><g:link controller="newsItem" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="newsItem" action="create" params="['newsletter.id': newsletterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'newsItem.label', default: 'NewsItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: newsletterInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="newsletter.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${newsletterInstance?.title}"/>

</div>

