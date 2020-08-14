const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..100010] of string[10];
        bit,b       :       array[1..100008] of longint;
        kq      :   qword;
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
        for i:=1 to n do readln(f,a[i]);
end;

procedure       QS1(l,h  :       longint);
var     i,j,t      :       longint;
        tg,x      :       string[10];
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
                                t:=b[i];
                                b[i]:=b[j];
                                b[j]:=t;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;
procedure       QS(l,h  :       longint);
var     i,j,t      :       longint;
        tg,x      :       string[10];
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
function        dao(s:string):string;
var     i,m       :       longint;
        tg      :       string;
begin
        m:=length(s);
        tg:='';
        for i:=1 to m do
          tg:=tg+s[m-i+1];
        exit(tg);
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
          tg:=tg+bit[i];
          i:=i-i and (-i);
         end;
         exit(tg);
end;
procedure       up(i:longint);
begin
        while i<=n do
         begin
          bit[i]:=bit[i]+1;
          i:=i+i and (-i);
         end;
end;
procedure       init;
var     i,j:    longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n do
         a[i]:=dao(a[i]);
        for i:=1 to n do
         b[i]:=i;
         QS1(1,n);
        for i:=1 to n do
         begin
          j:=get(b[i]);
          kq:=kq+int64(i-j-1);
          up(b[i]);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        dong;
end.
