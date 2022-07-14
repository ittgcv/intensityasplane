function vector=vnormal(c)
  modulo=((c(1)^2+c(2)^2+c(3)^2)^.5);
  vector=[0,0,0];
  if modulo>0
    vector=[c(2)/modulo,c(3)/modulo,1/modulo];
  end
  