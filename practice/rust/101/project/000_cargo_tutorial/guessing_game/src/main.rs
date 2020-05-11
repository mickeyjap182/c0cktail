// define library for using.
use std::io;

// it is a statement run @startup.
fn main() {
    // it prints characters to console.
    println!("Guess the number");
    println!("Please input your guess.");

    // 
    let mut guess = String::new();

    io::stdin().read_line(&mut guess)
        .expect("faild to line");

    println!("You guessed: {}", guess);

}
