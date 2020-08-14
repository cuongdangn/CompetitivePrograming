const   fout    =       'D:\HocTap\FPC\bin\Daythem\ktong\test\test20\ktong.inp';
var     i,j     :       longint;
        g       :       text;
        n,k       :       longint;
begin
        assign(g,fout);
        rewrite(g);
        randomize;
        n:=100000;
        k:=random(10000)+5;
        writeln(g,n,' ',k);
        for i:=1 to n do write(g,random(10000)+3,' ');
        close(g);
end.
