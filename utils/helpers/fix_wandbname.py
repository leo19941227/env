import os
import sys
import torch
from pathlib import Path
import wandb

rootdir = sys.argv[1]
newname = sys.argv[2]
assert os.path.isdir(rootdir)

# load ckpt
ckptpth = list(Path(rootdir).glob('*.ckpt'))[0]
ckpt = torch.load(str(ckptpth), map_location='cpu')
args, config = ckpt['Settings']['Paras'], ckpt['Settings']['Config']

# fix wandb exp name
args.name = newname
wandb.init(name=args.name, resume=args.wandbid)
wandb.config.update({
    'args': vars(args),
    'config': config,
}, allow_val_change=True)

