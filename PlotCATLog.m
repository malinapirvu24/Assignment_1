%% Reference signal

[cnfg,scn] = my_read_cat_log("calibration_improve014.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
title('Reference Signal Before Padding');
xlabel('Time (ns)');
ylabel('Linear Magnitude');

%% Reference signal after padding

start_index = 140;
stop_index = 197;

window = zeros(size(data)); 
window(start_index:stop_index) = 1;
data_w = data.*window; 

figure;
plot(t_ns,data_w);
grid on;
title('Reference Signal After Padding');
xlabel('Time (ns)');
ylabel('Linear Magnitude');


%% LOS

[cnfg,scn] = my_read_cat_log("2.32_LOS_calibration_2016.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
title("LOS scenario");
xlabel('Time (ns)');
ylabel('Linear Magnitude');


%% NLOS absorbtion

[cnfg,scn] = my_read_cat_log("2.32_NLOS_absorbtion017.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
title("NLOS absorber material");
xlabel('Time (ns)');
ylabel('Linear Magnitude');

%% NLOS metal 

[cnfg,scn] = my_read_cat_log("2.32_NLOS_metal_57cm019.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
    title("NLOS metal plate");
xlabel('Time (ns)');
ylabel('Linear Magnitude');

%% Multipath scenario 1

[cnfg,scn] = my_read_cat_log("2.32_multipath_scenario_1_with ipads022.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
    title("First scenario of multipath propagation");
xlabel('Time (ns)');
ylabel('Linear Magnitude');


%% Multipath scenario 2

[cnfg,scn] = my_read_cat_log("2.32_multipath_scenario_2_with ipads023.csv");
data = [scn.scndata];

NSamp = scn(1,1).NumSmpls;
data = data(1:NSamp);

t_ns = linspace(cnfg.ScnStrt_ps,cnfg.ScnStp_ps,NSamp)/1000;
dt = (t_ns(end)-t_ns(1))/(NSamp-1);
fs = 1/dt;

figure;
plot(t_ns,data);
grid on;
    title("Second scenario of multipath propagation");
xlabel('Time (ns)');
ylabel('Linear Magnitude');




