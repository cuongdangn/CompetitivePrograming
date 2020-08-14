var     n       :       longint;
        c       :       char;
        i,j     :       longint;
        b,kq    :       ansistring;
        a       :       array[1..1000] of longint;
begin
        readln(n);
        kq:='';
        for i:=1 to n do
         begin
          read(c);kq:=kq+c;
          a[i]:=ord(c)-48;
         end;
        ////;

        for i:=0 to 9 do
         begin
           b:='';
           for j:=1 to n do
            b:=b+chr((a[j]+i)mod 10+48);
           if kq>b then kq:=b;
           for j:=1 to n do
            begin
             b:=b[n]+b;
             delete(b,n+1,1);
             if kq>b then kq:=b;
            end;
         end;
         write(kq);
end.
