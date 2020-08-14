const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a     :       array[1..100,1..100] of longint;
        x1,y1,z1,t1,n :       byte;
        kq      : longint;

procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     m,m1,e,i,j   :       longint;
begin
        readln(f,n);
        readln(f,x1,y1,z1,t1);
        kq:=maxlongint;
        for i:=1 to n do
                for j:=1 to n do a[i,j]:=maxint;
                for i:=1 to n do a[i,i]:=0;
        while not eof(f) do
                begin
                        readln(f,m,m1,e);
                        a[m,m1]:=e;
                        a[m1,m]:=e;
                end;
 end;
procedure      Floy;
var    i,j,k:byte;
begin
for k:=1 to n do
  for i:=1 to n do
        if a[i,k]<maxlongint then
                for j:=1 to n do
                        if a[k,j]<maxlongint then
                                if a[i,j]>a[i,k]+a[k,j] then
                                        begin
                                                a[i,j]:=a[i,k]+a[k,j];
                                                a[j,i]:=a[i,j];
                                        end;
end;

procedure       xuly(x,y,z,t:byte);
var     i,j,min       :longint;
begin
        min:=maxlongint;
        for i:=1 to n do
                for j:=1 to n do
         if a[i,x]+a[i,y]+a[j,z]+a[i,j]+a[j,t]<min then
         min:= a[i,x]+a[i,y]+a[j,z]+a[i,j]+a[j,t];
         if min<kq then kq:=min;
end;
begin
        mo;
        doc;
        floy;
        xuly(x1,z1,y1,t1);
        xuly(x1,y1,t1,z1);
        xuly(x1,t1,y1,z1);

        writeln(g,kq);
        dong;
end.

