uses    math;
var     s:ansistring;

        k,n,i,j,min1,min2,a1,a2,m1,m2,a11,a12,kq     :       longint;
        d       :   array[1..500005,1..26] of longint;
begin
 readln(n,k);
 read(s);
  for j:=1 to k do
        d[1,j]:=ord(s[1]<>chr(j+64));
        a1:=ord(s[1])-64;
        a2:=2;

  for i:=2 to n do
  begin
   m1:=maxlongint;
   m2:=maxlongint;
   for j:=1 to k do
    begin
        if j<>a1 then d[i,j]:=d[i-1,a1]+ord(s[i]<>chr(j+64))
        else d[i,j]:=d[i-1,a2]+ord(s[i]<>chr(j+64));
        if m1>d[i,j] then
         begin
          m2:=m1;
          a12:=a11;
          m1:=d[i,j];
          a11:=j;
         end
         else if m2>d[i,j] then
          begin
           m2:=d[i,j];
           a12:=j;
          end;
    end;
     a1:=a11;
     a2:=a12;
    end;
    kq:=maxlongint;
    for i:=1 to k do kq:=min(kq,d[n,i]);
    writeln(kq);
  end.





