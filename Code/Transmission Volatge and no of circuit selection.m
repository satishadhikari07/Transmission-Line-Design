
fprintf('Design of Economical Volatge of Transmission line\n');
fprintf('\n');
L=input('Enter the length of the Transmisiion line in KM = ');
P=input('Enter the Transmisiion Power in MW = ');
N=input('Enter the No. of Circuit i.e 1 or 2 = ');
PF=input('Enter the Power factor = ');
fprintf('\n');
Veco=(5.5*((L/1.6)+((P*1000)/(PF*N*150)))^(1/2));
fprintf('The economical voltage is Veco =  %f KV\n',Veco);
fprintf('Choose the nearest standard Voltage level among them : 11KV 33KV 66KV 132KV 220KV 400KV\n');
V=input('Enter the Value of the Nearest Standard Voltage in KV=');
 MFlimit=input('Enter the mflimit of the length of the Transmission line from the standard table =');
  if (N==1)
      Zc = 400;
      SIL = (((V)^2)/Zc);
      mfS = (P/SIL);
      fprintf('The mf for Single circuit is %f \n',mfS);
         if (mfS<MFlimit)
            fprintf('The Technical Criteria is fulfilled for Single Circuit\n');
               Nc = 1;
         else
             fprintf('The Technical Criteria is  not fulfilled for Single Circuit\n');
         end
  end
  
      if (N==2)
      Zc = 200;
      SIL = (((V)^2)/Zc);
      mfD = (P/SIL);
      fprintf('The mf for Double circuit is %f \n',mfD);
  if (mfD<MFlimit)
      fprintf('The Technical Criteria is fulfilled for Double Circuit\n');
      Nc = 2;
  else
      fprintf('The Technical Criteria is  not fulfilled for Double Circuit\n');
  end
      end
      
      
      
      
      
      
      
      
  
      
        
           
        
