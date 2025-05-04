import torch
from gsplat import rasterization

device = "cuda" if torch.cuda.is_available() else "cpu"

mean = torch.tensor([[0.,0.,0.]], device=device, dtype=torch.float)
rotation_quaternion = torch.rand((1,4), device=device, dtype=torch.float)
scales = torch.rand((1,3), device=device, dtype=torch.float)
color = torch.rand((1,3), device=device, dtype=torch.float)
opacity = torch.ones((1), device=device, dtype=torch.float)

world2cam = torch.eye(4, device=device, dtype=torch.float)[None]
cam2image = torch.tensor([
    [[1., 0., 120.],
    [0., 1., 120. ],
    [0., 0., 1.   ]]], 
    device=device, dtype=torch.float
)

if __name__ == "__main__":
    print(f"world2cam shape: {world2cam.shape} \n cam2image shape: {cam2image.shape}")
    rgb_image, alpha, metadata = rasterization(
        means=mean,
        quats=rotation_quaternion,
        scales=scales,
        colors=color,
        opacities=opacity,
        viewmats=world2cam,
        Ks=cam2image,
        width=240,
        height=240
    )