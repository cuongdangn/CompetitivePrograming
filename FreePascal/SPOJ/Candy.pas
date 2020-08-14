const   finp    =       'Candy.INP';
        fout    =       'Candy.out';
type    bg      =       record
        cs,t,s  :       longint;
        end;
var     g,f     :       text;
        a,b       :       array[1..100000] of bg;
        n,w       :       longint;
        kq,ht,htt       :       array[1..100000] of longint;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
          readln(f,a[i].s,a[i].t);
          a[i].cs:=i;
        end;
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,t    :       longint;
        tg   :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].t;
        repeat
         while a[i].t<x do inc(i);
         while a[j].t>x do dec(j);
         if i<=j then
          begin
             tg:=a[i];
             a[i]:=a[j];
             a[j]:=tg;
             inc(i);dec(j);
          end;
         until i>j;
         if i<h then QS(i,h);
         if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j     :       longint;
        ok      :       boolean;
begin
        randomize;
        b:=a;
        QS(1,n);
        for i:=1 to n do
         begin
          ok:=false;
          for j:=1 to w do
           begin
            if abs(ht[j]-a[i].s)<=(a[i].t-htt[j]) then
             begin
              ht[j]:=a[i].s;
              htt[j]:=a[i].t;
              kq[a[i].cs]:=j;
              ok:=true;
              break;
             end;
           end;
           if not ok then
           begin
            inc(w);
            htt[w]:=a[i].t;
            ht[j]:=a[i].s;
            kq[a[i].cs]:=w;
            end;
         end;
         writeln(g,w);
         for i:=1 to n do
           writeln(g,b[i].s,' ',b[i].t,' ',kq[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
