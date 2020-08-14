uses    math;
const   finp    =       'PINPOS.INP';
        fout    =       'PINPOS.OUT';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        x1,x2,y1,y2:int64;
        q       :       int64;
        a       :       array[1..100010,1..4] of bg;
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
         for j:=1 to 4 do
          read(f,a[i,j].x,a[i,j].y);
end;
procedure       xuly;
var     i,j,maxx,minx,maxy,miny     :       longint;
begin
        x1:=-maxlongint;
        x2:=-x1;
        y1:=x1;
        y2:=x2;
        for i:=1 to n do
         begin
          maxx:=-maxlongint;
          maxy:=maxx;
          minx:=maxlongint;
          miny:=minx;
          for j:=1 to 4 do
           begin
            maxx:=max(maxx,a[i,j].x-a[i,j].y);
            minx:=min(minx,a[i,j].x-a[i,j].y);
            maxy:=max(maxy,a[i,j].x+a[i,j].y);
            miny:=min(miny,a[i,j].x+a[i,j].y);
           end;
          x1:=max(x1,minx);
          x2:=min(x2,maxx);
          y1:=max(y1,miny);
          y2:=min(y2,maxy);
         end;
         q:=(x2-x1-1)*(y2-y1-1);
         if q<=0 then writeln(g,0)
         else
          begin
           if abs(x1) mod 2=abs(y1) mod 2 then writeln(g,(Q+1) div 2)
           else writeln(g,Q div 2);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
