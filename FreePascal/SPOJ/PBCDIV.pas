var     f :array[0..100,0..100] of double;
        t,i,j,a:longint;
begin

        fillchar(f,sizeof(f),0);
        for i:=1 to 25 do
        begin
        f[i,i]:=1;
        f[i,1]:=1;
        end;
        for i:=3 to 25 do
         for j:=2 to i-1 do
          begin
          f[i,j]:=f[i-1,j-1]+j*f[i-1,j];
          end;
         readln(t);
         for i:=1 to t do
         begin
                readln(a,j);
                writeln(f[a,j]:0:0);
         end;
end.
