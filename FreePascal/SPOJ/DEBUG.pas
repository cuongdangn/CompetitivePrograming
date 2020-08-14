uses    math;
const   finp    =       'DEBUG.INP';
        fout    =       'DEBUG.OUT';
var     g,f     :       text;
        kq,n,m     :       longint;
        a       :       array[1..300,1..300] of char;

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
        readln(f,m,n);
        for i:=1 to m do
          begin
           for j:=1 to n do read(f,a[i,j]);
           readln(f);
          end;
end;
function        ktrhang(i1,i2,j1,j2:longint):boolean;
var     jj,j     :       longint;
begin
        if (i1<=0)or(i2>m)or(j1<=0)or(j2>n) then exit(false);
        j:=j1;
        jj:=j2;
        while j<=j2 do
         begin
          if a[i1,j]<>a[i2,jj] then exit(false);
          inc(j);
          dec(jj);
         end;
         exit(true);
end;
function        ktrcot(j1,j2,i1,i2:longint):boolean;
var     i,ii    :       longint;
begin
        if (i1<=0)or(i2>m)or(j1<=0)or(j2>n) then exit(false);
        i:=i1;
        ii:=i2;
        while i<=i2 do
         begin
          if a[i,j1]<>a[ii,j2] then exit(false);
          inc(i);
          dec(ii);
         end;
         exit(true);
end;


procedure       xuly;
var     i,j,k,t,x,i1,i2,j1,j2   :       longint;
begin
      kq:=0;
      for i:=1+kq div 2 to m-1-kq div 2 do
        for j:=1+kq div 2 to n-1-kq div 2 do
          if (a[i,j]=a[i+1,j+1])and(a[i,j+1]=a[i+1,j]) then
           begin
            t:=2;
               i1:=i;i2:=i+1;
            j1:=j;j2:=j+1;
             if 2*min(min(m-i2+1,n-j2+1),min(i1,j1))<=kq then continue;

            repeat
                t:=t+2;
                x:=(t-2) div 2;
                if not ktrhang(i1-x,i2+x,j1-x,j2+x) then break;
                if not ktrcot(j1-x,j2+x,i1-x,i2+x) then break;
            until  false;
            kq:=max(kq,t-2);
           end;
        for i:=1+kq div 2 to m-kq div 2  do        //chan
         for j:=1+kq div 2 to n-kq div 2 do
          begin
                t:=1;
              if 2*min(min(m-i+1,n-j+1),min(i,j))-1<=kq then continue;
            repeat
                t:=t+2;
                x:=(t-1) div 2;
                if not ktrhang(i-x,i+x,j-x,j+x) then break;
                if not ktrcot(j-x,j+x,i-x,i+x) then break;
            until false;
                kq:=max(kq,t-2);
          end;
           if kq<=1 then write(g,-1) else writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

