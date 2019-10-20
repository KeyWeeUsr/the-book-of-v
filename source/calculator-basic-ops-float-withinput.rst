.. code:: v

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
        println(add(1, 2))
        println(sub(1, 2))
        println(mul(1, 2))
        println(div(1, 2))
        println(os.args)
    }
    
