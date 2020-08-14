uses    math;
const   finp    =       'STRAZA.INP';
        fout    =       'STRAZA.OUT';
        eps     =       1e-9;
type    diem    =       record
        x,y     :       double;
        end;
        dt      =       record
        x1,x2,y1,y2:    double;
        end;
var     g,f     :       text;
        a       :       array[1..20] of dt;
        n,kq       :       longint;

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
          readln(f,a[i].x1,a[i].y1,a[i].x2,a[i].y2);
end;
function        kc(a,b:diem):double;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        diemgiao(a,b:dt):diem;
var     a1,b1,c1,a2,b2,c2     :       double;
        tg      :       diem;
begin
        a1:=a.y2-a.y1;
        b1:=a.x2-a.x1;
        c1:=a.x1*a.y2-a.y1*a.x2;
        a2:=b.y2-b.y1;
        b2:=b.x2-b.x1;
        c2:=b.x1*b.y2-b.y1*b.x2;
        tg.y:=(c1*a2-c2*a1)/(b2*a1-b1*a2);
        tg.x:=(c1*b2-c2*b1)/(b2*a1-b1*a2);
        exit(tg);
end;


function        bang(a,b        :       double):boolean;
begin
        if abs(a-b)<=eps then exit(true)
        else exit(false);
end;
function       cungphuong(a,b:dt):boolean;
var     i,j     :       longint;
begin
        if bang((a.x1-a.x2)*(b.y1-b.y2),(a.y1-a.y2)*(b.x1-b.x2)) then exit(true);
        exit(false);
end;
function        kiemgiao(a,b:dt):boolean;
var     tg1,tg2,tg3 :       diem;
begin
        tg1:=diemgiao(a,b);
        tg2.x:=a.x1;
        tg2.y:=a.y1;
        tg3.x:=a.x2;
        tg3.y:=a.y2;
        if not bang(kc(tg1,tg2)+kc(tg1,tg3),kc(tg2,tg3)) then exit(false);
        tg2.x:=b.x1;
        tg2.y:=b.y1;
        tg3.x:=b.x2;
        tg3.y:=b.y2;
        if not bang(kc(tg1,tg2)+kc(tg1,tg3),kc(tg2,tg3)) then exit(false);
        exit(true);
end;
function        ktra(a,b,c:dt):boolean;
var     i,j     :       longint;
        tg1,tg2 :       diem;
begin
        if (cungphuong(a,b))or(cungphuong(a,c))or(cungphuong(b,c)) then exit(false);
         if (not kiemgiao(a,b))or(not kiemgiao(a,c))or(not kiemgiao(b,c)) then exit(false);
         tg1:=diemgiao(a,b);
         tg2:=diemgiao(b,c);
         if (bang(tg1.x,tg2.x))and(bang(tg2.y,tg1.y)) then exit(false);
        exit(true);
end;
function        thuoc(tg1,tg2,tg3:diem):boolean;
begin
        exit(bang(kc(tg1,tg2)+kc(tg1,tg3),kc(tg2,tg3)));
end;
procedure       init;
var     i,j,k,t     :       longint;
        dd      :array[1..4] of boolean;
        tg      :array[1..4] of diem;
        ok      :       boolean;

begin
        repeat
         ok:=false;
         for i:=1 to n-1 do
          for j:=i+1 to n do
           if cungphuong(a[i],a[j]) then
            begin
                tg[1].x:=a[i].x1;
                tg[1].y:=a[i].y1;
                tg[2].x:=a[j].x1;
                tg[2].y:=a[j].y1;
                tg[3].x:=a[j].x2;
                tg[3].y:=a[j].y2;
                tg[4].x:=a[i].x2;
                tg[4].y:=a[i].y2;
                if thuoc(tg[1],tg[2],tg[3]) or thuoc(tg[4],tg[2],tg[3]) or thuoc(tg[2],tg[1],tg[4]) or thuoc(tg[3],tg[1],tg[4]) then
                 begin
                     ok:=true;
                     fillchar(dd,sizeof(dd),true);
                     if thuoc(tg[1],tg[2],tg[3]) then dd[1]:=false;
                     if thuoc(tg[4],tg[2],tg[3]) then dd[4]:=false;
                     if thuoc(tg[2],tg[1],tg[4]) then dd[2]:=false;
                     if thuoc(tg[3],tg[1],tg[4]) then dd[3]:=false;
                     t:=1;
                     for k:=1 to 4 do
                      if dd[k] then
                       begin
                        if t=1 then begin a[i].x1:=tg[k].x;a[i].y1:=tg[k].y;inc(t) end
                        else begin a[i].x2:=tg[k].x; a[i].y2:=tg[k].y;inc(t) end;
                       end;
                       if t=1 then begin a[i]:=a[j] end;
                       a[j]:=a[n];
                       dec(n);
                     //break;
                 end;
                 //if ok then break;
            end;
          until not ok;
end;
procedure       xuly;
var     i,j,k   :       longint;
begin
        init;
        for i:=1 to n-2 do
         for j:=i+1 to n-1 do
          for k:=j+1 to n do
             if ktra(a[i],a[j],a[k]) then
              inc(kq);
             writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
