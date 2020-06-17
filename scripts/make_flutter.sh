#! /bin/bash

if [ "$#" -eq 2 ]; then
    ROOT_DIR=$(realpath $1)
    RUNTIME_MODE=${2,,}
else
    echo "usage: make_flutter <root_dir> [release|profile|debug]"
    exit 1
fi

cd $ROOT_DIR

cmake . \
-DCMAKE_BUILD_TYPE=Release \
-DFLUTTER_ENGINE_LIBRARY=$ROOT_DIR/binaries/$RUNTIME_MODE/libflutter_engine.so \
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=out \
-DCMAKE_INSTALL_PREFIX=/usr/local

if [ $? -eq 0 ] ; then
    sudo cp $ROOT_DIR/binaries/$RUNTIME_MODE/libflutter_engine.so $ROOT_DIR/binaries/$RUNTIME_MODE/icudtl.dat /usr/lib
    sudo cp $ROOT_DIR/binaries/$RUNTIME_MODE/flutter_embedder.h /usr/include

    sudo make install
fi
