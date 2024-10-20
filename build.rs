fn main() {
    println!("cargo:rustc-link-search=native=./deps/add_one/target/release");
    println!("cargo:rustc-link-lib=dylib=add_one");
}
