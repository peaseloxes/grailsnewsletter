package grailsnewsletter

class Newsletter {
    String title
    Date dateCreated
    Date dateSent

    static hasMany = [newsitems : NewsItem, subscribers : Subscriber]

    static constraints = {
        dateSent(nullable: true)
    }

    String toString(){
        "${title} - ${dateCreated}"
    }
}
