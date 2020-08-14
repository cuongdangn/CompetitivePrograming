const   finp    =       'DELCOL.INP';
        fout    =       'DELCOL.OUT';
var     g,f    :       text;
        head       :        array[0..100000] of longint;
        adj     :  array[0..400000] of longint;
        h       :  array[1..3,1..100000] of longint;
        a       :  array[1..3,1..100000] of longint;
        n       :      longint;
        dd      :array[0..100000] of byte;
        st      :      array[0..200000] of longint;
        da,cu   :      longint;
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
var     i,j       :longint;
begin
        readln(f,n);
        for i:=1 to 3 do
                begin
                        for j:=1 to n do read(f,a[i,j]);
                        readln(f);
                end;

end;
procedure       push(u:longint);
begin
        inc(cu);
        st[cu]:=u;
end;
procedure       kt;
var     i,j,i1,m  :longint;
        ok      :       boolean;
begin
        da:=0;
        cu:=-1;
        m:=0;
        for i:=1 to 3 do
                for j:=1 to n do
                        inc(h[i][a[i,j]]);
        for i:=2 to 3 do
                for j:=1 to n do
                       if h[i,j]=0 then push(j);
        for j:=1 to n do
                begin
                        for i:=1 to 3 do
                             begin
                                     ok:=true;
                                     for i1:=i-1 downto 1 do if a[i,j]=a[i1,j] then ok:=false;
                                     if ok then
                                                begin
                                                inc(m);
                                                head[a[i,j]]:=head[a[i,j]]+1;
                                                end;
                             end;
                end;
        for i:=2 to n do
                head[i]:=head[i-1]+head[i];
        for j:=1 to n do
                begin
                        for i:=1 to 3 do
                             begin
                                     ok:=true;
                                     for i1:=i-1 downto 1 do if a[i,j]=a[i1,j] then ok:=false;
                                     if ok then
                                                begin
                                                adj[head[a[i,j]]]:=j;
                                                head[a[i,j]]:=head[a[i,j]]-1;
                                                end;
                             end;
                end;
        head[n+1]:=m;
end;
procedure       dele(c:longint);
var     i,j:longint;
begin
        for i:=1 to 3 do
                begin
                        h[i][a[i,c]]:=h[i][a[i,c]]-1;
                        if h[i][a[i,c]]=0 then push(a[i,c]);
                end;
end;
procedure       xuly;
var     i,j,u,kq     :       longint;
begin
        kt;
        kq:=0;
        while da<=cu do
                begin
                      u:=st[da];
                      inc(da);
                      for i:=head[u]+1 to head[u+1] do
                      IF  dd[adj[i]]=0 then
                                begin
                                inc(kq);
                                dd[adj[i]]:=1;
                                dele(adj[i]);
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
