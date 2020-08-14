const   fout    =       'MEO.INP';
        d       :       array[0..2] of char= ('R','G','W');
var     g       :       text;
        i,n     :       longint;
begin
        assign(g,fout);
        rewrite(g);
        randomize;
        n:=random(10000)+1;
	writeln(g,n,' ',random(10000)+1);
        for i:=1 to n do write(g,d[random(3)]);
        close(g);
end.
