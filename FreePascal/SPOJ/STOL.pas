uses    math;
const   finp    =       'STOL.INP';
        fout    =       'STOL.OUT';
var     g,f     :       text;
        n,m,kq     :       longint;
        a       :       array[1..400,1..400] of char;
        h,le,r       :       array[0..400] of longint;

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
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       xuly;
var     i,j,k     :       longint;
begin
        for i:=1 to m do
         begin
          for j:=1 to n do
           if a[i,j]='.' then h[j]:=h[j]+1
           else h[j]:=0;

           h[0]:=-maxlongint;
           h[n+1]:=-maxlongint;
           for j:=n downto 1 do
            begin
                k:=j+1;
                while h[k]>=h[j] do k:=r[k];
                r[j]:=k;
            end;
           for j:=1 to n do
            begin
             k:=j-1;
             while h[k]>=h[j] do k:=le[k];
             le[j]:=k;
            end;
            for j:=1 to n do
             if a[i,j]='.' then kq:=max(kq,(r[j]-le[j]-1+h[j])*2-1);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
