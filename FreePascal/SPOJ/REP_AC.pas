const   finp    =       'REP.INP';
        fout    =       'REP.OUT';
type    bg      =       record
        a,b,c     :       int64;
        end;
        bg1     =       record
        a,b     :       int64;
        end;
var     g,f     :       text;
        tong    :       int64;
        ton     :       array[0..100010] of int64;
        n,cuoi,dau       :       longint;
        st      :    array[1..100010] of bg1;
        d       :       array[1..100010] of bg;
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
        readln(f,n);
        for i:=1 to n do
         with d[i] do
          readln(f,a,b,c);
end;
procedure       QS(l,h:longint);
var     i,j,t   :       longint;
        x       :       int64;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=d[i].b;
        repeat
         while d[i].b<x do inc(i);
         while d[j].b>x do dec(j);
         if i<=j then
          begin
            tg:=d[i];
            d[i]:=d[j];
            d[j]:=tg;
            inc(i);dec(j);
          end;
        until i>j ;
  if i<h then QS(i,h);
  if j>l then QS(l,j);
end;
procedure       dien(t:int64;i:longint);
var     t1     :       int64;
begin
        t1:=d[i].b;
        if t<=0 then exit;
        while (cuoi>0) do
         begin
          if t1-st[cuoi].b>t then     //
           begin
            inc(cuoi);
            st[cuoi].b:=d[i].b;
            st[cuoi].a:=t1-t+1;
            exit;
           end
          else if t1-st[cuoi].b<t then//
           begin
            t:=t-t1+st[cuoi].b;
            t1:=st[cuoi].a-1;
            dec(cuoi);
           end
          else
           begin
            st[cuoi].b:=d[i].b;
            exit;
           end;
          end;
          inc(cuoi);
          st[cuoi].b:=d[i].b;
          st[cuoi].a:=t1-t+1;
end;

function        chat(x:int64):longint;
var     da,luu,cu,giua:longint;
begin
        da:=dau;
        cu:=cuoi;
        luu:=0;
        while da<=cu do
         begin
          giua:=(da+cu) div 2;
          if st[giua].b>=x then
           begin
            luu:=giua;
            cu:=giua-1;
           end
          else da:=giua+1;
         end;
        exit(luu);
end;
procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        randomize;
        QS(1,n);
        dau:=1;
        for i:=1 to n do
         begin
           t:=0;
           j:=chat(d[i].a);
           if j>0 then
            begin
             t:=tong-ton[j-1];
             if d[i].a>=st[j].a then
              t:=t-(d[i].a-st[j].a);
             end;
             t:=d[i].c-t;
           dien(t,i);
           if t>0 then tong:=tong+t;
           ton[cuoi]:=tong;
         end;
         writeln(g,tong);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
