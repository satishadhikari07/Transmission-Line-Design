clc
fprintf('          Sag and Tension calculation\n       ');
Dia=input('Enter the Diameter of the conductor in mm = ');
Wc=input('Enter the Weight of the Conductor in Kg/Km = ');
t=0.01;    %thickness of the ice in meters
Wp=100;   %wind pressure kg/m2
rho=950;   %density of ice
Wi=(pi*t*((Dia/1000)+t)*rho)*1000; % Multilplied by 1000 for Converting into Kg/Km
Ww=(Wp*(Dia/1000)*(2/3))*1000; 
W1=sqrt((Wi+Wc)^2 + (Ww)^2);
fprintf('The Weight to due to wind (Ww) per km = %f Kg/Km\n',Ww);
fprintf('The Weight to due to ice  (Wi) per km = %f Kg/Km\n',Wi);
fprintf('The Weight at the Toughest condition (W1) = %f Kg/Km\n',W1);
fprintf('\n');
fprintf('Calculation of T1\n ');
UTS= input('Enter the Ultimate  Tensile Strength in Kg  = '); 
T1=UTS/2;
fprintf('The value of T1 is = %f Kg\n',T1);
fprintf('\n');
fprintf('Calculation for T2\n ');
alpha=17.73*10^-6;
A=input('Enter the area of the Conductor in mm square= '); %area of the Conduxtor
e=input('Enter the Modulus of elasticity in kg/cm2 = ');
for i=1:5
    if (i==1)
        fprintf('For 250m Span\n')
        fprintf('\n')
l=0.250;
K1= -T1+((alpha*27)+((W1*W1*l*l)/(24*T1*T1)))*(A*e*10^-2);
fprintf('The value of k1 is = %f \n',K1);
K2 = ((Wc*Wc*l*l)*(A*e*10^-2))/24;
fprintf('The value of k2 is = %f \n',K2);
fprintf('Calculation for T3\n ');
syms M2
x = solve(M2^3 + K1*(M2^2)-K2==0,M2);% T2=M2
fprintf('Value = %f KG\n',x);
T2=input('Enter the  positive value of T2 from the calculation= ');
K1_= -T2+((alpha*38)+((W1*W1*l*l)/(24*T2*T2)))*(A*e*10^-2);
fprintf('The value of k1_ is = %f \n',K1_);
K2_=K2;
fprintf('The value of k2_ is = %f \n',K2_);
syms M3
y = solve(M3^3 + K1_*(M3^2)-K2_==0,M3);%T3=M3
fprintf('Value = %f KG\n',y);
 fprintf('\n')
    end
if (i==2)
        fprintf('For 275m Span\n')
         fprintf('\n')
l=0.275;
K1= -T1+((alpha*27)+((W1*W1*l*l)/(24*T1*T1)))*(A*e*10^-2);
fprintf('The value of k1 is = %f \n',K1);
K2 = ((Wc*Wc*l*l)*(A*e*10^-2))/24;
fprintf('The value of k2 is = %f \n',K2);
fprintf('Calculation for T3\n ');
syms M2
x = solve(M2^3 + K1*(M2^2)-K2==0,M2);% T2=M2
fprintf('Value = %f KG\n',x);
T2=input('Enter the  positive value of T2 from the calculation= ');
K1_= -T2+((alpha*38)+((W1*W1*l*l)/(24*T2*T2)))*(A*e*10^-2);
fprintf('The value of k1_ is = %f \n',K1_);
K2_=K2;
fprintf('The value of k2_ is = %f \n',K2_);
syms M3
y = solve(M3^3 + K1_*(M3^2)-K2_==0,M3);%T3=M3
fprintf('Value = %f KG\n',y);
 fprintf('\n')
end
if (i==3)
        fprintf('For 300m Span\n')
         fprintf('\n')
l=0.300;
K1= -T1+((alpha*27)+((W1*W1*l*l)/(24*T1*T1)))*(A*e*10^-2);
fprintf('The value of k1 is = %f \n',K1);
K2 = ((Wc*Wc*l*l)*(A*e*10^-2))/24;
fprintf('The value of k2 is = %f \n',K2);
fprintf('Calculation for T3\n ');
syms M2
x = solve(M2^3 + K1*(M2^2)-K2==0,M2);% T2=M2
fprintf('Value = %f KG\n',x);
T2=input('Enter the  positive value of T2 from the calculation= ');
K1_= -T2+((alpha*38)+((W1*W1*l*l)/(24*T2*T2)))*(A*e*10^-2);
fprintf('The value of k1_ is = %f \n',K1_);
K2_=K2;
fprintf('The value of k2_ is = %f \n',K2_);
syms M3
y = solve(M3^3 + K1_*(M3^2)-K2_==0,M3);%T3=M3
fprintf('Value = %f KG\n',y);
 fprintf('\n')
    end
if (i==4)
        fprintf('For 325m Span\n')
         fprintf('\n')
l=0.325;
K1= -T1+((alpha*27)+((W1*W1*l*l)/(24*T1*T1)))*(A*e*10^-2);
fprintf('The value of k1 is = %f \n',K1);
K2 = ((Wc*Wc*l*l)*(A*e*10^-2))/24;
fprintf('The value of k2 is = %f \n',K2);
fprintf('Calculation for T3\n ');
syms M2
x = solve(M2^3 + K1*(M2^2)-K2==0,M2);% T2=M2
fprintf('Value = %f KG\n',x);
T2=input('Enter the  positive value of T2 from the calculation= ');
K1_= -T2+((alpha*38)+((W1*W1*l*l)/(24*T2*T2)))*(A*e*10^-2);
fprintf('The value of k1_ is = %f \n',K1_);
K2_=K2;
fprintf('The value of k2_ is = %f \n',K2_);
syms M3
y = solve(M3^3 + K1_*(M3^2)-K2_==0,M3);%T3=M3
fprintf('Value = %f KG\n',y);
 fprintf('\n')
    end    
if (i==5)
        fprintf('For 350m Span\n')
         fprintf('\n')
l=0.350;
K1= -T1+((alpha*27)+((W1*W1*l*l)/(24*T1*T1)))*(A*e*10^-2);
fprintf('The value of k1 is = %f \n',K1);
K2 = ((Wc*Wc*l*l)*(A*e*10^-2))/24;
fprintf('The value of k2 is = %f \n',K2);
fprintf('Calculation for T3\n ');
syms M2
x = solve(M2^3 + K1*(M2^2)-K2==0,M2);% T2=M2
fprintf('Value = %f KG\n',x);
T2=input('Enter the  positive value of T2 from the calculation= ');
K1_= -T2+((alpha*38)+((W1*W1*l*l)/(24*T2*T2)))*(A*e*10^-2);
fprintf('The value of k1_ is = %f \n',K1_);
K2_=K2;
fprintf('The value of k2_ is = %f \n',K2_);
syms M3
y = solve(M3^3 + K1_*(M3^2)-K2_==0,M3);%T3=M3
fprintf('Value = %f KG\n',y);
    end
end

