function imdot=detecta_codorniz(impakalcolor,window_size)
  imdot=impakalcolor;
  [ren,col,component]=size(impakalcolor);
  for i=window_size*2:window_size:ren-window_size*3
    for j=window_size*3:window_size:(col-window_size*3)
      if impakalcolor(i,j,1)==255&&impakalcolor(i,j,2)==0&&impakalcolor(i,j,3)==0
      [i,j]
      color_pakal=[0,0,0];
      channel(:,:,1)=repmat(color_pakal(1),2*window_size+1,2*window_size+1);
      channel(:,:,2)=repmat(color_pakal(2),2*window_size+1,2*window_size+1);
      channel(:,:,3)=repmat(color_pakal(3),2*window_size+1,2*window_size+1);
      imdot(i-window_size:i+window_size,j-window_size:j+window_size,:)=channel;
      color_pakal=[255,255,255];
      channel(:,:,1)=repmat(color_pakal(1),2*window_size+1,2*window_size+1);
      channel(:,:,2)=repmat(color_pakal(2),2*window_size+1,2*window_size+1);
      channel(:,:,3)=repmat(color_pakal(3),2*window_size+1,2*window_size+1);
      imdot(i+2*window_size:i+3*window_size+1,j-3*window_size:j-2*window_size+1,:)=channel;
      %imdot(i-ws:i+ws,j-ws:j+ws,:)=channel;
       % imdot(i-window_size:i+window_size,j-window_size:j+window_size,:)=[0,0,0];
        %imdot(i+2*ws,j-2*ws,:)=[255,255,255];
        if impakalcolor(i+2*window_size,j-2*window_size,:)==[0,0,255]
            ['identificacion codorniz',i,j]
        endif
      endif
    endfor
  endfor
