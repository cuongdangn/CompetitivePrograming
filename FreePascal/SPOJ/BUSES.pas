const   finp    =       'BUSES.INP';
        fout    =       'BUSES.OUT';
type    bg      =       record
        gt,l,cs :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        m       :       longint;
        a,b,sc,tong     :       array[-1 ..100010] of longint;
        c       :       array[1..100010] of bg;
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
        readln(f,n,m);
        for i:=1 to m do
         readln(f,a[i],b[i]);
end;
procedure       QS1(l,h  :       longint);
var     i,j,tg     :       longint;
        x,t       :       longint;
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
           tg:=b[i];
           b[i]:=b[j];
           b[j]:=tg;
           tg:=a[i];
           a[i]:=a[j];
           a[j]:=tg;
           inc(i);dec(j);
          end;
        until i>j;
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;
procedure       QS(l,h  :       longint);
var     i,j     :       longint;
        x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=c[t].gt;
        repeat
         while c[i].gt<x do inc(i);
         while c[j].gt>x do dec(j);
         if i<=j then
          begin
           tg:=c[i];
           c[i]:=c[j];
           c[j]:=tg;
           inc(i);dec(j);
          end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function       chat(x,n:longint):longint;
var     dau,cuoi,luu,giua       :       longint;
begin
        dau:=-1;
        cuoi:=n;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          if b[giua]<x then
           begin
            luu:=giua;
            dau:=giua+1;
           end
          else cuoi:=giua-1;
         end;
         exit(luu);
end;
procedure       init;
var     i,j,k,tt     :       longint;
        new1    : int64;
begin
        for i:=1 to m do
         begin
          c[i].gt:=a[i];
          c[i].l:=1;
          c[i].cs:=i;
          c[i+m].gt:=b[i];
          c[i+m].l:=2;
          c[i+m].cs:=i;
         end;
         ///
         randomize;
         QS(1,2*m);
         k:=1;
         if c[1].l=1 then a[c[1].cs]:=1
         else b[c[1].cs]:=1;
         for i:=2 to 2*m do
          begin
           if c[i].gt<>c[i-1].gt then inc(k);
           if c[i].l=1 then a[c[i].cs]:=k
           else b[c[i].cs]:=k;
          end;
          n:=k;

          QS1(1,m);
          sc[1]:=1;
          tong[1]:=1;
          b[0]:=1;
          tt:=0;
          for i:=1 to m do
           begin
            j:=chat(a[i],i);
            new1:=(tong[b[tt]]-tong[b[j]]);
            sc[b[i]]:=sc[b[i]]+new1;
            tong[b[i]]:=tong[b[i]]+new1;
            if b[i]<>b[i+1] then begin tong[b[i]]:=tong[b[tt]]+tong[b[i]];tt:=i; end;
           end;
         writeln(g,sc[n]);

end;
procedure       trau;
var     i,j     :       longint;
        sc      :       array[0..1000] of longint;
begin

        fillchar(sc,sizeof(sc),0);
           sc[0]:=1;
         QS1(1,m);
          sc[0]:=1;
          for i:=1 to m do
           begin
            for j:=b[i]-1 downto a[i] do
             sc[b[i]]:=sc[b[i]]+sc[j];
           end;
         writeln(g,sc[n]);

end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        {sc[1]:=1;
        for i:=1 to m do
          sc[b[i]]:=sc[a[i]]+sc[b[i]];
        writeln(g,sc[n]); }
end;
begin
        mo;
        doc;
        xuly;
        //trau;
        dong;
end.
