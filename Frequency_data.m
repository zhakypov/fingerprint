clc
close all
clear 

Data_Pos = load('Pos_freq_new.mat');

t1 = Data_Pos.Pos_freq_new(:,1)- Data_Pos.Pos_freq_new(1,1);
x1 = Data_Pos.Pos_freq_new(:,2)- Data_Pos.Pos_freq_new(1,2); 
y1 = Data_Pos.Pos_freq_new(:,3)+ Data_Pos.Pos_freq_new(1,3) + 0.5 ; % Off-set to zero
z1 = Data_Pos.Pos_freq_new(:,4) - Data_Pos.Pos_freq_new(499,4); 
rz1 = Data_Pos.Pos_freq_new(:,7) - Data_Pos.Pos_freq_new(1,7);

freq = [1, 2, 4, 8, 16, 32, 64]; 
x_p = [3.13, 3.18, 3.16, 3.01, 2.15 0.94, 0.21];
x_p_max = x_p(1);
x_norm = x_p/x_p_max;
x_mag = 20*log(x_norm);

y_p = [1.81, 1.82, 1.81, 1.75, 1.47, 0.79, 0.49];
y_p_max = y_p(1);
y_norm = y_p/y_p_max;
y_mag = 20*log(y_norm);

z_p = [3.95, 3.94, 3.97, 3.67, 3.27, 2.04, 0.76];
z_p_max = z_p(1);
z_norm = z_p/z_p_max;
z_mag = 20*log(z_norm);

rz_p = [0.3, 0.29, 0.27, 0.24, 0.18, 0.05, 0.01];
rz_p_max = rz_p(1);
rz_norm = rz_p/rz_p_max;
rz_mag = 20*log(rz_norm);


% figure
% plot(freq, x_mag,'r'), hold on
% plot(freq,y_mag,'*'), hold on
% plot(freq, z_mag,'-'), hold on
% plot(freq,rz_mag, '^')


figure
plot(freq,x_mag, 'b -*','linewidth',2); hold on
plot(freq,y_mag, 'r -o','linewidth',2); hold on
plot(freq,z_mag, '-^','color',[0.05,0.47,0.05], 'linewidth',2); hold on
plot(freq,rz_mag, '-x', 'color',[0.72,0.27,1.00], 'linewidth',2); hold on
set(gca, 'XScale', 'log')
xlabel('Frequency (Hz)','FontName', 'Arial', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Magnitude (dB)','FontName', 'Arial', 'FontSize', 12, 'FontWeight', 'bold');
legend({'X-axis','Y-axis','Z-axis', 'Z-axis twist'}, 'FontName', 'Arial', 'FontSize', 10, 'Location','southwest');
ax=gca;
ax.LineWidth = 1.5;
ax.FontName = 'Arial';
ax.FontSize = 12;
ax.FontWeight = 'bold';
ax.Units = 'normalized';
grid on
pbaspect([1.5 1 1])
% xlim([0 1000])
ylim([-80 10])
% yticks([0])