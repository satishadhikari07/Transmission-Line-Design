%Group = Diwakar Khadka  
%      = Satish Adhikari
%      = Ayush Pathak
%      = sandip Marasaini

%Finding current for conductor selection
clc 
clear all 
PowerT = input('Enter the power to transmitted(MW):');
VoltageT = input('Enter the transmission voltage(KV):');
LengthT = input('Enter the transmission distance(Km):');
powerfactor = input('Enter the powerfactor: ');
powerfactordeg = acosd(powerfactor);
I= PowerT*10^3/(sqrt(3)*VoltageT*0.95);
m=['Current Flowing in transmission line is: ',num2str(I), ' A'];
disp(m);

%Collecting the conductor data
%Calculating effeciency of conductor
eff = 93;
while eff < 94
Con = input('Enter conductor name: ','s');
res = input('Enter the resistance of conductor at 20 deg.c (ohm/km): ');
al = input('Enter the number of alumunium on strands: ');
stl = input('Enter the number of steel on strands: ');
diam = input('Enter overall diameter of conductor (mm): ');
fprintf('Conductor = %s\n',Con);
fprintf('Resistance at 20(ohm/km) = %d\n',res);
fprintf('Number of alumunium = %d\n',al);
fprintf('Number of steel = %d\n',stl);
fprintf('Overall diameter(mm) = %d\n',diam);
    rcalc = res*1.18
    ptl = 3*I^2*rcalc*LengthT;
    ptlmw= ptl/10^6;
    eff=(1-ptlmw/PowerT)*100;
    fprintf('Effeciency is = %.2f\n',eff);
    if eff >= 94
        fprintf('Conductor is selected %s\n',Con);
    else
        fprintf('Conductor is rejected %s\n',Con);
    end
end
gmr = input('Enter the value of GMR according to number of strands:  ');
GMRL = gmr*(diam/2);
GMRC = (diam/2);
L = (2*(10^-7))*reallog((6.91*1000)/GMRL)
C = ((2*3.14*8.85*(10^-12))/reallog(6.91*1000/GMRC))*(10^9)
fprintf('Inductance is (H/m) = %d\n',L);
fprintf('Capacitance is (uf/km) = %d\n',C);

%Calculating A,B,C,D factor
Z = ((rcalc + (2*3.14*50*L*(10^3))*j))*LengthT
fprintf('\nTotal impedance is:');
fprintf('%f + %fi',real(Z),imag(Z));
Y = (2*3.14*50*C*(10^-6)*LengthT)*j
fprintf('\nTotal admittance is:');
fprintf('%f + %fi',real(Y),imag(Y));

%Calcultaing A
A = 1+((Y*Z)/2);
fprintf('\n Value of A(Rectangular form) : ');
fprintf('%f + %fi',real(A),imag(A));
[Atheta,Arho]=cart2pol(real(A),imag(A));
Adeg= Atheta*57.2958;%converting radian into degree
fprintf('\n Value of A(Polar form) : ');
fprintf('%f∠%f',Arho,Adeg);

%Calculating B
B = Z;
fprintf('\n Value of B(Rectangular form) : ');
fprintf('%f + %fi',real(B),imag(B));
[Btheta,Brho]=cart2pol(real(B),imag(B));
Bdeg= Btheta*57.2958;%converting radian into degree
fprintf('\n Value of B(Polar form) : ');
fprintf('%f∠%f\n',Brho,Bdeg);

%Calculating C
C1 = Y*(1+((Y*Z)/4));
fprintf('\n Value of C(Rectangular form) : ');
fprintf('%f + %fi',real(C1),imag(C1));
[Ctheta,Crho]=cart2pol(real(C1),imag(C1));
Cdeg= Ctheta*57.2958;%converting radian into degree
fprintf('\n Value of C(Polar form) : ');
fprintf('%f∠%f\n',Crho,Cdeg);

%calculating D=A
A = 1+((Y*Z)/2);
fprintf('\n Value of D(Rectangular form) : ');
fprintf('%f + %fi',real(A),imag(A));
[Atheta,Arho]=cart2pol(real(A),imag(A));
Adeg= Atheta*57.2958;%converting radian into degree
fprintf('\n Value of D(Polar form) : ');
fprintf('%f∠%f\n',Arho,Adeg);

%Calculating receiving end voltage
Vr = (VoltageT*(10^3))/sqrt(3);
fprintf('Receiving end Voltage is  = %f\n',Vr);
fprintf('Receiving end current is  = %f∠%f\n',I,powerfactor);

%writing I,A,B,C,D into rectangular for easy multiplication in matlab
Ir=I*exp(deg2rad(-powerfactordeg)*i);
%Calculating Vs
Vs = A*Vr + B*Ir ; % rectangular Vs
fprintf('\n Value of Vs(Rectangular form) : ');
fprintf('%f + %fi',real(Vs),imag(Vs));
[Vstheta,Vsrho]=cart2pol(real(Vs),imag(Vs));
Vsdeg= Vstheta*57.2958;%converting radian into degree
fprintf('\n Value of Vs(Polar form) : ');
fprintf('%f∠%f\n',Vsrho,Vsdeg);

%Calculating Is
Is = C*Vr + A*Ir; %rectangular Is
fprintf('\n Value of Is(Rectangular form) : ');
fprintf('%f + %fi',real(Is),imag(Is));
[Istheta,Isrho]=cart2pol(real(Is),imag(Is));
Isdeg= Istheta*57.2958;%converting radian into degree
fprintf('\n Value of Is(Polar form) : ');
fprintf('%f∠%f\n',Isrho,Isdeg);

%Calculating Voltage regulation
Vreg= ((real(Vs)/real(A))-(Vr))/(Vr);
VregPer = Vreg*100;
fprintf('Voltage Regulation = %f\n',VregPer);

%Calculating corona inception Voltage
Vcor = sqrt(3)*21.21*(GMRC/10)*0.9*0.9*reallog((6.91*1000)/GMRC);
fprintf('Corona inception voltage(KV) = %f\n',Vcor);





























    
