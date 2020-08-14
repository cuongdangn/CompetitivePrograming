type mas=array[1..1001] of byte;
type r=record
    x,y:longint;
    end;
type mas1=array[1..1000000] of r;
var s:mas;
    A:mas1;
    x0,y0,k,n,i,j:integer;
begin
    k:=0;
    read(n,x0,y0);
    for i:=1 to n do
        s[i]:=1;
    for i:=1 to n do
        read(A[i].x,A[i].y);
    for i:=1 to n do
        if s[i]<>0 then begin
                    inc(k);
                    for j:=1 to n do
                        if (A[j].x-x0)*(y0-A[i].y)=(x0-A[i].x)*(A[j].y-y0) then s[j]:=0;
                    end;
    writeln(k);
end.
