var     g,w     :       array[0..6000] of longint;
        l,i,j,n       :integer;
function        MAX(a,b:longint):longint;
begin
        max:=(abs(a-b)+a+b) div 2;
end;
function       min(a,b:longint):longint;
begin
        min:=(-abs(a-b)+a+b) div 2;
end;
begin
        readln(n,l);
        for i:=1 to n do
         begin
                readln(j);
                w[i]:=w[i-1]+j;
         end;
         for i:=1 to n do
         begin
                g[i]:=maxlongint;
                for j:=i-1 downto 0 do
                begin
                        if w[i]-w[j]>l then break;
                        g[i]:=min(g[i],max(g[j],l-(w[i]-w[j])));
                end;
         end;
        writeln(g[n]);
end.