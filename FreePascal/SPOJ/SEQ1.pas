uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        d       :       array[0..301,0..301] of longint;
        a       :       array[1..300] of longint;
        n       :       longint;
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
var     i,k,j,kq       :longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);

        kq:=-1;
        for  k:=1 to n-1 do
                begin
                        fillchar(d,sizeof(d),0);
                        for i:=1 to k do
                                for j:=k+1 to n do
                                 if a[i]<a[j] then d[i,j]:=d[i-1,j-1]+1
                                 else d[i,j]:=max(d[i-1,j],d[i,j-1]);
                                 kq:=max(kq,d[k,n])
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
