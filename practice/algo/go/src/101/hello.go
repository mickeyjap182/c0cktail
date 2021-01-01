package main
import "fmt"

type User struct {
  id int64
  name string
  birth string
}
func main() {
    fmt.Println("==start==\n")
    user := structure()
    fmt.Println(user)

}

func structure() User {
    u := User{id:101, name:"merry", birth:"1983/1/1"}

    return u
}
