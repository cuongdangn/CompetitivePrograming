const   fout    =       'AD.INP';
var     g       :       text;
        i,n     :       longint;
begin
        assign(g,fout);
        rewrite(g);
        randomize;
        n:=random(100)+1;
        for i:=1 to n do write(g,char(97+random(25)));
	writeln(g);
         n:=random(100)+1;
        for i:=1 to n do write(g,char(97+random(25)));
        close(g);
end.
