package grailsnewsletter

class NewsItem {
    String title
    String author
    String content

    static belongsTo = [newsletter : Newsletter]

    static constraints = {

    }

    public String toString(){
        return "${title} (${author})"
    }
}
