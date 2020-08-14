const   finp    =       'DNC.INP';
        fout    =       '';
var     g,f:    text;
        a,b       :array[1..200,1..200] of longint;
        n,m     :longint;
        d,st,ct      :       array[1..40000] of integer;
        sl      :  longint;
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
var     i,u,v,c,kq       :longint;
begin
        readln(f,n,m);
        kq:=0;
        for i:=1 to m do
                begin
                        readln(f,u,v,c);
                        inc(a[u,v]);
                        inc(a[v,u]);
                        b[u,v]:=c;
                        b[v,u]:=c;
                        kq:=kq+c;
                end;
        if kq<0 then
        begin
                writeln(g,-1) ;
                dong;
                halt;
        end;
end;
procedure       euler;
var        dau,u,v:longint;
begin
        dau:=1;
        st[1]:=1;
        repeat
            u:=st[dau];
            for v:=1 to n do
             if a[u,v]>0 then
                begin
                        dec(a[u,v]);
                        dec(a[v,u]);
                        inc(daU);
                        st[dau]:=v;
                        break;
                end;
                if st[dau]=u then
                 begin
                         inc(sl);
                         ct[sl]:=u;
                         dec(dau);
                 end;
            until dau=0;
end;
procedure       xuly;
var     i,min,j       :       longint;
begin
        euler;
        min:=maxlongint;
        d[1]:=0;
        for i:=2 to sl do
         d[i]:=d[i-1]+b[ct[i],ct[i-1]];
        for i:=1 to sl do
         if d[i]<min then
                begin
                        min:=d[i];
                        j:=i;
                end;

                begin
                        for i:=j to sl do write(g,ct[i], ' ');
                        for i:=2 to j do write(g,ct[i],' ')
                end;
end;
begin
        mo;
        doc;
        xuly;dong;
end.
