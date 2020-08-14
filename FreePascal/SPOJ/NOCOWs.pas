const
        max=1000;
var
        n,p:integer;
        l:array[1..max,1..500] of integer;
procedure qhd;
var
        i,j,k,maxi,maxj:integer;
        t:array[1..500] of integer;

begin
        for i:=1 to p do
                l[1,i]:=1;
        for i:=3 to n do
                if i mod 2=1 then
                begin
                        maxi:=i div 2-1;
                        maxj:=i div 2+1;
                        for k:=1 to maxi do
                                t[k]:=i-k-1;
                        for j:=1 to maxj do
                           begin
                                for k:=1 to maxi do
                                        l[i,j]:=(l[i,j]+l[k,j-1]*l[t[k],j-1]) mod 9901;
                                k:=i div 2;
                                l[i,j]:=(2*l[i,j] + l[k,j-1]*l[k,j-1]) mod 9901;
                           end;
                        for j:=maxj+1 to p do
                           l[i,j]:=l[i,j-1];
                end;
end;

begin
        read(n,p);
        if n mod 2=0 then
                begin
                        write(0);
                        halt;
                end;
        qhd;
        write((l[n,p]-l[n,p-1]+9901)mod 9901)
end.
