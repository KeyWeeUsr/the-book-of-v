struct Place {
    name string
mut:
    left &Place
    right &Place
    previous &Place
}
