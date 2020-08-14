uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
type    node    =       ^re;
        re      =       record
        v,w     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        n,m,s,t :       longint;
        d       :       array[0..maxn]  of longint;
        dd      :       array[0..maxn] of boolean;
        tr      :       array[0..maxn] of longint;
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
var     p:node;
begin
        new(p);
        P^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w       :longint;
begin
        readln(f,n,m,s,t);
        for i:=1 to m do
                begin
                        readln(f,u,v,w);
                        nap(ke[u],v,w);
                        nap(ke[v],u,w);
                end;
end;
procedure       ktao;
var     i       :longint;
begin
        for i:=0 to n do
                begin
                        dd[i]:=true;
                        d[i]:=maxlongint;
                end;
        d[s]:=0;
end;
procedure       dj;
var     u,w,v:longint;
        p       :       node;
begin
        ktao;
        repeat
                u:=0;
                for v:=1 to n do
                 if (d[v]<d[u])and(dd[v]) then u:=v;
                if (u=0)or(u=t) then break;
                dd[u]:=false;
                p:=ke[u];
                while p<>nil do
                        begin
                                v:=p^.v;
                                w:=p^.w;
                                if dd[v] then
                                        if d[v]>d[u]+w then
                                         begin
                                           d[v]:=d[u]+w;
                                           tr[v]:=u;
                                         end;
                                p:=p^.next;
                        end;
        until           false;
        writeln(g,d[t]);
        while t<>s do
                begin
                      write(g,t,'<-');
                      t:=tr[t];
                end;
        write(g,t);
end;
begin
        mo;
        doc;
        dj;
        dong;
end.



