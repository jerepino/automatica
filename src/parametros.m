%% Par?metros (valores nominales medidos, tolerancia error +/- 1%; salvo aclaraci?n espec?fica) %%
r = 314.3008; %%Relaci?n de reducci?n total
%Tm=1.2; %%Torque electromagn?tico [N.m]
%Tl=1.57; %%Torque de carga [N.m]
Jm = 3.1e-6; %%Momento de inercia (motor y caja)[kg.m^2]
bm = 1.5e-5; %%Coef. de fricci?n viscosa (motor y caja) [N.m.s/rad]
Lq = 5.8e-3; %%Inductancia de estator (eje en cuadratura) [H]
Ld = 6.6e-3; %%Inductancia de estator (eje directo) [H]
Lls = 0.8e-3; %%Inductancia de dispersi?n de estator [H]
Rs = 1.02; %%Resistencia de estator, por fase [omh]
Cts = 1.091; %%Capacitancia t?rmica de estator [W/(?C/s)]
Rs_amb = 55; %%Resistencia t?rmica estator-ambiente [?C/W]
Pp = 3; %%Pares de Polos magn?ticos
lambda_m = 0.01546; %%Flujo magn?tico equivalente de imanes concatenado por espiras del bobinado de estator [Wb o V.s/rad]
Jl = 0.2520+0.1260; %%Momento de inercia [kg.m^2]
bl = 0+0.0630; %%Amortiguamiento viscoso [N.m.s/rad]

Jeq = (Jm+Jl/r^2);  %% [kgm.m^2]
beq = (bm+bl/r^2);  %% [N.m.s/rad]

% Ganancias proporcionales modulador de torque
Rp_q = 5000*Lq ; %% [ohm]
Rp_d = 5000*Ld ; %% [ohm]
Tau = Lq/Rp_q;

% Constantes del observador
Kw = 1.0223e7; %% [rad/s^2]
K_tita = 6397.3; %% [rad/s]

% Ganancias PID medotodo sintonia serie
n = 2.5;
wpos = 800; %% [rad/s]

ba = Jeq*n*wpos; %% [N.m/(rad/s)]
Ksa = Jeq*n*wpos^2; %% [N.m/rad]
Ksia = Jeq*wpos^3; %% [N.m/(rad.s)]

% Nuevas constantes del observador
k_tita_n = 9600-beq/Jeq;
kw_n = (30720000-k_tita_n*beq/Jeq)/2;
ki_n = Jeq*3.2768e10;