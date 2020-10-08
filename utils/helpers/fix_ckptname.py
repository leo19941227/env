import os
import sys
import torch
from pathlib import Path

rootdir = sys.argv[1]
newname = sys.argv[2]
assert os.path.isdir(rootdir)

# fix local ckpts' names
for ckptpth in Path(rootdir).rglob('*.ckpt'):
    print(f'Fixing checkpoint {str(ckptpth)}')
    ckpt = torch.load(str(ckptpth), map_location='cpu')
    ckpt['Settings']['Paras'].name = newname
    torch.save(ckpt, ckptpth)
