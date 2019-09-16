package main
import (
    "fmt"
)

type Character struct {
  id int64
  name string
  birth string
}

type Player struct {
    Character
    level uint32
    exp  uint64
}

// implement function to'Character' by struct pointer.
func (c *Character) Viewstatus() int64 {
    fmt.Printf("STATUS: ID:%d , NAME:%s , BIRTH:%s \n", c.id, c.name, c.birth)

    return c.id
}

func main() {
    fmt.Println("==start==\n")
    u := Character{id:101, name:"merry", birth:"1983/1/1"}
    player := Player{Character:u, level:1, exp:0}
    // Sub struct 'Player' is able to call 'Character''s function.
    var user = player.Viewstatus()
    fmt.Println(user)

}

