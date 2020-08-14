const   finp            =       '';
        fout            =       '';
var     g,f     :       text;
        n,m     :       longint;
        kq      :       int64;
        s       :       array[0..5000001] of longint;
        du      :       array[0..1000000] of longint;
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
procedure       QS(l,h  :       longint);
var     i,j     :       longint;
        x,tg    :       longint;
begin
        i:=l;
        j:=h;
        x:=s[(l+h) div 2];
        repeat
                while s[i]<x do inc(i);
                while s[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=s[i];
                                s[i]:=s[j];
                                s[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var     i       :longint;
        du1       :      int64;
        j       :       longint;
begin
        readln(f,n,m);
        du1:=1;
        for i:=1 to n do
                begin
                        read(f,j);
                        j:=j mod m;
                        s[i]:=(s[i-1]+j)mod m;
                end;
        if m<=1000000 then
                begin
                         du[0]:=1;
                         for i:=1 to n do
                         inc(du[s[i]]);
                         for i:=0 to m-1 do
                        kq:=kq+int64(int64(du[i])*int64(du[i]-1))div 2;
                end
                else
                begin
                QS(0,n);
                s[n+1]:=m;
                for i:=0 to n do
                if s[i+1]<>s[i] then
                begin
                        kq:=kq+int64(int64(du1)*int64(du1-1))div 2;
                        du1:=1;
                end
                        else
                inc(du1);
           end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
