#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/src/Authentication"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/install/lib/python3/dist-packages:/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/build" \
    "/usr/bin/python3" \
    "/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/src/Authentication/setup.py" \
     \
    build --build-base "/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/build/Authentication" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/install" --install-scripts="/home/zjj/Documents/workspace/eie/SNA_SCC/lab2/install/bin"
