const   fout    =       'thuyenbien.inp';
var     i,j     :       longint;
        g       :       text;
        n,m,k,m1,n1,y1,x1       :       longint;
        ok      :       boolean;
        a       :   array[0..250,0..100] of longint;
begin
        assign(g,fout);
        rewrite(g);
        randomize;
        m:=200;
        n:=100;
        writeln(g,m,' ',n);
        for k:=1 to 20 do
         begin
                m1:=random(m div 10)+1;
                n1:=random(n div 10)+1;
                ok:=true;

                x1:=random(m-m1)+1;
                y1:=random(n-n1)+1;

                for i:=x1-1 to x1+m1 do
                 for j:=y1-1 to y1+n1 do
                  if a[i,j]=1 then ok:=false;

                if ok then
                 for i:=x1 to x1+m1-1 do
                   for j:=y1 to y1+n1-1 do
                    a[i,j]:=1;

         end;
         for i:=1 to m do
          begin
           for j:=1 to n do write(g,a[i,j],' ');
           writeln(g);
          end;


        close(g);
end.
