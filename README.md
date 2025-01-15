# Edge Detector HW/SW Co-design on FPGA


In this project, the Sobel edge detection algorithm has been implemented at a high level on an FPGA. The design follows a co-design approach, where:

* The computation tasks are offloaded to the PL (Programmable Logic) part of the FPGA.
* The interface and I/O handling are managed by the PS (Processing System).

The implementation is carried out on the `ZynQ 7010` chip, which provides an efficient platform for hardware/software co-design. This combination leverages the high-performance processing capabilities of hardware with the flexibility of software to achieve an optimized edge detection solution.



### Sobel's Edge Detection Algorithm

The Sobel edge detection algorithm is a popular and straightforward method used in image processing to identify edges in an image. It works by detecting regions of high intensity gradients, which typically correspond to edges in the image.

#### Key Concepts:

1. **Edge Detection**:  
   Edges in an image are boundaries where there is a sharp change in pixel intensity, often indicating object boundaries or other features.

2. **Gradient**:  
   The Sobel algorithm calculates the gradient of image intensity at each pixel, providing both the magnitude and direction of edges.

#### How Sobel Works:

1. **Gradient Calculation**:  
   Sobel applies two filters (kernels) to the image: one for detecting changes in the horizontal direction (**Gx**) and another for the vertical direction (**Gy**). These filters are convolution masks:

   - Horizontal filter (**Gx**):  

$$
     G_x =
     \begin{bmatrix}
     -1 & 0 & 1 \\
     -2 & 0 & 2 \\
     -1 & 0 & 1
     \end{bmatrix}
$$

   - Vertical filter (**Gy**):  

$$
     G_y =
     \begin{bmatrix}
     -1 & -2 & -1 \\
      0 &  0 &  0 \\
      1 &  2 &  1
     \end{bmatrix}
$$

2. **Convolution**:  
   The image is convolved with these filters. Each filter emphasizes changes in intensity in its respective direction.

3. **Gradient Magnitude**:  
   The gradients from the horizontal and vertical filters are combined to compute the overall edge strength at each pixel using the formula:

$$
    \text{Gradient Magnitude} = \sqrt{G_x^2 + G_y^2}
$$

4. **Gradient Direction**:  
   The direction of the edge can be determined using:

$$
    \theta = \tan^{-1}\left(\frac{G_y}{G_x}\right)
$$

5. **Thresholding** (optional):  
   To identify only significant edges, a threshold can be applied to the gradient magnitude.

#### Characteristics of Sobel Algorithm:

- **Noise Sensitivity**:  
  Sobel includes smoothing (averaging) in its kernel structure, which reduces the impact of noise compared to simpler methods like Prewitt filters.
  
- **Performance**:  
  It is computationally efficient and suitable for hardware implementation like on FPGA.

- **Applications**:  
  Sobel is commonly used in computer vision tasks, such as object detection, feature extraction, and motion analysis.

