uses    math;
const   finp    =       'PUNCTE.INP';
        fout    =       'PUNCTE.OUT';
type    bg      =       record
        ma,mi   :       longint;
        end;
        bg1     =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        x1,y1      :     array[-1000..1000] of bg;
        ddx,ddy    :     array[-1000..1000,-1000..1000] of byte;
        a       :     array[1..1000000] of bg1;
        n       :     longint;
        kq      :     longint;
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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                readln(f,a[i].x,a[i].y);
end;
procedure       kt;
var     i,u,v       :longint;
begin
        for i:=-1000 to 1000 do
                begin
                        x1[i].ma:=-1001;
                        x1[i].mi:=1001;
                        y1[i].ma:=-1001;
                        y1[i].mi:=1001;
                end;
        for i:=1 to n do
                begin
                        u:=a[i].x;
                        v:=a[i].y;

                        x1[u].ma:=max(x1[u].ma,a[i].y);

                        x1[u].mi:=min(x1[u].mi,a[i].y);

                        y1[v].ma:=max(y1[v].ma,a[i].x);

                        y1[v].mi:=min(y1[v].mi,a[i].x);
                end;
end;
procedure       xuly;
var     i,j:longint;
        bo      :       boolean;
begin
        kt;
        bo:=true;
         repeat
            bo:=true;
             for i:=0 to 4 do
             if (x1[i].mi<=x1[i].ma)and(ddx[x1[i].mi,x1[i].ma]=0) then
              begin
              bo:=false;
              ddx[x1[i].mi,x1[i].ma]:=1;
              for j:=x1[i].mi to x1[i].ma do
                begin
                   y1[j].ma:=max(y1[j].ma,i);
                   y1[j].mi:=min(y1[j].mi,i);
                end;
              end;
              for i:=0 to 4 do
             if (y1[i].mi<=y1[i].ma)and((ddy[y1[i].mi,y1[i].ma]=0)) then
              begin
              ddy[y1[i].mi,y1[i].ma]:=1;
              bo:=false;
              for j:=y1[i].mi to y1[i].ma do
                begin
                   x1[j].ma:=max(x1[j].ma,i);
                   x1[j].mi:=min(x1[j].mi,i);
                end;
              end;
        until     bo;
        for i:=-1000 to 1000 do
        if x1[i].ma>=x1[i].mi then
                kq:=kq+x1[i].ma-x1[i].mi+1;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


















