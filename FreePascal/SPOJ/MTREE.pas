const   finp    =       '';
        fout    =       '';
        du      =       1000000007;
type    node    =       ^re;
        re      =       record
        u,v,w   :       longint;
        next    :       node;
        end;
var     g,f:text;
        s,e     :       array[1..100000] of int64;
        ke      :       array[1..100000] of node;
        dd      :       array[1..100000] of byte;
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
procedure       nap(var ke:node;v,w:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w       :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
                begin
                        readln(f,u,v,w);
                        nap(ke[u],v,w);
                        nap(ke[v],u,w);
                end;
end;
procedure       DFS(u:longint);
var     p       :       node;
        v,w       :       longint;
        tg      : int64;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<>nil do
                begin
                        v:=p^.v;
                        w:=p^.w;
                        if dd[v]=0 then
                                begin
                                        DFS(v);
                                        tg:=((s[v]+1)*w)mod du;
                                        e[u]:=(e[u]+s[u]*tg) mod du;
                                        s[u]:=(s[u]+tg)mod du;
                                end;
                        p:=p^.next;
                end;
end;
procedure       xuly;
var     kq      :       longint;
        i       :       longint;
begin
        DFS(1);
        kq:=0;
        for i:=1 to n do kq:=(kq+s[i]+e[i]) mod du;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.