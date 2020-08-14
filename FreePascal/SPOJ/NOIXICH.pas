const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..20000] of longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
        read(f,a[i]);
end;
procedure       QS(l,h:longint);
var     i,j,tg,x:longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);dec(j);
                        end;
        until    i>J;
        if i<h then qs(i,h);
        if j>l then qs(l,j);
end;
procedure       xuly;
var     dem,i   :       longint;
begin
        dem:=0;
        for i:=1 to n do
        begin
                if a[i] < n-1 then
                begin
                        dem:=dem+a[i];
                        n:=n-a[i]-1;
                end
                else
                begin
                      dem:=dem+n-1;
                      break;
                end;
        end;
        write(g,dem);
end;
begin
        mo;
        doc;
        Qs(1,n);
        xuly;
        close(f);
        close(g);
end.
