# MPF Saint-Seiya-Pinball

## Rules

[Caballeros_del_Zodiaco (Saint Seiya) Rules.pdf](./R%C3%A8gles%20Caballeros_del_Zodiaco%20(Saint%20Seiya)%20Rules.pdf)

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
