const   finp    =       '';
        fout    =       '';
        mn      =       100101;
type    bg      =       record
        cs,lo   :       longint;
        gt      :       int64;
        end;
var     g,f     :       text;
        a1      :       array[0..3*mn] of bg;
        t       :       array[0..3*mn+1] of longint;
        a,b,c :       array[0..mn] of longint;
        n,l,r   :       longint;
        kq1:	int64;
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
var     i,j      :       longint;
        x       :       int64;
        tg      :  bg;
begin
        i:=l;
        j:=h;
        x:=a1[(l+h)div 2].gt;
        repeat
                while a1[i].gt<x do inc(i);
                while a1[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a1[i];
                                a1[i]:=a1[j];
                                a1[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var     i ,k      :       longint;
begin
        readln(f,n,l,r);
        for i:=1 to n do
                begin
                        read(f,k);
                        a1[i].gt:=a1[i-1].gt+k;
                        if (a1[i].gt>=l)and(a1[i].gt<=r) then inc(kq1);
                        a1[i].cs:=i;
                        a1[i].lo:=1;
                end;
end;
procedure       kt;
var     i,k:      longint;
begin
        k:=1;
        for i:=1 to n do
                begin
                        a1[n+i].gt:=a1[i].gt+l;
                        a1[n+i].cs:=i;
                        a1[n+i].lo:=2;
                        a1[2*n+i].gt:=a1[i].gt+r;
                        a1[2*n+i].cs:=i;
                        a1[2*n+i].lo:=3;
                end;
        QS(1,n*3);
        a1[0].gt:=a1[1].gt;
        for i:=1 to n*3 do
                begin
                        if a1[i].gt<>a1[i-1].gt then inc(k);
                        if a1[i].lo=1 then a[a1[i].cs]:=k;
                         if a1[i].lo=2 then b[a1[i].cs]:=k;
                          if a1[i].lo=3 then c[a1[i].cs]:=k;
                end;
end;

procedure update(i:longint);
begin
while (i<=3*mn) do
  begin
  T[i]:=T[i]+1;
  i:=i+i and(-i);
  end;
end;

function get(i:longint):longint;
var V:longint;
begin
v:=0;
while i>0 do
  begin
  V:=V+T[i];
  i:=i-i and (-i);
  end;
  get:=V;
end;
procedure       xuly;
var     i       :       longint;
        q,p      :       longint;
        kq	:	int64;
begin
        kq:=0;
        update(a[n]);
        for i:=n-1 downto 1 do
                       begin
                        p:=get(b[i]-1);
                        q:=get(c[i]);
                        kq:=kq+q-p;
                        update(a[i]);
                        end;

        writeln(g,kq+kq1);
end;
begin
        mo;
        doc;
        kt;
        xuly;
        dong;
end.






