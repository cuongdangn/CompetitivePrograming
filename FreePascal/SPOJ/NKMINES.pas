const   finp    =       '';
        fout    =       '';
var     g,f     :      text;
        b,a       :      array[1..200,1..200] of longint;
        n,m       :      longint;

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
var i,j:longint;
begin
        readln(f,m,n);
        for i:=1 to m do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       duyet(t,h,c:longint);
var     i,j     :       longint;
begin
