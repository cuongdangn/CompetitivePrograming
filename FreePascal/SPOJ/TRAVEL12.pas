const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :    text;
        ke      :       array[1..10001] of node;
        kq       :       array[1..10001,1..2] of longint;
        t       :array[1..10001] of longint;
        dd      :       array[1..10000] of byte;
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
procedure       ghi(j:longint);
begin
        inc(t[k]);
        kq[k,t[k]]:=j;
        if t[k]=2 then
                begin
                        writeln(g,i,' ',kq[k,1],' ',k,' ',kq[k,2]);
                        dong;
                        halt;
                end;
end;
procedure       DFS1(j:longint);
var     p:node;
begin
        p:=ke[j];
        while p<> nil do
         begin
                k:=p^.v;
                if (k<>j)and(dd[k]=0) then
                ghi(j);
                p:=p^.next;
         end;
end;
procedure       DFS(i:longint);
var     p:node;
        j:longint;
begin
        p:=ke[i];
        while p<> nil do
         begin
                j:=p^.v;
                if (dd[j]=0) then DFS1(j);
                p:=p^.next;
         end;
end;
procedure       xuly ;
var     j       :       longint;
begin
        for i:=1 to n do
         begin
             dd[i]:=1;
             for j:=1 to n do t[j]:=0;
             DFS(i);
          end;
          writeln(g,-1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
