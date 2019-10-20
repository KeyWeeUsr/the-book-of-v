fn main() {
    // RPN stack
    mut stack := []f32
    prioritized := ["mul", "div"]
    normal := ["add", "sub"]

    for idx, value in os.args {
        if idx == 0 {
            continue
        }

        if (value in prioritized || value in normal) {
            if stack.len < 2 {
                panic("No values to use for operator $value")
            } else {
                right := stack[stack.len - 1]
                stack.delete(stack.len - 1)

                left := stack[stack.len - 1]
                stack.delete(stack.len - 1)

                if value == "add" {
                    println(add(left, right))
                } else if value == "sub" {
                    println(sub(left, right))
                } else if value == "mul" {
                    println(mul(left, right))
                } else if value == "div" {
                    println(div(left, right))
                } else {
                    println("$left $value $right")
                    println(stack)
                    panic("This should not happen!")
                }
                continue
            }
        }

        if (value in prioritized || value in normal) && stack.len < 2 {
            panic("No values to use for operator $value")
        }

        if !(value in prioritized || value in normal) {
            stack << value.f32()
        }
    }
}
