uses    math;
var
        n,m,i2,j,res,min1:longint;
        k,i       :       byte;
        s: ansistring;
        s2:array[1..1001] of char;
begin
        readln(n,m,k);
        readln(s);
        s:=s+s;
        res:=1001;
        for i:=1 to k do
                begin
                readln(s2);
                for i2:=1 to n do
                        begin
                        min1:=0;
                        for j:=1 to m do
                                begin
                                if s2[j]<>s[i2+j-1] then min1:=min1+1;
                                if min1>res then break;
                                end;
                                res:=min(res,min1);
                        end;
                end;
        write(res);
end.


