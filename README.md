# Full-scaled Deep Metric Learning for Pedestrian Re-identification

This project is a novel full-scaled deep metric learning (FDML) method for person re-identification.

## Installation
* Dependencies: 
  * [CUDA](https://developer.nvidia.com/cuda-toolkit) and [cuDNN](https://developer.nvidia.com/cudnn) with GPU
  * [Torch](https://github.com/torch/torch7) with packages ([nn](https://github.com/torch/nn), [cunn](https://github.com/torch/cunn), [cutorch](https://github.com/torch/cutorch), [cudnn](https://github.com/soumith/cudnn.torch)) installed by default, as well as some special packages such as [loadcaffe](https://github.com/szagoruyko/loadcaffe) and [matio](https://github.com/soumith/matio-ffi.torch)
  * Matlab (R2014a version) - for some result analysing scripts

* Getting project

```shell
git clone https://github.com/Lmy0217/FDML.git
cd FDML
```

### datasets
* Download the [CUHK03](http://www.ee.cuhk.edu.hk/~xgwang/CUHK_identification.html) (labeled & detected) dataset, then extract and place the file (cuhk-03.mat) in the folder `./datasets/cuhk03`.
* Download the [CUHK01](http://www.ee.cuhk.edu.hk/~xgwang/CUHK_identification.html) dataset and extract the zip file (CAMPUS.zip) in the folder `./datasets/cuhk01` (now, this folder should contain a folder named 'campus').
* Download the [VIPeR]() dataset and extract the file in the folder `./datasets/VIPeR` (now, this folder should contain two folders named 'cam_a' and 'cam_b'). Execute the script `./datasets/handle_viper.m` as

```shell
matlab -r ./datasets/handle_viper.m`
```
* Download the [QMUL-iLIDS]() dataset and extract the file in the folder `./datasets/i-LIDS` (now, this folder should contain a folders named 'Persons'). Execute the script `./datasets/handle_ilids.m` as

```shell
matlab -r ./datasets/handle_ilids.m`
```
* Execute the script `datasets.lua` as

```shell
th datasets.lua
```

### AlexNet model
* Download the [AlexNet](http://dl.caffe.berkeleyvision.org/bvlc_alexnet.caffemodel) pre-trained model in the folder `./models`.

## Training and Testing
Ours method are organized into two steps:

1. Pre-training feature extracting part on CUHK03.
2. Fine-tuning feature extracting part and metric learning part on CUHK01 or VIPeR or QMUL-iLIDS.

### pre-training
* Run `cnn.lua` to create ours pre-training model `./results/cnn_0.t7` as

```shell
th cnn.lua
```
* Run `pre-training.lua` with current epoch model saved as `./results/pre-training/cnn_current.t7` and all losses saved in `./results/pre-training.log`, execute it as

```shell
th pre-training.lua
```
* Modify (which model will be tested) and run `test-verify.lua` (verifying) as

```shell
th test-verify.lua
```

### fine-tuning
* Modify (set your pre-trained model) and run `drml.lua` to create ours fine-tuning model `./results/drml_0.t7` as

```shell
th drml.lua
```
* Modify (set dataset in CUHK01 / VIPeR / QMUL-iLIDS) and run `fine-tuning.lua` with current epoch model saved as `./results/fine-tuning/drml_current.t7` (save model `./results/fine-tuning/drml_[epoch].t7` every 10 epochs) and all losses saved in `./results/fine-tuning.log`, execute it as

```shell
th fine-tuning.lua
```
* Modify (which model will be tested) and run `test-identify.lua` (identifying) to predict similarities (distances) `./results/prediction.txt` (including two columns, the first column is predicted similarities (distances) and the second column represent positive pair (value 1) or negative pair (value -1)), execute it as

```shell
th test-identify.lua
```

## Citation
If you find this project useful in your research, please consider citing:
```
@article{huang2020,
  title={Full-scaled Deep Metric Learning for Pedestrian Re-identification},
  author={Wei Huang, Mingyuan Luo, Peng Zhang, Yufei Zha},
  journal={Multimedia Tools and A0pplications},
  year={2020}
}
```

## License
[MIT License](LICENSE)