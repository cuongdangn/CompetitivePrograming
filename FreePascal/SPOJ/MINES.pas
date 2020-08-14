const   finp    =       'MINES.INP';
        fout    =       'MINES.OUT';
var     g,f     :       text;
        n,m     :       longint;
        a,b     :       array[0..1001,0..1001] of longint;
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
var     i,j     :       longint;
begin
        readln(f,m,n);
        for i:=1 to m do
          for j:=1 to n do read(f,b[i,j]);
end;
procedure       xuly;
var     i,t,j,x     :       longint;
begin
        for t:=2 to (m+n) do
         begin
          if t<=n+1 then
          begin
          i:=1;
          j:=t-1
          end
          else
           begin
            i:=t-n;
            j:=t-i;
           end;
         while (j>=1)and(i<=m) do
          begin
           if j=1 then
            begin
             x:=b[i,j]-a[i-1,j]-a[i-1,j+1];
             if x<=3 then a[i,j]:=0
             else a[i,j]:=1;
            end
            else
             begin
              x:=b[i,j]-b[i,j-1] + (a[i,j-2]+a[i-1,j-2]+a[i+1,j-2])-a[i-1,j+1];
              if a[i,j-1]=1 then x:=x+3;
              if x>=3 then a[i,j]:=1
               else a[i,j]:=0;
              end;
              i:=i+1;
              j:=j-1;
           end;
         end;
         /////;
         for i:=1 to m do
          begin
           for j:=1 to n do write(g,a[i,j],' ');
           writeln(g);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
