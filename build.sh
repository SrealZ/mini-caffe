./generatepb.sh
mkdir build_gpu
cd build_gpu
cmake .. -DCMAKE_BUILD_TYPE=Release -DUSE_CUDA=ON -DUSE_CUDNN=ON -DCUDA_ARCH_NAME=All
make -j123
cp ../example/models/ssd/MobileNetSSD_deploy.prototxt .
./benchmark MobileNetSSD_deploy.prototxt 8 0
./benchmark MobileNetSSD_deploy.prototxt 8 -1
mkdir ../build_cpu
cd ../build_cpu
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j123
cp ../example/models/ssd/MobileNetSSD_deploy.prototxt .
./benchmark MobileNetSSD_deploy.prototxt 8 -1
