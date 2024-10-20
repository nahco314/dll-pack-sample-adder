extern "C" {
    fn inc(_: i32) -> i32;
}

#[no_mangle]
pub extern "C" fn adding_and_one(a: i32, b: i32) -> i32 {
    unsafe { inc(a + b) }
}
