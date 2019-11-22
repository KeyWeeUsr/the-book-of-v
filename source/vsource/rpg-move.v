fn move(trav mut Traveler, direction string) {
    place := trav.location
    back := place.previous
    left := place.left
    right := place.right

    println("Old location $trav.location.name")
    println("Trying to move $direction")

    if direction == "back" {
        trav.location = nonnil_or_stay(place, back)
    } else if direction == "left" {
        trav.location = nonnil_or_stay(place, left)
    } else if direction == "right" {
        trav.location = nonnil_or_stay(place, right)
    } else {
        println("$direction is not valid, use back, left or right")
    }
    println("New location $trav.location.name")
}
