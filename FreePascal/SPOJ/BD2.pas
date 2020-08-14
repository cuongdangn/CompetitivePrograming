const   finp    =       'BD2.INP';
        fout    =       'BD2.OUT';
type    arr     =       array[1..3,1..10] of byte;
        bg      =       record
        x,y,u,v :       longint;
        end;
var     g,f     :       text;
        a       :       arr;
        n,sb       :       longint;
        vt       :  array[1..30] of longint;
        da      :       array[1..1000000] of bg;
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
procedure       trao(var a,b:byte);
var     tg:longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       sapxep3(h:longint);
var     x,y,i,j      :       longint;
begin
        x:=vt[h+n*2] div n+ord(vt[h+n*2] mod n<>0);
        y:=vt[h+n*2]-(x-1)*n;
       while x<>3 do
          begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x+1;
                da[sb].v:=y;
                vt[a[x+1,y]]:=n*(x-1)+y;
                vt[a[x,y]]:=x*n+y;
                trao(a[x,y],a[x+1,y]);
                x:=x+1;
         end;
        while y<>h do
         begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x;
                da[sb].v:=y-1;
                vt[a[x,y-1]]:=n*(x-1)+y;
                vt[a[x,y]]:=n*(x-1)+y-1;
                trao(a[x,y],a[x,y-1]);
                y:=y-1;
         end;
end;
procedure       sapxep2(h:longint);
var     x,y,i,j      :       longint;
begin
        x:=vt[h+n] div n+ord(vt[h+n] mod n<>0);
        y:=vt[h+n]-(x-1)*n;
       if x=3 then
         begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x-1;
                da[sb].v:=y;
                vt[a[x-1,y]]:=n*(x-1)+y;
                vt[a[x,y]]:=(x-2)*n+y;
                trao(a[x,y],a[x-1,y]);
                x:=x-1;
         end
         else
         if x=1 then
          begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x+1;
                da[sb].v:=y;
                vt[a[x+1,y]]:=(x-1)*n+y;
                vt[a[x,y]]:=x*n+y;
                trao(a[x,y],a[x+1,y]);
                x:=x+1;
         end;
        while y<>h do
         begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x;
                da[sb].v:=y-1;
                vt[a[x,y-1]]:=n*(x-1)+y;
                vt[a[x,y]]:=n*(x-1)+y-1;
                trao(a[x,y],a[x,y-1]);
                y:=y-1;
         end;
end;
procedure       sapxep1(h:longint);
var     x,y,i,j      :       longint;
begin
        x:=vt[h] div n+ord(vt[h] mod n<>0);
        y:=vt[h]-(x-1)*n;
        while x<>1 do
         begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x-1;
                da[sb].v:=y;
                vt[a[x-1,y]]:=n*(x-1)+y;
                vt[a[x,y]]:=(x-2)*n+y;
                trao(a[x,y],a[x-1,y]);
                x:=x-1;
         end;
        while y<>h do
         begin
                inc(sb);
                da[sb].x:=x;
                da[sb].y:=y;
                da[sb].u:=x;
                da[sb].v:=y-1;
                vt[a[x,y-1]]:=n*(x-1)+y;
                vt[a[x,y]]:=n*(x-1)+y-1;
                trao(a[x,y],a[x,y-1]);
                y:=y-1;
         end;
end;
procedure       xuly;
var     i       :       longint;
begin

        for i:=1 to n do
        begin
         sapxep1(i);
         sapxep2(i);
         sapxep3(i);
        end;
        writeln(g,sb);
        for i:=1 to sb do writeln(g,da[i].x,' ',da[i].y,' ',da[i].u,' ',da[i].v)
end;
procedure       doc;
var     i,t,j       :       longint;
begin
        readln(f,n);
        for i:=1 to 3 do
        begin
         for j:=1 to n do
         begin
         read(f,a[i,j]);
         vt[a[i,j]]:=(i-1)*n+j;
         end;
         readln(f);
        end;

end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
