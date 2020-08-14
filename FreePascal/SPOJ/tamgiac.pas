uses    math;
const   finp    =       'tamgiac.inp';
        fout    =       'tamgiac.out';
        vc      =       10000000000;
type    node    = record
        min1,min2,max1:longint;
        end;
var     g,f     :       text;
        n       :       longint;
        t       :       array[0..400001] of node;
        a       :       array[1..100001] of longint;
        kq,mi1,mi2,ma:int64;
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
procedure      buil(x,i,j:longint);
var     mid:longint;
begin
        if i=j then
                begin
                        t[x].min1:=a[i];
                        t[x].min2:=maxlongint;
                        t[x].max1:=a[i];
                        exit;
                end;
        mid     :=(i+j) div 2;
        Buil(x*2,i,mid);
        buil(x*2+1,mid+1,j);
        t[x].max1:=max(t[x*2].max1,t[x*2+1].max1);
        if t[x*2].min1<t[x*2+1].min1 then
                begin
                        t[x].min1:=t[x*2].min1;
                        t[x].min2:=min(t[x*2+1].min1,t[x*2].min2);
                end
        else
                begin
                        t[x].min1:=t[x*2+1].min1;
                        t[x].min2:=min(t[x*2+1].min2,t[x*2].min1);
                end;
end;
procedure       get(x,i,j,l,r:longint);
var     mid     :       longint;
begin
        if (j<l)or(i>r) then exit;
        if (i>=l)and(j<=r) then
                begin
                        ma:=max(ma,t[x].max1);
                        if t[x].min1<mi1 then
                begin
                        mi2:=min(mi1,t[x].min2);
                        mi1:=t[x].min1;
                end
        else
                begin
                        mi2:=min(mi2,t[x].min1);
                end;
                   exit;
                end;

        mid:=(i+j) div 2;
        get(x*2,i,mid,l,r);
        get(x*2+1,mid+1,j,l,r);
end;
procedure       xuly;
var     i,j,j1       :longint;

begin
        readln(f,n);
        for i:=1 to n do
        read(f,a[i]);
        for i:=1 to 4*n do
                begin
                        t[i].min1:=maxlongint;
                        t[i].min2:=maxlongint;
                        t[i].max1:=-maxlongint;
                end;
        buil(1,1,n);
        i:=1;
        j:=3;         j1:=0;
        while (I<=j)and(j<=n) do
                begin
                        mi1:=maxlongint+1;
                        mi2:=maxlongint+1;
                        ma:=-mi1;
                        get(1,1,n,i,j);
                        while (mi1+mi2>ma)and(j<=n) do
                                begin
                                        j1:=j;
                                        inc(j);
                                        ma:=max(ma,a[j]);
                                        if a[j]<mi1 then
                                                begin
                                                        mi2:=min(mi1,a[j]);
                                                        mi1:=a[j];
                                                end
                                         else
                                                begin
                                                        mi2:=min(mi2,a[j]);
                                                end;
                                end;
                        kq:=max(kq,j1-i+1);
                        inc(i);
                end;
        writeln(g,kq);
end;
begin
        mo;
        xuly;
        dong;
end.
