uses    math;
const   finp    =       'LSEQ.INP';
        fout    =       'LSEQ.OUT';
var     g,f     :       text;
        m,n,kq,so0       :       longint;
        a,b       :       array[0..1000010] of longint;
        dd      :       array[-1000000..1000000] of byte;

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
        for i:=1 to n do
         read(f,a[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
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
function        chat(x,i:longint):longint;
var     dau,cuoi,luu,giua       :       longint;
begin
        dau:=1;
        cuoi:=i;
        luu:=0;
        while dau<=cuoi do
         begin
           giua:=(dau+cuoi) div 2;
           if b[giua]<x then dau:=giua+1
           else
            begin
             luu:=giua;
             cuoi:=giua-1;
            end;
         end;
         exit(luu);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n do
         if a[i]=0 then
           inc(so0)
         else if dd[a[i]]=0 then
          begin
           dd[a[i]]:=1;
           inc(m);
           b[m]:=a[i];
          end;
         for i:=1 to m do
          b[i]:=b[i]-i;
        /////
        kq:=so0;
        for i:=1 to m do
         begin
          j:=chat(b[i]-so0,i-1);
          if j=0 then kq:=max(so0+1,kq) else kq:=max(kq,b[i]+i-(b[j]+j)+1+so0-(b[i]-b[j]));
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
