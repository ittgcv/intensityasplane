function  [hirshAng,  aminCen]= metodoHirshI(imnl, imnr, ws, k, i, j)
    R=imnr(i-ws:i+ws, j-ws:j+ws);
    L=imnl(i-ws:i+ws, k-ws:k+ws);
     [ac]=ab2v(R,L);
     
    R1=imnr(i-ws-ws:i, j-ws-ws:j);
    L1=imnl(i-ws-ws:i, k-ws-ws:k);
     [aul]=ab2v(R1,L1);
     
    R2=imnr(i-ws-ws:i, j:j+ws+ws);
    L2=imnl(i-ws-ws:i, k:k+ws+ws);
    [adl]=ab2v(R2,L2);
    
    R3=imnr(i:i+ws+ws, j-ws-ws:j);
    L3=imnl(i:i+ws+ws, k-ws-ws:k);
     [aur]=ab2v(R3,L3); 
     
    R4=imnr(i:i+ws+ws, j:j+ws+ws);
    L4=imnl(i:i+ws+ws, k:k+ws+ws);
    [adr]=ab2v(R4,L4);


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

