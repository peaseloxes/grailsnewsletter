package grailsnewsletter

class Subscriber {
    String name
    String email
    boolean unsubscribed

    static constraints = {
        email(email:true, unique: true)
    }

    String toString(){
        "${name} (${email})"
    }
}
