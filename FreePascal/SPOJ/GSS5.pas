uses    math;
const   finp    =       '';
        fout    =       '';

type    bg      =       record
        tt,ht,s,kx :longint;
        end;
var     a,s    :array[0..50001] of longint;
        it      :array[1..200010] of bg;
        n,t,i       :       longint;
        g,f     :       text;
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
        read(f,n);
        for i:=1 to n do
                read(f,a[i]);
        for i:=1 to n do s[i]:=s[i-1]+a[i];

end;
procedure       buil(k,l,r:longint);
var     m       :       longint;
begin
        if l=r then
         begin
                it[k].tt:=a[l];
                it[k].ht:=a[l];
                it[k].s:=a[l];
                it[k].kx:=a[l];
                exit;
         end;
         m:=(l+r) div 2;
         buil(k*2,l,m);
         buil(k*2+1,m+1,r);
         IT[k].tt:=max(it[k*2].tt,it[k*2].s+it[k*2+1].tt);
         IT[k].s:=it[k*2].s+it[k*2+1].s;
         it[k].ht:=max(it[k*2+1].ht,it[k*2+1].s+it[k*2].ht);
         it[k].kx:=max(max(it[k*2].kx,it[k*2+1].kx),it[k*2].ht+it[k*2+1].tt);
end;
function       get(k,l,r,i,j:longint):bg;
var     m       :       longint;
        p1,p2,p3        :       bg;
begin
       if (r<i)or(l>j) then exit;
       if (i<=l)and(r<=j) then exit(it[k]);
       m:=(l+r) div 2;
       if (j<=m) then exit(get(k*2,l,m,i,j))
       else
        if (i>m) then exit(get(k*2+1,m+1,r,i,j))
        else
         begin
          p1:=get(2*k,l,m,i,j);
          p2:=get(2*k+1,m+1,r,i,j);
          p3.s:=p1.s+p2.s;
          p3.tt:=max(p1.tt,p1.s+p2.tt);
          p3.ht:=max(p2.ht,p2.s+p1.ht);
          p3.kx:=max(max(p1.kx,p2.kx),p1.ht+p2.tt);
          exit(p3);
         end;
end;
procedure       xuly;
var     i,q       :       longint;
        u,v,u1,v1,kq       :       longint;
        res,res1: bg;
begin
        doc;
        buil(1,1,n);
        readln(f,q);
        for i:=1 to q do
         begin
         readln(f,u,v,u1,v1);
        if v<=u1 then
        begin
         res:=get(1,1,n,u,v);
         res1:=get(1,1,n,u1,v1);
         writeln(g,res.ht+res1.tt+s[u1-1]-s[v]);
         end
        else      //u,u1,v,v1
         begin
         res:=get(1,1,n,u,u1);
         res1:=get(1,1,n,v,v1);
         kq:=res.ht+res1.tt+s[v-1]-s[u1];

         res:=get(1,1,n,u,u1);
         res1:=get(1,1,n,u1,v);
         kq:=max(kq,res.ht+res1.tt-a[u1]);

         res:=get(1,1,n,u1,v);
         res1:=get(1,1,n,v,v1);
         kq:=max(kq,res.ht+res1.tt-a[v]);

         res:=get(1,1,n,u1,v);
         kq:=max(kq,res.kx);

         writeln(g,kq);
         end
         end
end;
begin
        mo;
        readln(f,t);
        for i:=1 to t do xuly;
        dong;
end.

