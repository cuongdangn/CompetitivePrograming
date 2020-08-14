const   finp    =       'caykhung.inp';
        fout    =       '';
type    bg      =       record
        x,y,w   :       longint;
        end;
var     g,f     :       text;
        e       :       array[1..100000] of bg;
        cha     :       array[1..10000] of longint;
        n,m     :       longint;
        kq      :       longint;
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
        readln(f,n,m);
        for i:=1 to m do
         readln(f,e[i].x,e[i].y,e[i].w);
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x       :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=e[random(h-l+1)+l].w;
        repeat
                while e[i].w<x do inc(i);
                while e[j].w>x do dec(j);
                if i<=j then
                 begin
                        tg:=e[i];
                        e[i]:=e[j];
                        e[j]:=tg;
                        inc(i);dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        find(a:longint):longint;
begin
        if cha[a]<0 then exit(a);
        cha[a]:=find(cha[a]);
        exit(cha[a]);
end;
procedure       xuly;
var     i,j,cha1,cha2     :       longint;
begin
        randomize;
        QS(1,m);
        for i:=1 to n do cha[i]:=-1;
        for i:=1 to m do
         begin
                cha1:=find(e[i].x);
                cha2:=find(e[i].y);
                if cha1<>cha2 then
                       begin  cha[cha1]:=cha2;kq:=kq+e[i].w; end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
