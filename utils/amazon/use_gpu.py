import torch

device_count = torch.cuda.device_count()
alist = []
blist = []
for i in range(device_count):
    alist.append(torch.randn(10000, 10000).to(f"cuda:{i}"))
    blist.append(torch.randn(10000, 10000).to(f"cuda:{i}"))

while True:
    for a, b in zip(alist, blist):
        torch.mm(a, b)
