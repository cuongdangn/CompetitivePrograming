const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m     :       int64;
        m1      :       longint;
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
        readln(f,n,m);
end;
procedure       xuly;
var
begin
        m1:=n div 2;
        m1:=m1 div 2;
        for i:=0 to cu[m1] do
         begin
          str(i,s);
          while length(s)<m1 do s:='0'+s;






