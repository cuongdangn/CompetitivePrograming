const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        maxd,mind,a       :       array[1..1000000] of longint;
        q,n,res,res1:longint;
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
        readln(f,n,q);
        for i:=1 to n do readln(f,a[i]);
end;
function        min(a,b:longint):longint;
begin
        min:=(-abs(a-b)+a+b) div 2;
end;
function        max(a,b:longint):longint;
begin
        max:=(abs(a-b)+a+b) div 2;
end;
procedure       truyvan(k,l,r:longint);
var     m       :       longint;
begin
        if l=r then
        begin
                maxd[k]:=a[l];
                mind[k]:=a[l];
                exit;
        end;
        m:=(l+r) div 2;
        truyvan(k*2,l,m);
        truyvan(k*2+1,m+1,r);
        maxd[k]:=max(maxd[k*2],maxd[k*2+1]);
        mind[k]:=min(mind[k*2],mind[k*2+1]);
end;
procedure       truyvan1(k,l,r,i,j:longint);
var     m       :longint;
begin
        if (l>j) or (r<i) then exit;
        if (i<=l) and(j>=r) then
        begin
                res:=max(res,maxd[k]);
                res1:=min(res1,mind[k]);
                exit;
        end;
        m:=(l+r) div 2;
        truyvan1(k*2,l,m,i,j);
        truyvan1(k*2+1,m+1,r,i,j);
end;
procedure       xuly;
var     i,u,v:longint;
begin
        mo;
        doc;
        truyvan(1,1,n);
        for i:=1 to q do
        begin
         readln(f,u,v);
         res:=-1;
         res1:=maxlongint;
         truyvan1(1,1,n,u,v);
         writeln(g,res-res1);
        end;
        dong;
end;
begin
        xuly;
end.