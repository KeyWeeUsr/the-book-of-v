.. code:: v

    // calc.v
    fn add(left int, right int) int {
        return left + right
    }

    fn sub(left int, right int) int {
        return left - right
    }

    fn mul(left int, right int) int {
        return left * right
    }

    fn div(left int, right int) int {
        return left / right
    }

    fn main() {
        println(add(1, 2))
        println(sub(1, 2))
        println(mul(1, 2))
        println(div(1, 2))
    }
