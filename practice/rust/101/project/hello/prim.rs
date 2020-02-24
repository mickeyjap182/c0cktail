
/**
 * main function
 *
 */
fn main() {
    // variable guess own type from right side contents. 
    let answer = sum(10 , 14); // let y: i32
    print_i32(answer)
}

/**
 * add two 32 bit integer.
 *
 * @param int x  ... first parameter is i32.
 * @param int y ... second parameter is i32.
 * @return i32 ...  returning value type is calculated i32 value.
 */
fn sum(x: i32, y: i32) -> i32 {
    x + y
}

/**
 * print 32 bit integer.
 */
fn print_i32(x: i32) {
    // ! is 
    println!("answer = {}", x); 
}

