const   finp    =       'COMBIN.INP';
        fout    =       'COMBIN.OUT';
var     g,f     :       text;
        d       :       array[1..65,1..65] of int64;
        kq      :       array[1..51] of longint;
        n,k,p     :       longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(G);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuat;
var     i:longint;
begin
        for i:=1 to k do write(g,kq[i],' ');
end;
function        tinh(i,m:longint):int64;
var     j:longint;
        s:int64;
begin
        if d[i,m]<>-1 then exit(D[i,m]);
        if i>k then exit(1);
        s:=0;
        for j:=m to n do s:=s+tinh(i+1,j+1);
        d[i,m]:=s;
        exit(s);
end;
procedure       num(i,m:longint);
var     j:longint;
begin
        if i>k then
                begin
                        xuat;
                        dong;
                        halt;
                end;
        for j:=m to n do
         if p>tinh(i+1,j+1) then p:=p-tinh(i+1,j+1)
         else
                begin
                        kq[i]:=j;
                        num(i+1,j+1);
                        break;
                end;
end;
procedure       xuly;
begin
        fillchar(d,sizeof(d),255);
        readln(f,n,k,p);
        p:=p+1;
        num(1,1);
end;
begin
        mo;
        xuly;
        dong;
end.
