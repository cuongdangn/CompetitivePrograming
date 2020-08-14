const   finp    =       'CANDIES.INP';
        fout    =       'CANDIES.OUT';
var     g,f     :       text;
        a       :       array[0..51] of longint;
        kq2,kq1      :       int64;
        k       :       longint;
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
procedure       doc;
var     i:longint;
begin
        readln(f,k);
        for i:=1 to k do read(f,a[i]);
end;
procedure       xuly;
var     i       :longint;
begin
         for i:=k downto 1 do
                        kq1:=a[i]*2+kq1*2+1;
        while (a[k]=0)and(k>=1) do dec(k);
        for i:=k downto 1 do
                        kq2:=a[i]*2+kq2*2-1;
        writeln(g,kq2);
        writeln(g,kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.