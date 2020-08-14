const   finp    =       '';
        fout    =       '';
        base    =       790972;
var     g,f     :       text;
        n,k     :       longint;
        a,b     :       array[1..100000] of longint;
        d       :       array[0..50] of longint;
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
var     i,j     :       longint;
begin
        readln(f,n,k);
        for i:=1 to n do
         readln(f,a[i],b[i]);
end;
function        tinh(l,h:longint):longint;
var     i,j     :       longint;
begin
        for i:=1 to k do d[i]:=0;
        d[0]:=1;
        for i:=l to h do
          for j:=k downto 1 do d[j]:=(int64(d[j])+int64(a[i])*int64(d[j-1])) mod base;
        exit(d[k]);
end;
procedure       swap(var a,b    :       longint);
var     tg      :       longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QS(l,h  :       longint);
var     t,x,i,j         :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t];
        repeat
                while b[i]<x do inc(i);
                while b[j]>x do dec(j);
                if i<=j then
                 begin
                  swap(a[i],a[j]);
                  swap(b[i],b[j]);
                  inc(i);
                  dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       xuly;
var     i,dau,dem     :       longint;
begin
        dem:=tinh(1,n);
        randomize;
        QS(1,n);
        dau:=1;
        for i:=2 to n do
         if b[i]<>b[i-1] then
          begin
           if i-dau>=k then dem:=(dem-tinh(dau,i-1)+base)mod base;
           dau:=i;
          end;
           if i-dau+1>=k then dem:=(dem-tinh(dau,i)+base)mod base;
         writeln(g,dem);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

