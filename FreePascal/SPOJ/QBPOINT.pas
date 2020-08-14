const   finp    =       '';
        fout    =       '';
        vc      =       1e19;
        es      =       1e-9;
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f    :       text;
        n       :      longint;
        kq      :      qword;
        a       :      array[1..2001] of bg;
        b       :      array[1..2001] of extended;
        m       :      longint;
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
var     i,j:    longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,a[i].x,a[i].y);
end;
procedure       QS(l,h  :       longint);
var     t,i,j         :       longint;
        tg,x      :       extended;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t];
        repeat
                while b[i]<x do inc(i);
                while b[j]>x do dec(j);
                if i<=j then
                 begin
                  tg:=b[i];
                  b[i]:=b[j];
                  b[j]:=tg;
                  inc(i);
                  dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       xuly;
var     i,j,x,y     :       longint;
        dem     :   qword;
        ht      :   extended;
begin
        for i:=1 to n-1 do
         begin
          m:=0;
          for j:=i+1 to n do
           begin
            inc(m);
            x:=(a[i].x-a[j].x);
            y:=(a[i].y-a[j].y);
            if y=0 then b[m]:=vc
            else b[m]:=x/y;
           end;
           QS(1,m);
          ht:=b[1];
          dem:=1;
          for j:=2 to m do
           if abs(ht-b[j])<=es then
            inc(dem)
           else
            begin
             kq:=dem*(dem-1) div 2+kq;
             dem:=1;
             ht:=b[j];
            end;
            kq:=dem*(dem-1) div 2+kq;

         end;

         writeln(g,kq);
end;
begin
        mo;
        doc;
        randomize;
        xuly;
        dong;
end.
