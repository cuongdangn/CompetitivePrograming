{$ inline on}
const   finp    =       '';
        fout    =       '';
type    re      =       record
        gt,cs      :       longint;
        end;
var     g,f     :       text;
        a       :       array[0..200005] of re;
        c       :       array[0..200005] of char;
        b,d,th       :       array[0..200005] of longint;
        dd:       array[0..200005] of byte;
        n,sl,m       :       longint;
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
var     i,t       :longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
                readln(f,c[i],t);
                if c[i]<>'K' then
                begin
                 inc(m);
                 a[m].gt:=t;
                 a[m].cs:=i;
                end
                else b[i]:=t;
        end;
end;
procedure       QS(l,h:longint);
var     i,j,x        :       longint;
        tg      :    re;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,k       :       longint;
begin
        QS(1,m);
        a[0]:=a[1];
        k:=1;
        for i:=1 to m do
         begin
          if (a[i].gt<>a[i-1].gt) then inc(k);
          begin
                b[a[i].cs]:=k;
                th[k]:=a[i].gt;
          end
         end;
end;
procedure       up(u,v:longint);
begin
        while u<= m do
         begin
            d[u]:=d[u]+v;
            u:=u + u and (-u);
         end;
end;
function        get(u:longint):longint;
var     tg:     longint;
begin
        tg:=0;
        while u>0 do
         begin
          tg:=tg+d[u];
          u:=u - u and (-u);
         end;
         exit(tg);
end;
function       tim(x:longint):longint;
var     l,h,m1,x1,luu     :       longint;
begin
        l:=1;
        h:=m;
        luu:=-1;
        repeat
              m1:=(l+h) div 2;
              x1:=get(m1);
              if x1>=x then
               begin
                if x1=x then luu:=m1;
                h:=m1-1;
               end
              else l:=m1+1;
        until l>h;
        exit(luu);
end;
procedure       xuly;
var     i,j       :longint;
begin
        for i:=1 to n do
         begin
          if c[i]='I' then
           begin
                if dd[b[i]]=0 then
                 begin
                        dd[b[i]]:=1;
                        up(b[i],1);
                        inc(sl);
                 end;
           end;
          if c[i]='D' then
           begin
                if dd[b[i]]=1 then
                 begin
                        dd[b[i]]:=0;
                        up(b[i],-1);
                        dec(sl);
                 end;
           end;
           if c[i]='C' then
                writeln(g,get(b[i]-1));
           if c[i]='K' then
           begin

           if b[i]>sl  then writeln(g,'invalid')
           else
                begin
                j:=tim(b[i]);
                writeln(g,th[j]);
                end;
           end;
          end;
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
