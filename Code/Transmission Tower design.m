clc
fprintf('                Air Clearance and tower calculation\n            ')
fprintf('\n');
fprintf('\n');
V=input('Enter the System Voltage  = ');
SW = input('Enter the swing angle  = ');
W=angle(SW);
SH = input('Enter the shield angle  = ');
H=angle(SH);
a = ((( V * 0.898146239) + 30))/100;
l = a * sec(W);
b = 1.5 * a;
CL = a(1+ (tan(W)));
d = sqrt(3)*(CL + (b/2));
e = 0.1089 *((l+a)/2*a)^2 ;
y = (l+a)/(sqrt(1-e));
fprintf(' Air Clearnce  =  %f m\n',a);
fprintf(' String length =  %f m\n',l);
fprintf(' Tower width  =  %f m\n',b);
fprintf(' Cross-arm length =  %f m\n',CL);
fprintf(' Earth-Conductor =  %f m\n',d);
fprintf(' Conductor-Conductor =  %f m\n',y);