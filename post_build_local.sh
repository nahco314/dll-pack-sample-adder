mkdir ./artifacts/
dll-pack-builder local $(dll-pack-builder find ${BUILD_OUT_DIR}) ./artifacts/ ${DLL_PACK_TARGET} ${GITHUB_REF#refs/tags/}
