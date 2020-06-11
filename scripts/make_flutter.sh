#! /bin/bash

if [ "$#" -eq 1 ]; then
    ROOT_DIR=$(realpath $1)
else
    echo "usage: make_flutter <root_dir>"
    exit 1
fi

sudo cp $ROOT_DIR/binaries/libflutter_engine.so $ROOT_DIR/binaries/icudtl.dat /usr/lib
sudo cp $ROOT_DIR/binaries/flutter_embedder.h /usr/include

cd $ROOT_DIR

cmake . \
-DCMAKE_BUILD_TYPE=Debug \
-DFLUTTER_ENGINE_LIBRARY=$ROOT_DIR/binaries/libflutter_engine.so \
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=out \
-DCMAKE_INSTALL_PREFIX=/usr/local

if [ $? -eq 0 ] ; then
    sudo make install
fi
