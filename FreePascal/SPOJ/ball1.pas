uses    math;
const   finp    =       'Ball.INP';
        fout    =       'Ball.OUT';
var     g,f     :       text;
        f1,f2,f3   :       array[1..10,1..10] of int64;
        fw      :       array[1..10,1..10,1..10] of int64;
        d       :       array[1..11,0..1024,0..1024] of int64;
        n :     longint;
         a,b,c,w  :       int64;
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
var     i,j,k   :       longint;
begin
        readln(f,n,a,b,c,w);
        for i:=1 to n do
         for j:=1 to n do read(f,f1[i,j]);
         readln(f);
        for i:=1 to n do
         for j:=1 to n do read(f,f2[i,j]);
         readln(f);
        for i:=1 to n do
         for j:=1 to n do read(f,f3[i,j]);
         readln(f);
         for i:=1 to n do
          for j:=1 to n do
           for k:=1 to n do
           read(f,fw[i,j,k]);
end;
function        tinh(i,t1,t2:longint):int64;
var     k,j,t3,t4     :       longint;
        dem,t     :     int64;
begin
        if i>n then exit(0);
        if d[i,t1,t2]<>-1 then exit(d[i,t1,t2]);
        t:=0;
        for j:=1 to n do
         if ((t1 shr (j-1))and 1=0) then
          for k:=1 to n do
           if ((t2 shr (k-1)) and 1=0) then
            begin
                  t3:=t1 or (1 shl (j-1));
                  t4:=t2 or (1 shl (k-1));
                  dem:=a*f1[i,j]+b*f2[i,k]+c*f3[j,k]+w*fw[i,j,k];
                  t:=max(t,dem+tinh(i+1,t3,t4));
            end;
          d[i,t1,t2]:=t;
          exit(t);
end;
procedure       xuly;
var     kq:int64;
begin
        fillchar(d,sizeof(d),255);
        kq:=tinh(1,0,0);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.