fn="/home/nautica/Documents/investigacion/images/borregos/b1.avi"
%fn = fullfile (tempdir(), "sombrero.mp4");
 if (! exist (fn, "file"))
   warning ("'%s' doesn't exist, running demo VideoWriter first...", fn);
   demo ("VideoWriter");
 endif
 x = VideoReader (fn);
 im = [];
 while (! isempty (img = readFrame (x)))
   if (isempty (im))
     im = image (img);
     axis off;
   else
     set (im, "cdata", img);
   endif
   drawnow
   pause (1/30);
 endwhile