uses    math;
const   finp    =       'DEBUG.INP';
        fout    =       'DEBUG.OUT';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        kq,n,m     :       longint;
        a       :       array[1..300,1..300] of char;
        n1      :       longint;
        st      :       array[1..90001] of bg;
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
function        nhohon(a,b:bg):boolean;
var     i,j,i1,j1     :       longint;
begin
        i:=a.x;j:=a.y;
        i1:=b.x;j1:=b.y;
        exit(min(min(m-i+1,n-j+1),min(i,j))<min(min(m-i1+1,n-j1+1),min(i1,j1)))
end;
function        lonhon(a,b:bg):boolean;
var     i,j,i1,j1     :       longint;
begin
        i:=a.x;j:=a.y;
        i1:=b.x;j1:=b.y;
        exit(min(min(m-i+1,n-j+1),min(i,j))>min(min(m-i1+1,n-j1+1),min(i1,j1)))
end;
procedure       QS(l,h  :       longint);
var     i,j,t      :       longint;
        tg,x      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=st[t];
        repeat
                while lonhon(st[i],x) do inc(i);
                while nhohon(st[j],x) do dec(j);
                if i<=j then
                        begin
                                tg:=st[i];
                                st[i]:=st[j];
                                st[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
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
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          begin
           inc(n1);
           st[n1].x:=i;
           st[n1].y:=j;
          end;
          randomize;
          QS(1,n1);
end;
procedure       xuly;
var     t1,i,j,k,t,x,i1,i2,j1,j2   :       longint;
begin
      kq:=0;
      init;
      for t1:=1 to n1 do
      begin
        i:=st[t1].x;j:=st[t1].y;
        if (i<m)and(j<n) then
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
        end;
      ////////////////////////
      for t1:=1 to n1 do
          begin
                i:=st[t1].x;
                j:=st[t1].y;
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

