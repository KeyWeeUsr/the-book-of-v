fn main() {
    // RPN stack
    stack := []f32
    prioritized := ["mul", "div"]
    normal := ["add", "sub"]

    for idx, value in os.args {
        if idx == 0 {
            continue
        }

        println(value)
        if (value in prioritized || value in normal) && stack.len < 2 {
            panic("No values to use for operator $value")
        }
    }
}
