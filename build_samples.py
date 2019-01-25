import os

os.system("pip install miyadaiku.themes.bootstrap4 miyadaiku.themes.fontawesome miyadaiku.themes.fullpagejs")

import pathlib, shutil

cur = pathlib.Path('.')
if (cur /  'doc/outputs/samples').exists():
    shutil.rmtree(cur / 'doc/outputs')

os.system("miyadaiku-build --rebuild doc")

os.makedirs(cur / 'doc/outputs/samples') 

for d in (cur / 'samples').iterdir():
    if d.is_dir():
        os.system(f"miyadaiku-build --rebuild {d}")

        #os.makedirs(cur / f'doc/outputs/{d.name}') 
        shutil.copytree(d / 'outputs', cur / f'doc/outputs/samples/{d.name}')

