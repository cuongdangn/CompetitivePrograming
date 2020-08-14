uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        ch      :      array[1..2] of char= ('(',')');
        t       :array[1..2] of integer = (1,-1);
var     g,f     :       text;
        n,k     :       longint;
        kq1,kq2     :       int64;
        s       :       string;
        d       :       array[1..60,0..60,0..60] of int64;
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
begin
     readln(f,n,k);
     read(f,s);
end;
function        tinh(i,bac,tong:longint):int64;
var     dem:int64;
        j       :       byte;
begin
if tong<0 then exit(0);
        if d[i,bac,tong]<>-1 then exit(d[i,bac,tong]);

        if i=n+1 then
         begin
             if (bac=k)and(tong=0) then exit(1)
             else exit(0);
         end;
          dem:=0;
        for j:=1 to 2 do
         dem:=dem+tinh(i+1,max(bac,tong+t[j]),tong+t[j]);
         d[i,bac,tong]:=dem;
         exit(dem);
end;
procedure        lankq(i,bac,tong:longint);
var     dem:int64;
        j       :       byte;
begin
        if i=n+1 then exit;

        for j:=1 to 2 do
        if ch[j]=s[i] then
        begin
         lankq(i+1,max(bac,tong+t[j]),tong+t[j]) ;
         exit;
        end
         else
          kq2:=kq2+tinh(i+1,max(bac,tong+t[j]),tong+t[j])
end;
procedure       xuly;
begin
        fillchar(d,sizeof(d),255);
        kq1:=tinh(1,0,0);
        lankq(1,0,0);
        writeln(g,kq1);
        writeln(g,kq2+1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
