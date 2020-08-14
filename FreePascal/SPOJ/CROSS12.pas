uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,kq  :       longint;
        a       :       array[0..100001] of char;
        b,r     :       array[0..10001] of longint;
        d,c     :       array[0..100001] of longint;
        dau,cuoi:       longint;
        dq,fx      :       array[1..100001] of longint;
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
        for i:=1 to n do
         read(f,r[i]);
         readln(f);
         for i:=1 to m do read(f,a[i]);
end;
procedure       add1(i:longint);
begin
        while (dau<=cuoi)and(c[dq[cuoi]]>=c[i]) do dec(cuoi);
        inc(cuoi);
        dq[cuoi]:=i;
end;
procedure       xuly1(k:longint);
var    i        :       longint;
begin
        dau:=1;
        cuoi:=0;
        //writeln(k);
        for i:=1 to k do
         if a[i]='1' then
          begin
           c[i]:=maxlongint;
           add1(i);
          end
         else begin c[i]:=1;add1(i) end;
        for i:=k+1 to m+1 do
         begin
          if i-dq[dau]>k then inc(dau);
         if a[i]='1' then
            c[i]:=maxlongint
         else if dau<=cuoi then
         if c[dq[dau]]=maxlongint then c[i]:=c[dq[dau]] else c[i]:=c[dq[dau]]+1;
         add1(i);
         end;
         d[k]:=c[m+1];
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
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
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       xuly;
var     i,j     :       longint;
begin
        a[0]:='0';
        a[m+1]:='0';
        for i:=1 to 100 do xuly1(i);
        randomize;
        for i:=1 to n do b[i]:=d[r[i]];
        QS(1,n);
        fx[1]:=0;
        fx[2]:=b[2];
        for i:=3 to n do
         fx[i]:=min(fx[i-1]+b[1]+b[i],fx[i-2]+b[1]+b[i]+2*b[2]);

         writeln(g,fx[n]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
