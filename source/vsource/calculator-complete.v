import os

fn add(left f32, right f32) f32 {
    return left + right
}

fn sub(left f32, right f32) f32 {
    return left - right
}

fn mul(left f32, right f32) f32 {
    return left * right
}

fn div(left f32, right f32) f32 {
    return left / right
}

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
                    stack << add(left, right)
                } else if value == "sub" {
                    stack << sub(left, right)
                } else if value == "mul" {
                    stack << mul(left, right)
                } else if value == "div" {
                    stack << div(left, right)
                } else {
                    println("$left $value $right")
                    println(stack)
                    panic("This should not happen!")
                }

                if idx == os.args.len - 1 {
                    println(stack)
                    exit(0)
                } else {
                    continue
                }
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
