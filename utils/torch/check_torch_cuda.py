import torch

print("cuda is available:", torch.cuda.is_available())
print("cudnn version:", torch.backends.cudnn.version())

