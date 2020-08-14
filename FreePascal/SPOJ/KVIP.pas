uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        fx      :       array[1..1000] of int64;
        c       :       array[1..1000,1..1000] of int64;
        n       :       longint;
        s,max1  :       int64;

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
var     i,j:longint;
begin
        readln(f,n);
        for i:=1 to n do
         begin
          for j:=1 to n do read(f,c[i,j]);
          s:=s+c[i,i];
          readln(f);
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        max1:=s;

        for i:=2 to n do
         begin
         fx[i]:=c[i,1]-c[i,i]+c[1,i]-c[1,1];
         if i>2 then
          for j:=i-1 downto 2 do
           fx[i]:=max(fx[i],fx[j]-c[j,1]+c[i,1]-c[i,i]+c[j,i]);
           max1:=max(max1,fx[i]);
         end;
         writeln(g,max1+s);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



