ws=2
      valor=-ws;
      cuenta=1;
      for l=1:(2*ws+1)
        valpos=-ws
        for m=1:(2*ws+1)
          posr(cuenta)=valor;
          pos(cuenta)=valpos;
          cuenta=cuenta+1;
          valpos=valpos+1;
        endfor
        valor=valor+1
      endfor
posr
pos
