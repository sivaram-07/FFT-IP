# FFT CONTROL BLOCK
The streaming FFT allows continuous processing of input data and
outputs a continuous complex data stream without the need to halt the data flow
in or out of the FFT IP core.The data source asserts sink_valid to indicate to the
FFT function that valid data is available for input.To generate sink_valid,sink_sop and sink_eop, 
we create a control_for_fft block.After some clock cycles,the IP core outputs source_sop and
source_eop,source_valid to denote about the result availability to downstream module.

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/753c5662-7df1-4ee9-be0f-8aa0fe858b36)

# FFT WRAPPER
We instantiate the FFT IP Core and control_for_fft blocks in a single block
‘fft_wrapper’

# ROM
A 2kb-ROM is available in the DE0 Nano Board.To store and access values in this ROM we used ROM IP 
available in the IP Catalog.This ROM has 10 address lines, 12 bits for output and 1024 words. The 1024
words are entered in a .mif (Memory Initialization File). These values which are
sine values are generated in MATLAB.(The matlab code is also provided).Here the values are shifted up by 1 and 
scaled by 1000 to avoid negative values and floating point numbers. In the .mif file we have 
the 1024 values stored as hexadecimal.

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/1a112927-afdf-4b98-8467-520d8c28c168)


# COUNTER
The 10 address lines input to ROM is given using a 10-bit counter.
