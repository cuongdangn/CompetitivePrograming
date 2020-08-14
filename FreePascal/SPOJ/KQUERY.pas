const   finp    =       'KQUERY.INP';
        fout    =       'KQUERY.OUT';
type    bg      =       record
        l       :       byte;
        gt,cs   :       longint;
        end;
var     g,f     :       text;
        n,q     :       longint;
        a       :       array[0..230001] of bg;
        d,c     :       array[0..200000] of longint;
        bit,res     :       array[1..40000] of longint;
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
                begin
                        read(f,a[i].gt);
                        a[i].cs:=i;
                        a[i].l:=0;
                end;
        readln(f);
        read(f,q);
        for i:=1 to q do
                begin
                        readln(f,d[i],c[i],a[i+N].gt);
                        a[n+i].cs:=i;
                        a[n+i].l:=1;
                end;
end;
procedure       QS(l,h:longint);
var     i,j,x,x1   :       longint;
        tg      :  bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2].gt;
        x1:=a[(l+h)div 2].l;
        repeat
             while (a[i].gt<x)or((a[i].gt=x)and(a[i].l<x1)) do inc(i);
             while (a[j].gt>x)or((a[j].gt=x)and(a[j].l>x1)) do dec(j);
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
function        get(u:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while u>0 do
                begin
                        tg:=tg+bit[u];
                        u:=u- u and (-u);
                end;
        exit(tg);
end;
procedure       update(i:longint);
begin
        while i<=n do
                begin
                        bit[i]:=bit[i]+1;
                        i:=i+i and (-i);
                end;
end;
procedure       xuly;
var     l,r,i:longint;

begin
        QS(1,n+q);
        for i:=1 to n+q do
        if a[i].l=1 then
                begin
                        if d[a[i].cs]-1=0 then l:=0 else l:=get(d[a[i].cs]-1);
                        r:=get(c[a[i].cs]);
                        res[a[i].cs]:=c[a[i].cs]-d[a[i].cs]+1-(r-l);
                end
        else update(a[i].cs);
        for i:=1 to q do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

