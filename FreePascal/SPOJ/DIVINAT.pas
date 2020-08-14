const   finp    =       'DIVINAT.IN';
        fout    =       'DIVINAT.OUT';
var     g,f     :       text;
        n,m       :       longint;
        p,t       :       array[1..100000] of longint;
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
begin
        readln(f,n);
end;
procedure       pt(n:longint);
var     i,j       :longint;
begin
        i:=n;
        j:=2;
        while (i>1)and(j<trunc(sqrt(n))) do
                begin
                       if i mod  j=0 then
                        begin
                                inc(m);
                                p[m]:=j;
                                while i mod j=0 do
                                        begin
                                                inc(t[m]);
                                                i:=i div j;
                                        end;
                        end;
                         inc(j);
                end;
       if i>1 then
        begin
                inc(m);
                p[m]:=i;
                t[m]:=1;
        end

end;
function        pow(a,b:longint):int64;
var     tg      :       int64;
begin
        if b=0 then exit(1);
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=tg*tg;
        if b mod 2=1 then tg:=tg*a;
        exit(tg);
end;
procedure       xuly;
var     i       :       longint;
        kq      :       int64;
begin
        pt(n);
        kq:=1;
        for i:=1 to m do
                   kq:=kq*int64((p[i]-1))*pow(p[i],t[i]-1);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

