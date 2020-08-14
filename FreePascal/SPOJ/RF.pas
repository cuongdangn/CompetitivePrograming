const   finp    =       'RF.INP';
        fout    =       'RF.OUT';
type    bignum=    ansistring;
var     g,f     :       text;
        n,m     :       int64;
        a,b     :       array[1..2001] of int64;
        kq      :       bignum;
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
var     i       :longint;
begin
        readln(f,m,n);
        for i:=1 to m do read(f,a[i]);
        readln(f);
        for i:=1 to n do read(f,b[i]);
end;
function        nhan(a:bignum;k:int64):bignum;
var     c,s:bignum;
        nho,t     :       int64;
        i:longint;
begin
        c:=a;  nho:=0;
        for i:=length(a) downto 1 do
                begin
                        t:=k*(ord(a[i])-48)+nho;
                        nho:=t div 10;
                        c[i]:=char(t mod 10 +48);
                end;
        if nho>0 then
        begin
                str(nho,s);
                c:=s+c;
        end;
        exit(c);
end;
function        UC(u,v:int64):int64;
begin
        if v=0 then exit(u);
        exit(UC(v,u mod v));
end;
procedure       toig;
var     i,j       :longint;
        US:int64;
        s:bignum;
begin
        for i:=1 to m do
              for j:=1 to n do
                begin
                        US:=UC(a[i],b[j]);
                        a[i]:=a[i] div us;
                        b[j]:=b[j] div us;
                end;
        s:='1';
        for i:=1 to m do
                      s:=nhan(s,a[i]);
                      writeln(g,s);
        s:='1';
        for i:=1 to n do
                      s:=nhan(s,b[i]);
                      writeln(g,s);
end;
begin
        mo;
        doc;
        toig;
        dong;
end.