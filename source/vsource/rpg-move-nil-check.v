fn nonnil_or_stay(old_place &Place, new_place &Place) &Place {
    if isnil(new_place) {
       println("Nothing is there.")
       return old_place
    } else {
       return new_place
    }
}
