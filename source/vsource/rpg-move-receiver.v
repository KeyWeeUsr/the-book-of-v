fn (trav mut Traveler) move(direction string) {
    ...
}

fn main() {
    ...
    mut traveler := Traveler{location: &tree}
    ...
    traveler.move("back")
    traveler.move("left")
    traveler.move("back")
    traveler.move("right")
    traveler.move("back")
}
