uses    math;
const   finp    =       '';
        fout    =       '';
type    re      =       record
        u,v,w   :       longint;
        end;
var     g,f     :text;
        a       :       array[1..10000] of re;
        cha     :array[1..10000] of longint;
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
var     i,j,k,l:longint;
begin
        readln(f,n,m);
        for i:=1 to m do
                begin
                with a[i] do
                        readln(f,u,v,w);
                end;
end;
procedure       QS(l,h:longint);
var     i,j,x       :longint;
        tg:     re;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2].w;
        repeat
                while a[i].w<x do inc(i);
                while a[j].w>x do dec(j);
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
function        tim(j:longint):longint;
begin
        if cha[j]<0 then exit(j);
        cha[j]:=tim(cha[j]);
        exit(cha[j]);
end;
procedure       krsu;
var     i,cha1,cha2       :longint;
begin
        QS(1,m);
        for i:=1 to n do  cha[i]:=-1;
        for i:=1 to m do
                begin
                        cha1:=tim(a[i].u);
                        cha2:=tim(a[i].v);
                        if cha1<>cha2 then
                                begin
                                        cha[cha1]:=cha2;
                                        kq:=max(kq,a[i].w);
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        krsu;
        dong;
end.

