const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
        maxn    =       111;
var     x,y     :array[0..111] of longint;
        f       :array[0..111,0..111] of longint;
        l,r,m,n     :longint;
        f1,g    :       text;
procedure       xuly;
var     i,j,a,b,m1       :       longint;
begin
        readln(f1,n,m);
        for i:=1 to n do readln(f1,x[i],y[i]);
        l:=1;
        r:=x[1]*m+y[1]*m;
        while l<r do
                begin
                        m1:=(l+r) div 2;
                        for i:=0 to 111 do
                         for j:=0 to 111 do f[i,j]:=-maxlongint;
                        f[0,0]:=0;
                        for i:=1 to n do
                        begin
                         a:=0;
                         while (a<=m)and(a*x[i]<=m1) do
                                begin
                                     j:=0;
                                     b:=(m1-a*x[i]) div y[i];
                                     while (j+a<=m) do
                                        begin
                                          if f[i][j+a]<f[i-1][j]+b then f[i][j+a]:=f[i-1][j]+b;
                                          inc(j);
                                        end;
                                     inc(a);
                                end;
                         end;
                         if f[n][m]>=m then r:=m1
                        else l:=m1+1;
                 end;
                writeln(g,l);
end;
procedure       mo;
begin
        assign(f1,finp);
        reset(f1);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f1);
        close(g);
end;
begin
        mo;
        xuly;
        dong;
end.