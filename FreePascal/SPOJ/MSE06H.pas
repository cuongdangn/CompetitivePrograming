const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m,k     :       longint;
        bit     :       array[1..1010] of int64;
        a       :       array[1..1000010] of bg;
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
function        get(i:longint):int64;
var     tg:int64;
begin
        tg:=0;
        while i>0 do
         begin
          tg:=tg+bit[i];
          i:=i-i and(-i);
         end;
         exit(tg);
end;
procedure       up(i:longint);
begin
        while i<=m do
         begin
          bit[i]:=bit[i]+1;
          i:=i+i and (-i);
         end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t,y      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].x;
        y:=a[t].y;
        repeat
                while (a[i].x<x)or((a[i].x=x)and(a[i].y<y)) do inc(i);
                while (a[j].x>x)or((a[j].x=x)and(a[j].y>y)) do dec(j);
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

procedure       xuly(t:longint);
var     i,j     :       longint;
        kq      :       int64;
begin
        QS(1,k);
        kq:=0;
        for i:=1 to k do
         begin
          kq:=kq+get(m-a[i].y);
          up(m-a[i].y+1);
         end;
         writeln(g,'Test case ',t,': ',kq);
end;
procedure       doc;
var     i,j,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          readln(f,n,m,k);
          for j:=1 to k do
           readln(f,a[j].x,a[j].y);
          /////////////
          for j:=1 to m do bit[j]:=0;
          xuly(i);
         end
end;
begin
        mo;
        doc;
        dong;
end.