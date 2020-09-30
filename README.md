# HoVer-Net Inference Code

HoVer-Net ROI and WSI processing code for simultaneous nuclear segmentation and classification in histology images. <br />
If you require the model to be trained, refer to the [original repository](https://github.com/vqdang/hover_net).  <br />

[Link](https://www.sciencedirect.com/science/article/abs/pii/S1361841519301045?via%3Dihub) to Medical Image Analysis paper. 

## Set up envrionment

```
conda create --name hovernet python=3.6
conda activate hovernet
pip install -r requirements.txt
```

## Running the code

Before running the code, download the HoVer-Net weights [here](https://drive.google.com/file/d/1k1GSsQkFkSjYY0eXi2Kx7Hlj8AGrhOOP/view?usp=sharing).[![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/) (see below for licensing details)

Usage:
```
  python run.py [--gpu=<id>] [--mode=<mode>] [--model=<path>] [--input_dir=<path>] \[--output_dir=<path>] \
      [--cache_dir=<path>] [--batch_size=<n>]  [--inf_tile_shape=<n>] [--proc_tile_shape=<n>] [--postproc_workers=<n>]
  python run.py (-h | --help)
  python run.py --version
```
Options:
```
  -h --help                  Show this string.
  --version                  Show version.
  --gpu=<id>                 GPU list. [default: 0]
  --mode=<mode>              Inference mode. 'roi' or 'wsi'. [default: roi]
  --model=<path>             Path to saved checkpoint.
  --input_dir=<path>         Directory containing input images/WSIs.
  --output_dir=<path>        Directory where the output will be saved. [default: output/]
  --cache_dir=<path>         Cache directory for saving temporary output. [default: cache/]
  --batch_size=<n>           Batch size. [default: 25]
  --inf_tile_shape=<n>       Size of tiles for inference (assumes square shape). [default: 20000]
  --proc_tile_shape=<n>      Size of tiles for post processing (assumes square shape). [default: 20000]
  --postproc_workers=<n>     Number of workers for post processing. [default: 4]
```

Example:
```
python run.py --gpu='0' --mode='roi' --model='hovernet.npz' --input_dir='roi_dir' --output_dir='output'
python run.py --gpu='0' --mode='wsi' --model='hovernet.npz' --input_dir='wsi_dir' --output_dir='output'
python run.py --gpu='0' --mode='wsi' --model='hovernet.npz' --input_dir='wsi_dir' --output_dir='output' --return_masks
```

There are two modes for running this code: `'roi'` and `'wsi'`.

* `'roi'`
    * **Input**: standard image file
    * **Output 1**: Overlaid results on image
    * **Output 2**: `.npy` file -> first channel = instance seg mask, 2nd channel = class mask

* `'wsi'`
    * **Input**: whole-slide image
    * **Output**: `.npz` file with saved centroids, masks, and type predictions
  
Note, masks are only saved in `'wsi'` mode when `--return_masks` is provided.  <br />

In `'wsi'` mode, the WSI is broken into tiles and each tile is processed indepdently. `--tile_size` may be used to alter the size of tiles if needed. <br />

To access the `.npz` file, use: 
```
fileload = np.load(filename)
masks = fileload['mask']
centroids = fileload['centroid']
predictions = fileload['type']
```

## Citation 

If any part of this code is used, please give appropriate citation. <br />

BibTex entry: <br />
```
@article{graham2019hover,
  title={Hover-net: Simultaneous segmentation and classification of nuclei in multi-tissue histology images},
  author={Graham, Simon and Vu, Quoc Dang and Raza, Shan E Ahmed and Azam, Ayesha and Tsang, Yee Wah and Kwak, Jin Tae and Rajpoot, Nasir},
  journal={Medical Image Analysis},
  pages={101563},
  year={2019},
  publisher={Elsevier}
}

@inproceedings{gamper2019pannuke,
  title={PanNuke: an open pan-cancer histology dataset for nuclei instance segmentation and classification},
  author={Gamper, Jevgenij and Koohbanani, Navid Alemi and Benet, Ksenija and Khuram, Ali and Rajpoot, Nasir},
  booktitle={European Congress on Digital Pathology},
  pages={11--19},
  year={2019},
  organization={Springer}
}

@article{gamper2020pannuke,
  title={PanNuke Dataset Extension, Insights and Baselines},
  author={Gamper, Jevgenij and Koohbanani, Navid Alemi and Graham, Simon and Jahanifar, Mostafa and Benet, Ksenija and Khurram, Syed Ali and Azam, Ayesha and Hewitt, Katherine and Rajpoot, Nasir},
  journal={arXiv preprint arXiv:2003.10778},
  year={2020}
}
```

## Dataset

The network was trained on the PanNuke dataset, where images are of size 256x256. This explains the slight difference in the input size of HoVer-Net compared to the original paper. In this repository, we also use 3x3 valid convolution in the decoder, as opposed to 5x5 convolution in the paper to speed up inference for WSI processing. <br />

Download the PanNuke dataset [here](https://warwick.ac.uk/fac/sci/dcs/research/tia/data/pannuke).

![](doc/dataset.png)

## License

Note that the PanNuke dataset is licensed under [Attribution-NonCommercial-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-nc-sa/4.0/), therefore the derived weights for HoVer-Net are also shared under the same license. Please consider the implications of using the weights under this license on your work and it's licensing. 

## Contributors

See the list of [contributors](https://github.com/simongraham/hovernet_inference/graphs/contributors) who participated in this project.

