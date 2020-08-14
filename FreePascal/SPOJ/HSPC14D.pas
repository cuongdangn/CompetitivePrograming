uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,p     :       qword;
        lt      :       array[0..60] of qword;
        q,kq,sb       :       longint;
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
procedure       xuly;
var     i       :       longint;
begin
        sb:=0;
        for i:=59 downto 0 do
         if n>=lt[i] then
          begin
           inc(sb);
           n:=n-lt[i];
          end;
          kq:=sb mod p;
          writeln(g,kq);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,q);
        lt[0]:=1;
        for i:=1 to 59 do
         lt[i]:=lt[i-1]*2;
        for i:=1 to q do
         begin
          readln(f,n,p);
          n:=n-1;
          xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.
