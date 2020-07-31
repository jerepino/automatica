%%Datos%%
Tq_max = 29.42; %%Torque máximo admisible en la caja reductora [N.m]
Tl_max = 1.57; %%Torque de carga [N.m]
r = 314.3008; %%Relacion de reduccion total
Jl = 0.2520+0.1260; %%Momento de inercia [kg.m^2]
bl = 0+0.0630; %%Amortiguamiento viscoso [N.m.s/rad]
Jm = 3.1e-6; %%Momento de inercia (motor y caja)[kg.m^2]
bm = 1.5e-5; %%Coef. de fricci?n viscosa (motor y caja) [N.m.s/rad]

Jeq = (Jm+Jl/r^2);  %% [kgm.m^2]
beq = (bm+bl/r^2);  %% [N.m.s/rad]

Td_max=(Tq_max-Tl_max)/r;
a_max=Td_max/Jeq; %aceleración máxima posible
a_max=a_max*0.70; % se escalala aceleración para no sobrepasar el torque máximo en la respuesta
p=[a_max -5*a_max 2*pi*r];

p_1_2=roots(p)  %%Con estas raíces obtenemos el tiempo de aceleración y el tiempo para iniciar el frenado.

w_max= a_max*p_1_2(2); %velocidad del motor
q_max = w_max/r %velocidad del brazo robotico
