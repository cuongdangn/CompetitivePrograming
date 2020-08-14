var     i,a,n :       longint;
        sl      :       array[1..100] of longint;
begin
        readln(n);
        for i:=1 to n do
                begin
                        read(a);
                        if a=25 then inc(sl[a])
                        else
                        if a=50 then
                                begin
                                        if sl[25]=0 then
                                                begin
                                                        writeln('NO');
                                                        halt;
                                                end;
                                        dec(sl[25]);
                                        inc(sl[50]);
                                end
                        else
                                begin
                                        if sl[50]=0 then
                                                begin
                                                        if sl[25]<3 then
                                                                begin
                                                                        writeln('NO');
                                                                        halt;
                                                                end
                                                        else
                                                                begin
                                                                        sl[25]:=sl[25]-3;
                                                                        inc(sl[100]);
                                                                end;
                                                end
                                        else
                                                begin
                                                        if sl[25]=0 then
                                                                begin
                                                                        writeln('NO');
                                                                        halt;
                                                                end
                                                        else
                                                                begin
                                                                        inc(sl[100]);
                                                                        dec(sl[25]);
                                                                        dec(sl[50]);
                                                                end
                                                end;

                                end;

                end;
         writeln('YES');

end.







