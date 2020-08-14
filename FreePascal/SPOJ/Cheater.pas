const   finp    =       'Cheater.INP';
        fout    =       'Cheater.OUT';
type    bg      =       record
        da,cu,gt,ton    :       double;
        end;
var     g,f:    text;
        n,m     :       longint;

        p,x,a       :       array[1..100000] of double;
        it      :       array[1..400000] of bg;
        c,kq       :       extended;
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
var     i,j     :       longint;
begin
        read(f,n,m,c);

        for i:=1 to n do
         read(f,x[i]);

        for i:=1 to n-1 do
         read(f,p[i]);

        for i:=1 to n-1 do
         a[i]:=(x[i+1]-x[i])/2 - c*p[i]/100;
end;
function       max(a,b:extended):extended;
begin
         if a<b then exit(b) else exit(a);
end;
procedure       buil(k,i,j:longint);
var     mid     :       longint;
begin
        if i=j then
         begin
          it[k].gt :=a[i];
          it[k].da:=a[i];
          it[k].cu:=a[i];
          it[k].ton:=a[i];
          exit;
         end;
        mid:=(i+j) div 2;
        buil(k*2,i,mid);
        buil(k*2+1,mid+1,j);
        it[k].ton:=it[k*2].ton+it[k*2+1].ton;
        it[k].da:=max(it[k*2].da,it[k*2+1].da+it[k*2].ton);
        it[k].cu:=max(it[k*2+1].cu,it[k*2].cu+it[k*2+1].ton);

        it[k].gt:=max(it[k*2].gt,it[k*2+1].gt);
        it[k].gt:=max(it[k].gt,it[k*2].cu+it[k*2+1].da);
end;
function       get(k,i,j,x,y:  longint):bg;
var     mid:longint;
        tg1,tg2,tg3: bg;
begin
        if (x<=i)and(j<=y) then exit(it[k]);
        mid:=(i+j) div 2;
        if mid>=y then exit(get(k*2,i,mid,x,y));
        if mid+1<=x then exit(get(k*2+1,mid+1,j,x,y));

        tg1:=get(k*2,i,mid,x,y);
        tg2:=get(k*2+1,mid+1,j,x,y);
        tg3.ton:=tg2.ton+tg1.ton;
        tg3.da:=max(tg1.da,tg2.da+tg1.ton);
        tg3.cu:=max(tg2.cu,tg1.cu+tg2.ton);

        tg3.gt:=max(tg1.gt,tg2.gt);
        tg3.gt:=max(tg3.gt,tg1.cu+tg2.da);
        exit(tg3);
end;
procedure       xuly;
var     i,u,v   :       longint;
        tg      :bg;
begin
        buil(1,1,n-1);
        for i:=1 to m do
         begin
                read(f,u,v);
                tg:=get(1,1,n-1,u,v-1);
              //  writeln(tg.gt:0:6);
                if tg.gt>0 then kq:=kq+tg.gt;
         end;
         writeln(g,kq:0:6);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
