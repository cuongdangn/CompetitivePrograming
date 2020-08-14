const   finp    =       '';
        fout    =       '';
var     g,f1     :       text;
        st       :       string;
        f       :       array[0..255] of integer;
procedure       mo;
begin
        assign(f1,finp);
        reset(f1);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f1);
        close(g);
end;
procedure       doc;
begin
        readln(f1,st);
end;
function kt(i,j:longint):boolean;
   var st1:string;
       k,a:longint;
   begin
      kt:=true;
      st1:=copy(st,j+1,i-j);
      a:=length(st1);
      for k:=1 to (a div 2) do
         if st1[k]<>st1[a-k+1] then exit(false);
   end;
function        min(a,b:longint):longint;
begin
        min:=(-abs(a-b)+a+b)div 2;
end;
procedure solve;
   var i,j:longint;
   begin
      f[0]:=0;
      for i:=1 to length(st) do
         begin
            f[i]:=255;
            for j:=i-1 downto 0 do
               if kt(i,j) then
                  f[i]:=min(f[i],f[j]+1);
         end;
   end;
begin
        mo;
        doc;
        solve;
        writeln(g,f[length(st)]);
        dong;
end.