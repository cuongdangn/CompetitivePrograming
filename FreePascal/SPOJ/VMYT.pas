const   finp    =       '';
        fout    =       '';
        du      =       1000000007;

type    mg      =       array[1..51,1..51] of int64;
var     g,f     :       text;
        a,b,c   :       mg;
        gt      :       array[1..51] of longint;
        n,k     :       longint;
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
function        nhan(a,b:mg):mg;
var     tg:mg;
        i,j,t:byte;
        x:int64;
begin
        for i:=1 to k do
                for j:=1 to k do
                 begin
                        x:=0;
                        for t:=1 to k do
                        x:=(x + ((a[i,t] mod (du-1))*(b[t,j] mod (du-1)))mod (du-1)) mod (du-1) ;

                        tg[i,j]:=x;

                 end;
                exit(tg);
end;

function       mu(a:mg;b:int64):mg;
var     tg      :       mg;
begin
        if b=1 then exit(a);
        tg:=mu(a,b div 2);
        tg:=nhan(tg,tg);
        if odd(b) then tg:=nhan(tg,a);
        exit(tg);
end;
procedure       kt(k:longint);
var     i       : byte;
begin
        for i:=1 to k do
                a[i,i]:=1;
        for i:=1 to k-1 do
                b[i+1,i]:=1;
        for i:=1 to k do b[i,k]:=1;
end;
function        pow(x,y:int64):int64;
var     tg:int64;
begin
        if y=1 then exit(x mod du);
         tg:=pow(x,y div 2);
        tg:=((tg mod du)*(tg mod du)) mod du;
        if odd(y) then tg:=((tg mod du)*(x mod du)) mod du;
        exit(tg);
end;
procedure       doc;
var     i:byte;
        kq:int64;
        t:mg;
begin
        readln(f,n,k);
        for i:=1 to k do
        begin
        read(f,gt[i]);
        gt[i]:=gt[i] mod du;
        end;
        if n<=k then writeln(g,gt[k])
        else
        begin

        kt(k);

        t:=mu(b,n-k);

        c:=nhan(a,t);

        kq:=1;
        for i:=1 to k do kq:=(kq*pow(gt[i],c[i,k] mod du)mod du);

       writeln(g,kq mod du);

        end;

end;
begin
        mo;
        doc;
        dong;
end.
