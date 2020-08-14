var     n,i   :   longint;
        c   :   char;
        ok  :   boolean;
        dd  :   array['A'..'z'] of boolean;
begin
        readln(n);

        for i:=1 to n do
         begin
          read(c);
          dd[c]:=true;
         end;
         ok:=true;
        for c:='A' to 'Z' do
         if (not dd[c])and(not dd[chr(ord(c)+32)]) then ok:=false;
         if ok then writeln('YES')
         else writeln('NO');
end.
