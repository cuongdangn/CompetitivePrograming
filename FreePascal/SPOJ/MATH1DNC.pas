const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        c       :       array[1..200,1..200] of byte;
        a,b,t     :       array[1..200] of longint;
        n,m,kq     :       longint;
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
        while not seekeof(f) do
                begin
                        readln(f,u,v);
                        c[u,v]:=1;
                end;
end;
procedure       tan_duong(j:longint);
var     i,p       :       longint;
begin
        repeat
                i:=t[j];
                p:=a[i];
                a[i]:=j;
                b[j]:=i;
                j:=p;
        until j=0;
end;
procedure       bfs(i:longint);
var     j:longint;
        st      :       array[1..300] of longint;
        dau,cuoi     :       longint;
begin
        dau:=1;
        cuoi:=1;
        st[dau]:=i;
        fillchar(t,sizeof(t),0);
        repeat
             i:=st[dau];
             inc(dau);
             for j:=1 to m do
                if (t[j]=0)and(c[i,j]=1) then
                        begin
                                t[j]:=i;
                                if b[j]=0 then
                                        begin
                                                tan_duong(j);
                                                exit;
                                        end
                                else
                                        begin
                                                inc(cuoi);
                                                st[cuoi]:=b[j];
                                        end;
                        end;
        until          dau>cuoi;
end;
procedure       xuly;
var     i:longint;
begin
        for i:=1 to n do
                if a[i]=0 then
                                BFS(i);
        for i:=1 to n do
        if a[i]<>0 then inc(kq);
        writeln(g,kq);
        for i:=1 to n do
         if a[i]<>0 then writeln(g,i,' ',a[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


