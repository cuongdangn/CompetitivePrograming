const   finp    =       'SUMSETS.INP';
        fout    =       'SUMSETS.OUT';
type    bg      =       record
        x,y     :       longint;
        gt      :       longint;
        end;
        bg1     =       record
        gt,i:longint;
        end;
var     g,f     :       text;
        a       :       array[1..1000] of bg1;
        s,h       :       array[1..1000001] of bg;
        n,dem       :       longint;
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
procedure       kt;
var     i,j:longint;
begin
        dem:=0;
        for i:=1 to n-1 do
                for j:=i+1 to n do
                begin
                        inc(dem);
                        s[dem].gt:=a[i].gt+a[j].gt;
                        s[dem].x:=i;
                        s[dem].y:=j;
                end;

end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x    :       int64;    tg:bg;
begin
        i:=l;
        j:=h;
        x:=s[(l+h)div 2].gt;
        repeat
                while s[i].gt<x do inc(i);
                while s[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=s[i];
                                s[i]:=s[j];
                                s[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>J;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
Function Find(X:int64;l,r,i,j:longint):boolean;
var
        mid,d,c         :               longint;
begin
        Find:=false;d:=l;c:=r;
        While d<=c do
        begin
                mid:=(d+c) shr 1;
                if s[mid].gt=X then
                       begin
                        if ((s[mid].x<>i)and(s[mid].y<>i))and((s[mid].x<>j)and(s[mid].y<>j))then
                        exit(true)
                        else if (s[mid+1].gt=x)or(s[mid-1].gt=x) then exit(true);
                        exit(false);
                       end
                else
                if s[mid].gt<X then
                        d:=mid+1
                else
                        c:=mid-1;
        end;
end;
procedure       QS1(l,h:longint);
var     i,j     :       longint;
        x    :       int64;
        tg   :       bg1;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2].gt;
        repeat
                while a[i].gt>x do inc(i);
                while a[j].gt<x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>J;
if i<h then QS1(i,h);
if j>l then QS1(l,j);
end;



procedure       xuly;
var     i,j       :longint;
        x       : int64;
        kq      : int64;
begin
        kt;
        QS(1,dem);
        QS1(1,n);

        for i:=1 to n do
                begin
                        if find(x,1,dem,a[i].i,a[j].i) then
                        begin
                                writeln(g,a[i].gt);
                                exit;
                        end;
                end;
                writeln(g,'no solution');
end;
procedure       doc;
var     i       :longint;
begin
        readln(f,n);
        while n>0 do
                begin
                        for i:=1 to n do
                        begin
                        readln(f,a[i].gt);
                        a[i].i:=i;
                        end;

                        xuly;
                        readln(f,n);
                end;
end;
begin
        mo;
        doc;
        dong;
end.
