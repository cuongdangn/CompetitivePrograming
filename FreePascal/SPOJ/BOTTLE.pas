const   finp    =       'BOTTLE.INP';
        fout    =       'BOTTLE.OUT';
type    bg      =       record
        gt,cs   :       longint;
        end;
        bg1     =       record
        sl,kc,cs        :       longint;
        end;
var     g,f       :       text;
        n,m       :       longint;
        b      :       array[1..15000] of bg1;
        a       :       array[1..5000] of bg;
        res     :       array[1..5000] of longint;

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
procedure       QS(l,h:longint);
var     i,j,x        :       longint;
        tg      :    bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>J;
 if i<h then QS(i,h);
 if j>l then QS(l,j);
end;
procedure       QS1(l,h:longint);
var     i,j,x        :       longint;
        tg      :    bg1;
begin
        i:=l;
        j:=h;
        x:=b[(l+h) div 2].kc;
        repeat
                while b[i].kc<x do inc(i);
                while b[j].kc>x do dec(j);
                if i<=j then
                        begin
                                tg:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>J;
 if i<h then QS1(i,h);
 if j>l then QS1(l,j);
end;
procedure       doc;
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                   begin
                     readln(f,a[i].gt);
                     a[i].cs:=i;
                   end;
        QS(1,n);
        while not seekeof(f) do
                begin
                        inc(m);
                        readln(f,b[m].kc,b[m].sl);
                        b[m].cs:=m;
                end;
        QS1(1,m);
end;
procedure       xuly;
var     i,j:longint;
begin
        j:=1;
        for i:=1 to n do
                begin
                        while (b[j].kc<a[i].gt) and (j<m) do inc(j);
                        res[a[i].cs]:=b[j].cs;
                        dec(b[j].sl);
                        if b[j].sl=0 then inc(j);
                end;
        for i:=1 to n do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
