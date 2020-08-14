const   finp    =       '';
        fout    =       '';
        base    =       trunc(1e9)+7;
var     g,f     :       text;
        n,m,k   :       longint;
        a       :       array[1..50000] of char;
        b       :       array[1..50000] of longint;
        hash,lt :       array[0..50000] of longint;
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
        for i:=1 to n do read(f,a[i]);
end;
procedure       init;
var     i,j     :       longint;
begin
        hash[0]:=0;
        for i:=1 to n do
         hash[i]:=(int64(hash[i-1])*26 mod base+ord(a[i])-48) mod base;
         lt[0]:=1;
         for i:=1 to n do
          lt[i]:=int64(lt[i-1])*26 mod base
end;
function        tinh(i,j:longint):longint;
begin
        exit((hash[j]-int64(hash[i-1])*int64(lt[j-i+1]) mod base+base)mod base);
end;
procedure       QS(l,h:longint);
var     tg,x    :       longint;
        i,j     :       longint;
begin
        i:=l;
        j:=h;
        x:=b[random(h-l+1)+l];
        repeat
                while b[i]<x do inc(i);
                while b[j]>x do dec(j);
                if i<=j then
                 begin
                   tg:=b[i];
                   b[i]:=b[j];
                   b[j]:=tg;
                   inc(i);
                   dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       tao(x:longint);
var     i       :       longint;
begin
        m:=0;
        for i:=1 to n-x+1 do
          b[i]:=tinh(i,i+x-1);
        m:=n-x+1;
end;
function        ktra(x:longint):boolean;
var     t,i     :       longint;
begin
        tao(x);
        QS(1,m);
        t:=1;
        for i:=2 to m do
         if b[i]=b[i-1] then inc(t)
         else
           begin
             if t>=k then exit(true);
             t:=1;
           end;
        exit(t>=k);
end;
procedure       xuly;
var     dau,cuoi,giua,luu:  longint;
begin
        init;
        dau:=1;
        luu:=0;
        cuoi:=n;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          if ktra(giua) then
           begin
             luu:=giua;
             dau:=giua+1;
           end
          else cuoi:=giua-1;
         end;
         writeln(g,luu);
end;
begin
        mo;
        doc;
        randomize;
        xuly;
        dong;
end.
