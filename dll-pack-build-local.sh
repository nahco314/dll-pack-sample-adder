rustup target add ${DLL_PACK_TARGET}

cd deps/add_one
cargo build --profile release
cargo build --profile release --target ${DLL_PACK_TARGET}
cd ../../

cargo build --profile release --target ${DLL_PACK_TARGET}

export LD_LIBRARY_PATH=./deps/add_one/target/${DLL_PACK_TARGET}/release/:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=./deps/add_one/target/${DLL_PACK_TARGET}/release/:${DYLD_LIBRARY_PATH}

mkdir ./artifacts/
dll-pack-builder local $(cargo metadata --no-deps --format-version 1 | jq -r '.packages[0].name') \
    $(dll-pack-builder find ${BUILD_OUT_DIR}) \
     ./artifacts/ ${DLL_PACK_TARGET} ${GITHUB_REPOSITORY} ${GITHUB_REF#refs/tags/} \
    --include "deps/**/*"
