# FFT-IP

The Fast Fourier Transform (FFT) is a fundamental building block used in DSP
systems, with applications ranging from OFDM based Digital MODEMs, to
Ultrasound, RADAR and CT Image reconstruction algorithms. It is a fast
algorithm to compute DFT as it reduces the calculation complexity from the
order of N2 in DFT to Nlog2N, where N is the number of sample points. The
Verilog implementation of FFT includes complex numbers addition and
multiplication due to twiddle factor.In this project,FPGA implementation of
maximum 1024-point DIT radix-2 FFT using fixed-point arithmetic has been
presented. The frequency resolution is also computed. The designed FFT can be
used in scientific computations.The DE0-Nano board is used to implement the design.

# Tools and Software Used
   Intel Quartus Prime Lite(for implementing the design in Altera IV FPGA Board)
            ,MATLAB(for verifying the results of FFT)

# FFT IP CORE 
The Quartus has an inbuilt FFT Core in IP Catalog. The FFT IP core is a high
performance, highly-parameterizable FFT processor. The FFT IP core
implements a complex FFT or inverse FFT (IFFT) for high-performance
applications. The length or size of FFT is chosen as 1024, data flow is chosen as
variable streaming that uses fixed point representation. The input data width is 12
bits. The output width of the FFT is 23 bits. The twiddle factor occupies 18 bits.
For more details about the IP core , refer https://cdrdv2-public.intel.com/667064/ug_fft-683374-667064.pdf

# Architecture
FFT WRAPPER - Top module which contains FFT IP CORE,FFT CONTROL BLOCK. 
FFT IP Core - For FFT Computation.
FFT Control Block - To generate necessary control signals for FFT IP.
ROM IP - To store the input data values.
Counter - To read the values sequentially from ROM at every clock edge from PLL.
PLL - To generate a up converted clock signal from the Cyclone IV board clock(PIN R5).
The schematic of the FFT Block is shown below.

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/ab484b11-655a-4db6-8c08-3de8b127141d)

The source file for all the blocks and simulation results are available in the respective folders.
