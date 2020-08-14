const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        n,dem       :       longint;
        a       :       array[1..1000001] of char;
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
procedure       xuly;
var     i,j,x,nho,nho1       :       longint;
begin
        i:=1; j:=n;
                while a[i]='<' do inc(i);
                while a[j]='>' do dec(j);
                nho1:=-1; nho:=0;
                for x:=i to j do
                 begin
                        if a[x]='>' then
                        begin
                                inc(nho);
                                if nho1>-1 then dec(nho1);
                        end
                        else inc(nho1);
                 end;
        if i>j then write(g,0) else write(g,nho+nho1)
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

