function [Eigenfaces, MeanFace,A, ProjectedImages] = EigenfaceCore()

% Load training images
T = CreateDatabase();

% Compute Mean Face
MeanFace = mean(T,2);

% Normalize Images
A = T - MeanFace;

% Compute covariance matrix
L = A' * A;

% Compute eigenvalues and eigenvectors
[V,D] = eig(L);

% Sort eigenvectors according to descending eigenvalues
[eigenvalues,index] = sort(diag(D),'descend');
V = V(:,index);

% Convert eigenvectors to eigenfaces
Eigenfaces = A * V;

% -------- KEEP ONLY THE TOP EIGENFACES --------
numEigenfaces = 25;      % Try 20, 25, 30, or 35
Eigenfaces = Eigenfaces(:,1:numEigenfaces);

% Normalize eigenfaces
for i = 1:size(Eigenfaces,2)
    Eigenfaces(:,i) = Eigenfaces(:,i) / norm(Eigenfaces(:,i));
end

% Project training images
ProjectedImages = Eigenfaces' * A;
disp('Eigenfaces computed successfully.');

end
