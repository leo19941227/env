import argparse
from pathlib import Path

import numpy as np
from tqdm import tqdm
import soundfile as sf
from librosa.util import find_files


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("pt_dir")
    parser.add_argument("audio_dir")
    args = parser.parse_args()

    pt_dir = Path(args.pt_dir)
    audio_dir = Path(args.audio_dir)
    audio_dir.mkdir(exist_ok=True, parents=True)

    pt_files = pt_dir.rglob("*.npz")
    for pt_path in tqdm(list(pt_files)):
        with np.load(pt_path) as data:
            audio = data["data"]
            sr = data["sr"]

        target_path = (audio_dir / f"{Path(pt_path).stem}.wav").resolve()
        sf.write(target_path, audio, sr)
