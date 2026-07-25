# Face Recognition using PCA (Eigenfaces) in MATLAB

A MATLAB implementation of **Face Recognition using Principal Component Analysis (PCA)** using the **Eigenfaces** algorithm. This project recognizes faces by reducing the dimensionality of facial images and comparing them in a lower-dimensional feature space using Euclidean distance.

---

##  Project Overview

Face recognition is one of the most widely used applications of computer vision. In this project, Principal Component Analysis (PCA) is used to extract the most significant facial features, known as **Eigenfaces**. Each face is represented as a combination of these Eigenfaces, making recognition faster and more efficient.

The system:

- Builds a training database from facial images.
- Computes Eigenfaces using PCA.
- Projects both training and test images into the Eigenface space.
- Finds the closest matching face using Euclidean distance.

---

##  Features

- Face Recognition using PCA (Eigenfaces)
- Automatic image preprocessing
- Mean face computation
- Eigenface generation
- Euclidean distance-based matching
- Supports grayscale and RGB images
- Automatic numerical sorting of image datasets
- Displays test image alongside the recognized training image

---

##  Project Structure

```
FaceRecognitionPCA/
│
├── Main.m
├── CreateDatabase.m
├── EigenfaceCore.m
├── Recognition.m
├── README.md
│
├── TrainDatabase/
│   ├── 1.jpg
│   ├── 2.jpg
│   └── ...
│
└── TestDatabase/
    ├── 1.jpg
    ├── 2.jpg
    └── ...
```

---

##  Requirements

- MATLAB R2020a or later
- Image Processing Toolbox

---

##  How It Works

### Step 1 – Create Training Database

- Read all images from the **TrainDatabase** folder.
- Convert color images to grayscale.
- Resize all images to **112 × 92** pixels.
- Convert each image into a column vector.
- Store all image vectors in a training matrix.

### Step 2 – Compute Eigenfaces

- Calculate the mean face.
- Normalize all training images.
- Compute the covariance matrix.
- Calculate eigenvalues and eigenvectors.
- Generate Eigenfaces.
- Project every training image into Eigenface space.

### Step 3 – Recognize a Face

- Read a test image.
- Apply the same preprocessing steps.
- Project it into Eigenface space.
- Compute the Euclidean distance between the test image and every projected training image.
- Select the closest match.

---

## 📊 Algorithm

1. Read training images.
2. Convert images to vectors.
3. Compute the mean face.
4. Normalize the training set.
5. Compute covariance matrix.
6. Calculate eigenvalues and eigenvectors.
7. Generate Eigenfaces.
8. Project training images into Eigenface space.
9. Project the test image.
10. Compare feature vectors using Euclidean distance.
11. Display the closest matching face.

---

##  Running the Project

1. Clone this repository.
2. Open the project folder in MATLAB.
3. Ensure the folder structure is:

   ```
   TrainDatabase/
   TestDatabase/
   ```

4. Run:

   ```matlab
   Main
   ```

---

##  Example Output

```
Eigenfaces computed successfully.

Minimum Distance = 505.04

Test Image 10 matched with Training Image 5
```

The program displays:

- Test image
- Matched training image
- Minimum Euclidean distance
- Matched image number


##  Concepts Used

- Principal Component Analysis (PCA)
- Eigenfaces
- Image Vectorization
- Covariance Matrix
- Eigenvalues & Eigenvectors
- Euclidean Distance
- Pattern Recognition



##  Future Improvements

- Recognition accuracy calculation
- Unknown face detection using thresholding
- GUI using MATLAB App Designer
- Webcam-based real-time face recognition
- Support for larger datasets
- Comparison with LDA, Fisherfaces, and deep learning methods

---

##  Bug Fixes

During development, a filename ordering issue was identified. MATLAB loads image files alphabetically (e.g., `1.jpg`, `10.jpg`, `11.jpg`, `2.jpg`), which can lead to incorrect training image indexing.

This project sorts image filenames numerically before building the training database to ensure correct face matching.



## Author

SHRIYA SARDESHPANDE

Electronics & Telecommunication Engineering Student

---

## 📄 License

This project is created for educational and learning purposes. Feel free to use and modify it for academic work with appropriate attribution.
