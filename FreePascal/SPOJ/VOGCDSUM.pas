const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,t       :       longint;
        a       :       array[1..100000] of longint;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         read(f,a[i]);
end;
function        UCLN(u,v:int64):int64;
begin
        if v=0 then exit(u)
        else exit(UCLN(v,u mod v));
end;
procedure       xuly;
var     i,j       :       longint;
        kq      :       int64;
begin
        kq:=0;
        for i:=1 to n do
        begin
        t:=a[i];
        kq:=kq+t;
         for j:=i+1 to n do
          begin
           t:=ucln(t,a[j]);
           kq:=kq+t;
          end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
