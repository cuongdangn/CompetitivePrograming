{$MODE OBJFPC}
const   finp            =       'BINPACK2.INP';
        fout            =       'BINPACK2.OUT';
        maxm            =       1048576;
        maxn            =       101;
type    arr     =       array[1..maxm] of int64;
var     f,g     :       text;
        n,k     :       integer;
        a       :       array[0..maxn] of int64;
        s       :       int64;
        kq      :       array[0..maxn] of integer;
        P,Q,luu1,luu2:arr;
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
var     i:      integer;
begin
        readln(f,n,k);
        s:=0;
        for i:=1 to n do
                begin
                        read(f,a[i]);
                        s:=s+a[i];
                end;
                readln(f);
end;
procedure       sub3;
var       w,t:int64;
          i,j:integer;
begin
        i:=1; kq[1]:=1;
        w:=s div 2;
        t:=a[1];
        while (t<=w)and(i<n) do
                begin
                        inc(i);
                        kq[i]:=1;
                        t:=t+a[i];
                end;
        kq[i]:=0;
        for j:=i+1 to n do kq[i]:=2;
        for i:=1 to k-1 do kq[i]:=0;
        for i:=1 to n do write(g,kq[i]);
        writeln(g);
end;
procedure       doi(var a,b:int64);
var     tg:int64;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,tg    :       int64;
begin
        i:=l;
        j:=h;
        x:=Q[(l+h) div 2];
        repeat
                while Q[i]<x do inc(i);
                while Q[j]>x do dec(j);
                if i<=j then
                        begin
                                doi(Q[i],Q[j]);
                                doi(luu2[i],luu2[j]);
                                inc(i);
                                dec(j);
                        end;
        until           i>j ;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
function        get(u:int64;t:integer):integer;
begin
        get:=u shr (t-1) and 1;
end;
function        chat(x:int64;l,h:longint):longint;
var     mid,d,c :       longint;
begin
        chat:=0;
        d:=l;
        c:=h;
        while d<c do
        begin
                mid:=(d+c) shr 1;
                if q[mid]=x then exit(mid)
                else
                if q[mid]<x then d:=mid+1
                else c:=mid-1;
        end;
end;
procedure       sub2;
var     i,j,n1,n2,m1,m2,u,v     :       integer;
        t,w     :       int64;
begin
        w:=s div 2;
        n1:=n div 2;
        n2:=n-n1;
        m1:=1 shl n1-1;
        m2:=1 shl n2-1;
        for i:=0 to m1 do
                begin
                        t:=0;
                        for j:=1 to n1 do
                                if get(i,j)=1 then
                                        t:=t+a[j];
                                        p[i+1]:=t;
                                        luu1[i+1]:=i;
                end;
        for i:=0 to m2 do
                begin
                        t:=0;
                        for j:=1 to n2 do
                        if get(i,j)=1 then
                                t:=t+a[j+n1];
                                q[i+1]:=t;
                                luu2[i+1]:=i;
                end;
        QS(1,m2+1);
        for i:=1 to m1+1 do
        if p[i]<w then
                begin
                        j:=chat(w-p[i],1,m2+1);
                        if j<>0 then break;
                end;
        for u:=1 to n1 do
        if get(luu1[i],u)=1 then
        kq[u]:=1
        else kq[u]:=2;
        for u:=1 to n2 do
        if get(luu2[j],u)=1 then kq[n1+u]:=1
        else kq[n1+u]:=2;
        for u:=1 to n do write(g,kq[u]);
        writeln(g);
end;
procedure       xuly1;
begin
        doc;
        fillchar(kq,sizeof(kq),0);
        if k>=1 then sub3 else sub2;
end;
procedure       xuly;
var     te,i    :       integer;
begin
        readln(f,te);
        for i:=1 to te do xuly1;
end;
begin
        mo;
        xuly;
        dong;
end.