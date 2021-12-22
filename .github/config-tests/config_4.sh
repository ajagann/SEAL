# Build examples with HEXL
set -x
COMPILER_FLAGS="-DCMAKE_BUILD_TYPE=Debug
                -DSEAL_BUILD_TESTS=ON
                -DSEAL_BUILD_BENCH=ON
                -DSEAL_BUILD_EXAMPLES=ON
                -DSEAL_USE_INTEL_HEXL=ON
                -DSEAL_BUILD_DEPS=ON
                -DSEAL_BUILD_SEAL_C=ON
                -DBUILD_SHARED_LIBS=OFF
                -DSEAL_USE_CXX17=OFF
                -DCMAKE_INSTALL_PREFIX=./"

cmake -B build ${COMPILER_FLAGS}
cmake --build build -j --config Debug
cmake --build build -j --target install --config Debug

echo "hello"
pwd
ls -la build/bin
find . -name "*sealtest*"
echo "hello"
sealtest=$(find . -name "sealtest*")
$sealtest --gtest_output=xml
exit $?