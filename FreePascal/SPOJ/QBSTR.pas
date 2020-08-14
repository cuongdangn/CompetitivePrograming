var     a,b,p:ansistring;
        l:array[0..2000,0..2000] of longint;
        i,j     :longint;
function        max(a,b:longint):longint;
begin
        max:=(abs(a-b)+a+b) div 2;
end;
begin
        fillchar(l,sizeof(l),0);
        readln(a);               b:='';
        for i:=length(a) downto 1 do  b:=b+a[i];
        for i:=1 to length(a) do
                for j:=1 to length(b) do
                 begin
                       if a[i]=b[j] then l[i,j]:=l[i-1,j-1]+1 else
                       l[i,j]:=max(l[i,j-1],l[i-1,j]);
                 end;
        while (i>0) and (j>0)  do
        if a[i]=b[j]  then
                begin
                        p:=a[i]+p;
                        dec(i);
                        dec(j);
                end
                else if l[i,j]=l[i,j-1] then dec(j) else dec(i);
        writeln(p);
end.