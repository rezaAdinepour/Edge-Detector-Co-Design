# Edge Detector HW/SW Co-design on FPGA


In this project, the Sobel edge detection algorithm has been implemented at a high level on an FPGA. The design follows a co-design approach, where:

* The computation tasks are offloaded to the PL (Programmable Logic) part of the FPGA.
* The interface and I/O handling are managed by the PS (Processing System).

The implementation is carried out on the `ZynQ 7010` chip, which provides an efficient platform for hardware/software co-design. This combination leverages the high-performance processing capabilities of hardware with the flexibility of software to achieve an optimized edge detection solution.



### Sobel Edge Detection Algorithm

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
     -1 & 0 & 1 \\
     -1 & 0 & 1
     \end{bmatrix}
$$

   - Vertical filter (**Gy**):  

$$
     G_y =
     \begin{bmatrix}
     -1 & -1 & -1 \\
      0 &  0 &  0 \\
      1 &  1 &  1
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



We design the project in two phases:
- software 
- hardware

## Software Phase:
For testing the design, we use the following image:

![img1](Doc/Images/test_img.png)


* We convolve the two kernels **Gx** and **Gy** with the image and then calculate the average of the outputs of both convolved images to report the edges of the image.

To achieve this, we implement the convolution function as follows:

```Python
def convolve(x, kernel):
    x_height = x.shape[0]
    x_width = x.shape[1]
    
    kernel_height = kernel.shape[0]
    kernel_width = kernel.shape[1]
    
    H = (kernel_height - 1) // 2
    W = (kernel_width - 1) // 2
    
    out = np.zeros((x_height, x_width))
    # iterate over all the pixel of image X
    for i in np.arange(H, x_height - H):
        for j in np.arange(W, x_width - W):
            sum = 0
            # iterate over the filter
            for k in np.arange(-H, H + 1):
                for l in np.arange(-W, W + 1):
                    # get the corresponding value from image and filter
                    a = x[i + k, j + l]
                    w = kernel[H + k, W + l]
                    sum += (w * a)
            out[i, j] = sum
    return out

```

* The dimensions of the grayscale image are (1080, 661).
* To reduce computational load and increase processing speed, we compromise on image quality and downscale the image dimensions to (128, 128).
* The resized image appears as follows:

![img2](Doc/Images/test_img_resized.png)


Next, we convolve both kernels with the input image, and the outputs are as follows:

![img3](Doc/Images/test_img_conv.png)


Using the code snippet below, we compute the average of the edges detected by both kernels. We then normalize the pixel values to a range of 0 to 255.

```Python
# calculate the gradient magnitude of vectors
edge_out = np.sqrt(np.power(pre_x, 2) + np.power(pre_y, 2))
edge_out = (edge_out / np.max(edge_out)) * 255
```


The final edge-detected image, referred to bellow, is presented as the software output of the edges detected in the image.

![img4](Doc/Images/test_final_conv_sw.png)





