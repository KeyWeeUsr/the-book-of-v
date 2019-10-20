import os

fn main() {
    for idx, value in os.args {
        if idx == 0 {
            continue
        }
        println(value)
    }
}
