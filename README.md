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
     G\_x = 
     \begin{bmatrix}
     -1 & 0 & 1 \\
     -2 & 0 & 2 \\
     -1 & 0 & 1
     \end{bmatrix}
     $$

   - Vertical filter (**Gy**)


$$
     G\_x =
     \begin{bmatrix}
     -1 & 0 & 1 \\
     -2 & 0 & 2 \\
     -1 & 0 & 1
     \end{bmatrix}
     $$

