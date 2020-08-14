uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n    :       longint;
        a,sl,h1       :       array[1..50000] of longint;
        h   :       array[1..1000001] of longint;
        kq  :       array[1..50010] of ansistring;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g)
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
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
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

procedure       xuly;
var     i,j,kq1       :       longint;
        s       : ansistring;
begin
        randomize;
        QS(1,n);
        kq1:=1;
        h[a[1]]:=1;
        h1[1]:=1;
        for i:=2 to n do
         begin
          if h[a[i]]>0 then begin h[a[i]]:=h[a[i]]+1;kq1:=max(kq1,h[a[i]]);h1[i]:=h[a[i]];continue end;
          for j:=1 to trunc(sqrt(a[i])) do
           if a[i] mod j=0 then
            begin
             if h[a[i]]<h[a[i] div j]+1 then begin h[a[i]]:=h[a[i] div j]+1; end;
             if h[a[i]]<h[j]+1 then begin h[a[i]]:=h[j]+1; end;
            end;
            h1[i]:=h[a[i]];
            kq1:=max(kq1,h[a[i]]);
         end;
         writeln(g,kq1);
         for i:=1 to n do
          begin
           str(a[i],s);
           kq[h1[i]]:=kq[h1[i]]+' '+s;
           inc(sl[h1[i]]);
          end;
          for i:=1 to kq1 do
            writeln(g,sl[i],kq[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
