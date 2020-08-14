const   finp    =       'DNC.INP';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..1000] of ansistring;
        da      :       array[1..1000] of integer;
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
        begin
        readln(f,a[i]);
        da[i]:=i;
        end;

end;
procedure       QS(l,h:integer);
var         x,i,j,tg:longint;
begin
        i:=l;
        j:=h;
        x:=da[(l+h) div 2];
        repeat
                while a[da[i]][x]='1' do inc(i);
                while a[x][da[j]]='1' do dec(j);
                if i<=j then
                        begin
                                tg:=da[i];
                                da[i]:=da[j];
                                da[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       xuat;
var     i:longint;
begin
        QS(1,n);
        for i:=1 to n do write(g,da[i],' ');
end;
begin
        mo;
        doc;
        xuat;
        dong;
end.


