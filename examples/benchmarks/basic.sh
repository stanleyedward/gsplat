SCENE_DIR="../storage/data/360_v2/"
RESULT_DIR="results/gspalt_base_benchmark_v1"
SCENE_LIST="garden bicycle stump bonsai counter kitchen room" # treehill flowers
RENDER_TRAJ_PATH="ellipse"

for SCENE in $SCENE_LIST;
do
    if [ "$SCENE" = "bonsai" ] || [ "$SCENE" = "counter" ] || [ "$SCENE" = "kitchen" ] || [ "$SCENE" = "room" ]; then
        DATA_FACTOR=2
    else
        DATA_FACTOR=4
    fi

    echo "Running $SCENE"

    CUDA_VISIBLE_DEVICES=7 python examples/simple_trainer.py default --disable_viewer --data_factor $DATA_FACTOR --lpips-net vgg \
        --render_traj_path $RENDER_TRAJ_PATH \
        --data_dir $SCENE_DIR/$SCENE/ \
        --result_dir $RESULT_DIR/$SCENE/ \
	    --save-ply
  
done



