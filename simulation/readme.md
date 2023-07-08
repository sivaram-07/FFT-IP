# RESULTS
The SignalTap Logic Analyzer Editor
allows us to debug the design in real-time and at high-speed while performing an
analysis in the Quartus software.Using Signal Tap logic Analyzer, the outputs from the respective data output
blocks can be captured and analysed.
The output as viewed from the signal tap analyser is given below\

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/efb71ea4-ba6a-47d2-bc5f-90d55a6c1f5b)

The diagrams below indicate the enabled sink_sop. This activation of sink_sop
signifies the incoming data packets(i.e)the input signal.

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/44e60db6-e956-47f8-8de5-7fe53dbdadf6)

The activation of the source_sop is shown below. This indicates the start of FFT
points being displayed (both real and imaginary values).

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/3d28373c-1757-4cae-a800-200e82e98270)

The FFT points from the signal tap output (the real and imaginary values) are
exported and using MATLAB, the IFFT of the output points are found and the
result is plotted. The Matlab code used for reconstruction is as follows:

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/f4092f55-9797-450d-9546-30f78bb9e0a8)

The input sine wave whose Fast Fourier Transform was realized using Quartus is
approximately reconstructed at the output side using the Inverse Fast Fourier
Transform.To verify the results,we need to find the resolution(bin size of FFT)from the reconstructed sine wave's frequency domain plot.

![image](https://github.com/sivaram-07/FFT-IP/assets/114935240/97109e21-5b27-49c5-b1a8-826da390af6d)

Frequency Resolution(Theoretical) = Sampling rate/FFT Size
                                  = 200MHz/1024
= 195312.5Hz
Frequency Resolution(Practical) From the Frequency plot = 195312 Hz
