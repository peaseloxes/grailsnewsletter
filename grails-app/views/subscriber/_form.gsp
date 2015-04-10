<%@ page import="grailsnewsletter.Subscriber" %>

<div class="fieldcontain ${hasErrors(bean: subscriberInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subscriber.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${subscriberInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriberInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="subscriber.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${subscriberInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriberInstance, field: 'unsubscribed', 'error')} required">
	<label for="unsubscribed">
		<g:message code="subscriber.unsubscribed.label" default="Unsubscribed" />
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="unsubscribed" value="${subscriberInstance?.unsubscribed}"/>
</div>