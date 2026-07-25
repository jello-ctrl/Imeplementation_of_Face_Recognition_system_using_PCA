clear;
clc;

[Eigenfaces, MeanFace, ProjectedImages] = EigenfaceCore();

MeanImage = reshape(MeanFace,[112 92]);

figure;
imshow(uint8(MeanImage));
title('Mean Face');
