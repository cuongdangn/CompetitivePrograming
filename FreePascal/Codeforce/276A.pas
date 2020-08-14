var     a,m :       int64;
        dd      :       array[0..100001] of byte;
begin
        readln(a,m);
        while dd[a mod m]=0 do
         begin
          dd[a mod m]:=1;
          if a mod m=0 then break;
          a:=(a+a mod m)mod m;
         end;
         if dd[0]=1 then writeln('Yes')
         else writeln('No');
end.

