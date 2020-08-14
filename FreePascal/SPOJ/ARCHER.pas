uses    math;
const   finp    =       'ARCHER.INP';
        fout    =       'ARCHER.OUT';
        eps     =       1e-9;
type    bg1     =       record
        x,y     :       double;
        end;
        bg      =       record
        x,y,z   :       longint;
        end;
var     g,f     :       text;
        n,m,kq  :       longint;
        a       :       array[1..2010] of bg;
        b       :       array[1..2010] of bg1;
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
         readln(f,a[i].x,a[i].y,a[i].z);
end;
procedure       QS(l,h:longint);
var     t,i,j     :       longint;
        x,y     :       double;
        tg      :       bg1;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t].x;
        y:=b[t].y;
        repeat
         while (b[i].x<x)or((abs(b[i].x-x)<=eps)and(b[i].y<y)) do inc(i);
         while (b[j].x>x)or((abs(b[j].x-x)<=eps)and(b[j].y>y)) do dec(j);
         if i<=j then
          begin
            tg:=b[i];
            b[i]:=b[j];
            b[j]:=tg;
            inc(i);dec(j);
          end;
         until i>j;
        if i<h then QS(i,h);
        if j>l then Qs(l,j);
end;
procedure       xuly;
var     i,j,k,dem,m,luu,x,y,z   :       longint;
begin
        kq:=1;
        randomize;
        for i:=1 to n-1 do
         begin
          dem:=1;
          m:=0;
          for j:=i+1 to n do
           begin
            x:=a[i].x-a[j].x;
            y:=a[i].y-a[j].y;
            z:=a[i].z-a[j].z;
            if (x=0)and(y=0)and(z=0) then inc(dem)
            else if z<>0 then
              begin
                inc(m);
                b[m].x:=x/z;
                b[m].y:=y/z;
              end;
           end;
           luu:=0;
          if m>0 then
          begin
                QS(1,m);
                k:=1;
                for j:=2 to m do
                 if (abs(b[j].x-b[j-1].x)<=eps)and(abs(b[j].y-b[j-1].y)<=eps) then
                  inc(k)
                 else
                  begin
                   luu:=max(luu,k);
                   k:=1;
                  end;
                 luu:=max(luu,k);

          end;
          kq:=max(kq,luu+dem);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.