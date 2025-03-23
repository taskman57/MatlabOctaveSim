clc;
% From old filter implementation
oldtaps=[-4 19 25 39 59 85 118 158 205 261 324 395 473 558 647 741 837 933 1028 1119 1204 1282 1350 1407 1451 1481 1496 1496 1481 1451 1407 1350 1282 1204 1119 1028 933 837 741 647 558 473 395 324 261 205 158 118 85 59 39 25 19 -4];
k= [28 12 -24 -116 -284 -552 -928 -1404 -1944 -2476 -2888 -3036 -2732 -1784 0 2784 6676 11700 17780 24724 32248 39952 47396 54096 59596 63504 65536 65536 63504 59596 54096 47396 39952 32248 24724 17780 11700 6676 2784 0 -1784 -2732 -3036 -2888 -2476 -1944 -1404 -928 -552 -284 -116 -24 12 28];
inp=[
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19
0xFFF8
0xFD19
0xF4DC
0xE857
0xD92E
0xC957
0xBAD3
0xAF6C
0xA86C
0xA675
0xA96C
0xB075
0xBA1D
0xC485
0xCDAC
0xD3B6
0xD52F
0xD13E
0xC7C8
0xB972
0xA78C
0x93DE
0x8071
0x6F3F
0x61EF
0x599D
0x56AF
0x58CA
0x5EDF
0x6750
0x702E
0x777D
0x7B7F
0x7AED
0x752E
0x6A66
0x5B77
0x49DE
0x3781
0x2668
0x1878
0x0F2E
0x0B6A
0x0D4E
0x143D
0x1EF0
0x2BA4
0x3859
0x431B
0x4A48
0x4CCD
0x4A48
0x431B
0x3859
0x2BA4
0x1EF0
0x143D
0x0D4E
0x0B6A
0x0F2E
0x1878
0x2668
0x3781
0x49DE
0x5B77
0x6A66
0x752E
0x7AED
0x7B7F
0x777D
0x702E
0x6750
0x5EDF
0x58CA
0x56AF
0x599D
0x61EF
0x6F3F
0x8071
0x93DE
0xA78C
0xB972
0xC7C8
0xD13E
0xD52F
0xD3B6
0xCDAC
0xC485
0xBA1D
0xB075
0xA96C
0xA675
0xA86C
0xAF6C
0xBAD3
0xC957
0xD92E
0xE857
0xF4DC
0xFD19];

Fs = 100e6;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector
y = filter(oldtaps,1,inp) + 2*randn(size(t));     % Sinusoids plus noise
plot(Fs*t(1:100),y(1:100))
figure;
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
% len=size(t)
Y = fft(y, NFFT)/L;%len(2);
f = Fs/2*linspace(0,1,NFFT/2);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')