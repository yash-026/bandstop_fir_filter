In this project, a FIR bandstop filter was designed and verified.
The following are the filter specifications used for this project-
Fs = 1000;             % Sampling frequency (Hz)
Fpass = 100;           % Passband frequency (Hz)
Fstop = 200;           % Stopband frequency (Hz)
Ap = 0.1;              % Passband ripple (dB)
Ast = 80;              % Stopband attenuation (dB)
These specifications can be varied according to the requirement.
I have used Hannning window for this but, any other window function can be used. I have also added a link for referring the different window functions available in MATLAB.
The following are the different observations obtained from this project-

![image](https://github.com/yash-026/bandstop_fir_filter/assets/128773892/0578c279-0af6-40b6-a27a-4fe65d971b75)

![image](https://github.com/yash-026/bandstop_fir_filter/assets/128773892/f38cf38a-1510-40be-ac2d-23c243aead09)

![image](https://github.com/yash-026/bandstop_fir_filter/assets/128773892/3a7c3557-002f-401b-95e4-f87a446740f4)
As it can be seen here, the 150Hz sine wave was stopped by the filter from the above frequency response. Thus, filter was successfully verified.

![image](https://github.com/yash-026/bandstop_fir_filter/assets/128773892/1b0dbae2-c792-41c1-98b3-ec3d4abc0e06)
