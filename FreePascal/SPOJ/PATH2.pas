{$mode objfbc}
uses    math;
const   finp    =       'PATH.INP';
        fout    =       'PATH.OUT';
        maxn    =       100001;
type    node    =       ^re;
        re      =       record
        v,w     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        dd      :       array[1..maxn] of byte;
        ke      :       array[1..maxn] of node;
        res,kq     :       int64;
        s,n       :       longint;

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
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w       :longint;
begin
        readln(f,n,s);
        for i:=1 to n-1  do
              begin
                readln(f,u,v,w);
                nap(ke[u],v,w);
                nap(ke[v],u,w);
              end;
end;
procedure       DFS(u:longint);
var     p       :       node;
        v,w       :       longint;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<>nil do
                begin
                        v:=p^.v;
                        w:=p^.w;
                        if dd[v]=0 then
                                begin
                                        res:=res+w;
                                        kq:=max(res,kq);
                                        dfs(v);
                                        res:=res-w;
                                end;
                        p:=p^.next;
                end;
end;
procedure       xuly;
begin
        dfs(s);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.