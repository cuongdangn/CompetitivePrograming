const   finp    =       'dnc.inp';
        fout    =       '';
var     g,f     :       text;
        n,m,h     :       longint;
        kq      : int64;
        d       :       array[1..21] of int64;
        luu     :       array[0..1,0..1000001] of int64;
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
procedure       luu1(t,l:longint);
var     i     :       longint;
        j     :       int64;
begin
        j:=0;
        for i:=1 to l do
         j:=(j*10+d[i])mod m;
        luu[t,j]:=luu[t,j]+1;
end;
procedure       duyet(i,l,t:longint);
var    j,da:longint;
begin
        if i>(h+1) div 2 then
         begin
          luu1(t,l);
          exit;
         end;
        if (i=1) and (t=1) then da:=1
        else da:=0;
        for j:=da  to 9 do
         begin
          d[i]:=j;
          d[h-i+1]:=j;
          duyet(i+1,l,t);
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        readln(f,n,m);
        h:=n div 2;
        fillchar(luu,sizeof(luu),0);
        duyet(1,n,1);
        duyet(1,h,0);
        for i:=1 to m-1 do
         kq:=kq+luu[1,i]*luu[0,m-i];
         kq:=kq+luu[1,0]*luu[0,0];
         writeln(g,kq);
end;
begin
        mo;
        xuly;
        dong;
end.
