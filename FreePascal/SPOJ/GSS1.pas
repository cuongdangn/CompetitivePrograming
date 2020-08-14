uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        maxc    =       1000000;
type    bg      =       record
        ma,mi,t :longint;
        end;
var     a,b     :array[0..50001] of longint;
        it,tr,ph      :array[1..200010] of bg;

        n       :       longint;
        res   :       longint;
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
        readln(f,n);
        for i:=1 to n do
                read(f,a[i]);
         for i:=1 to n do
          b[i+1]:=b[i]+a[i];
          n:=n+1;
end;
procedure       buil(k,l,r:longint);
var     m       :       longint;
begin
        if l=r then
         begin
                it[k].ma:=b[l];
                it[k].mi:=b[l];
                it[k].t:=b[l];
                if l=1 then it[k].t:=-maxc;
                exit;
         end;
         m:=(l+r) div 2;
         buil(k*2,l,m);
         buil(k*2+1,m+1,r);
         IT[k].ma:=max(it[k*2].ma,it[k*2+1].ma);
         IT[k].mi:=min(it[k*2].mi,it[k*2+1].mi);
         it[k].t:=max(it[k*2+1].ma-it[k*2].mi,max(it[k*2].t,it[k*2+1].t));
end;
procedure       get(k,i,j,l,r:longint);
var     m       :       longint;
begin
        if (i<=l)and(j>=r) then
         begin
                res:=max(res,it[k].t);
                if k mod 2 =0 then
                begin
                tr[k div 2].mi:=it[k].mi;
                tr[k div 2].ma:=it[k].ma
                end
                else
                begin
                ph[k div 2].mi:=it[k].mi;
                ph[k div 2].ma:=it[k].ma
                end;
                exit;
         end;
         m:=(l+r) div 2;
          tr[k]:=maxc;
        if not((i>m)or(j<l)) then
        begin
         get(k*2,i,j,l,m);
          if k mod 2 =0 then tr[k div 2]:=tr[k]
                else ph[k div 2]:=tr[k];
        end;
         ph[k]:=-maxc;
         if not((i>r)or(j<m+1)) then
         begin
         get(k*2+1,i,j,m+1,r);
          if k mod 2 =0 then tr[k div 2]:=min(ph[k],tr[k div 2])
                else ph[k div 2]:=max(ph[k div 2],ph[k]);
         end;
          res:=max(res,ph[k]-tr[k]);

end;
procedure       xuly;
var     i,q       :       longint;
        u,v       :       longint;
begin
        buil(1,1,n);
        readln(f,q);
        for i:=1 to q do
         begin
         readln(f,u,v);
         res:=-maxc;
         get(1,u,v+1,1,n);
         writeln(g,res);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

