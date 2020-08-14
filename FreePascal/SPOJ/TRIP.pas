const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        fx,c      :       array[0..100000,0..100] of longint;
        min,n     :       longint;
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
var     i,j:longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                for j:=1 to n do read(f,c[i,j]);
                readln(f);
                end;
end;

function        getmin(a,b:longint):longint;
begin
        getmin:=(-abs(a-b)+a+b) div 2;
end;
procedure       QHD;
var     i,j,k,x :       longint;
begin
        min:=1000000000;
        for i:=1 to 1 shl n-1 do
                for j:=1 to n do fx[i,j]:=min;
                fx[1,1]:=0;
                for j:=1 to n-1 do fx[1 shl j,j+1]:=0;
                 for i:=1 to 1 shl n -1 do
                        for j:=1 to n do
                               if fx[i,j]>=0 then
                                        for k:=1 to n do
                                                if k<>j then
                                                        begin
                                                                x:=i or (1 shl (k-1));
                                                                if ((i shr (k-1)) and 1 =0 ) then
                                                                fx[x,k]:=getmin(fx[x,k],c[j,k]+fx[i,j]);
                                                        end;
       for j:=1 to n do
                if (fx[1 shl n -1,j]>=0) and (fx[1 shl n - 1,j]<min) then min:=fx[1 shl n - 1,j];
write(g,min);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
