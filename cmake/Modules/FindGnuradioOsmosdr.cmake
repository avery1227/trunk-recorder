PKG_CHECK_MODULES(PC_GNURADIO_OSMOSDR gnuradio-osmosdr)

FIND_PATH(
    GNURADIO_OSMOSDR_INCLUDE_DIRS
    NAMES osmosdr/source.h
    HINTS $ENV{GNURADIO_OSMOSDR_DIR}/include
        ${GNURADIO_OSMOSDR_INCLUDEDIR}
        ${GNURADIO_OSMOSDR_INCLUDE_DIRS}
        ${CMAKE_INSTALL_PREFIX}/include
    PATHS /usr/local/include
          /usr/include
          /opt/local/include
)

FIND_LIBRARY(
    GNURADIO_OSMOSDR_LIBRARIES
    NAMES gnuradio-osmosdr
    HINTS $ENV{GNURADIO_OSMOSDR_DIR}/lib
        ${GNURADIO_OSMOSDR_LIBRARY_DIRS}
        ${GNURADIO_OSMOSDR_LIBDIR}
        ${CMAKE_INSTALL_PREFIX}/lib
        ${CMAKE_INSTALL_PREFIX}/lib64
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          /opt/local/lib
)


if(GNURADIO_OSMOSDR_INCLUDE_DIRS AND GNURADIO_OSMOSDR_LIBRARIES)
  set(GNURADIO_OSMOSDR_FOUND TRUE CACHE INTERNAL "gnuradio-osmosdr found")
  message(STATUS "Found gnuradio-osmosdr: ${GNURADIO_OSMOSDR_INCLUDE_DIRS}, ${GNURADIO_OSMOSDR_LIBRARIES}")
else(GNURADIO_OSMOSDR_INCLUDE_DIRS AND GNURADIO_OSMOSDR_LIBRARIES)
  set(GNURADIO_OSMOSDR_FOUND FALSE CACHE INTERNAL "gnuradio-osmosdr found")
  message(STATUS "gnuradio-osmosdr not found.")
  message(STATUS "Found gnuradio-osmosdr: ${GNURADIO_OSMOSDR_INCLUDE_DIRS}, ${GNURADIO_OSMOSDR_LIBRARIES}")
endif(GNURADIO_OSMOSDR_INCLUDE_DIRS AND GNURADIO_OSMOSDR_LIBRARIES)


INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GnuradioOsmosdr DEFAULT_MSG GNURADIO_OSMOSDR_LIBRARIES GNURADIO_OSMOSDR_INCLUDE_DIRS)
MARK_AS_ADVANCED(GNURADIO_OSMOSDR_LIBRARIES GNURADIO_OSMOSDR_INCLUDE_DIRS)