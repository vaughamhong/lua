mkdir -p generated/xcode_osx
pushd generated/xcode_osx
cmake -DAPPLE_OSX=1 -G "Xcode" ../../
popd