{$MODE OBJFPC}
uses   crt;
const  fi     = '';
       fo     = '';
       maxd   = 5001;
type   diem   		= record x,y : real; end;
       dagiac 		= array[0..maxd] of diem;
       doanthang = record d,c : diem; end;
var    M,N    : diem;
       dg     : dagiac;
       sl     : integer;
       g,f1      : text;
       dem,m1,i    : integer;
       x_max  : real;
procedure nhap;
    var
        i : integer;
    begin
        x_max := -maxlongint;
        assign(f1,fi);
        reset(f1);
        readln(f1,sl);
        for i:=1 to sl do
        begin
            readln(f1,dg[i].x,dg[i].y);
            if dg[i].x>x_max then x_max := dg[i].x;
        end;
end;

function f(l : doanthang; d : diem): real;
    var a,b,c : real;
    begin
        a := l.c.y-l.d.y;
        b := l.d.x-l.c.x;
        c := l.d.y*l.c.x - l.d.x*l.c.y;
        f := a*d.x + b*d.y +c;
    end;
procedure       doc;
begin
        readln(f1,M.x,M.y);
        N.x := x_max+1;
        if N.x <= M.x then N.x := M.x + 1;
        N.y := M.y;
end;
function max(a,b : real): real;
begin
        if a>b then max:= a else max := b;
end;

function min(a,b : real): real;
    begin
        if a<b then min:= a else min:= b;
    end;

function diem_thuoc_doanthang(d: diem;l : doanthang) : boolean;
    var a,b,c : real;
        ok,ok1,ok2 : boolean;
    begin
        ok  := f(l,d)=0;
        ok1 := (min(l.d.x,l.c.x)<=d.x) and (d.x<=max(l.d.x,l.c.x));
        ok2 := (min(l.d.y,l.c.y)<=d.y) and (d.y<=max(l.d.y,l.c.y));
        diem_thuoc_doanthang := ok and ok1 and ok2;
    end;

function khacphia(l1,l2 : doanthang) : boolean;
    begin
        khacphia := false;
        if f(l1,l2.d)=0 then exit;
        if f(l1,l2.c)=0 then exit;
        if f(l2,l1.d)=0 then exit;
        if f(l2,l1.c)=0 then exit;
        khacphia:=(f(l1,l2.d)*f(l1,l2.c)<0) and (f(l2,l1.d)*f(l2,l1.c)<0);
    end;

function trong : boolean;
    var  canh,MN : doanthang;
         i     : integer;
    begin
         dem    := 0;
         dg[0]   := dg[sl];
         dg[sl+1] := dg[1];
         dg[sl+2] := dg[2];
         MN.d  := m;
         MN.c  := n;
         for i:=1 to sl do
         begin
            canh.d  := dg[i];
            canh.c  := dg[i+1];
            if diem_thuoc_doanthang(M,canh) then
            begin
                 trong:= false;
                 exit;
            end;
            if diem_thuoc_doanthang(dg[i],MN) and
               diem_thuoc_doanthang(dg[i+1],MN) and
              ((dg[i-1].y-dg[i].y)*(dg[i+2].y-dg[i].y)<0)then inc(dem)
            else
            if diem_thuoc_doanthang(dg[i+1],MN) and
               ((dg[i].y-m.y)*(dg[i+2].y-m.y)<0) then inc(dem)
            else
            if khacphia(canh,MN) then inc(dem);
         end;
         trong:= ((dem mod 2)=1) and (dem<>0);
    end;

BEGIN
    nhap;
    assign(g,fo);
    rewrite(g);
    readln(f1,m1);
    for i:=1 to m1 do
    begin
    doc;
    if trong then
         writeln(g,'YES')
    else writeln(g,'NO');
    end;
    close(g);
END.
