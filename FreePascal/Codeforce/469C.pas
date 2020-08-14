const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,kq     :       longint;
        a       :       array[1..1000,1..1000] of char;
        dd      :       array[1..1000,1..1000] of longint;

procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
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
        for j:=1 to n do
         begin
          for i:=1 to m-1 do
           if dd[i,i+1]=0 then
           begin
            if a[i,j]>a[i+1,j] then
               begin
                inc(kq);
                for k:=i-1 downto 1 do
                 if dd[k,k+1]=j then dd[k,k+1]:=0;
                 break;
                end
            else if a[i,j]<a[i+1,j] then dd[i,i+1]:=j;
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

