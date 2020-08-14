uses    math;
const   fout    =       'test1\abc.INP';
var     g       :text;
        i,j     :       longint;
        n,k,m     :       longint;
        t       : int64;
        d       : array[1..100000] of longint;

begin
        assign(g,fout);
        rewrite(g);
        randomize;
          n:=100000;
          writeln(g,n);
          i:=0;


          for i:=2 to n do
            writeln(g,i,' ',random(i-1)+1,' ',10000);
          for i:=1 to n do
           begin
              {  k:=random(n)+1;}
              k:=i;
                if d[k]=0 then begin d[k]:=1;inc(m); end
           end;
           writeln(g);
           writeln(g,m);
           for i:=1 to n do
           if d[i]=1 then write(g,i,' ');


         close(g);
end.
