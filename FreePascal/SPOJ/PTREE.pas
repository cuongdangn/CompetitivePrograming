uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..201] of node;
        dd      :       array[1..201] of boolean;
        c       :       array[1..201] of longint;
        d       :       array[0..201,0..201] of longint;
        k,n,kq     :       longint;
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
var     p       :node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v       :longint;
begin
        readln(f,n,k);
        for i:=1 to n do
              read(f,c[i]);
              readln(f);
              for i:=1 to n-1 do
                begin
                        readln(f,u,v);
                        nap(ke[u],v);
                        nap(ke[v],u);
                end;
end;
procedure       DFS(u:longint);
var     p:node;
        i,v:longint;
        ok      :       boolean;
begin
        dd[u]:=false;
        p:=ke[u];
        ok:=true;
        d[u,0]:=c[u];
        while p<>nil do
                begin
                    v:=p^.v;
                    if dd[v] then
                        begin
                                ok:=false;
                                dfs(v);
                                for i:=1 to k do d[u,i]:=max(d[u,i],d[v,i-1]+c[u]);
                                kq:=max(kq,d[u,k]);
                        end;
                     p:=p^.next;
                end;
        if ok then d[u,1]:=c[u];
end;
procedure       xuly;
var     i       :longint;
        p       :       node;
        v:      longint;
begin
        fillchar(dd,sizeof(dd),TRUE);
        DFS(1);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
