fn main() {
    mut tree := Place{name: "Tree"}
    mut pile := Place{name: "Pile of old leaves"}
    mut shrub := Place{name: "Shrubbery"}
    mut bear := Place{name: "Bear behind Shrubbery"}

    // connect tree node with its children
    tree.left = &pile
    tree.right = &shrub
    pile.previous = &tree
    shrub.previous = &tree

    // forward-connect shrub node only
    // because it already has 'previous' set
    shrub.right = &bear
    bear.previous = &shrub

    println(&tree)
    println(tree)

    println(&pile)
    println(pile)

    println(&shrub)
    println(shrub)

    println(&bear)
    println(bear)
}
