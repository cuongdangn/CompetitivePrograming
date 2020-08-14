const           MAX             =100000;
                fi              ='SEQ.INP';
                fo              ='SEQ.OUT';

var             a,sum           :array[0..MAX]of int64;
                L,R,n           :longint;
                res             :int64;

procedure docf;
var f   :text;
    i   :longint;
 begin
   assign(f,fi); reset(f);
   readln(f,n, L, R);
   for i:=1 to n do read(f,a[i]);

   fillchar(sum,sizeof(sum),0);
   for i:=1 to n do sum[i]:=sum[i-1]+a[i];
   close(f);
   writeln(sum[n]);
 end;

procedure qs(dau,cuoi:longint);
var i,j :longint;
    t,k :int64;
 begin
   i:=dau; j:=cuoi;
   k:=sum[(i+j) div 2];

   repeat
      while sum[i]<k do inc(i);
      while sum[j]>k do dec(j);

      if i<=j then begin
         t:=sum[i]; sum[i]:=sum[j]; sum[j]:=t;
         inc(i); dec(j);
      end;
   until i>j;
   if dau<j then qs(dau,j);
   if i<cuoi then qs(i,cuoi);
 end;

function tinh(C :longint):int64;
var i,j       :longint;
    count     :int64;
 begin
    count:=0;
    j:=0;
    for i:=0 to n do begin
       while (j<n)and(sum[j+1]<=sum[i]+C) do inc(j);
       count:=count + j-i;
    end;
    tinh:=count;
 end;

procedure ghikq;
var f   :text;
 begin
   assign(f,fo); rewrite(f);
   writeln(f,res);
   close(f);
 end;

BEGIN
  docf;

  qs(0,n);

  if L=0 then res:=tinh(R)
  else res:=tinh(R)-tinh(L-1);

  ghikq;
END.
