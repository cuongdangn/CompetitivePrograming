const   finp    =       'PROJECT.INP';
        fout    =       'PROJECT.OUT';
        eps     =       (1e-9);
type    bg      =       record
        cs,u,v     :       longint;
        c,l     :       double;
        end;
var     g,f:    text;
        e       :       array[1..10000] of bg;
        n,m     :       longint;
        dd      :       array[1..10000] of boolean;
        luu     :       array[1..10000] of longint;
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
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
          readln(f,e[i].u,e[i].v,e[i].l,e[i].c);
          e[i].cs:=i;
         end;
end;
function        nho(a,b:bg;x:double):boolean;
begin
        exit((a.c-a.l*x)<(b.c-b.l*x));
end;
procedure       QS(l,h:longint;x:double);
var     t,i,j     :       longint;
        y       :       bg;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        y:=e[t];
        repeat
         while nho(e[i],y,x) do inc(i);
         while nho(y,e[j],x) do dec(j);
         if i<=j then
          begin
           tg:=e[i];
           e[i]:=e[j];
           e[j]:=tg;
           inc(i);dec(j);
          end;
         until i>j;
         if i<h then QS(i,h,x);
         if j>l then QS(l,j,x);
end;
function        find(x:longint):longint;
begin
        if cha[x]<0 then exit(x);
        cha[x]:=find(cha[x]);
        exit(cha[x]);
end;

function        ktra(x:double):boolean;
var     i,j,t,cha1,cha2     :       longint;
        t1,t2   :       double;
begin
        for i:=1 to m do
         dd[i]:=true;
        for i:=1 to n do cha[i]:=-1;
        QS(1,m,x);
        t:=1;
        for i:=1 to n-1 do
         begin
           for j:=t to m do
            begin
              cha1:=find(e[j].u);
              cha2:=find(e[j].v);
              if cha1<>cha2 then
                begin
                cha[cha1]:=cha2;
                dd[e[j].cs]:=false;
                break;
                end;
            end;
            t:=j+1;
         end;
        t1:=0;
        t2:=0;
        for i:=1 to m do
        if not dd[e[i].cs] then
         begin
          t1:=t1+e[i].c;
          t2:=t2+e[i].l;
         end;
        exit((t1<t2*x)or(abs(t1-t2*x)<=eps));
end;
procedure       luulai;
var     i ,dem      :       longint;
begin
        dem:=0;
        for i:=1 to m do
         if not dd[i] then
          begin
           inc(dem);
           luu[dem]:=i;
          end;
end;

procedure       xuly;
var     dau,cuoi,giua:  double;
        i       :       longint;
begin
        dau:=0;
        cuoi:=maxlongint;
        for i:=1 to 100 do
         begin
           giua:=(dau+cuoi)/2;
           if ktra(giua) then
            begin
                luulai;
                cuoi:=giua-eps;
            end
           else dau:=giua+eps;
         end;
        for i:=1 to n-1 do
         write(g,luu[i],' ')
end;
begin
        randomize;
        mo;
        doc;
        xuly;
        dong;
end.