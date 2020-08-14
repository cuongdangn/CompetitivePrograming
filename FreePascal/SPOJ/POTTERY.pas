uses    math;
const   finp    =       'POTTERY.INP';
        fout    =       'POTTERY.OUT';
var     g,f:    text;
        maxx,t,sp     :       int64;
        n,m     : longint;
        a,b       : array[1..100010] of longint;
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
function        kt(x:int64):boolean;
var    i:longint;
        kq1,kq2:int64;
begin
        kq1:=0;
        kq2:=0;
        for i:=1 to n do  kq1:=x div a[i]+kq1;
        for i:=1 to m do kq2:=(t-x) div b[i]+kq2;
        if kq2>=kq1 then exit(true) else exit(false);
end;
function        chat(t:int64):int64;
var     da,cu,gi        :       int64;
begin
        da:=1;
        cu:=t;
        while da<=cu do
                begin
                        gi:=(da+cu)div 2;
                        if kt(gi) then da:=gi+1 else cu:=gi-1;
                end;
        exit(da-1);

end;
procedure       doc;
var     i,x,time       :longint;
begin
        readln(f,t);
        readln(f,n);
        for i:=1 to n do
                        begin
                        read(f,a[i]);
                        maxx:=max(maxx,a[i]);
                        end;

        readln(f,m);
        for i:=1 to m do
                        read(f,b[i]);


end;
procedure       xuly;
var     time,i    :       longint;
begin
        time:=chat(t);
        for i:=1 to n do sp:=sp+time div a[i];
        writeln(g,sp);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.