const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ke      :       array[1..10000] of node;

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
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v:      longint;
begin
        readln(f,n,m);
        for i:=1 to m do
                begin
                        readln(f,u,v);
                        nap(ke[u],v);
                        nap(ke[v],u);
                end;
end;
procedure       xuly;
var     i       :       longint;
begin
        for i:=1 to