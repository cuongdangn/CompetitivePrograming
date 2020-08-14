const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :    text;
        ke      :       array[1..10001] of node;
        dd      :       array[1..10000] of longint;
        n,m,i,k     :       longint;
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
procedure       nap(var ke : node;v:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                nap(ke[u],v);
                nap(ke[v],u);
         end;
end;

procedure       BFS(i:longint);
var p   :       node;
    dau,u,v :longint;
    st  :array[1..10000] of longint;
begin
        p:=ke[i];
        dau:=0;
        for u:=1 to n do dd[u]:=0;
        while  p<> nil do
         begin
                v:=p^.v;
                inc(dau);
                st[dau]:=v;
                p:=p^.next;
         end;
         for u:=1 to dau do
          begin
                p:=ke[st[u]];
                while p<>nil do
                 begin
                        if p^.v<>i then
                         if dd[p^.v]<>0 then
                                begin
                                        writeln(g,i,' ',dd[p^.v],' ',p^.v,' ',st[u]);
                                        dong;
                                        halt;
                                end

                         else dd[p^.v]:=st[u];
                         p:=p^.next;
                 end;
          end;
end;
procedure       xuly ;
begin
        for i:=1 to n do
         begin
             BFS(i);
          end;
          writeln(g,-1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
