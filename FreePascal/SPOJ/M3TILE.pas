var     f       :       array[0..30] of int64;
        i,j     :       longint;
begin
        f[0]:=1;
        f[1]:=0;
        f[2]:=3;
        for i:=3 to 30 do if Odd(i) then f[i]:=0
        else f[i]:=4*f[i-2]-f[i-4];
        readln(j);
        while j<>-1 do
        begin
                  writeln(f[j]);
                  readln(j);
        end;
end.