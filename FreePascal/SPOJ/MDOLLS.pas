{$INLINE ON}
{$R-,Q-}
const
        inp='';
        out='';
        maxn=20000;
var
        t,n,kq:integer;
        a,b,f:array[0..maxn] of integer;
        fi,fo:text;
procedure swap(var c,d:integer);
var
        tg:integer;
begin
        tg:=c;
        c:=d;
        d:=tg;
end;

procedure quicksort;
        procedure sort(l,r:integer);
        var
                key,i,j:integer;
                tg1,tg2:integer;
        begin
                if l>=r then exit;
                key:=(l+r) div 2;
                tg1:=a[key];     tg2:=b[key];
                i:=l;
                j:=r;
                repeat
                        while (a[i]<tg1) or ((a[i]=tg1)and (b[i]>tg2)) do inc(i);
                        while (a[j]>tg1) or ((a[j]=tg1)and (b[j]<tg2)) do dec(j);
                        if i<=j then
                                begin
                                        if i<j then
                                                begin
                                                        swap(a[i],a[j]);
                                                        swap(b[i],b[j]);
                                                end;
                                        inc(i);
                                        dec(j);
                                end;
                until i>j;
                if l<j then sort(l,j);
                if i<r then sort(i,r);
        end;
        begin
                sort(1,n);
        end;

function find(x:integer):integer;
var
        l,r,mid:integer;
begin
        find:=0;
        l:=1;     r:=kq;
        while l<=r do
                begin
                        mid:=(l+r) div 2;
                        if f[mid]<x then
                                begin
                                        find:=mid;
                                        r:=mid-1;
                                end
                                else l:=mid+1;
                end;
end;

procedure process;
var
        tg,i:integer;
begin
        quicksort;
        kq:=0;
        for i:=1 to n do
                begin
                        tg:=find(b[i]);
                        if tg=0 then
                                begin
                                        inc(kq);
                                        f[kq]:=b[i];
                                end
                                else f[tg]:=b[i];
                end;
end;


procedure process2;
var
        i,j,t:integer;
begin
        assign(fi,inp);
        reset(fi);
        assign(fo,out);
        rewrite(fo);
        readln(fi,t);
        for i:=1 to t do
                begin
                        readln(fi,n);
                        for j:=1 to n do
                                read(fi,a[j],b[j]);
                        process;
                        writeln(fo,kq);
                end;
        close(fi);
        close(fo);
end;

begin
        process2;
end.
