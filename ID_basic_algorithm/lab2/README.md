# dependencies

you need to install pyenv and poetry


# install env

```bash
pyenv install 3.8.6
pyenv local 3.8.6
poetry env use 3.8.6
poetry install --no-root
```

# train

```bash
cd yolov5-5.0
poetry run python train.py --img 640 --batch 16 --epochs 100 --data ./data/coco128.yaml --weights ./weights/yolov5s.pt
```
