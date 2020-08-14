uses    math;
const   fout    =       'DNC.INP';
type    bg      =       record
        x,y     :       longint;
        end;
var     g       :text;
        i,j     :       longint;
        n,k,m     :       longint;
        t,t1       : longint;
        dd       : array[1..1000,1..1000] of longint;
        e       : array[1..100000] of bg;
{procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
              }
begin
        assign(g,fout);
        rewrite(g);
        randomize;
          n:=1000;
          m:=100000;
         {for i:=1 to 1000000 do
          begin
           inc(m);
           if m>100000 then begin dec(m); break; end;
           e[m].x:=random(n)+1;
           e[m].y:=random(n)+1;
           if dd[e[m].x,e[m].y]<>0 then dec(m);
           if m>0 then  dd[e[m].x,e[m].y]:=1;
          end;  }
          writeln(g,n,' ',m,' ',random(n)+1, ' ',1000000);
          m:=0;
          for i:=1 to n do
           for j:=1 to n do
            if i<>j then
             begin
             inc(m);
             if m>100000 then break;
              writeln(g,i,' ',j,' ',random(50)+1);
             end;
        { writeln(g,n,' ',m,' ',random(n)+1, ' ',1000000);
         for i:=1 to m do
          writeln(g,e[i].x,' ',e[i].y,' ',random(100)+1);}
         close(g);
end.
