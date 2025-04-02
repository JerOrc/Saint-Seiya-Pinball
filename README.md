# MPF Saint-Seiya-Pinball

## Demo video
https://www.youtube.com/shorts/OaKfcrMCkjA

[![Watch the video](https://img.youtube.com/vi/OaKfcrMCkjA/hqdefault.jpg)](https://youtube.com/shorts/OaKfcrMCkjA?si=xHt3P5rRWdcvgIaL)

## Running steps

- Install Godot
- Create and activate a python environnement
- Run this commands :
```shell
pip install numpy

git clone https://github.com/missionpinball/mpf.git
cd mpf
git checkout 0.80.x
pip install -e .

cd ..
git clone https://github.com/PPUC/MPF-pinball-ZeDMD-demo.git

cd MPF-pinball-ZeDMD-example

```
- Run Godot
  - Import project.godot
  - Accept the error message
- Close and restart Godot
  - Run the Godot project
- Run MPF :

```shell
mpf
```

In order to launch mpf and Godot with only 1 command line :
```shell
mpf both -t -G /path-to-Godot/Godot_v4.3-stable_linux.x86_64 
```


## How does it works ?
This work comes from this tutorial of Paradigm Tilt: 

https://www.youtube.com/watch?v=rQqKG2Ie6KM

https://www.youtube.com/watch?v=IO3U1SMZ5-A

And from Anthony van Winkle post here : https://groups.google.com/g/mpf-users/c/eTe_1PEFQq4/m/Kl4Vp8FdBAAJ

> You can see in the config.yaml the hardware configuration I setup, yours will of course vary but there is no requirement for window: or displays: sections. There is one important thing you need to configure and that's the name of the dmd (under the rgb_dmds: section). In the sample repo it's named fast_rgb_dmd, and in the godot scene dmd_window.tscn the main Window has a child node (of type MPFDMDDisplay) and the node name is also fast_rgb_dmd. It's necessary for you to make sure your DMD node name matches the rgb_dmd name in your config, because that's how MPF knows which DMD to update. 
