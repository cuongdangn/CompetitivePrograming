const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        lt      :       array[0..60] of qword;
        x,y     :       qword;
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
function        tinh(x,y        :       qword;c:longint):qword;
var     i,j     :       longint;
begin
        if x=y then exit(x);
        for i:=c downto 0 do
         if lt[i]<=y then
          begin
                if lt[i]<=x then exit(tinh(x-lt[i],y-lt[i],i)+lt[i]);
                if lt[i+1]-1<=y then exit(lt[i+1]-1);
                exit(lt[i]-1);
          end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        readln(f,x,y);
        writeln(g,tinh(x,y,59));
end;
procedure       doc;
var     i,j:    longint;
begin
        readln(f,j);
        lt[0]:=1;
        for i:=1 to 60 do
         lt[i]:=lt[i-1]*2;
        for i:=1 to j do
         xuly;
end;
begin
        mo;
        doc;
        dong;
end.