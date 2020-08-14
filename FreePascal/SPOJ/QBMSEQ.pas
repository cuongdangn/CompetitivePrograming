var tmax, tmin, rmax, rmin, s: int64;
    i, n, tmp, t1: longint;

function max(a, b, k: int64): int64;
  begin
       if a*k > b*k then exit(a) else exit(b);
  end;

begin
     readln(n);
     read(tmax);
     tmin:= tmax;   t1:= tmax;
     rmin:= tmax;   rmax:= tmax;
     s:= tmax;

     for i:= 2 to n do
        begin
             read(tmp);
             s:= s + tmp;
             tmax:= max(tmp, tmax + tmp, 1);
             tmin:= max(tmp, tmin + tmp, -1);
             if rmax < tmax then rmax:= tmax;
             if rmin > tmin then rmin:= tmin;
        end;
     if rmax = s then rmax:= max(rmax - tmp, rmax - t1, 1);
     if rmin = s then rmin:= max(rmin - tmp, rmin - t1, -1);
     if rmax > s - rmin then write(rmax) else write(s - rmin);
end.
