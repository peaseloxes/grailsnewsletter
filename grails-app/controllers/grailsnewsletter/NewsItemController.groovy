package grailsnewsletter


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewsItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewsItem.list(params), model: [newsItemInstanceCount: NewsItem.count()]
    }

    def show(NewsItem newsItemInstance) {
        respond newsItemInstance
    }

    def create() {
        respond new NewsItem(params)
    }

    @Transactional
    def save(NewsItem newsItemInstance) {
        if (newsItemInstance == null) {
            notFound()
            return
        }

        if (newsItemInstance.hasErrors()) {
            respond newsItemInstance.errors, view: 'create'
            return
        }

        newsItemInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), newsItemInstance.id])
                redirect newsItemInstance
            }
            '*' { respond newsItemInstance, [status: CREATED] }
        }
    }

    def edit(NewsItem newsItemInstance) {
        respond newsItemInstance
    }

    @Transactional
    def update(NewsItem newsItemInstance) {
        if (newsItemInstance == null) {
            notFound()
            return
        }

        if (newsItemInstance.hasErrors()) {
            respond newsItemInstance.errors, view: 'edit'
            return
        }

        newsItemInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewsItem.label', default: 'NewsItem'), newsItemInstance.id])
                redirect newsItemInstance
            }
            '*' { respond newsItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewsItem newsItemInstance) {

        if (newsItemInstance == null) {
            notFound()
            return
        }

        newsItemInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewsItem.label', default: 'NewsItem'), newsItemInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
