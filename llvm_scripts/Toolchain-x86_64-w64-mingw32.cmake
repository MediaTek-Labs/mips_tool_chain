# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(TRIPLE x86_64-w64-mingw32)
SET(CMAKE_C_COMPILER ${TRIPLE}-gcc)
SET(CMAKE_CXX_COMPILER ${TRIPLE}-g++)
SET(CMAKE_RC_COMPILER ${TRIPLE}-windres)
SET(CMAKE_AR ${TRIPLE}-ar)
SET(CMAKE_RANLIB ${TRIPLE}-ranlib)

# target environment location
SET(CMAKE_FIND_ROOT_PATH PATH:${MINGW})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

