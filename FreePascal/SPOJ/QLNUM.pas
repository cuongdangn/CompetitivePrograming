const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
procedure       doc;
begin
        readln(f,n,k);
        d[0,0]:=1;
        for i:=1 to n do
         for j:=1 to k*n do
          begin
           d[i,j]:=0;
           for t:=0 to 9 do
           if j>=t then
            d[i,j]:=d[i,j]+d[i-1,j-t]
          end;
        for i:=1 to n do
          begin
           for j:=1 to i do
            for t:=1 to k*i do
             kq:=kq+d[j,