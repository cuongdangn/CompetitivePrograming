const   finp    =       'TFIELD.INP';
        fout    =       'TFIELD.OUT';
type    bg      =       record
        n,c     :       longint;
        s       :       extended;
        end;
        bg1     =       record
        x,y     :       extended;
        end;
var     g,f     :       text;
        a       :       array[0..1010] of bg;
        n,k     :       longint;
        bb      :       array[0..1010] of longint;
        b       :       array[0..1010,0..1010] of bg1;
        dd      :       array[0..1010] of boolean;
        kq      :       extended;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x       :       extended;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=a[random(h-l+1)+l].s;
        repeat
                while a[i].s<x do inc(i);
                while a[j].s>x do dec(j);
                if i<=j then
                 begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,k);
        for i:=1 to n do
         begin
                read(f,a[i].n,a[i].c);
                for j:=1 to a[i].n do
                  read(f,b[i,j].x,b[i,j].y);
         end;
end;
function        tinhs(i:longint):extended;
var     tg      :       extended;
        j       :       longint;
begin
        tg:=0;
        for j:=2 to a[i].n do
          tg:=tg+(b[i,j].x-b[i,j-1].x)*(b[i,j].y+b[i,j-1].y);
        tg:=tg+(b[i,1].x-b[i,a[i].n].x)*(b[i,1].y+b[i,a[i].n].y);
        tg:=abs(tg);
        exit(tg);
end;

procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
        a[i].s:=tinhs(i);
        randomize;
        QS(1,n);
end;
procedure       xuly1(c:longint);
var     i,j,s     :       longint;
begin
        for i:=1 to n do
         bb[i]:=0;
        for i:=1 to n do
         if a[i].c=c then bb[i]:=0
         else bb[i]:=1;
        bb[0]:=0;
        //////////////////////
        j:=1;
        s:=0;
        for i:=1 to n do
         begin
                s:=s+bb[i];
                while (j<=n)and(s>k) do
                 begin
                        s:=s-bb[j];
                        inc(j);
                 end;
                if kq<a[i].s-a[j-1].s then kq:=a[i].s-a[j-1].s;
         end;
end;

procedure       xuly;
var     i,j:    longint;
begin
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         if dd[a[i].c] then
          begin
            dd[a[i].c]:=false;
            xuly1(a[i].c);
          end;
         writeln(g,kq/2:0:1);
end;


begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
