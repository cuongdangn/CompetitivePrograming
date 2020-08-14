uses    math;
const   finp    =       'ANTS.INP';
        fout    =       'ANTS.OUT';
type    bg      =       record
        lo,cs :       longint;
        l       :     int64;
        end;
var     g,f     :       text;
        n       :       longint;
        kq1,d   :       int64;
        a,b     :       array[1..1000010] of bg;
        kq      :       array[1..1000010] of int64;

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
        readln(f,n,d);
        for i:=1 to n do
         begin
          read(f,a[i].l);
          if a[i].l<0 then begin a[i].lo:=0;a[i].l:=abs(a[i].l) end
          else a[i].lo:=1;
          a[i].cs:=i;
         end;
end;
procedure       QS(l,h  :       longint);
var     i,j,t      :       longint;
        tg      :      bg;
        x       :      int64;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].l;
        repeat
                while a[i].l<x do inc(i);
                while a[j].l>x do dec(j);
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
procedure       xuly;
var     i,j,ht,tiep     :       longint;
begin
        randomize;
        QS(1,n);
        ht:=1;
        b:=a;
        kq1:=0;
        for i:=1 to n do
         begin
          if b[i].lo=0 then
          begin
           kq1:=max(kq1,b[i].l);
           ht:=i+1;
          end
            else
             begin
              tiep:=-1;
              for j:=ht to n do
               if b[j].lo=0 then begin tiep:=j;break end;
              if tiep=-1 then break;
              kq1:=max(kq1,b[tiep].l);
              b[tiep].lo:=1;
              ht:=tiep+1;
             end;
         end;
        /////////
        ht:=n;
        for i:=n downto 1 do
         begin
          if a[i].lo=1 then
          begin
           kq1:=max(kq1,d-a[i].l);
           ht:=i-1;
          end
            else
             begin
              tiep:=-1;
              for j:=ht downto 1 do
               if a[j].lo=1 then begin tiep:=j;break end;
              if tiep=-1 then break;
              kq1:=max(kq1,d-a[tiep].l);
              a[tiep].lo:=0;
              ht:=tiep-1;
             end;
         end;
        writeln(g,kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
