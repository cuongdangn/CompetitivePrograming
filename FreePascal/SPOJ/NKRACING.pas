const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y,w   :       longint;
        end;
var     g,f     :       text;
        n,m,kq     :       longint;
        e       :       array[1..100000] of bg;
        cha     :       array[1..10000] of longint;
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
        readln(f,n,m);
        for i:=1 to m do
               begin
                readln(f,e[i].x,e[i].y,e[i].w);
                kq:=kq+e[i].w;
               end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=e[(l+h) div 2].w;
        repeat
                while e[i].w>x do inc(i);
                while e[j].w<x do dec(j);
                if i<=j then
                 begin
                        tg:=e[i];
                        e[i]:=e[j];
                        e[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        get(u:longint):longint;
begin
        if cha[u]=-1 then exit(u);
        cha[u]:=get(cha[u]);
        exit(cha[u]);
end;
procedure       xuly;
var     i,cha1,cha2:longint;
begin
        QS(1,m);
        fillchar(cha,sizeof(cha),255);
        for i:=1 to m do
         begin
              cha1:=get(e[i].x);
              cha2:=get(e[i].y);
              if cha1<>cha2 then
               begin
                if cha1>cha2 then
                 cha[cha1]:=cha2
                 else cha[cha2]:=cha1;
                 kq:=kq-e[i].w;
                end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
