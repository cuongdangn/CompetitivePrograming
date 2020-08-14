const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
        for i:=1 to n do
         begin
          readln(f,d[i].gt,d[i+n].gt,c[i]);
          d[i].cs:=i;
          d[i].l:=1;
          d[i+n].l:=2;
          d[i+n].cs:=i;
         end;
end;
procedure       QS(l,h:longint);
var     i,j,x        :       longint;
        tg      :    bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=d[t].gt;
        y:=d[t].l;
        repeat
                while (d[i].gt<x)or((d[i].gt=x)and(d[i].l>y)) do inc(i);
                while (d[j].gt>x)or((d[j].gt=x)and(d[j].l<y)) do dec(j);
                if i<=j then
                 begin
                  tg:=d[i];
                  d[i]:=d[j];
                  d[j]:=tg;
                  inc(i);dec(j);
                 end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        QS(1,2*n);
        for i:=1 to 2*n do
          if d[i].l=2 then
           begin
            t:=0;
            for j:=i-1 downto 1 do
             begin
              t:=t+sl[j];
              if d[i].cs=d[j].cs then break;
             end;
             ////////////
            if t<c[d[i].cs] then
             begin
              t:=c[d[i].cs]-t;
              for j:=i-1 downto k do
               begin
                t1:=-sl[j]+(d[j+1].gt-d[j].gt+1);
                if t1>=t then
                 begin
                  sl[j]:=sl[j]+t1-t;
                  t:=0;
                 end
                else
                 begin
                  sl[j]:=sl[j]+t1;
                  t:=t-t1;
                 end;
                 if t=0 then break;
               end;
           end;
           for i:=1 to 2*n-1 do
            kq:=kq+sl[i];
           writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.