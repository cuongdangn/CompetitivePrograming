uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';

type
        trie    =       ^node;
        node    =       record
        u,f     :       longint;
        c       :       array['a'..'z'] of trie;
        end;
var     fi,fo     :       text;
        root    : trie;
        s       : string;

procedure       mo;
begin
        assign(fi,finp);
        reset(fi);
        assign(fo,fout);
        rewrite(fo);
end;
procedure       dong;
begin
        close(fi);
        close(fo);
end;
procedure       add(var a:trie);inline;
var     c1:      char;
begin
        new(a);
        a^.u:=0;
        a^.f:=0;
        for c1:='a' to 'z' do
              a^.c[c1]:=nil;
end;
procedure       doc;
var     n,i,j:longint;
        p:trie;
begin
        readln(fi,n);
        add(root);
        for j:=1 to n do
                begin
                        readln(fi,s);
                        p:=root;
                        for i:=1 to length(s) do
                                begin
                                        if p^.c[s[i]]=nil then add(p^.c[s[i]]);
                                        p:=p^.c[s[i]];
                                end;
                        p^.u:=1;
                end;
end;
procedure       dfs(a:trie);inline;
var     c1:char;
begin
        a^.f:=a^.u;
        for c1:='a' to 'z' do
                if a^.c[c1]<>nil then
                        begin
                                dfs(a^.c[c1]);
                                a^.f:=max(a^.f,a^.c[c1]^.f+a^.u);
                        end;
end;
procedure       xuly;
begin
        dfs(root);
        writeln(fo,root^.f);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
