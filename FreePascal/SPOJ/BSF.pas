uses    math;
const   finp    =       'BSF.INP';
        fout    =       'BSF.out';
        maxx    =       trunc(1e18);
type    bg      =       record
        w,h     :       int64;
        end;
        bg1     =       record
        h,f,c   :       int64;
        end;
var     g,f      :      text;
        n,m      :      longint;
        fx      :       array[0..1010,0..1010] of int64;
        fx1      :       array[0..1010,0..1010,0..1] of int64;
        a        :      array[0..1010] of bg;
        b        :      array[0..1010] of bg1;
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
         readln(f,a[i].h,a[i].w);
        for i:=1 to m do
         readln(f,b[i].h,b[i].f,b[i].c);
end;
procedure       QS1(l,h:longint);
var     t,i,j,x   :       longint;
        tg      :       bg1;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t].h;
        repeat
                while b[i].h<x do inc(i);
                while b[j].h>x do dec(j);
                if i<=j then
                 begin
                   tg:=b[i];
                   b[i]:=b[j];
                   b[j]:=tg;
                   inc(i);dec(j);
                 end;
        until i>j;
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;

procedure       QS(l,h:longint);
var     t,i,j,x   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].h;
        repeat
                while a[i].h<x do inc(i);
                while a[j].h>x do dec(j);
                if i<=j then
                 begin
                   tg:=a[i];
                   a[i]:=a[j];
                   a[j]:=tg;
                   inc(i);dec(j);
                 end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,j,k     :       longint;
begin
        QS(1,n);
        QS1(1,m);
        for i:=1 to n do
         for j:=0 to m do
          fx[j,i]:=maxx;
      for i:=1 to n do
         for j:=0 to m do
          for k:=0 to 1 do
          fx1[j,i,k]:=maxx;
        fx[0,0]:=0;
       for i:=1 to m do
        fx1[i,0,1]:=maxx;
        fx1[0,0,0]:=0;
end;
procedure       sub3;
var     k,i,j     :       longint;
        t       : int64;
begin
        for i:=1 to m do
         begin
         for j:=1 to n do
          if a[j].h<=b[i].h then
          begin
           fx[i,j]:=fx[i-1,j];
           t:=a[j].w;
           for k:=j-1 downto 0 do
            begin
             fx[i,j]:=min(fx[i,j],fx[i-1,k]+b[i].f+t*b[i].c);
             t:=t+a[k].w;
            end;
          end
          else break;
         end;
         writeln(g,fx[m,n]);
end;
procedure       sub4;
var     i,j     :       longint;
begin
        for i:=1 to m do
         begin
          for j:=1 to n do
           if a[j].h<=b[i].h then
           begin
            fx1[i,j,0]:=min(fx1[i-1,j,0],fx1[i-1,j,1]);
            fx1[i,j,1]:=min(fx1[i,j-1,0]+a[j].w*b[i].c+b[i].f,fx1[i,j-1,1]+a[j].w*b[i].c);
           end
           else break;
         end;
         writeln(g,min(fx1[m,n,0],fx1[m,n,1]));
end;
begin
        mo;
        doc;
        init;
        sub4;
        dong;
end.
