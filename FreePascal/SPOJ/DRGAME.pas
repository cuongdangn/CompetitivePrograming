const   finp    =       'DRGAME.INP';
        fout    =       'DRGAME.OUT';
var     g,f     :       text;
        a       :       array[1..1000,1..1000] of longint;
        n,m,kq     :       longint;
        b       :array[1..1000] of longint;
        next,d       :       array[1..1000] of longint;
        dd      :       array[1..1000] of byte;
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
var     i,u,v       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                inc(a[u,v]);
                inc(a[v,u]);
                inc(b[u]);
                inc(b[v]);
         end;
end;
procedure       bfs(i:longint);
var     u,v       :       longint;
        dau,cuoi        :       longint;
        st      :       array[1..2000] of longint;
begin
        dau:=1;
        cuoi:=1;
        fillchar(dd,sizeof(dd),0);
        st[dau]:=i;
        dd[i]:=1;
        while dau<= cuoi do
         begin
             u:=st[dau];
             inc(dau);
             for v:=1 to n do
              if (dd[v]=0)and(a[u,v]>0) then
               begin
                inc(cuoi);
                dd[v]:=1;
                st[cuoi]:=v;
               end;
         end;
         u:=0;
        for v:=1 to cuoi do
         if b[st[v]] mod 2=1 then inc(u);
         if u>0 then kq:=kq+(u-2) div 2+1 else kq:=kq+1;
end;
procedure       xuly;
var     i       :longint;
begin
        for i:=1 to n do
         if dd[i]=0 then
         begin
                BFS(i);
         end;
         writeln(g,kq-1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

