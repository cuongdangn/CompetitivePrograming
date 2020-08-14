const
      base=9901;
var gx:array[0..10000] of integer;
    fx:array[0..602,0..10000] of integer;
    n,h:integer;

procedure nhap;
begin
 readln(n,h);
end;
procedure qhd;
var i,j,k:integer;
begin
 if n mod 2=0 then
        begin
                writeln(0);
                exit;
        end;
 gx[1]:=1;
 fx[1,1]:=1;
 for i:=2 to h do
 for j:=n downto 1 do
        if j mod 2=1 then
 begin
  for k:=1 to (j-2) div 2 do
  fx[i,j]:=((fx[i,j]+(fx[i-1,k]*gx[j-1-k])+ (gx[k]*fx[i-1,j-1-k])
  - (fx[i-1,k]*fx[i-1,j-1-k]) )) mod base;
  fx[i,j]:=fx[i,j]*2;
  if (j-2) mod 2 =1 then
        begin
                k:=(j-2) div 2+1;
                 fx[i,j]:=(fx[i,j]+(fx[i-1,k]*gx[j-1-k]) + (gx[k]*fx[i-1,j-1-k])
  - (fx[i-1,k]*fx[i-1,j-1-k]) ) mod base;
        end;
  if fx[i,j]<0 then fx[i,j]:=fx[i,j]+base;
  gx[j]:=(gx[j]+fx[i,j]) mod base;

 end;
 write(fx[h,n] mod base);
end;
BEGIN
 nhap;
 qhd;
END.

