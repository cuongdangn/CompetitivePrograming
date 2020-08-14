const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,cs    :       longint;
        end;
var     g,f     :       text;
        d,ke,l,res1      :       array[0..100000] of longint;
        a       :array[0..100000] of bg;
        n,kq1,kq       :       longint;
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
                        read(f,l[i]);
        for i:=1 to n do
              begin
                read(f,ke[i]);
                a[i].x:=ke[i];
                a[i].cs:=i;
                inc(d[ke[i]]);
              end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x        :       longint;
        tg      :    bg;
begin
        i:=l;
        j:=h;
        x:=a[(L+h) div 2].x;
        repeat
                while a[i].x<x do inc(i);
                while a[j].x>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>J;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j,res       :longint;
begin
        l[0]:=1;
        ke[0]:=0;
        QS(1,n);
        for i:=2 to n do
                begin
                        if a[i].x=a[i-1].x then
                              begin
                                ke[a[i].cs]:=0;
                                ke[a[i-1].cs]:=0;
                              end;
                end;
        for i:=1 to n do
                if l[i]=1 then
                        begin
                                res:=1;
                                j:=ke[i];
                                while l[j]=0 do
                                        begin
                                               inc(res);
                                               j:=ke[j];
                                        end;
                                if kq<res then
                                        begin
                                                kq:=res;
                                                kq1:=i;
                                        end;
                        end;
        writeln(g,kq);
        j:=0;
        while kq>0 do
                begin
                        inc(j);
                        res1[j]:=kq1;
                        kq1:=ke[kq1];
                        dec(kq);
                end;
        for i:=j downto 1 do  write(g,res1[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
