const   finp    =       '';
        fout    =       '';
type    bg      =       record
        cs,gt:longint;
        end;
var     g,f     :       text;
        n,k,p     :       longint;
        a       : array[0..100000] of bg;
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
procedure       QS(l,h  :       longint);
var     i,j,x      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2].gt;
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
procedure       doc;
var     i:longint;
        j:int64;
begin
        readln(f,n,k,p);
        for i:=1 to n do
                begin
                    readln(f,j);
                    j:=j mod p;
                    a[i].gt:=(a[i-1].gt+j) mod p;
                    a[i].cs:=i;
                end;
        QS(1,n);
end;
function        chat1(l,h,x,cs:longint):longint;
var     i,j,gi,kq:longint;
begin
        i:=l;
        j:=h;
        kq:=0;
        while i<=j do
                begin
                    gi:=(i+j) div 2;
                    if a[gi].gt<=x then
                        begin
                                if a[gi].cs<cs then kq:=a[i].gt;
                                 i:=gi+1
                        end
                    else j:=gi-1;
                end;
        exit(kq);
end;
procedure        xuly;
var     i       :       longint;
        j,kq:longint;
begin

        kq:=maxlongint;
        for i:=0 to n do
        if a[i].gt>=k then
         begin
              j:=chat1(0,n,a[i].gt-k,a[i].cs);
              if a[i].gt-j<kq then kq:=a[i].gt-j;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
