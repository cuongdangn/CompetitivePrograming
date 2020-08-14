uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100011;
var     g,f     :       text;
        l,r,d,a  :       array[1..maxn] of longint;
        it,cong  :       array[1..4*maxn] of longint;
        n,m,nua     :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure      dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
end;
procedure       sub1;
var     i,k     :       longint;
        ok      :       boolean;
begin
        nua:=n div 2;
        for k:=nua downto 1 do
         begin
           for i:=1 to m do
            begin
             l[i]:=0;
             r[i]:=0;
            end;
           for i:=1 to k do  inc(l[a[i]]);
           for i:=k+1 to k*2 do inc(r[a[i]]);
           ok:=true;
           for i:=m downto 1 do
            begin
             d[i]:=d[i+1]+r[i+1]-l[i];
             if d[i]<0 then
              begin
               ok:=false;
               break;
              end;
            end;
           if ok then
            begin
             writeln(g,k);
             dong;
             halt;
            end;
         end;
         writeln(g,-1);
end;
procedure       buil(k,l,h:longint);
var     mi      :       longint;
begin
        if l=h then
         begin
          it[k]:=d[l];
          exit;
         end;
         mi:=(l+h) div 2;
         buil(k*2,l,mi);
         buil(k*2+1,mi+1,h);
         it[k]:=min(it[k*2],it[k*2+1]);
end;
procedure       lamdung(k:longint);
begin
        it[k*2]:=it[k*2]+cong[k];
        it[k*2+1]:=it[k*2+1]+cong[k];
        cong[k*2]:=cong[k*2]+cong[k];
        cong[k*2+1]:=cong[k*2+1]+cong[k];
        cong[k]:=0;
end;
procedure       up(k,l,h,i,j,x:longint);
var mi : longint;
begin
        if (j<l)or(i>h) then exit;
        if (l>=i)and(h<=j) then
         begin
           it[k]:=it[k]+x;
           cong[k]:=cong[k]+x;
           exit;
         end;
         mi:=(l+h) div 2;
         lamdung(k);
         up(k*2,l,mi,i,j,x);
         up(k*2+1,mi+1,h,i,j,x);
         it[k]:=min(it[k*2],it[k*2+1]);
end;
procedure       sub2;
var     k,i       :       longint;
begin
        nua:=n div 2;
        for i:=1 to nua do inc(l[a[i]]);
        for i:=nua+1 to nua*2 do inc(r[a[i]]);
        for i:=m downto 1 do d[i]:=d[i+1]+r[i+1]-l[i];
        buil(1,1,m);
        if it[1]>=0 then
         begin
          writeln(g,nua);
          exit;
         end;
        for k:=nua-1 downto 1 do
         begin
           up(1,1,m,1,a[k+1]-1,1);
           up(1,1,m,1,a[(k+1)*2]-1,-1);
           up(1,1,m,1,a[(k+1)*2-1]-1,-1);
           up(1,1,m,1,a[k+1],1);
           if it[1]>=0 then
            begin
             writeln(g,k);
             exit;
            end;
         end;
         writeln(g,-1);
end;
begin
        mo;
        doc;
        sub2;
        dong;
end.


