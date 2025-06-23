nsys profile \
    --trace cuda,cudnn,cublas,nvtx,osrt \
    --gpu-metrics-device=all \
    --cuda-memory-usage true \
    --capture-range cudaProfilerApi \
    --capture-range-end stop-shutdown \
    --cudabacktrace true \
    --python-sampling true \
    --force-overwrite true \
    --output profiling_test_report \
    --stats=true \
    --export=sqlite \
    python examples/simple_trainer.py mcmc --data-dir ../storage/data/360_v2/garden/ --data_factor 4 --disable_viewer --strategy.cap-max 1000000 --max-steps 8000 --result_dir results/garden_MCMC_1M_profiled_8k

# nsight-sys profiling_test_report.nsys-rep

