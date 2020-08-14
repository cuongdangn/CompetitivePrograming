const   finp    =       'ENET.I02';
        fout    =       'ENET.AA0';
                //ENET.A02
        maxn    =       1000;
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        d,cha      :       array[1..maxn] of integer;
        s,t,n,m :       longint;
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
procedure       nap(var ke:node;v:longint);
var     p:node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     u,v,i     :       longint;
begin
        readln(F,n,m,s,t);
        for i:=1 to m do
                begin
                        readln(f,u,v);
                        nap(ke[u],v);
                        nap(ke[v],u);
                end;
end;
procedure       DFS(u:longint);
var     v       :       longint;
        p       :node;
begin
        if u=t then
               begin
                d[u]:=1;
                exit;
               end
        else
        d[u]:=-1;
        p:=ke[u];
        while p<> nil do
                begin
                        v:=p^.v;
                        if d[v]=1 then
                                begin
                                        d[u]:=1;
                                end
                        else if d[v]=0 then
                                begin
                                        DFS(v);
                                        if d[v]=1 then
                                        begin
                                        d[u]:=1;
                                        end;
                                end;
                        p:=P^.next;
                end;
end;
procedure       xuly;
var     i,kq       :longint;
begin
        kq:=0;
        DFS(s);
         for i:=1 to n do
          if d[i]=1 then inc(kq);
         writeln(g,kq);
         for i:=1 to n do
          if d[i]=1 then writeln(g,i);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
