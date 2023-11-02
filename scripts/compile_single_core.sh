#!/bin/bash
set -e

# First we move to the build directory.
cd build

# Compiling the baseline (legacy & extended formats).
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_800mtps_legacy" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=ON -DENABLE_FSP=OFF -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=OFF -DENABLE_SSP=OFF && make
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_800mtps" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=OFF -DENABLE_FSP=OFF -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=OFF -DENABLE_SSP=OFF && make

# Compiling Hermes (legacy & extended formats).
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_hermes_o_800mtps_legacy" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=ON -DENABLE_FSP=ON -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=OFF -DENABLE_SSP=OFF && make
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_hermes_o_800mtps" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=OFF -DENABLE_FSP=ON -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=OFF -DENABLE_SSP=OFF && make

# Compiling TLP (legacy & extended formats).
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_hermes_o_800mtps_legacy" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=ON -DENABLE_FSP=ON -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=ON -DENABLE_SSP=ON && make
cmake -G "Unix Makefiles" ../ -DSIMULATOR_OUTPUT_DIRECTORY="1_cores_cascade_lake_hermes_o_800mtps" -DCHAMPSIM_CPU_NUMBER_CORE=1 -DCHAMPSIM_CPU_DRAM_IO_FREQUENCY=800 -DLEGACY_TRACE=OFF -DENABLE_FSP=ON -DENABLE_DELAYED_FSP=OFF -DENABLE_BIMODAL_FSP=ON -DENABLE_SSP=ON && make

cd ..

# Copying prefetchers and replacement policies plugins.
cp bin/prefetchers/* prefetchers/
cp bin/replacements/* replacements/
