var     a2,a1:real;
        i,n       :       integer;
function        max(a,b:real):real;
begin
        if a>b then exit(a)
        else exit(b);
end;
begin
        readln(n,a1);
        for i:=3 to n do a2:=max(a2,((i-2)*a1-(i-1)*(i-2))/(i-1));
        writeln((i-1)*a2-((i-2)*a1-(i-1)*(i-2)):0:2);


end.
