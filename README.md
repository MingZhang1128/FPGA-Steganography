# New Security Approach for LSB Steganography using FPGA Implementation Based on Visual Sensitivity to Colors and Edges

## Block Memory Generator: 
We used block memory generator from IP catalog to store our
image and message.
## Controller Module: 
it consists of 3 counter counter_data , counter_img_buffer and
counter_img_encoder which used to control the memory addresses of the image20
depending on the number of bits that is embedded and the two flags from average
module.
## Encoder Module: 
used to embed message in the cover image based on the number of
bits of the message (switch cases). It starts after edge_ detected flag with 2 clock cycles
as memory start sending data after two clock cycles.
## Decoder Module: 
used to generate the original message as output from the cover image
depends on the flag coming from encoder.
## Buffer Module: 
Is a delay line shift register to limit the filter kernel from reading the
same pixel value multiple times from an external memory.
## Kernel Module: 
Start the process of multiplication by sobel filter after buffer flag is
triggered.
## Sqrt Module:
module used to square root the values of Sobel edge detection to get the
average value of the used in the threshold
## Threshold(average):
used to detect the edges using a dynamic threshold.
