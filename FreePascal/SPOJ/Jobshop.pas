uses    math;
const   finp    =       'Jobshop.INP';
        fout    =       'Jobshop.OUT';
var     g,f     :       text;
        n,m,kq     :       longint;
        a       :       array[1..100,1..100] of longint;
        d,dd       :       array[1..100] of longint;
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
var       i,j,k,u   :       longint;
begin
        readln(f,n,m);
        kq:=maxlongint;
        for i:=1 to  n do
         begin
            read(f,k);
            d[i]:=k;
            for j:=1 to k do
                begin
                  read(f,u);
                  a[u,i]:=1;
                end;
            readln(f);
         end;
end;
procedure       sub1;
var     i,ngay,j       :       longint;
        ok      :      boolean;
begin
        ngay:=1;
        repeat
                ok:=true;
                for i:=1 to n do
                if dd[i]=0 then
                if d[i]=0 then
                 begin
                 ok:=false;
                 dd[i]:=ngay;
                 end;
                 for i:=1 to n do
                 if dd[i]=ngay then
                 for j:=1 to n do
                 if a[i,j]=1 then dec(d[j]);
                 inc(ngay);
        until ok;
        for i:=1 to n do
         if dd[i]=0 then
                begin
                        writeln(g,-1);
                        exit;
                end;
        writeln(g,ngay-2);
end;
procedure       sub2(t:longint;ngay:longint);
var     j,i,k,t1:longint;
        v       :array[1..15] of longint;
        dem,dem1     :       longint;
begin
        if t= 1 shl n-1 then
                begin
                        kq:=min(kq,ngay);
                        exit;
                end;
        dem:=0;
        for j:=1 to n do
         if (t shr (j-1) and 1=0)  then
         if d[j]=0 then
                begin
                inc(dem);
                v[dem]:=j;
                end;
         if dem=0 then exit;

         if dem<=m then
          begin
                t1:=t;
                for j:=1 to dem do
                        begin
                        t1:=t1 or (1 shl (v[j]-1));
                          for k:=1 to n do
                           if a[v[j],k]=1 then dec(d[k]);
                        end;
                sub2(t1,ngay+1);
          end
          else
           begin
                for i:=1 to 1 shl dem-1 do
                 begin
                        dem1:=0;
                        t1:=t;
                        for j:=1 to dem do
                         if (i shr (j-1) and 1=1) then inc(dem1);
                         if dem1=m then
                        begin
                             for j:=1 to dem do
                               if (i shr (j-1) and 1=1) then t1:=t1 or (1 shl (v[j]-1));
                             sub2(t1,ngay+1);
                        end;
                 end;
           end;
end;


procedure       xuly;
begin
        if n<=m then sub1 else
        begin
                sub2(0,0);
                if kq=maxlongint then write(g,-1) else writeln(g,kq);
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
