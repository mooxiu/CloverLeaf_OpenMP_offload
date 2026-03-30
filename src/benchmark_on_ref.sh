#/bin/bash

dir="${PWD}"
echo "current dir: ${dir}"
cd /home/muyao/projects/spack_env/env-memkf04
spack env activate .
cd ${dir} || exit


echo "Start Compiling..."
make COMPILER=LLVM_GPU

BMSIZE=(128)

for size in "${BMSIZE[@]}"; do
  echo "Start Run bm${size}:"
  make run_clover_bm${size}
done

