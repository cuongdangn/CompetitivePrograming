const   finp    =       'COVER.INP';
        fout    =       'COVER.OUT';
type    bg1     =       record
        l,gt    :       longint;
        end;
var     g,f     :       text;
        dd      :       array[1..200010] of boolean;
        kq,n      :       longint;
        loai    :       array[1..2] of longint;
        b       :       array[1..200010] of bg1;
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
var     i,x,y     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
         readln(f,x,y);
          b[i].gt:=x;
          b[i].l:=1;
          b[i+n].gt:=y;
          b[i+n].l:=2;
         end;
end;
procedure       QS(l,h  :       longint);
var     y,i,j,x,t      :       longint;
        tg      :       bg1;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t].gt;
        y:=b[t].l;
        repeat
                while (b[i].gt<x)or((b[i].l<y)and(b[i].gt=x)) do inc(i);
                while (b[j].gt>x)or((b[j].l>y)and(b[j].gt=x)) do dec(j);
                if i<=j then
                        begin
                                tg:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j,bd,cu     :       longint;
begin
        for i:=1 to n do
         begin

         end;
        randomize;
        QS(1,2*n);
        fillchar(dd,sizeof(dd),true);
        for i:=1 to 2*n do
         if dd[i] then
         begin
          bd:=b[i].gt;
          loai[1]:=1;
          loai[2]:=0;
          for j:=i+1 to 2*n do
           begin
            dd[j]:=false;
            inc(loai[b[j].l]);
            if loai[1]=loai[2] then begin cu:=b[j].gt;break end;
           end;
           kq:=kq+cu-bd;
          end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.