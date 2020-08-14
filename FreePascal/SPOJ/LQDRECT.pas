const   finp    =       '';
        fout    =       '';
var     g,f:    text;
        n,m     :       longint;
        a       :       array[0..1001,0..301] of byte;
        kq      :       int64;
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
var     i,j     :       longint;
begin
        readln(f,m,n);
        for i:=1 to m do
                begin
                 for j:=1 to n do read(f,a[i,j]);
                 readln(f);
                end;
end;
procedure       xuly;
var     i,j,k   :       longint;
        t       :       int64;
begin
        for i:=1 to n-1 do
          for j:=i+1 to n do
                begin
                t:=0;
                 for k:=1 to m do
                  if (a[k,i]=a[k,j])and(a[k,i]=1) then
                        inc(t);
                  kq:=kq+t*(t-1) div 2;
                 end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.