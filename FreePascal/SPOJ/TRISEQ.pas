uses    math;
const   finp    =       'TRISEQ.INP';
        fout    =       'TRISEQ.OUT';
var     g,f     :       text;
        kq1,t:int64;
        n       :       longint;
        a,kq       :       array[1..19] of longint;
        d       :       array[1..19,1..19,1..19,0..19] of int64;
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
var     i       :       longint;
begin
        readln(f,n);
        readln(f,t);
        for i:=1 to n do read(f,a[i]);
end;
function        tinh(i,min1,min2,max1:longint):int64;
var     j,lm1,lm2,lma:longint;
        dem     :       int64;
begin
        if i>n then
        begin
                exit(ord(min1+min2>max1));
        end;
        if d[i,min1,min2,max1]<>-1 then exit(d[i,min1,min2,max1]);
        dem:=0;
        for j:=1 to n do
         begin
                kq[i]:=j;
                lm1:=min1;
                lm2:=min2;
                lma:=max1;
                if lm1>j then
                begin
                        lm2:=lm1;
                        lm1:=j
                end
                else lm2:=min(lm2,j);
                lma:=max(lma,j);
                dem:=dem+tinh(i+1,lm1,lm2,lma);
         end;
         d[i,min1,min2,max1]:=dem;
         exit(dem);
end;
procedure        lankq1(i,min1,min2,max1:longint);
var     j,lm1,lm2,lma:longint;
        dem     :       int64;
begin
        dem:=0;
        if i>n then exit;
        for j:=1 to n do
         begin
                lm1:=min1;
                lm2:=min2;
                lma:=max1;
                if lm1>j then
                begin
                        lm2:=lm1;
                        lm1:=j
                end
                else lm2:=min(lm2,j);
                lma:=max(lma,j);
               if t>tinh(i+1,lm1,lm2,lma) then t:=t-tinh(i+1,lm1,lm2,lma)
               else
               begin
                kq[i]:=j;
                lankq1(i+1,lm1,lm2,lma);
                break;
               end;
         end;
end;
procedure        lankq2(i,min1,min2,max1:longint);
var     j,lm1,lm2,lma:longint;
        dem     :       int64;
begin
        dem:=0;
        if i>n then exit;
        for j:=1 to a[i] do
         begin
                lm1:=min1;
                lm2:=min2;
                lma:=max1;
                if lm1>j then
                begin
                        lm2:=lm1;
                        lm1:=j
                end
                else lm2:=min(lm2,j);
                lma:=max(lma,j);
                if j=a[i] then lankq2(i+1,lm1,lm2,lma)
                else
                kq1:=kq1+tinh(i+1,lm1,lm2,lma);

         end;
end;
procedure       xuly;
var     i       :       longint;
begin
        fillchar(d,sizeof(d),255);
        writeln(g,tinh(1,19,19,0));
        lankq1(1,19,19,0);
        for i:=1 to n do write(g,kq[i],' ');
        writeln(g);
        lankq2(1,19,19,0);
        writeln(g,kq1+1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
