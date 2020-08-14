const   finp    =       '';
        fout    =       '';
var     g,f     :text;
        a       :       array[-201..200,-200..200] of longint;
        n       :       longint;
        d       :       array[1..4,1..4] of longint;
        kq      :int64;
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
var     i,j,i1,m       :       longint;
begin
        readln(f,n);
        for i1:=1 to n do
                begin
                        readln(f,i,j,m);
                        a[i,j]:=m;
                end;
end;
procedure       xuly;
var     i,j,i1,j1: longint;
begin
        for j1:=-200 to 199 do
        for j:=j1+1 to 200 do
                begin
                        fillchar(d,sizeof(d),0);
                    for i:=-200 to 200 do
                     if (a[i,j1]>0)and(a[i,j]>0) then
                     begin
                        inc(d[a[i,j1],a[i,j]]);
                        inc(d[a[i,j],a[i,j1]]);
                     end;
                     kq:=kq+d[1,2]*d[3,4]+d[1,3]*d[2,4]+d[1,4]*d[2,3];
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.