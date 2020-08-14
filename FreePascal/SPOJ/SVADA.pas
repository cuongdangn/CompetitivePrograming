const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
        arr     =       array[1..100] of bg;
var     g,f     :       text;
        t,n,m       :       longint;
        a,b     :       array[1..100] of bg;
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
        readln(f,t);
        read(f,n);
        for i:=1 to n do read(f,a[i].x,a[i].y);
        read(f,m);
        for i:=1 to m do read(f,b[i].x,b[i].y);
end;
function        tinh(x,n:longint;a:arr):int64;
var     i       :       longint;
        tg      :       int64;
begin
        tg:=0;
        for i:=1 to n do
          if x>=a[i].x then
                tg:=tg+int64((x-a[i].x) div a[i].y)+1;
        exit(tg);
end;
procedure       xuly;
var     dau,cuoi,giua,luu       :       longint;
        t1,t2   :       int64;
begin
        dau:=1;
        cuoi:=t;
        luu:=0;
        while dau<=cuoi do
         begin
                giua:=(dau+cuoi) div 2;
                t1:=tinh(giua,n,a);
                t2:=tinh(t-giua,m,b);
                if t1<=t2 then
                        begin
                                luu:=giua;
                                dau:=giua+1;
                        end
                else cuoi:=giua-1;
         end;
         writeln(g,luu);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.