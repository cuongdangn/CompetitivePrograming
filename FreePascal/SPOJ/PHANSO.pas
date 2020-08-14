CONST   finp    =       'PHANSO.INP';
        fout    =       'PHANSO.OUT';
var     g,f     :       text;
        n       :       longint;
        r,s     :       int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
Function GetBit(k,x:longint):Byte;
Begin
        GetBit := (x Shr (k-1)) and 1;
End;
procedure       xuly;
var     h,i,j       :       longint;
begin
        readln(f,n);
        n:=n+1;
        h:=trunc(ln(n)/ln(2));
        r:=1;
        s:=1;
        for i:=h downto 1 do
                begin
                   j:=getbit(i,n);
                   if j=1 then r:=r+s else s:=r+s;
                end;
        write(g,r,' ',s);
end;
begin
        mo;
        xuly;
        dong;
end.

