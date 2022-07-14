function  [hirshAng,  aminCen]= metodoHirshD(imnl, imnr, ws, k, i, j)

    L=imnl(i-ws:i+ws, j-ws:j+ws);
    R=imnr(i-ws:i+ws, k-ws:k+ws);
    [ac]=ab2v(L,R);
    
    L1=imnl(i-ws-ws:i, j-ws-ws:j);
    R1=imnr(i-ws-ws:i, k-ws-ws:k);
     [aul]=ab2v(L1,R1);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
           
    L2=imnl(i-ws-ws:i, j:j+ws+ws);
    R2=imnr(i-ws-ws:i, k:k+ws+ws);
     [adl]=ab2v(L2,R2);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
           
    L3=imnl(i:i+ws+ws, j-ws-ws:j);
    R3=imnr(i:i+ws+ws, k-ws-ws:k);
     [aur]=ab2v(L3,R3);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
            
    L4=imnl(i:i+ws+ws, j:j+ws+ws);
    R4=imnr(i:i+ws+ws, k:k+ws+ws);
   [adr]=ab2v(L4,R4);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
   

   mya(1,1)=ac;
   mya(1,2)=aul;
   mya(1,3)=adl;
   mya(1,4)=aur;
   mya(1,5)=adr;
   
    [fina, indexa]=min(mya(1,:));
    hirshAng=ac+fina;
    mya(1,indexa)=10000000;
    [fina, indexa]=min(mya(1,:));
    hirshAng=hirshAng + fina;
    aminCen=ac;
  
end

