uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       1001;
type    node    =       ^re;
        re      =       record
        v,w       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        tham    :       array[1..maxn] of boolean;
        ke      :       array[1..maxn] of node;
        d       :       array[1..maxn,0..1] of longint;
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
procedure nap(var ke:node; v,w:longint);
var p:node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure nhap;
var i,u,v,w,j:longint;
begin
        readln(F,n);
        for i:=1 to n do ke[i]:=nil;
        for i:=1 to n do
                for j:=0 to 1 do d[i,j]:=0;
        fillchar(tham,sizeof(tham),false);
        for i:=2 to n do
        begin
              readln(F,v,w);
              nap(ke[i],v,w);
              nap(ke[v],i,w);
        end;
end;
procedure dfs(u:longint);
var     v,w:longint;
        ok      :       boolean;
        P:node;
begin
        tham[u]:=true;
        p:=ke[u];
        ok:=true;
        WHile p<>nil do
        begin
                v:=p^.v;
                w:=p^.w;
                if not tham[v] then
                begin
                    dfs(V);
                    d[u,0]:=d[v,0]+d[u,0];
                    d[u,1]:=min(d[v,0]+w,d[v,1])+d[u,1];
                    ok:=false;
                end;
                p:=p^.next;
        end;
        if ok then
                begin
                        d[u,0]:=0;
                        d[u,1]:=maxlongint;
                end;
end;
procedure       xuly;
var     i       :longint;
begin
        DFS(1);
        writeln(g,d[1,1],'.00');
end;
procedure       doc;
var     t,i:longint;
begin
        readln(f,t);
        begin
                for i:=1 to t do
                        begin
                                nhap;
                                xuly;
                        end;
        end;
end;
begin
        mo;
        doc;
        dong;
end.
