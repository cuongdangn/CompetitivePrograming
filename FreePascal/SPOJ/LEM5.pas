uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,kq       :       longint;
        a,vt,b,bb       :       array[0..100002] of longint;
        tru,l   :array[0..100002,0..102] of longint;
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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        readln(f,a[i]);
                        vt[i]:=i;
                end;
end;
procedure       QS(l,h:longint);
var     x,tg,i,j:longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                tg:=vt[i];
                                vt[i]:=vt[j];
                                vt[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until    i>J;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,j,k     :       longint;
begin
        QS(1,n);
        b[vt[1]]:=1;
        bb[1]:=1;
        k:=1;
        for i:=2 to n do
        begin
          if a[i]<>a[i-1] then inc(k);
          b[vt[i]]:=k;
          bb[i]:=k;
        end;

        for i:=2 to n do
         for j:=1 to 100 do
                begin
                     if a[i]-j=a[i-1] then tru[bb[i],j]:=bb[i-1]
                     else
                      if a[i]-j<a[i-1] then tru[bb[i],j]:=tru[bb[i-1],j-(a[i]-a[i-1])];
                end;
end;

procedure       xuly;
var     i,j,t,m,k1       :longint;
begin
        init;
        kq:=0;
        for i:=1 to n do
                for j:=1 to 100 do
                        begin
                          t:=tru[b[i],j];
                          l[b[i],j]:=max(l[t,j]+1,l[b[i],j]);
                          if kq<l[b[i],j] then
                                begin
                                        kq:=l[b[i],j];
                                        m:=i;  k1:=j;
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




