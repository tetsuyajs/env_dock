import torch

print("torch version", torch.__version__)
print("cuda available", torch.cuda.is_available())
print("available gpu count", torch.cuda.device_count())
print("gpu name", torch.cuda.get_device_name())
