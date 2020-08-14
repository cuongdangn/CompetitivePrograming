const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                nap(ke[u],v);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u] then
                        dfs(p^.u);
                p:=p^.next;
         end;
        tp[id]:=u;
        dec(id);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        fillchar(dd,sizeof(dd),true);
        id:=n;
        dfs(1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.