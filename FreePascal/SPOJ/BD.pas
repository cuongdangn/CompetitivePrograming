const   finp    =       'BD.INP';
        fout    =       'BD.OUT';
        hx      :       array[1..4] of integer=(-1,0,1,0);
        hy      :       array[1..4] of integer=(0,-1,0,1);
type    arr     =       array[1..30] of byte;
        bg      =       record
        x,y,u,v :       longint;
        end;
var     g,f     :       text;
        a       :       arr;
        n       :       longint;
        da      :       array[1..1000000] of bg;
        d       :       array[1..3628799] of byte;
        gt      :       array[0..9] of longint;
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
procedure       sub1;
var     i,j       :       longint;
begin
        if (a[1]=1)and(a[2]=2)and(a[3]=3) then writeln(g,0)
        else
         if (a[1]=2)and(a[2]=1)and(a[3]=3) then
          begin
           writeln(g,1);
           writeln(g,1,' ',1,' ',2,' ',1);
          end
         else
          begin
           writeln(g,2);
           writeln(g,3,' ',1,' ',2,' ',1);
            writeln(g,1,' ',1,' ',2,' ',1);
           end;
end;
procedure       sub2(a:arr;sb,t:longint);
var     x,y,i,u,v,tt,j,t1       :       longint;
begin
        tt:=0;
        for i:=1 to 3*n do
         begin
          u:=0;
          for j:=1 to i-1 do
           if a[j]<a[i] then inc(u);
           tt:=tt+(a[i]-u-1)*gt[3*n-i];
         end;
         if tt+1=1 then
           begin
                writeln(g,sb-1);
                for i:=1 to sb-1 do
                 writeln(g,da[i].x,' ',da[i].y,' ',da[i].u,' ',da[i].v);
                dong;
                halt;
           end;
           inc(tt);
           if d[tt]=1 then exit;
           d[tt]:=1;
           x:=t div n+ord(t mod n<>0);
           y:=t-(x-1)*n;
           for i:=1 to 4 do
            begin
                u:=x+hx[i];
                v:=y+hy[i];
                if (u>0)and(v>0)and(u<=3)and(v<=n) then
                 begin
                     t1:=(u-1)*n+v;
                     a[t]:=a[t1];
                     a[t1]:=1;
                     da[sb].x:=x;
                     da[sb].y:=y;
                     da[sb].u:=u;
                     da[sb].v:=v;
                     sub2(a,sb+1,t1);
                     a[t1]:=a[t];
                     a[t]:=1;
                 end;
            end;
end;
procedure       doc;
var     i,t       :       longint;
begin
        readln(f,n);
        gt[0]:=1;
        for i:=1 to 9 do gt[i]:=gt[i-1]*i;
        for i:=1 to n*3 do
        begin
         read(f,a[i]);
         if a[i]=1 then t:=i;
        end;
        if n=1 then sub1 else
        if n<=3 then sub2(a,1,t);
end;

begin
        mo;
        doc;
        dong;
end.
