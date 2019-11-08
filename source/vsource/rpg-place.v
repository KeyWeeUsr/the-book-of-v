struct Place {
    name string
    left &Place
    right &Place
    previous &Place
}
