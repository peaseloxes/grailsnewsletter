package grailsnewsletter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewsletterController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def mailService

    def send(Newsletter newsletterInstance){

        // TODO i18n

        // check if already sent
        if(newsletterInstance.dateSent!=null){
            Console.println("This newsletter has already been sent")
        }else{
            // compile newsletter
            String content = "Newsletter \n\n"

            if(newsletterInstance.newsitems.empty){
                Console.println("There are no newsitems to send!")
            }

            // TODO no news items error handling
            newsletterInstance.newsitems.each {
                content += it.content + "\n\n"
            }

            // send the mail

            // TODO not hardcoded
            String unsubscribeLink = "http://localhost:8080/grailsnewsletter/subscriber/unsubscribe"

            // TODO i18n
            // TODO no subscribers error handling
            def subList = Subscriber.list()

            // TODO move to service
            subList.each {
                if(!it.unsubscribed) {
                    String personalContent = content + "Unsubscribe here: "

                    personalContent += unsubscribeLink + "/" + it.id

                    System.err.println("sending mail to: " + it.email)
                    System.err.println("content: " + personalContent)


                    String subMail = it.email

                    mailService.sendMail {
                        to subMail
                        subject "Newsletter"
                        body personalContent
                    }

                }
            }

            // TODO change Date() to proper date
            // set date sent
            newsletterInstance.dateSent = new Date()

            // save date sent update
            newsletterInstance.save flush:true
        }

        // respond for view
        //respond newsletterInstance
        render "Mail sent!"
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Newsletter.list(params), model:[newsletterInstanceCount: Newsletter.count()]
    }

    def show(Newsletter newsletterInstance) {
        respond newsletterInstance
    }

    def create() {
        respond new Newsletter(params)
    }

    @Transactional
    def save(Newsletter newsletterInstance) {
        if (newsletterInstance == null) {
            notFound()
            return
        }

        if (newsletterInstance.hasErrors()) {
            respond newsletterInstance.errors, view:'create'
            return
        }

        newsletterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect newsletterInstance
            }
            '*' { respond newsletterInstance, [status: CREATED] }
        }
    }

    def edit(Newsletter newsletterInstance) {
        respond newsletterInstance
    }

    @Transactional
    def update(Newsletter newsletterInstance) {
        if (newsletterInstance == null) {
            notFound()
            return
        }

        if (newsletterInstance.hasErrors()) {
            respond newsletterInstance.errors, view:'edit'
            return
        }

        newsletterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect newsletterInstance
            }
            '*'{ respond newsletterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Newsletter newsletterInstance) {

        if (newsletterInstance == null) {
            notFound()
            return
        }

        newsletterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Newsletter.label', default: 'Newsletter'), newsletterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsletter.label', default: 'Newsletter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
