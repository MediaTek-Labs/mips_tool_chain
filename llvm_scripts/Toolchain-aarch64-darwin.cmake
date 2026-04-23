# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Darwin)
SET(CMAKE_SYSTEM_VERSION 11.0)

# which compilers to use for C and C++
SET(TRIPLE aarch64-apple-darwin21.4)
SET(CMAKE_C_COMPILER ${TRIPLE}-clang)
SET(CMAKE_ASM_COMPILER ${TRIPLE}-clang)
SET(CMAKE_CXX_COMPILER ${TRIPLE}-clang++)
SET(CMAKE_AR ${TRIPLE}-ar)
SET(CMAKE_RANLIB ${TRIPLE}-ranlib)

# target environment location
SET(CMAKE_FIND_ROOT_PATH PATH:${DARWIN_TOOLS}/bin)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
