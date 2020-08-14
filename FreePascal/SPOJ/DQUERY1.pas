const   finp    =       '';
        fout    =       '';
        maxn    =       30000;
type    bg      =       record
        gt,l,cs       :       longint;
        end;
        bg1     =       record
        u,v     :       longint;
        end;
var     g,f     :       text;
        T       :       array[1..maxn] of longint;
        a       :       array[1..maxn] of longint;
        vt      :       array[1..1000000] of longint;
        s       :       array[1..230001] of bg;
        n,q     :       longint;
        res     :       array[1..200000] of longint;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
        read(f,a[i]);

        readln(f);
        readln(f,q);
        for i:=1 to q do
                readln(f,d[i].u,d[i].v);
end;
procedure       init;
var     i       :       longint;
begin
        for i:=1 to n do
         begin
                s[i].l:=0;
                s[i].gt:=vt[a[i]];
                s[i].cs:=i;
                vt[a[i]]:=i;
         end;
         for i:=1 to q do
          begin
                s[i+n].l:=1;
                s[i+n].gt:=d[i].u;
                s[i+n].cs:=i;
          end;
end;
procedure       QS(l,h:longint);
var     i,j,x,x1   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=s[(l+h) div 2].gt;
        x1:=s[(l+h) div 2].l;
        repeat
                while (s[i].gt<x)or((s[i].gt=x)and(s[i].l>x1)) do inc(i);
                while (s[j].gt>x)or((s[j].gt=x)and(s[j].l<x1)) do dec(j);
                if i<=j then
                 begin
                        tg:=s[i];
                        s[i]:=s[j];
                        s[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       up(i:longint);
begin
        while i<=n do
         begin
                t[i]:=t[i]+1;
                i:=i+i and (-i);
         end;
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=tg+t[i];
                i:=i-i and (-i);
         end;
         exit(tg);
end;
procedure       xuly;
var     i,l,r       :       longint;
begin
        init;
        QS(1,n+q);
        for i:=1 to n+q do
         if s[i].l=0 then up(s[i].cs)
         else
          begin
               l:=get(s[i].gt-1);
               r:=get(d[s[i].cs].v);
               res[s[i].cs]:=r-l;
          end;
          for i:=1 to q do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong
end.
