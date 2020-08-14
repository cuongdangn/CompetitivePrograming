const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,k   :       longint;
        a,b       :       array[1..200,1..200] of byte;
        sai       :       array[1..200] of boolean;
        s,s1    :       string;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrte(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,u,v   :       longint;
begin
        readln(f,n,m,k);
        readln(f,s);
        readln(f,s1);
        for i:=1 to m do
         begin
                readln(f,u,v);
                a[u,v]:=1;
                b[v,u]:=1;
         end;
end;
procedure       DFS(u,j:longint);
var     i       :       longint;
begin
        if j=0 then
         begin
                for i:=1 to n do
                 if (a[u,i]=1) then
                  begin
                        if

