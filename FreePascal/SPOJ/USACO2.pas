uses    math;
const   finp    =       'milktemp.in';
        fout    =       'milktemp.out';
type    re      =       record
        gt,cs,l      :       longint;
        end;
var     g,f     :       text;
        a       :       array[0..50000] of re;
        b       :       array[0..50000,1..2] of longint;
        res     :       array[0..60000] of longint;
        n,x,y,z,ma,kq      :       longint;
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
        readln(f,n,x,y,z);
        for i:=1 to n do
        begin
                readln(f,a[i].gt,a[i+n].gt);
                a[i].l:=1;
                a[i+n].l:=2;
                a[i].cs:=i;
                a[i+n].cs:=i;
        end;
end;
procedure       QS(l,h:longint);
var     i,j,x        :       longint;
        tg      :    re;
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
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,k       :       longint;
begin
        QS(1,2*n);
        a[0]:=a[1];
        k:=1;
        for i:=1 to 2*n do
         begin
          if (a[i].gt<>a[i-1].gt) then inc(k);
                b[a[i].cs,a[i].l]:=k;
                ma:=max(ma,k);
         end;
end;
procedure       xuly;
var     i,da,cu       :       longint;
begin
        init;
        for i:=1 to n do
         begin
             da:=b[i,1];
             cu:=b[i,2];
             res[da]:=res[da]+y;
             res[cu+1]:=res[cu+1]-y;
                  res[1]:=res[1]+x;
                  res[da]:=res[da]-x;
                  res[cu+1]:=res[cu+1]+z;
                  res[ma+1]:=res[ma+1]-z;
         end;
         for i:=1 to ma+1 do
                begin
                        res[i]:=res[i]+res[i-1];
                        kq:=max(kq,res[i]);
                end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
