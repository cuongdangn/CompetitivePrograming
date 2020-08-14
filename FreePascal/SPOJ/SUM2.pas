const   finp    =       'SUM2.INP';
        fout    =       'SUM2.OUT';
var     g,f     :       text;
        n,kq    :       int64;
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
procedure       tinh;
var     i,j,v   :       int64;
begin
        j:=0;
        kq:=0;
        while true do
         begin
          i:=j+1;
          v:=n div i;
          j:=n div v;
          kq:=kq+(j-i+1)*v;
          if v=1 then break;
         end;
         writeln(g,kq mod 1000000);
end;

procedure       doc;
var     i,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          readln(f,n);
          tinh;
         end;
end;
begin
        mo;
        doc;
        dong;
end.