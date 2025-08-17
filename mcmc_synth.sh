SCENE_DIR="../storage/data/nerf_synthetic/"
RESULT_DIR="results/benchmark_mcmc_1M/synthetic"
SCENE_LIST="chair drums ficus hotdog lego materials mic" 
RENDER_TRAJ_PATH="ellipse"

CAP_MAX=1000000

for SCENE in $SCENE_LIST;
do

    echo "Running $SCENE"

    # train without eval
    CUDA_VISIBLE_DEVICES=7 python examples/simple_trainer.py mcmc --disable_viewer \
        --strategy.cap-max $CAP_MAX \
        --render_traj_path $RENDER_TRAJ_PATH \
        --data_dir $SCENE_DIR/$SCENE/ \
        --result_dir $RESULT_DIR/$SCENE/ \
        --save-ply \
    	--lpips-net vgg

    # # run eval and render
    # for CKPT in $RESULT_DIR/$SCENE/ckpts/*;
    # do
    #     CUDA_VISIBLE_DEVICES=7 python examples/simple_trainer.py mcmc --disable_viewer --data_factor $DATA_FACTOR --lpips-net vgg \
    #         --strategy.cap-max $CAP_MAX \
    #         --render_traj_path $RENDER_TRAJ_PATH \
    #         --data_dir $SCENE_DIR/$SCENE/ \
    #         --result_dir $RESULT_DIR/$SCENE/ \
    #         --ckpt $CKPT
    # done
done


