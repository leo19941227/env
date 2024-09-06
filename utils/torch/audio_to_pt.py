import argparse
from pathlib import Path

import numpy as np
from tqdm import tqdm
import soundfile as sf
from librosa.util import find_files


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("audio_dir")
    parser.add_argument("pt_dir")
    args = parser.parse_args()

    audio_dir = Path(args.audio_dir)
    pt_dir = Path(args.pt_dir)
    pt_dir.mkdir(exist_ok=True, parents=True)

    audio_files = find_files(audio_dir)
    for audio_path in tqdm(audio_files):
        audio, sr = sf.read(audio_path)
        target_path = (pt_dir / f"{Path(audio_path).stem}.npz").resolve()
        np.savez(target_path, data=audio, sr=sr)
