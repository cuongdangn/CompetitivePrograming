var     a:array[0..500000] of int64;
        b:array[0..100000000] of byte;
        i:longint;
begin
        a[0]:=0;
        fillchar(b,sizeof(b),0);
        b[0]:=1;
        for i:=1 to 500000 do
        begin
                if (a[i-1]-i>0)and(b[a[i-1]-i]=0) then
                begin
                b[a[i-1]-i]:=1;
                a[i]:=a[i-1]-i
                end
                else
                begin
                b[a[i-1]+i]:=1;
                a[i]:=a[i-1]+i;
                end;
        end;
        readln(i);
        while (i<>-1) do
            begin
                writeln(a[i]);
                readln(i);
            end;
end.
