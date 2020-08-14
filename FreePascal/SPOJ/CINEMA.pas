 const fi='';
      fo='';
var f:Text;
    n,m,q,tong:longint;
    a:array[0..100000]of longint;
    trace:array[1..1000000]of longint;
    b:array[1..1000,1..1000]of longint;

procedure input;
var i,j,tongcu:longint;
begin
 tong:=0; tongcu:=0;
 assign(f,fi); reset(f);
 readln(f,n,m);
 readln(f,q);
 a[0]:=0;
 for i:=1 to q do
  begin
   read(f,a[i]);
   tong:=tong+a[i];
   for j:=tongcu+1 to tong do trace[j]:=i;
   tongcu:=tong;
  end;
 close(f);
 assign(f,fo); rewrite(f);
end;

procedure process;
var i,j,dem:longint;
begin
 fillchar(b,sizeof(b),0);
 dem:=1;
 for i:=1 to n do
  begin
   if odd(i) then
    begin
     for j:=1 to m do
      begin
       b[i,j]:=trace[dem];
       inc(dem);
       if dem=tong+1 then exit;
      end;
    end;
   if not odd(i) then
    begin
     for j:=m downto 1 do
      begin
       b[i,j]:=trace[dem];
       inc(dem);
       if dem=tong+1 then exit;
      end;
    end;
  end;
end;

procedure print;
var i,j:longint;
begin
 for i:=1 to n do
  begin
   for j:=1 to m do write(f,b[i,j],' ');
   writeln(f);
  end;
 close(f);
end;

BEGIN
 input;
 process;
 print;
END.
