fn main() {
    ...
    // forward-connect shrub node only because it already has 'previous' set
    shrub.right = &bear
    bear.previous = &shrub

    move(mut traveler, "back")
    move(mut traveler, "left")
    move(mut traveler, "back")
    move(mut traveler, "right")
    move(mut traveler, "back")
}
