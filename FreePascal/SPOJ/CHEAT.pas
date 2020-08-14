var     prev,next    :       array[1..100007] of longint;
        i,last,n,ok,val:longint;
begin
        readln(n);
        last:=0;
        ok:=1;
        for i:=1 to n do
        begin
        prev[i]:=i-1;
        next[i]:=i+1;
        end;
        for i:=1 to n do
                begin
                  readln(val);
                  if (val<>prev[last] )and (val<last) then
                        begin
                                ok:=0;
                                break;
                        end;
                  next[prev[val]]:=next[val];
                  prev[ next[val] ]:=prev[val];
                  last:=val;
                end;
        if ok=1 then writeln('NO')
        else writeln('YES');
end.



