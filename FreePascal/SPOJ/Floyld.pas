const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a,tr       :       array[1..100,1..100] of longint;
        n,m,k,i,x,y,z,dem       :       longint;
        d       :       array[1..10000] of byte;
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
var     i,u,v,c:longint;
begin
        readln(f,n,m,k);
        for i:=1 to n do
        for c:=1 to n do
        if i<>c then a[i,c]:=maxlongint else a[i,c]:=0;
        for i:=1 to m do
         begin
                readln(f,u,v,c);
                a[u,v]:=c;
                a[v,u]:=c;
         end;
end;
procedure       FLOYD;
var     k,u,v:longint;
begin
        for u:=1 to n do
         for v:=1 to n do tr[u,v]:=v;
        for k:=1 to n do
        for u:=1 to n do
        if a[u,k]< maxlongint then
         for v:=u+1 to n do
         if (a[k,v]<maxlongint)and(a[u,v]>a[u,k]+a[k,v]) then
          begin
             a[u,v]:=a[u,k]+a[k,v];
             a[v,u]:=a[u,v];
             tr[u,v]:=tr[u,k];
              tr[v,u]:=tr[u,k];
          end;
 for u:=1 to n do
         for v:=1 to n do if a[u,v]=maxlongint then a[u,v]:=-1;
end;
begin
        mo;
        doc;
        floyd;
        for i:=1 to k do
        begin
                readln(f,x,y,z);
                if x=0 then writeln(g,a[y,z])
                else
                 begin
                        if a[y,z]<0 then write(g,-1)
                        else
                        begin
                        while y<>z do
                        begin
                                inc(dem);
                                d[dem]:=y;
                                y:=tr[y,z];
                        end;
                        write(g,dem+1,' ');
                        for n:=1 to dem do write(g,d[n],' ');
                        write(g,z);
                        end;
                        writeln(g);
                 end;
        end;
        dong;
end.