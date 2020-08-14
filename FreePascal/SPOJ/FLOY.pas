const   finp    =       '';
        fout    =       '';
        maxc    =       maxlongint;
var     g,f     :       text;
        a,tr       :       array[1..100,1..100] of longint;
        n,m,k,dem   :longint;
        res     :       array[1..100] of longint;
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
procedure       truy(s,t:longint);
begin
        dem:=0;
        while s<>t  do
                begin
                        inc(dem);
                        res[dem]:=s;
                        s:=tr[s,t];
                end;
        inc(dem);
        res[dem]:=t;
end;
procedure       floy;
var     i,k,j   :longint;
begin
        for i:=1 to n do
         for j:=1 to n do tr[i,j]:=j;
        for k:=1 to n do
         for i:=1 to n do
          if a[i,k]<maxc then
                for j:=1 to n do if (a[k,j]<maxc) then
                if (a[i,j]>a[k,j]+a[i,k]) then
                        begin
                                a[i,j]:=a[k,j]+a[i,k];
                                tr[i,j]:=tr[i,k];
                        end;
end;
procedure       doc;
var     i,u,v,w,j       :longint;
begin
        readln(f,n,m,k);
        for i:=1 to n do
        for u:=1 to n do if u<>I then a[i,u]:=maxc
        else a[i,u]:=0;
        for i:=1 to m do
                begin
                        readln(f,u,v,w);
                        a[u,v]:=w;
                        a[v,u]:=w;
                end;
                floy;
        for i:=1 to k do
                begin
                        readln(f,w,u,v);
                        if w=0 then writeln(g,a[u,v])
                        else
                               begin
                                truy(u,v);
                                write(g,dem);
                                for j:=1 to dem do write(g,' ',res[j]);
                                writeln(g);
                               end;
                end;
end;
begin
        mo;
        doc;
        dong;
end.