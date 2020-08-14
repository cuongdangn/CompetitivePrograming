const   finp    =       'NEAREST.INP';
        fout    =       'NEAREST.OUT';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..1000000] of longint;

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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
         read(f,a[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,tg,x        :longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
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
        until   i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,kc,j,kq       :       longint;
begin
        QS(1,n);
        j:=1;
        kq:=1;
        kc:=maxlongint;
        for i:=2 to n do
          begin
                if a[i]-a[i-1]<kc then
                        begin
                                kc:=a[i]-a[i-1];
                                kq:=1;
                        end
                else if a[i]-a[i-1]=kc then inc(kq);
          end;
          writeln(g,kc,' ',kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

