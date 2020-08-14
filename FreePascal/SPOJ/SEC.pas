const   finp    =       '';
        fout    =       '';
type    tree    =       ^node;
        node    =       record
        hx,sl   :       longint;
        c       :       array[0..1] of tree;
        end;
var     g,f     :       text;
        trie    :       tree;
        n,m,kq  :       longint;
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
procedure       nap(var a:tree);
var     i:byte;
begin
        new(a);
        a^.sl:=1;
        a^.hx:=0;
        for i:=0 to 1 do a^.c[i]:=nil;
end;
procedure       doc;
var     i,j,kt,i1,cong,tru       :       longint;
        p       :       tree;
begin
        readln(f,m,n);
        nap(trie);
        for i:=1 to m do
                begin
                        read(f,j);
                        p:=trie;
                        for i1:=1 to j do
                                begin
                                        read(f,kt);
                                        if p^.c[kt]=nil then
                                                        nap(p^.c[kt])
                                        else inc(p^.c[kt]^.sl);
                                        p:=p^.c[kt];
                                end;
                        readln(f);
                        inc(p^.hx);
                end;
        for i:=1 to n do
                begin
                        read(f,j);
                        p:=trie;
                        kq:=0;
                        for i1:=1 to j do
                                begin
                                        read(f,kt);
                                        if p^.c[kt]=nil then
                                        begin
                                                cong:=0;
                                                tru:=0;
                                                break;
                                        end;
                                        p:=p^.c[kt];
                                        kq:=kq+p^.hx;
                                        cong:=p^.sl;
                                        tru:=-p^.hx;
                                end;
                        readln(f);
                        kq:=kq+cong+tru;
                        writeln(g,kq);
                end;
end;
begin
        mo;
        doc;
        dong;
end.
