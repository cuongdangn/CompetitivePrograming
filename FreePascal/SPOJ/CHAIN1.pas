uses    math;
const   finp    =       '';
        fout    =       '';
type    tree    =       ^re;
        re      =       record
        f,u     :       longint;
        c       :       array['a'..'z'] of tree;
        end;
var     g,f     :       text;
        goc     :       tree;
        n       :       longint;
        s       :       ansistring;
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
procedure       nap(var p:tree);
var     c       :       char;
begin
        new(p);
        p^.u:=0;
        p^.f:=0;
        for c:='a' to 'z' do p^.c[c]:=nil;
end;
procedure       doc;
var     i,j     :       longint;
        p       :       tree;
begin
        readln(f,n);
        nap(goc);
        for i:=1 to n do
         begin
                readln(f,s);
                p:=goc;
                for j:=1 to length(s) do
                 begin
                        if p^.c[s[j]]=nil then nap(p^.c[s[j]]);
                        p:=p^.c[s[j]];
                 end;
                p^.u:=1;
         end;
end;
procedure       dfs(p:tree);
var     c       :char;
begin
        p^.f:=0;
        for c:='a' to 'z' do
             if p^.c[c]<>nil then
              begin
                dfs(p^.c[c]);
                p^.f:=max(p^.f,p^.c[c]^.f);
              end;
        p^.f:=p^.f+p^.u;
end;
procedure       xuly;
begin
        dfs(goc);
        writeln(g,goc^.f);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.