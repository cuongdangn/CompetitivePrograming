const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u,c     :       longint;
        next    :       node;
        end;

var     g,f     :       text;
        ke      :       array[1..40000] of node;
        n,m     :       longint;
        st      :       array[1..40000] of longint;
        dau     :       longint;
        dd      :       array[1..40000] of boolean;
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
procedure       nap(var ke:node;u,c     :       longint);
var     p       :       node;
begin
        new(p);
        p^.c:=c;
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,c,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do readln(f);
        for i:=1 to m do
             begin
                readln(f,u,v);
                nap(ke[u],v,i);
                nap(ke[v],u,i);
             end;
end;
procedure       xuly;
var     p       :       node;
        u       :       longint;
begin
        st[1]:=1;
        dau:=1;
        writeln(g,m);
        repeat
                u:=st[dau];
                p:=ke[u];
                ke[u]:=p;
                while (p<>nil)and(dd[p^.c]) do p:=p^.next;
                if p<>nil then
                 begin
                        inc(dau);
                        st[dau]:=p^.u;
                        dd[p^.c]:=true;
                 end
                 else
                  begin
                        write(g,st[dau],' ');
                        dec(dau);
                  end;
        until     dau=0;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.