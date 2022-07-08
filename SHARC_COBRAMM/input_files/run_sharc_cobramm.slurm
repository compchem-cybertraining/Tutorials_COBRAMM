#!/bin/bash
#SBATCH --partition=valhalla  --qos=valhalla
#SBATCH --clusters=faculty
#SBATCH --nodes=1
#SBATCH --requeue
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory="$SLURM_SUBMIT_DIR

home_dir=$PWD 

module load openmpi/3.0.3/gcc-7.3.0
module load openbabel

# module load intel-oneapi-compilers/2021.3.0
# /util/common/modulefiles/Core/intel-oneapi-compilers/2021.3.0.lua
export PATH=/util/common/oneapi/2021.3.0/compiler/2021.3.0/linux/bin/intel64:/util/common/oneapi/2021.3.0/compiler/2021.3.0/linux/bin:$PATH
export LD_LIBRARY_PATH=/util/common/oneapi/2021.3.0/compiler/2021.3.0/linux/compiler/lib/intel64_lin:/util/common/oneapi/2021.3.0/compiler/2021.3.0/linux/lib:$LD_LIBRARY_PATH
export MANPATH=$MANPATH:/util/common/oneapi/2021.3.0/compiler/2021.3.0/documentation/en/man/common

# module load intel-oneapi-mkl/2021.3.0
# /util/common/modulefiles/Core/intel-oneapi-mkl/2021.3.0.lua
export MKL=/util/common/oneapi/2021.3.0/mkl/2021.3.0
export MKLROOT=/util/common/oneapi/2021.3.0/mkl/2021.3.0
export MKL_TARGET_ARCH=intel64
export PATH=/util/common/oneapi/2021.3.0/mkl/2021.3.0/bin/intel64:$PATH
export LD_LIBRARY_PATH=/util/common/oneapi/2021.3.0/mkl/2021.3.0/lib/intel64:$LD_LIBRARY_PATH
export CPATH=/util/common/oneapi/2021.3.0/mkl/2021.3.0/include/intel64:$CPATH
export PKG_CONFIG_PATH=/util/common/oneapi/2021.3.0/mkl/2021.3.0/tools/pkgconfig:$PKG_CONFIG_PATH

#module load intel-oneapi-compilers/2021.3.0 intel-oneapi-mkl/2021.3.0


source /projects/academic/cyberwksp21/Software/Conda/Miniconda3/etc/profile.d/conda.sh
#conda activate py39
export ALL_LIB=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/py39
export LD_LIBRARY_PATH=$ALL_LIB/lib:$LD_LIBRARY_PATH

#export WorkDir=$PWD
export Project='MOLCAS'
export MOLCAS=/projects/academic/cyberwksp21/Software/openmolcas_V21.10/
export PATH=${PATH}:${MOLCAS}/bin
export MOLCAS_MEM=2000
export MOLCAS_MOLDEN=ON
export MOLCAS_OUTPUT='PWD'


export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi
export OMP_NUM_THREADS=$omp_threads

module load intel-oneapi-compilers/2021.3.0 intel-oneapi-mkl/2021.3.0
if [ -d "test_cobramm_dir" ]; then
   if [ ! -z "$(ls -A test_cobramm_dir)" ]; then
      rm test_cobramm_dir/*
   fi
else
   mkdir test_cobramm_dir
fi

#cp -r* test_cobramm_dir

#cd test_cobramm_dir

#scratch_dir=molcas_$SLURM_JOB_ID 
#export MOLCAS_NPROCS=1 
#export MOLCAS_WORKDIR=$CINECA_SCRATCH/$scratch_dir 
__conda_setup="$('/projects/academic/cyberwksp21/Software/Conda/Miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/projects/academic/cyberwksp21/Software/Conda/Miniconda3/etc/profile.d/conda.sh" ]; then
        . "/projects/academic/cyberwksp21/Software/Conda/Miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/projects/academic/cyberwksp21/Software/Conda/Miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate py27
 
export AMBERHOME=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/ambertools22/
export PATH=$AMBERHOME/bin:$PATH
export COBRAM_PATH=/projects/academic/cyberwksp21/Software/cobramm
export PATH=$COBRAM_PATH/cobramm:$PATH
export PATH=$COBRAM_PATH/util:$PATH

export SHARC=/projects/academic/cyberwksp21/Software/sharc2.1.1/sharc-master/bin_cobramm
export PATH=$SHARC:$PATH


srun run.sh

#cp -r * $home_dir 
touch FINISHED
