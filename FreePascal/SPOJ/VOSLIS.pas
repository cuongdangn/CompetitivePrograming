uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m     :       longint;
        a,b   :       array[1..5005] of int64;
        d       :     array[1..5005] of int64;
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
var     i       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
        for i:=1 to m do read(f,b[i]);
end;
procedure       xuly;
var     i,j     :       longint;
        sa,tr   :       int64;
begin
        fillchar(d,sizeof(d),255);
        for i:=1 to n do
         begin
          sa:=0;
          for j:=1 to m do
           begin
            tr:=sa;
            if d[j]>=0 then sa:=max(sa,d[j]+abs(b[j]-a[i]));
            if b[j]=a[i] then d[j]:=max(d[j],tr);
           end;
          end;
          for j:=1 to m do
           kq:=max(kq,d[j]);
           writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
