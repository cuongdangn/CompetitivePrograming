uses    math;
const   finp    =       'codef.INP';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m,kq,k     :       longint;
        a       :       array[1..100000] of longint;
        sl      :       array[1..2] of longint;
        luu     :       array[1..500000] of bg;

procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
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
       for i:=1 to n do begin read(f,a[i]);inc(sl[a[i]]); end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t,y      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=luu[t].x;
        y:=luu[t].y;
        repeat
                while (luu[i].x<x)or((luu[i].x=x)and(luu[i].y<y)) do inc(i);
                while (luu[j].x>x)or((luu[j].x=x)and(luu[j].y>y)) do dec(j);
                if i<=j then
                        begin
                                tg:=luu[i];
                                luu[i]:=luu[j];
                                luu[j]:=tg;
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
        if sl[1]=sl[2] then begin writeln(g,0);exit end;
        m:=max(sl[1],sl[2]);
        if ((sl[1]=m)and(a[n]=2))or((sl[2]=m)and(a[n]=1)) then
         begin
          writeln(g,0);
          exit;
         end;
        for i:=1 to trunc(sqrt(m)) do
         begin
          if m mod i=0 then
           begin

             begin
             inc(k);
             luu[k].x:=i;
             luu[k].y:=m div i;
             end;
             if (i<>m div i) then
             begin
             inc(k);
             luu[k].x:=m div i;
             luu[k].y:=i;
             end;
           end;
         end;
         QS(1,k);
         writeln(g,k);
         for i:=1 to k do
          writeln(g,luu[i].x,' ',luu[i].y);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.