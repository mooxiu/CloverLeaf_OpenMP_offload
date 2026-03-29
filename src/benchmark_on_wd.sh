#/bin/bash

dir="${PWD}"
echo "current dir: ${dir}"
cd /home/muyao/projects/spack_env/env-memkf04
spack env activate .
cd ${dir} || exit


echo "Clean Built"
make clean

echo "Start Compiling..."
make COMPILER=LLVM_GPU

BMSIZE=(128 64 32 16 8 4 2)

for size in "${BMSIZE[@]}"; do
  echo "Start Run bm${size}:"
  make run_clover_bm${size}
done

echo "Finish"
