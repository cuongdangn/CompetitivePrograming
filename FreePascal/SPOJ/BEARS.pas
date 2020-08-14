uses    math;
const   finp    =       'BEARS.INP';
        fout    =       'BEARS.OUT';
type    bg      =       record
        x1,y1,x2,y2     :       longint;
        end;
var     a       :       array[1..502] of bg;
        n,u,v     :       longint;
        g,f:text;
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
        close(g)
end;
procedure       doc;
var i,j   :       longint;
begin
        readln(f,u,v);
        readln(f,n);
        for i:=1 to n do
        begin
         readln(f,a[i].x1,a[i].y1,a[i].x2,a[i].y2);
         j:=a[i].x1+a[i].x2;
         a[i].x1:=min(a[i].x1,a[i].x2);
         a[i].x2:=j-a[i].x1;
         j:=a[i].y1+a[i].y2;
         a[i].y1:=min(a[i].y1,a[i].y2);
         a[i].y2:=j-a[i].y1;
        end;
end;
function        thuoc(a,b,c,d,u,v:longint):boolean;
begin
        exit((u>a)and(u<b)and(v<c)and(v>d));
end;
function       ktra(k:longint):boolean;
var     i,j,tr,ph,t,d :       longint;
        mr      :       boolean;
begin
        tr:=-k;
        ph:=k;
        t:=k;
        d:=-k;
        mr:=true;
        while (mr and (not thuoc(tr,ph,t,d,u,v))) do
         begin
          mr:=false;
          for i:=1 to n do
           begin
            if thuoc(tr,ph,t,d,a[i].x1,a[i].y1)and thuoc(tr,ph,t,d,a[i].x2,a[i].y2) then
            continue;
            if (tr>=a[i].x2)or(ph<=a[i].x1)or(a[i].y2<=d)or(a[i].y1>=t) then
            continue;
            tr:=min(tr,a[i].x1-1);
            ph:=max(ph,a[i].x2+1);
            t:=max(t,a[i].y2+1);
            d:=min(d,a[i].y1-1);
            mr:=true;
           end;
         end;
         exit(thuoc(tr,ph,t,d,u,v));
end;
function        chat:longint;
var dau,cuoi,giua,kq : longint;
begin
        dau:=0;
        cuoi:=max(abs(u),abs(v))+1;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          if ktra(giua) then
          cuoi:=giua-1
          else
          begin
          kq:=giua;
          dau := giua+1;
          end;
         end;
         exit(kq);
end;
begin
        mo;
        doc;
        writeln(g,chat);
        dong;
end.

