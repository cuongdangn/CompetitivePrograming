const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
type    node    =       ^re;
        re      =       record
        v,w       :       longint;
        next      :       node;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ke      :       array[1..maxn] of node;
        d,dd    :       array[1..maxn] of longint;
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
var     i,u,v,w:longint;
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
var     i:longint;
begin
        for i:=1 to n do
                begin
                        dd[i]:=0;
                        d[i]:=maxlongint);
                end;
end;
procedure       bell;
var     i,v       :longint
        stop    :boolean;
begin
        for i:=1 to n-1 do
                begin
                        stop:=false;


