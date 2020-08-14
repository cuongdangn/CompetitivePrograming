const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a,b   :       array[1..100000] of byte;
        c       :     array[1..100000] of integer;
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
var     i,j,dem       :       integer;
begin
        readln(f,n,m,k);
        dem:=0;
        l:=0;
        for i:=1 to n do
                begin
                        read(f,j);
                        a[j]:=a[j]+1;
                        inc(l);
                end;
        readln(f);
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
                        if (c[j]<=q)and(a[j]>=0)and(a[j]=>c[j]) then
                                begin
                                        inc(t);
                                        c[j]:=c[j]+1;
                                end;
                        end;
                        if t=l then
                        begin
                                kq:=max(dem,kq);

                        end;
                        if b[j]=1 then
                                begin
                                        dem:=0;
                                        t:=0;
                                        q:=q+1;
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.


