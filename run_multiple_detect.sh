#!/bin/bash
set -euo pipefail
# python detect_imagr.py --weights runs/train/yolov7-w6/weights/testing_tuesday/best.pt --conf 0.25 --img-size 960 --source 'countdown_fullframe/test/*_1920:1080.bayer_8.jpg' --save-txt --name test --project runs/detect/countdown

INPUT_DIR=$INPUT_DATASET
MODEL_WEIGHT=$WEIGHT
OUTPUT_DIR=$RESULT_DIR

if [[ ! -d "$INPUT_DIR" ]]; then
    echo "$INPUT_DIR must be a directory"
    exit 1
fi


for i in "$INPUT_DIR"/*/; do
    python detect_imagr.py --weights "$MODEL_WEIGHT" --conf 0.25 --img-size 960 --source "$i/*_1920:1080.bayer_8.jpg" --save-txt --name "$(basename "$i")" --project "$OUTPUT_DIR"
done