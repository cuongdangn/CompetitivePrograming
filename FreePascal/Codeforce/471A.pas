var     a     :  array[1..6]   of  longint;
        sl      :       array[1..9] of longint;
        b       :       array[1..2] of longint;
        chan,i,m  :       longint;
begin
        readln(a[1],a[2],a[3],a[4],a[5],a[6]);
        for i:=1 to 6 do inc(sl[A[I]]);
        for i:=1 to 9 do
          if sl[i]>=4 then chan:=i;
        if chan=0 then begin writeln('Alien');halt; end;
        for i:=1 to 6 do
         if a[i]<>chan then
          begin
           inc(m);
           b[m]:=a[i];
          end;
         if m=0 then begin b[1]:=a[1];b[2]:=a[1] end
         else if m=1 then b[2]:=chan;
         if b[1]=b[2] then writeln('Elephant')
          else writeln('Bear');
end.
