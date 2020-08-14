const   finp    =       'STRIP.INP';
        fout    =       'STRIP.OUT';
        don     :       array[1..4]of longint=(1,-1,0,0);
        cot     :       array[1..4]of longint=(0,0,1,-1);
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..2001,1..2001] of char;
        l       :       array[1..2001,1..2001] of longint;
        dd      :       array[1..2001,1..2001] of byte;
        st      :       array[1..4000010] of bg;
        dau,cuoi,kq  :       longint;
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
        readln(f,n);
        for i:=1 to n do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       khoitao;
var     i,j     :      longint;
begin
        for i:=1 to n do
         for j:=1 to n do dd[i,j]:=0;
end;
procedure       init;
var     i,j,j1     :       longint;
begin
        khoitao;
        for i:=1 to n do
         for j:=1 to n do
          if (a[i,j]='O')and(dd[i,j]=0) then
           begin
            j1:=i;
            while (j1<=n)and(a[j1,j]='O') do
             begin
              dd[j1,j]:=1;
              j1:=j1+1;
              end;
             l[i,j]:=j1-i;
            end;
end;
function        check(x,y       :       longint):boolean;
begin
        exit((x>0)and(y>0)and(x<=n)and(y<=n)and(a[x,y]='O')and(dd[x,y]=0));
end;
procedure       loangloai(x,y:longint);
var     i,j,k       :       longint;
        tg      :       bg;
begin
        dd[x,y]:=1;
        dau:=1;cuoi:=1;
        st[dau].x:=x;
        st[dau].y:=y;
        while dau<=cuoi do
         begin
          tg:=st[dau];
          inc(dau);
          for k:=1 to 4 do
           begin
            i:=tg.x+don[k];
            j:=tg.y+cot[k];
            if check(i,j) then
             begin
              inc(cuoi);
              st[cuoi].x:=i;
              st[cuoi].y:=j;
              dd[i,j]:=1;
             end;
           end;
         end;
end;

function       loanglay(x,y,t:longint):boolean;
var     k,i,j,dem       :       longint;
        ok      :       boolean;
        tg      :       bg;
begin
        dd[x,y]:=1;
        dau:=1;cuoi:=1;
        st[dau].x:=x;
        st[dau].y:=y;
        dem:=1;
        ok:=true;
        while dau<=cuoi do
         begin
          tg:=st[dau];
          inc(dau);
          for k:=1 to 4 do
           begin
            i:=tg.x+don[k];
            j:=tg.y+cot[k];
            if check(i,j) then
             begin
              inc(cuoi);
              inc(dem);
              st[cuoi].x:=i;
              st[cuoi].y:=j;
              dd[i,j]:=1;
              if abs(i-x)+abs(j-y)>t then ok:=false;
             end;
           end;
         end;
         exit(ok and (dem=(2*(t+1)*(t+1)-t*2-1)));
end;



procedure       xuly;
var     i,j,t     :       longint;
begin
        init;
        kq:=0;
        khoitao;
        for i:=1 to n do
         for j:=1 to n do
          if (a[i,j]='O')and(dd[i,j]=0) then
           begin
            if (l[i,j] mod 2=0)or(l[i,j]<=kq) then loangloai(i,j)
            else
             begin
               t:=(l[i,j]-1) div 2;
               if loanglay(i+t,j,t) then kq:=l[i,j];
             end;
           end;
           if kq<=1 then writeln(g,-1) else writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.