const   finp    =       '';
        fout    =       '';
type    arr     =       array[1..7] of longint;
var     g,f     :       text;
        n,k     :       longint;
        a       :       array[0..100005] of arr;
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
function        cmp1(x:arr;i:longint):boolean;
var     j       :longint;
begin
        for j:=1 to k-1 do
        begin
         if a[i,j]>x[j] then exit(false);
         if a[i,j]<x[j] then exit(true);
        end;
         exit(false);
end;

function        cmp2(x:arr;i:longint):boolean;
var     j       :longint;
begin
        for j:=1 to k-1 do
        begin
         if a[i,j]<x[j] then exit(false);
         if a[i,j]>x[j] then exit(true);
        end;
         exit(false);
end;
procedure       QS(l,h  :       longint);
var     i,j,t,ii      :       longint;
        tg      :       arr;
        x       :       array[1..7] of longint;
begin
        i:=l;
        j:=h;
         t:=random(h-l+1)+l;
        for ii:=1 to k-1 do
         x[ii]:=a[t,ii];
        repeat
                while cmp1(x,i) do inc(i);
                while cmp2(x,j) do dec(j);
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
procedure       init;
var     i,j,t     :       longint;
begin
        for i:=1 to n do
         begin
         t:=a[i,1];
          for j:=2 to k do
            a[i,j-1]:=t-a[i,j];
         end;
          for j:=1 to k-1 do
           a[n+1,j]:=0;
         randomize;
         QS(1,n+1);
end;
procedure       xuly;
var     i,j     :       longint;
        t,kq       :       qword;
begin
        init;
        t:=1;
        kq:=0;
        for i:=2 to n+1 do
         begin
          for j:=1 to k-1 do
           if (a[i,j]<>a[i-1,j]) then begin kq:=kq+(t*(t-1)) div 2;t:=0;break; end;
           inc(t);
         end;
         kq:=kq+(t*(t-1)) div 2;
         writeln(g,kq);
end;
procedure        doc;
var     i,j,t,tt      :      longint;
        c       :char;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          readln(f,n,k);
          for j:=1 to n do
          begin
           read(f,c);
           for tt:=1 to k do
            a[j,tt]:=a[j-1,tt];
           tt:=ord(c)-96;
           a[j,tt]:=a[j-1,tt]+1;
          end;
          xuly;
          readln(f);
         end;
end;
begin
        mo;
        doc;
        dong;
end.
