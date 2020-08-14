const   finp    =       '';
        fout    =       '';
        maxn    =       100001;
        du      =       1000000007;

type    bg      =       record
        num,le  :       longint;
        end;
        bg1     =       record
        gt,cs    :       longint;
        end;
var     g,f     :       text;
        n,dd,sl       :       longint;
        a       :       array[0..100001] of bg1;
        t    :       array[1..100001] of bg;
        b       :       array[1..100001] of longint;
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
        tg      :    bg1;
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
        until           i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var     i     :longint;
        k     : longint;
begin
        readln(f,n);
        k:=1;
        for i:=1 to n do
        begin
        read(f,a[i].gt);
        a[i].cs:=i;
        end;
        QS(1,n);
        for i:=1 to n do
        begin
                if (i<>1) then
                 if a[i].gt>a[i-1].gt then inc(k);
                 b[a[i].cs]:=k;
        end;
end;
procedure        update(i,v,u:longint);
begin
        while i<=maxn do
                begin
                 if t[i].le<u then
                 begin
                 t[i].le:=u mod du;
                 t[i].num:=v mod du;
                 end
                 else
                 if t[i].le=u then
                        begin
                                t[i].le:=u mod du;
                                t[i].num:=(t[i].num+v)mod du;
                        end
                        else
                 break;
                 i:=i+i and (-i);
                end;
end;
procedure        get(i:longint);
begin
        sl:=0;
        dd:=0;
        while i>0 do
                begin
                        if dd<t[i].le then
                                begin
                                        dd:=t[i].le mod du;
                                        sl:=t[i].num mod du;
                                end
                        else if t[i].le=dd then sl:=(t[i].num+sl)mod du;
                        i:=i-i and (-i)
                 end;
end;
procedure       xuly;
var     i:longint;
begin
        for i:=1 to n do
         begin
              get(b[i]-1);
              if sl=0 then sl:=1;
              update(b[i],sl,dd+1);
         end;
         get(maxn);
         writeln(g,sl);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.





