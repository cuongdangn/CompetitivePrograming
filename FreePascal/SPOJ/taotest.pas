const   fout    =       'DNC.inp';
        a       :array[0..1] of char=('.','#');
var     g       :       text;
        m,n,i,j,u,v    :       longint;
begin
        randomize;
        assign(g,fout);
        rewrite(g);
        n:=random(16)+1;
        writeln(g,n);
        for i:=1 to n do write(g,random(15007)-random(15007),' ');
        writeln(g);
        writeln(g,1);
        writeln(g,1,' ',n-random(n-2));
        close(g);
end.
