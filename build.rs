fn main() {
    println!(
        "cargo:rustc-link-search=native=./deps/add_one/target/{}/release",
        std::env::var("TARGET").unwrap()
    );
    println!("cargo:rustc-link-lib=dylib=add_one");
}
