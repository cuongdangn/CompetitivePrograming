var i,j :longint;
        c       :       char;
        dd      :       array['A'..'z'] of longint;
        l1,l2   :       longint;
begin
        dd['Q']:=9;
        dd['q']:=9;
        dd['R']:=5;
        dd['r']:=5;
        dd['b']:=3;
        dd['B']:=3;
        dd['N']:=3;
        dd['n']:=3;
        dd['p']:=1;
        dd['P']:=1;
        for i:=1 to 8 do
        begin
         for j:=1 to 8 do
          begin
                read(c);
                if (c='.') then continue;
                if(ord(c)>=97) then l1:=l1+dd[c]
                else l2:=l2+dd[c];
          end;
          readln;
         end;
         if(l1>l2) then write('Black')
         else if(l1=l2) then write('Draw')
         else write('White');
end.