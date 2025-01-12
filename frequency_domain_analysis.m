%% Frequency domain reference signal (after padding)

[cnfg,scn] = my_read_cat_log("calibration_improve014.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

start_index = 157;
stop_index = 197;

window = zeros(size(data)); 
window(start_index:stop_index) = 1;
data_w = data.*window; 

NFFT = 2^nextpow2(NSamp); % Next power of 2 for FFT
% Zero-padding to improve FFT resolution
data_padded = [data_w, zeros(1, NFFT - length(data))]; 


% Apply FFT
fft_result = fft(data_padded, NFFT);
freq_axis = fs * (0:(NFFT/2)) / NFFT;
fft_magnitude_1 = abs(fft_result(1:NFFT/2+1)); 
fft_magnitude_db = 20 * log10(fft_magnitude_1);

% Plot in frequency domain
figure;
plot(freq_axis, fft_magnitude_db);
grid on;
title('Reference (Padded) Signal');
xlabel('Frequency (GHz)');
ylabel('Magnitude (dB)');
xlim([3 5]); % Set frequency range to 3-5 GHz
ylim([80 110])

%% Multipath - first scenario

[cnfg,scn] = my_read_cat_log("2.32_multipath_scenario_1_with ipads022.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

start_index = 157;
stop_index = 275;

window = zeros(size(data)); 
window(start_index:stop_index) = 1;
data_w = data.*window; 

figure;
plot(t_ns,data_w);
grid on;
title('Multipath first After Padding');
xlabel('Time (ns)');
ylabel('Linear Magnitude');

NSamp = scn(1,1).NumSmpls;
data_w = data_w(1:NSamp);
NFFT = 2^nextpow2(NSamp); % Next power of 2 for FFT
% Zero-padding to improve FFT resolution
data_padded = [data_w, zeros(1, NFFT - length(data))]; 

% Apply FFT
fft_result = fft(data_padded, NFFT);
freq_axis = fs * (0:(NFFT/2)) / NFFT;
fft_magnitude_2 = abs(fft_result(1:NFFT/2+1)); 
fft_magnitude_db = 20 * log10(fft_magnitude_2);

% Plot in frequency domain
figure;
plot(freq_axis, fft_magnitude_db);
grid on;
title('First Multipath Scenario in Frequency Domain (dB)');
xlabel('Frequency (GHz)');
ylabel('Magnitude (dB)');
xlim([3 5]); % Set frequency range to 3-5 GHz
ylim([80 115])


%% Normalize the first scenario with respect to the reference signal

normalized_magnitude = fft_magnitude_2 ./ fft_magnitude_1;
normalized_magnitude_db = 20 * log10(normalized_magnitude);

figure;
plot(freq_axis, normalized_magnitude_db);
grid on;
title('Frequency Transfer Function (First scenario)');
xlabel('Frequency (GHz)');
ylabel('Normalized Magnitude (dB)');
xlim([3 5]); 






