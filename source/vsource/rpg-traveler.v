struct Traveler {
mut:
    location &Place
}

fn main() {
    ...
    traveler := Traveler{location: &tree}
    ...
    println(traveler.location.name)
}
