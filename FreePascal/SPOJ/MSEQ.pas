uses    math;
const   finp    =       'MSEQ.inp';
        fout    =       'MSEQ.out';
type    arr     =       array[0..100000] of longint;
var     g,f     :       text;
        n,m,dem,t       :       longint;
        a,b        : array[0..100000] of longint;
        sl,dd1       : array[0..100000] of longint;
        dd       : array[0..1000000000] of byte;
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
var     i:longint;
begin
        dem:=0;
        readln(f,n,m);
        t:=n;
        for i:=1 to n do
                begin
                        read(f,a[i]);
                        a[i]:=a[i] mod m;
                end;
end;
function          chat(x,i,j:int64):int64;
var     d,c,m     :       int64;
begin
        d:=i;
        c:=j;
        chat:=0;
        while d<=c do
                begin
                        m:=(d+c) div 2;
                        if a[m]=x then
                             begin
                                chat:=m;
                                c:=m-1;
                             end
                        else
                        if a[m]<x then d:=m+1
                        else c:=m-1;
                end;
end;
procedure       QS(l,h:longint;var      b:arr);
var     i,j,x,tg        :       longint;
begin
        i:=l;
        j:=h;
        x:=b[(l+h) div 2];
        repeat
                while x>b[i] do inc(i);
                while x<b[j] do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until          i>j;
        if l<j then QS(l,j,b);
        if i<h then QS(i,h,b);
end;
procedure       xuly;
var     i,j:longint;
        kq,dem1      :       longint;
begin
        QS(1,n,a);
        dem:=1;
        b[1]:=1;
        kq:=0;
        for i:=2 to n do
                begin
                        if a[i]<>a[i-1] then
                                begin
                                        dem:=i;
                                        b[dem]:=1;
                                end
                        else inc(b[dem]);
                end;
        kq:=0;

        if a[1]=0 then t:=n-b[1];
        for i:=1 to n do
                begin
                        if (b[i]<>0)and(a[i]<>0)and(dd1[i]=0) then
                                begin
                                        if m mod 2=0 then
                                        if a[i]=m div 2 then
                                        begin
                                                kq:=kq+1;
                                                dd1[a[i]]:=1;
                                        end
                                        else
                                        begin
                                        j:=chat((m-a[i])mod m,1,n);
                                        dd1[j]:=1;
                                        kq:=kq+max(b[j],b[i]);
                                        end
                                        else
                                                begin
                                                j:=chat((m-a[i])mod m,1,n);
                                                dd1[j]:=1;
                                                kq:=kq+max(b[j],b[i]);
                                                end;
                                end;
                end;
        if a[1]=0 then kq:=kq+1;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
