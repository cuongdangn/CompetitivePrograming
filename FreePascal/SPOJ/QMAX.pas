uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,q,res   :       longint;
        IT      :       array[0..200000] of longint;
        a       :       array[0..50000] of longint;
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
var     i,u,v,k       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v,k);
                a[u]:=a[u]+k;
                a[v+1]:=a[v+1]-k;
         end;
         for i:=1 to n do
          a[i]:=a[i-1]+a[i];
end;
procedure       update(k,i,l,r:longint);
var     m       :       longint;
begin
        if (i<l)or(i>r) then exit;
        if l=r then
         begin
                it[k]:=a[i];
                exit;
         end;
         m:=(l+r) div 2;
         update(k*2,i,l,m);
         update(k*2+1,i,m+1,r);
         IT[k]:=max(it[k*2],it[k*2+1]);
end;
procedure       get(k,i,j,l,r:longint);
var     m       :       longint;
begin
        if (i>r)or(j<l) then exit;
        if (i<=l)and(j>=r) then
         begin
                res:=max(res,it[k]);
                exit;
         end;
         m:=(l+r) div 2;
         get(k*2,i,j,l,m);
         get(k*2+1,i,j,m+1,r);
end;
procedure       xuly;
var     i,q       :       longint;
        u,v       :       longint;
begin
        for i:=1 to n do update(1,i,1,n);
        readln(f,q);
        for i:=1 to q do
         begin
         readln(f,u,v);
         res:=0;
         get(1,u,v,1,n);
         writeln(g,res);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
