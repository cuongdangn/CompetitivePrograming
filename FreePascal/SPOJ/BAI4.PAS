const   fi      =       'bai4.inp';
        fo      =       'bai4.OUT';
        chu     =       'ABCDEFGHIJ.';
        so      =       '0123456789';
var     f       :       text;
        a       :       array[1..15] of string;
        d       :       array[1..11,1..4]of byte;
        g,kq    :       array[1..11]of byte;
        m,n     :       byte;
function min(a,b:byte):byte;
begin if a>b then min:=b
        else min:=a;
end;
function max(a,b:byte):byte;
begin if a>b then max:=a
        else max:=b;
end;
procedure nhap;
var i,j,r:byte;
begin
    assign(f,fi);reset(f);
    readln(f,m);
    readln(f,n);
    for i:=1 to m do g[i]:=1;
    for i:=1 to m do kq[i]:=1;
    for i:=1 to m do begin d[i,1]:=11;d[i,2]:=11;end;
    for i:=1 to n do
        begin
             for j:=1 to n do
                 begin
                      read(f,a[i,j]);
                      r:=pos(a[i,j],chu);
                      if (r=0)or(r=11) then continue;
                      g[r]:=0;
                      kq[r]:=0;
                      d[r,1]:=min(d[r,1],i);
                      d[r,2]:=min(d[r,2],j);
                      d[r,3]:=max(d[r,3],i);
                      d[r,4]:=max(d[r,4],j);
                 end;
        readln(f);
        end;
    close(f);
end;
procedure lat(i,j:byte;ch:char);
var x,y,r:byte;s:string;
begin
    r:=pos(ch,chu)-1;
    str(r,s);
    ch:=s[1];
    for x:=i to i+4 do
    for y:=j to j+4 do a[x,y]:=ch;
end;
function kt:boolean;{kiem tra trong}
var i,u,v:byte;
begin
    kt:=true;
    for i:=1 to m do
        begin
             if (d[i,3]-d[i,1]>4)or(d[i,4]-d[i,2]>4) then
                                begin
                                kt:=false;
                                exit;
                                end;

             for u:=d[i,1] to d[i,3] do
             for v:=d[i,2] to d[i,4] do
                if pos(a[u,v],chu)=0 then
                                begin
                                kt:=false;
                                exit;
                                end;
        end;
end;
function kt_lat(u,v:integer;k:char):boolean;
var i,j:byte;
begin
    kt_lat:=true;
    for i:=u to u+4 do
    for j:=v to v+4 do
        if (a[i,j]<>k)and(pos(a[i,j],chu)>0) then
                                                begin
                                                    kt_lat:=false;
                                                    exit;
                                                end;
end;
function kt_cuoi(i,j:byte):boolean;
var r:char;u,v:byte;
begin
    r:=a[i,j];
    kt_cuoi:=true;
    for u:=i to i+4 do
    for v:=j to j+4 do if a[u,v]<>r then begin kt_cuoi:=false;exit;end;
end;
procedure xuat(r:byte);
var i:byte;
begin
    assign(f,fo);rewrite(f);
    if r=1 then writeln(f,'NO')
    else for i:=1 to m do if kq[i]=1 then write(f,chu[i]);
    close(f);
end;
procedure thuc_hien;
var i,j,r,sll:byte;
    u,v:integer;
begin
    if not kt then begin xuat(1);halt;end;

    sll:=0;
    for i:=1 to m do
        begin
             for j:=1 to m do
                if g[j]=0 then
                  begin
                     for u:=d[j,3]-4 to d[j,1] do
                     if (u>0)and(u+4<=n) then
                     for v:=d[j,4]-4 to d[j,2] do
                     if (v>0)and(v+4<=n) then
                     if kt_lat(u,v,chu[j]) then
                        begin
                                lat(u,v,chu[j]);
                                g[j]:=1;
                                inc(sll);
                        end;
                 end;
        end;
    for i:=1 to m do if g[i]=0 then begin xuat(1);halt;end;
    if (sll=1) then begin xuat(2);halt;end;
    for i:=1 to n-4 do
    for j:=1 to n-4 do
    if pos(a[i,j],so)>0 then
    if kt_cuoi(i,j) then
                                            begin
                                                r:=pos(a[i,j],so);
                                                kq[r]:=1;
                                            end;
    xuat(2);
end;
BEGIN
nhap;
thuc_hien;
END.
