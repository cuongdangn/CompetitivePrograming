uses    math;
const   finp    =       'HCN.INP';
        fout    =       'HCN.OUT';
        maxn    =       1500;
type    td      =       record
        x,y,x1,y1     :longint;
        end;
var     g,f     :       text;
        miny,maxy,minx,maxx,n:longint;
        ds      :array[1..100] of td;
        a,b,c       :array[-maxn..maxn,-maxn..maxn] of integer;
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
procedure     doc;
var     i,x,y     : longint;
begin
        readln(f,n);
        for i:=1 to n do
                    readln(f,ds[i].x,ds[i].y,ds[i].x1,ds[i].y1);
end;
procedure       xulya;
var     i       :longint;
begin
        maxy:=-maxn-1;
        maxx:=maxy;
        minx:=maxn+1;
        miny:=minx;
        for i:=1 to n do
                begin
                        minx:=min(min(ds[i].x1,ds[i].x),minx);
                        miny:=min(min(ds[i].y1,ds[i].y),miny);
                        maxx:=max(max(ds[i].x1,ds[i].x),maxx);
                        maxy:=max(max(ds[i].y1,ds[i].y),maxy);
                end;
        writeln(g,minx,' ',miny,' ',maxx,' ',maxy);
end;
procedure       xulyb;
var     k,i,j       :longint;
        kq      :   int64;
begin
        kq:=0;
        for k:=1 to n do
                begin
                        for i:=min(ds[k].x1,ds[k].x)+1 to max(ds[k].x1,ds[k].x) do
                         for j:=min(ds[k].y,ds[k].y1)+1 to max(ds[k].y,ds[k].y1) do
                          a[i,j]:=1;
                end;
        for i:=minx+1 to maxx do
         for j:=miny+1 to maxy do
         if a[i,j]=0 then inc(kq);
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xulya;
        xulyb;
        dong;
end.
