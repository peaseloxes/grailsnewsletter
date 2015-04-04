package grailsnewsletter

class Newsletter {
    String title
    Date dateCreated
    Date dateSent

    static hasMany = [newsitems : NewsItem]

    static constraints = {
        
    }

    String toString(){
        "${title} - ${dateCreated}"
    }
}
