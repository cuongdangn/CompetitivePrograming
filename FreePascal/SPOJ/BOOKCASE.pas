uses    math;
const   finp    =       'Bookcase.inp';
        fout    =       'Bookcase.out';
        maxc    =       1000;
        maxx    =       maxlongint;
type    bg      =       record
        h,t     :       longint;
        end;
var     g,f     :       text;
        d       :       array[1..70,0..maxc,0..maxc] of longint;
        a       :       array[1..70] of bg;
        n,kq,tong       :       longint;
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
        tong:=0;
        for i:=1 to n do
        begin
         readln(f,a[i].h,a[i].t);
         tong:=tong+a[i].t;
        end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].h;
        repeat
                while a[i].h>x do inc(i);
                while a[j].h<x do dec(j);
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

procedure       init;
var     i,t1,t2 :       longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n do
         for t1:=0 to maxc do
          for t2:=0 to maxc do
           d[i,t1,t2]:=maxx;
end;
procedure       xuly;
var     i,j,t1,t2     :       longint;
begin
        init;
        d[1,0,0]:=a[1].h;
        for i:=1 to n-1 do
         begin
          for t1:=1 to maxc do
           if d[i,t1,0]<maxx then
             begin
              if t1+a[i+1].t<maxc then d[i+1,t1+a[i+1].t,0]:=min(d[i+1,t1+a[i+1].t,0],d[i,t1,0]);
              d[i+1,t1,a[i+1].t]:=min(d[i+1,t1,a[i+1].t],d[i,t1,0]+a[i+1].h);
              d[i+1,t1,0]:=min(d[i+1,t1,0],d[i,t1,0]);
             end;
          ////////////////////////////////////////////////////////////////
          for t2:=1 to maxc do
           if d[i,0,t2]<maxx then
             begin
              if t2+a[i+1].t<maxc then d[i+1,0,t2+a[i+1].t]:=min(d[i+1,0,t2+a[i+1].t],d[i,0,t2]);
              d[i+1,a[i+1].t,t2]:=min(d[i+1,a[i+1].t,t2],d[i,0,t2]+a[i+1].h);
              d[i+1,0,t2]:=min(d[i+1,0,t2],d[i,0,t2]);
             end;
           /////////////////////////////////////////////////////////////////
           if d[i,0,0]<maxx then
            begin
             d[i+1,a[i+1].t,0]:=min(d[i+1,a[i+1].t,0],d[i,0,0]+a[i+1].h);
             d[i+1,0,a[i+1].t]:=min(d[i+1,0,a[i+1].t],d[i,0,0]+a[i+1].h);
             d[i+1,0,0]:=min(d[i,0,0],d[i+1,0,0]);
            end;
            ///////////////////////////////////////////////////////////////
            for t1:=1 to maxc do
             for t2:=1 to maxc do
              if d[i,t1,t2]<maxx then
               begin
                if t1+a[i+1].t<maxc then d[i+1,t1+a[i+1].t,t2]:=min(d[i+1,t1+a[i+1].t,t2],d[i,t1,t2]);
                if t2+a[i+1].t<maxc then d[i+1,t1,t2+a[i+1].t]:=min(d[i+1,t1,t2+a[i+1].t],d[i,t1,t2]);
                d[i+1,t1,t2]:=min(d[i,t1,t2],d[i+1,t1,t2]);
               end;
          end;
          kq:=maxx;
          for t1:=1 to 1000 do
           for t2:=1 to 1000 do
           if t1+t2<tong then
            if d[n,t1,t2]<maxx then
            kq:=min(kq,d[n,t1,t2]*(max(tong-t1-t2,max(t1,t2))));
            writeln(g,kq);
end;
procedure       doc1;
var     i,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          doc;
          xuly;
         end;
end;
begin
        mo;
        doc1;
        dong;
end.