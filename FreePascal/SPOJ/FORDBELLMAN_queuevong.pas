const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
        maxx    =       trunc(1e9)+100;
type    node    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        d       :       array[1..maxn] of longint;
        st,truy      :       array[0..maxn] of longint;
        dau,cuoi:       longint;
        dd      :       array[1..maxn] of boolean;
        n,m     :       longint;
        s       :       longint;
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
procedure       nap(var ke:node;u,w:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w       :       longint;
begin
        readln(f,n,m,s);
        for i:=1 to m do
         begin
                readln(f,u,v,w);
                nap(ke[u],v,w);
         end;
end;
procedure       fordbellman;
var     i,j,u     :       longint;
        p       : node;
begin
        dau:=0;
        cuoi:=0;
        for i:=1 to n do dd[i]:=false;
        for i:=1 to n do d[i]:=maxx;
        dd[s]:=true;
        d[s]:=0;
        st[0]:=s;
        while (dau<>(cuoi+1)mod n) do
         begin
                u:=st[dau];
                dau:=(dau+1) mod n;
                dd[u]:=false;
                p:=ke[u];
                while p<>nil do
                 begin
                        if d[u]+p^.w<d[p^.u] then
                         begin
                                d[p^.u]:=d[u]+p^.w;
                                truy[p^.u]:=u;
                                if not dd[p^.u] then
                                 begin
                                        cuoi:=(cuoi+1) mod n;
                                        st[cuoi]:=p^.u;
                                 end;
                         end;
                        p:=p^.next;
                 end;
         end;
end;
begin
        mo;
        doc;
        fordbellman;
        dong;
end.