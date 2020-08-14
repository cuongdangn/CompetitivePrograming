var     d,A:array[0..10000001] of int64;
        i,t,j       :       longint;
begin
        a[0]:=0;
        a[1]:=1;
        for i:=1 to 5000000 do
        begin
             a[i*2]:=a[i];
             a[2*i+1]:=a[i]+a[i+1];
        end;
        d[1]:=1;
        for i:=2 to 10000000 do
         // if a[i]=1 then writeln(a[i],' ',i)
          //else writeln(a[i]);
        if  a[i]>d[i-1] then begin d[i]:=a[i];writeln(i,' ',a[i]);inc(t); end else d[i]:=d[i-1];
       writeln(d[i],' ',t);
end.
