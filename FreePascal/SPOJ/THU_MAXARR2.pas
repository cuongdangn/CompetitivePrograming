var     i,dau,cuoi     :       int64;
        d       :array[1..10000000] of int64;
begin
        dau:=1;
        cuoi:=1;
        d[dau]:=1;
        while true do
         begin
          i:=d[dau];
          inc(dau);
          if i*2>2 then begin inc(cuoi);d[cuoi]:=i*2-1;writeln(d[cuoi]);end;
          if i*2>1000000000000000000 then break;
          if ((i+1) div 2) mod 2=1 then
          begin
           inc(cuoi);
           d[cuoi]:=i*2+1;
           writeln(d[cuoi]);
          end;

         end;

end.
