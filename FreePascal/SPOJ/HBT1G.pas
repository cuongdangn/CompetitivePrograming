uses    math;
var     t,i,j:longint;
        l,r:int64;
        sl,sr:string;
        kq,base,dau,cuoi:int64;
begin
 base:=trunc(1e9)+7;
 readln(t);
 for i:=1 to t do
  begin
   readln(l,r);
   str(l,sl);
   str(r,sr);
   kq:=0;
   cuoi:=9;
   for j:=1 to length(sl)-1 do cuoi:=cuoi*10+9;
   dau:=l;
   for j:=length(sl) to length(sr) do
    begin
    if (min(r,cuoi)-dau+1) mod 2=0 then
       kq:=((((min(r,cuoi)-dau+1) div 2)*(min(cuoi,r)+dau) mod base)*j+kq)mod base
    else  kq:=(((min(r,cuoi)-dau+1)*((min(cuoi,r)+dau)div 2) mod base)*j+kq)mod base;
    dau:=cuoi+1;
    cuoi:=cuoi*10+9;
  end;
   writeln(kq mod base);
end;
end.
