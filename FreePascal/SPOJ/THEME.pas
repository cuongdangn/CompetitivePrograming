uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a      :       array[0..5000] of longint;
        d       :       array[0..5000,0..5000] of longint;
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
        for i:=1 to n do read(f,a[i]);
end;
procedure       QHD;
var     i,j,kq,u,v   :       longint;
begin
        kq:=-1;
        for i:=1 to n do
                begin
                for j:=i+1 to n do
                 if (a[i+1]-a[i])=(a[j+1]-a[j]) then
                                begin
                                d[i,j]:=d[i-1,j-1]+1;
                                 if d[i,j]>j-i-1 then d[i,j]:=j-i-1
                 else if d[i,j]>i+1 then d[i,j]:=i+1;
                        kq:=max(kq,d[i,j]);
                                end
                 else d[i,j]:=0;
                 end;

            if kq<4 then write(0) else  write(kq+1);
end;
begin
        mo;
        doc;
        if n < 10 then writeln(g,0) else
        QHD;
        dong;
end.


