uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        k,n,m,kq     :       longint;
        a,b     :       array[1..200] of longint;

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
var     tg,x    :       longint;
        i,j     :       longint;
begin
        i:=l;
        j:=h;
        x:=b[random(h-l+1)+l];
        repeat
                while b[i]>x do inc(i);
                while b[j]<x do dec(j);
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
procedure       doc;
var     i,j,h,t,t1     :       longint;
begin
        readln(f,n,k);
        kq:=-maxlongint;
        for i:=1 to n do read(f,a[i]);
        for i:=1 to n do
         begin
         t:=0;
         for j:=i to n do
          begin
           t:=t+a[j];
           kq:=max(kq,t);
           m:=0;
           for h:=1 to n do
            if not((h>=i)and(h<=j)) then
             begin
              inc(m);
              b[m]:=a[h];
             end;
            randomize;
           if m>0 then  QS(1,m);
            t1:=t;
            for h:=1 to m do
             begin
              if h=k+1 then break;
              t1:=t1+b[h];
              kq:=max(kq,t1);
             end;
            end;
          end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
