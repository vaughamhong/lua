mkdir -p generated/xcode_ios
pushd generated/xcode_ios
cmake -DAPPLE_IOS=1 -G "Xcode" ../../
popd