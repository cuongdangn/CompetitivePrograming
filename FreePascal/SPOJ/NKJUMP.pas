const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a,d       :       array[1..1000] of longint;
        n       :       longint;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       QS(l,h:longint);
var     tg,x,i,j        :       longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
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
        until i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
function        max(a,b,c:longint):longint;
var     t       :       longint;
begin
        t:=0;
        if a>t then t:=a;
        if b>t then t:=b;
        if c>t then t:=c;
max:=t;
end;
procedure       xuly;
var     i,j,x,m     :       longint;
begin
        m:=1;
        for i:=1 to n do d[i]:=1;
        for i:=3 to n do
          begin
                j:=i-1;x:=1;
                while x<j do
                        begin
                               while (x<j) and (a[x]+a[j]<>a[i]) do
                                begin
                                        if a[i]<a[x]+a[j] then dec(j);
                                        if a[i]>a[x]+a[j] then inc(x);
                                end;
                        if  (a[i]=a[x]+a[j])and(x<>j) then
                                 begin
                                        d[i]:=max(d[i],d[x]+1,d[j]+1);
                                        inc(x);
                                        dec(j);
                                 end;
                         end;
                if m<d[i] then m:=d[i];
          end;
          writeln(g,m);
end;
begin
        mo;
        doc;
        QS(1,n);
        xuly;
        dong;
end.
