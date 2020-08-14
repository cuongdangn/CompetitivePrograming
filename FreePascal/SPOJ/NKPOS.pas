const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..200,1..200] of longint;
        n,m       :longint;
        res       :     array[0..500000] of longint;
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
var     i,u,v:longint;
begin
        readln(f,n,m);
        for i:=1 to n do readln(f);
        for i:=1 to m do
                begin
                        readln(f,u,v);
                        inc(a[u,v]);
                        inc(a[v,u]);
                end;
end;
procedure       euler;
var     st      :array[0..500000] of longint;
        dau,i,u,n1,ok     :       longint;
begin
        st[1]:=1;
        dau:=1;
        n1:=0;
        repeat
               u:=st[dau];
               ok:=0;
               for i:=1 to n do
                         if a[i,u]>0 then
                                begin
                                        dec(a[i,u]);
                                        dec(a[u,i]);
                                        inc(dau);
                                        st[dau]:=i;
                                        ok:=1;
                                        break;
                                end;
                         if ok=0 then
                                begin
                                        inc(n1);
                                        res[n1]:=u;
                                        dec(dau);
                                end;
        until dau=0;
        writeln(g,n1-1);
        for i:=n1 downto 1 do write(g,res[i],' ');
end;
begin
        mo;
        doc;
        euler;
        dong;
end.




