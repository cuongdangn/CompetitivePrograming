 const   finp    =       'DNC.INP';
        fout    =       '';
type    re      =       record
        cs,gt,l   :       longint;
        end;
var     g,f     :       text;
        a,dd,dc,res       :       array[0..230001] of longint;
        tr,lu,bit,c      :     array[0..1000000] of longint;
        b       :array[0..230100] of re;
        n,q     :       longint;
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
        readln(f);
        readln(f,q);
        for i:=1 to q do
        readln(f,dd[i],dc[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,x,x1      :       longint;
        tg      :       re;
begin
        i:=l;
        j:=h;
        x:=b[(l+h)div 2].gt;
        x1:=b[(l+h) div 2].l;
        repeat
                while (b[i].gt<x)or((b[i].l>x1)and(b[i].gt=x)) do inc(i);
                while (b[j].gt>x)or((b[j].l<x1)and(b[j].gt=x)) do dec(j);
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

procedure       ktao;
var     i       :longint;
begin
        for i:=1 to n do
         begin
          tr[i]:=c[a[i]];
          c[a[i]]:=i;
         end;
         for i:=1 to n do
          begin
             b[i].gt:=tr[i];
             b[i].cs:=i;
             b[i].l:=0;
          end;
         for i:=1 to q do
          begin
             b[i+n].gt:=dd[i];
             b[i+n].cs:=i;
             b[i+n].l:=1;
          end;
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
var     i,t,j       :       longint;
begin
        QS(1,n+q);
        for i:=1 to n+q do
        if b[i].l=0 then update(b[i].cs)
        else
         begin
             t:=get(dd[b[i].cs]-1);
             j:=get(dc[b[i].cs]);
             res[b[i].cs]:=j-t;
         end;
        for i:=1 to q do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        ktao;
        xuly;
        dong;
end.
