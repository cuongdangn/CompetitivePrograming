var     f,p,i       :       longint;
        d      :       array[0..31] of int64;
begin
        for i:=1 to 31 do d[i]:=d[i-1]*2+1;
        readln(f,p);
        while (f<>0) and (p<>0) do
         begin
                if d[f] div 2 +1=p then writeln('D') else
                begin
                while (p mod 2= 0)and(p>2) do p:=p div 2;
                if (((p-1) div 2)mod 2= 0) then writeln('U')
                else writeln('D');
                end;
                readln(f,p);
         end;
end.
