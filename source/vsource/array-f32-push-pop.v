fn main() {
    mut stack := []f32

    // push
    stack << 1.2
    stack << 2.2
    stack << 3.2

    // print the array and its length
    println(stack)
    println(stack.len)

    // pop last item
    temp := stack[stack.len - 1]
    stack.delete(stack.len - 1)

    // print the array and the popped item
    println(stack)
    println(temp)
}
