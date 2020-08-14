uses    math;
const   finp    =       'NONGTRAI.INP';
        fout    =       'NONGTRAI.OUT';
type    diem    =       record
        x,y     :       real;
        cs      :       longint;
        end;
        stt     =       record
        y1,y2     :       real;
        x       :       real;
        end;
var     g,f     :       text;
        n,can       :       longint;
        res     :       array[1..1000000] of real;
        a       :       array[1..1000000] of diem;
        h,w     :       int64;
        st      :       array[0..1,1..50000] of stt;
        top,l     :       longint;
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
        readln(f,w,h,n);
        for i:=1 to n do
        begin
                readln(f,a[i].x,a[i].y);
                a[i].cs:=i;
        end;
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x       :       real;
        tg      :       diem;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].x;
        repeat
                while x>a[i].x do inc(i);
                while a[j].x>x do dec(j);
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
function        thuoc(a:stt;b:diem):boolean;
begin
        exit(((a.y1<b.y)or(abs(a.y1-b.y)<1e-8))and((b.y<a.y2)or(abs(b.y-a.y2)<1e-8)));
end;
procedure       xuly;
var     i,j,dem,luu       :       longint;
        tg,tg2      : stt;
                ok      :       boolean;
begin
        QS(1,n);
        inc(top);
        st[l,top].x:=0;
        st[l,top].y1:=0;
        st[l,top].y2:=h;
        for i:=1 to n do
         begin
          for j:=1 to top do
           if thuoc(st[l,j],a[i]) then
           begin
                tg:=st[l,j];
                res[a[i].cs]:=(a[i].x-st[l,j].x)*2;
                 tg2.x:=tg.x+res[a[i].cs];
                tg2.y1:=a[i].y-(a[i].x-tg.x);
                tg2.y2:=tg2.y1+res[a[i].cs];
                ok:=false;
                if tg2.y1>tg.y1 then
                 begin
                        st[l,j].y2:=tg2.y1;
                        st[l,j].y1:=tg.y1;
                        st[l,j].x:=tg.x;
                        ok:=true;
                 end;
                 if tg.y2>tg2.y2 then
                 begin
                if ok then
                begin
                        inc(top);
                        st[l,top].y1:=tg2.y2;
                        st[l,top].y2:=tg.y2;
                        st[l,top].x:=tg.x;
                end
                else
                        begin
                         st[l,j].y1:=tg2.y2;
                         st[l,j].y2:=tg.y2;
                         st[l,j].x:=tg.x;
                         ok:=true;
                        end

                 end;
                 if ok then
                 begin
                 inc(top);
                 st[l,top]:=tg2;
                 luu:=top
                 end
                 else
                 begin
                        st[l,j]:=tg2;
                        luu:=j;
                 end;
                        break;

           end;
           dem:=0;
              for j:=1 to top do
              if j<>luu then
                if (st[l,j].x=tg2.x)and((st[l,j].y1=tg2.y2)or(st[l,j].y2=tg2.y1)) then
                 begin
                     tg2.x:=st[l,j].x;
                     tg2.y1:=min(st[l,j].y1,tg2.y1);
                     tg2.y2:=max(st[l,j].y2,tg2.y2);
                 end
                 else
                  begin
                        inc(dem);
                        st[1-l,dem]:=st[l,j];
                  end;
                  top:=dem;
                  inc(top);
                  st[1-l,top]:=tg2;
                  l:=1-l;
           end;
           for i:=1 to n do
            writeln(g,res[i]:0:0);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

