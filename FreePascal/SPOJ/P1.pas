uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        w       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        m,n     :       longint;
        a       :       array[0..100010] of longint;
        sl,nt,p,cs :       array[1..10000] of longint;
        ke      :  array[1..10000] of node;
        dem     :  array[0..13] of longint;
        kq      :       longint;
        kq1     :       int64;
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
        for i:=1 to n do read(f,a[i]);
end;
procedure       sang(n:longint);
var     i,j     :       longint;
begin
        for i:=1 to n do p[i]:=0;
        p[1]:=1;
        for i:=2 to n do
         if p[i]=0 then
         begin
                j:=i;
                while j<=n do
                 begin
                  p[j]:=i;
                  j:=j+i;
                 end;
         end;
         for i:=2 to n do
          if p[i]=i then
           begin
            inc(m);
            nt[m]:=i;
            cs[i]:=m;
           end;
end;
function        pow(a,b:longint):longint;
var     tg      :       longint;
begin
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=tg*tg;
        if b mod 2=1 then tg:=tg*a;
        exit(tg);
end;
procedure       nap(var ke:node;w:longint);
var     p       :       node;
begin
        new(p);
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       phatich(i:longint);
var     x,nt,dem       :       longint;
begin
        x:=a[i];
       // writeln(x);
        while x>1 do
         begin
          nt:=p[x];
         // writeln(nt);
          dem:=0;
          while x mod nt =0 do
           begin
             inc(dem);
             //writeln(x,' ',nt);
             x:=x div nt;
           end;
           nap(ke[cs[nt]],dem);
          end;
end;

procedure       xuly;
var     i,j,t,w     :       longint;
        p       :       node;
begin
        sang(10000);
        for i:=1 to n do
         phatich(i);
        for j:=1 to m do
         begin
           p:=ke[j];
           for i:=0 to 13 do dem[i]:=0;
           t:=0;
           while p<> nil do
            begin
              w:=p^.w;
              inc(t);
              inc(dem[w]);
              p:=p^.next;
            end;
            dem[0]:=n-t;
           /////////////
           t:=0;
           for i:=0 to 13 do
           begin
            t:=t+dem[i];
            if t>=(n+1) div 2 then break;
           end;
           ///////////////
           sl[j]:=i;
           for i:=0 to 13 do
            kq:=kq+dem[i]*abs(i-sl[j]);
         end;
          kq1:=1;
           for i:=1 to m do
              if sl[i]>0 then kq1:=kq1*int64(pow(nt[i],sl[i]));
           writeln(g,kq,' ',kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.