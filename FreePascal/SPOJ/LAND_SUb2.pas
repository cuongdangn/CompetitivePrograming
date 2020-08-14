uses    math;
const   finp    =       'LAND.INP';
        fout    =       'LAND.OUT';
type    bg      =       record
        x,y     :       longint;
        end;
        bg1     =       record
        x1,x2,y1,y2:longint;
        end;
var     g,f     :       text;
        slst,n,m,k   :       longint;
        ok      :       boolean;
        a       :       array[1..11] of bg;
        luu     :       array[1..12] of bg1;
        st      :       array[1..12] of bg;

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
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].x*a[t].y;
        repeat
                while (a[i].x*a[i].y)>x do inc(i);
                while (a[j].x*a[j].y)<x do dec(j);
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
procedure       doc;
var     i     :       longint;
begin
        readln(f,m,n,k);
        for i:=1 to k do
          readln(f,a[i].x,a[i].y);
        QS(1,k);
end;
function        kotrung(a,b:bg1):boolean;
var     ok1,ok2 :       boolean;
begin
        ok1:=(a.x1>b.x2)or(a.x2<b.x1);
        ok2:=(a.y1>b.y2)or(a.y2<b.y1);
        exit(ok1 or ok2);
end;
procedure       duyet(x:longint);
var     i,j,r,d,t     :       longint;
        tg      :   bg1;
        ok1     :   boolean;
begin
        if x=k+2 then
         begin
          ok:=true;exit;
         end;
        for i:=1 to slst do
          for j:=1 to slst do
           begin
            r:=a[x].x;
            d:=a[x].y;
            tg.x1:=st[i].x+1;
            tg.y1:=st[j].y+1;
            tg.x2:=tg.x1+r-1;
            tg.y2:=tg.y1+d-1;
            ok1:=(tg.x2<=m)and(tg.y2<=n);
            for t:=1 to x-1 do
                if not kotrung(tg,luu[t]) then ok1:=false;
            if ok1 then
                begin
                        luu[x]:=tg;
                        inc(slst);
                        st[slst].x:=tg.x2;
                        st[slst].y:=tg.y2;
                        duyet(x+1);
                        if ok then exit else dec(slst);
                 end;
             //////////////////////////////////////
             if r<>d then
             begin
             r:=a[x].y;
            d:=a[x].x;
            tg.x1:=st[i].x+1;
            tg.y1:=st[j].y+1;
            tg.x2:=tg.x1+r-1;
            tg.y2:=tg.y1+d-1;
             ok1:=(tg.x2<=m)and(tg.y2<=n);
            for t:=1 to x-1 do
                if not kotrung(tg,luu[t]) then ok1:=false;
            if ok1 then
                begin
                        luu[x]:=tg;
                        inc(slst);
                        st[slst].x:=tg.x2;
                        st[slst].y:=tg.y2;
                        duyet(x+1);
                        if ok then exit else dec(slst);
                 end;
            end;
            end;
end;
function       ktra(x:longint):boolean;
var     i,j     :       longint;
        b       :       array[1..11] of bg;
begin
        slst:=1;
        st[1].x:=0;
        st[1].y:=0;
        ok:=false;
        b:=a;
        a[k+1].x:=x;
        a[k+1].y:=x;
        j:=k;
        while (j>0)and(int64(a[j].x)*int64(a[j].y)<sqrt(int64(x))) do
         begin
          a[j+1]:=a[j];
          dec(j);
         end;
        a[j+1].x:=x;
        a[j+1].y:=x;
        duyet(1);
        //if ok then writeln('YES') else writeln('NO');
        a:=b;
        exit(ok);

end;
procedure       xuly;
var     dau,cuoi,giua,luu        :       longint;
        kq      :       int64;
begin
        dau:=1;
        cuoi:=max(m,n);
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
        kq:=sqr(int64(luu));
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
