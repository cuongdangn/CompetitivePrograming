const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        d       :       array[0..26,0..26] of int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
var     i,j,t,j1     :       longint;
begin
        d[1,1]:=1;
        for i:=2 to 25 do
         for j:=1 to i do
             d[i,j]:=d[i-1,j-1]+d[i-1,j]*j;
         readln(f,t);
         for i:=1 to t do
          begin
           readln(f,j,j1);
           writeln(g,d[j,j1]);
          end;
end;
begin
        mo;
        xuly;
        dong;
end.