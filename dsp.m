% Define filter specifications
Fs = 1000;             % Sampling frequency (Hz)
Fpass = 100;           % Passband frequency (Hz)
Fstop = 200;           % Stopband frequency (Hz)
Ap = 0.1;              % Passband ripple (dB)
Ast = 80;              % Stopband attenuation (dB)

% Calculate normalized frequencies
Wpass = 2 * pi * Fpass / Fs;
Wstop = 2 * pi * Fstop / Fs;

% Estimate filter order using trial and error for FIR filter design
N = 100;

% Design the filter using fir1 function
% For list of windows check - https://in.mathworks.com/help/signal/ug/windows.html
h = fir1(N, [Fpass Fstop]/(Fs/2), 'stop', hann(N+1));

% Plot the magnitude response of the filter
figure;
subplot(2,1,1);
[h_mag, w] = freqz(h, 1, 1024, Fs);
plot(w, 20*log10(abs(h_mag)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response of the filter
subplot(2,1,2);
phase_resp = unwrap(angle(h_mag));
plot(w, phase_resp);
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Verify the filter by filtering a signal
t = 0:1/Fs:1;
x = sin(2*pi*50*t) + sin(2*pi*150*t) + sin(2*pi*250*t); % Input signal
y = filter(h, 1, x); % Output signal after filtering
[xw_mag w1] = freqz(x, 1, 1024, Fs);
[yw_mag w2] = freqz(y, 1, 1024, Fs);

% Plot the input and output signals
figure;
subplot(2,1,1);
plot(t, x);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, y);
title('Output Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the frequency response of input and output signals
figure;
subplot(2,1,1);
plot(w1, abs(xw_mag));
title('Frequency Response of Input Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(w2, abs(yw_mag));
title('Frequency Response of Output Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot the impulse response of the filter
figure;
stem(0:N, h);
title('Impulse Response Coefficients');
xlabel('Sample');
ylabel('Magnitude');
grid on;
