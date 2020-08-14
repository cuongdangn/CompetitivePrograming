uses    math;
const   finp    =       'FLIP.INP';
        fout    =       'FLIP.OUT';
type    bg1      =       record
        a,b      :       longint;
        end;
        bg      =       record
        cs,gt   :       longint;
        end;
        bg2     =       record
        l       :       byte;
        cs,gt   :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ma,c    :       array[1..200000] of bg;
        e       :       array[1..400000] of bg2;
        bit,slanlat     :       array[1..200000] of longint;
        it      :       array[1..800000] of longint;
        d       :       array[1..200000] of bg1;
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
        for i:=1 to n do
         readln(f,d[i].a,d[i].b);
        for i:=1 to m do begin readln(f,c[i].gt);c[i].cs:=i; end;
end;
procedure       QS(l,h  :       longint);
var     t,i,j,x   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=l+random(h-l+1);
        x:=c[t].gt;
        repeat
                while c[i].gt<x do inc(i);
                while c[j].gt>x do dec(j);
                if i<=j then
                 begin
                  tg:=c[i];
                  c[i]:=c[j];
                  c[j]:=tg;
                  inc(i);dec(j);
                 end;
        until i>j;
        if (i<h) then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       QS1(l,h  :       longint);
var     y,t,i,j,x   :       longint;
        tg      :       bg2;
begin
        i:=l;
        j:=h;
        t:=l+random(h-l+1);
        x:=e[t].gt;
        y:=e[t].l;
        repeat
                while (e[i].gt<x)or((e[i].gt=x)and(e[i].l<y)) do inc(i);
                while (e[j].gt>x)or((e[j].gt=x)and(e[j].l>y)) do dec(j);
                if i<=j then
                 begin
                  tg:=e[i];
                  e[i]:=e[j];
                  e[j]:=tg;
                  inc(i);dec(j);
                 end;
        until i>j;
        if (i<h) then QS1(i,h);
        if j>l then QS1(l,j);
end;

procedure       buil(k,i,j:longint);
var     mid     :       longint;
begin
        if i=j then
         begin
          it[k]:=c[i].cs;
          exit;
         end;
         mid:=(i+j) >> 1;
         buil(k*2,i,mid);
         buil(k*2+1,mid+1,j);
         it[k]:=max(it[k*2],it[k*2+1]);
end;
function        get(k,l,h,i,j:longint):longint;
var     mid,t1,t2     :       longint;
begin
        if (l>j)or(h<i) then exit(-1);
        if (l>=i)and(h<=j) then exit(it[k]);
        mid:=(l+h) >> 1;
        t1:=get(k*2,l,mid,i,j);
        t2:=get(k*2+1,mid+1,h,i,j);
        exit(max(t1,t2));
end;

function        chat2(x:longint):longint;
var     luu,dau,cuoi,giua   :       longint;
begin
        luu:=-1 ;
        dau:=1;
        cuoi:=m;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) >> 1;
          if c[giua].gt<x then
           begin
            luu:=giua;
            dau:=giua+1;
           end
          else cuoi:=giua-1;
         end;
        exit(luu);
end;
function        chat1(x:longint):longint;
var     luu,dau,cuoi,giua   :       longint;
begin
        luu:=-1 ;
        dau:=1;
        cuoi:=m;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) >> 1;
          if c[giua].gt>=x then
           begin
            luu:=giua;
            cuoi:=giua-1;
           end
          else dau:=giua+1;
         end;
        exit(luu);
end;
procedure       xuly1;
var     i,j,x1,x2,t1,t2     :       longint;
begin
        randomize;
        QS(1,m);
        buil(1,1,m);
        for i:=1 to n do
         begin
          ma[i].cs:=i;
          x1:=max(d[i].a,d[i].b);
          x2:=min(d[i].a,d[i].b);
          t1:=chat1(x2);
          t2:=chat2(x1);
          if (t1>0)and(t2>0)and(t1<=t2) then
          ma[i].gt:=get(1,1,m,t1,t2)
          else ma[i].gt:=0;
         end;
         //for i:=1 to n do write(ma[i].gt,' ');
end;
procedure       up(i:longint);
begin
        while i>0 do
         begin
          bit[i]:=bit[i]+1;
          i:=i-i and (-i);
         end;
end;
function        getbit(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i<=m do
         begin
          tg:=tg+bit[i];
          i:=i+i and (-i);
         end;
         exit(tg);
end;

procedure       xuly2;
var     i,j     :       longint;
begin
        randomize;
        for i:=1 to n do
         begin
          e[i].l:=1;
          e[i].gt:=max(d[i].b,d[i].a);
          e[i].cs:=i;
         end;
        for i:=1 to m do
         begin
           e[n+i].l:=2;
           e[n+i].gt:=c[i].gt;
           e[n+i].cs:=c[i].cs;
         end;
        QS1(1,n+m);
        for i:=n+m downto 1 do
         if e[i].l=2 then
          up(e[i].cs)
         else
          slanlat[e[i].cs]:=getbit(ma[e[i].cs].gt+1);
end;
procedure       xuly;
var     i,j,mat     :       longint;
begin
        xuly1;
        xuly2;
        for i:=1 to n do
         begin
          if ma[i].gt<>0 then mat:=max(d[i].a,d[i].b) else mat:=d[i].a;
          if slanlat[i] mod 2=0 then write(g,mat,' ')
           else write(g,d[i].a+d[i].b-mat,' ');
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
