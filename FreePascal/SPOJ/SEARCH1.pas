const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        b   :       array[1..100000] of byte;
        a,c,d       :     array[1..100000] of longint;
        n,m,k,kq,l,q,t   :       longint;
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
function        max(a,b:integer):integer;
begin
        if a>b then exit (a)
        else exit(b);
end;
procedure       doc;
var     i,j,dem       :       longint;
begin
        readln(f,n,m,k);
        dem:=0;
        q:=0;
        for i:=1 to n do
                begin
                        read(f,j);
                        a[j]:=a[j]+1;
                        d[j]:=-1;
                end;
        for i:=1 to m do
                begin
                        read(f,j);
                        if b[j]=0 then b[j]:=1;
                end;
        for i:=1 to k do
                begin
                        read(f,j);
                        if (b[j]=0) then
                        begin
                                inc(dem);
                                if a[j]>0 then
                                begin
                                        if d[j]<q then
                                                begin
                                                        d[j]:=i;
                                                        c[j]:=0;
                                                end;
                                        if c[j]<a[j] then
                                                begin
                                                        inc(t);
                                                        inc(c[j]);
                                                end;
                                end;
                        end;
                        if t=n then
                        begin
                                kq:=max(dem,kq);

                        end;
                        if b[j]=1 then
                                begin
                                        dem:=0;
                                        t:=0;
                                        q:=i;
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.


