const   finp    =       '';
        fout    =       '';
type    mg      =       array[1..6,1..6] of int64;
var     g,f     :       text;
        b,c,a     :       mg;
        n,m,k   :       longint;
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
function        nhan(r,g:mg):mg;
var     i,j,u:longint;  x:int64;
        tg:mg;
begin
        for i:=1 to 6 do
                for j:=1 to 6 do
                        begin
                                x:=0;u:=0;
                                while u<6 do
                                begin
                                inc(u);
                                x:=(x+(r[i,u]mod m)*(g[u,j]mod m )mod m)mod m ;
                                end;
                                if x<0 then x:=x+m;
                                tg[i,j]:=x;
                        end;
                exit(tg);
end;
function        mu(a:mg;b:longint):mg;
var     tg:mg;
begin
        if b=1 then exit(a);
        tg:=mu(a,b div 2);
        tg:=nhan(tg,tg);
        if odd(b) then tg:=nhan(tg,a);
        exit(tg);
end;
procedure       kt;
begin
       b[1,1]:=1 mod m;
       b[1,2]:=k mod m;
       b[1,3]:=1 mod m;
       b[1,4]:=k*k mod m;
       b[1,5]:=k mod m;
       b[1,6]:=(k*k+1)mod m;
       c[1,2]:=(-1) mod m;
       c[2,1]:=1 mod m;
       c[3,6]:=1 mod m;
       c[2,2]:=(2*k)mod m;
       c[3,4]:=1 mod m;
       c[4,3]:=1 mod m;
       c[4,4]:=(((( 4 mod m)*(k mod m )) mod m)*(k mod m))mod m;
       c[4,5]:=(2 *k)mod m;
       c[4,6]:=c[4,4];
       c[5,4]:=(-4 *k )mod m;
       c[5,5]:=(-1) mod m;
       c[5,6]:=(-4 *k )mod m;
       c[6,6]:=1 mod m;
end;
procedure       xuly;
var     kq      :       longint;
        t       :       mg;
begin
        if n=2 then
                begin
                        writeln(g,(k*k+1) mod m );
                        exit;
                end;
                t:=mu(c, n-2 );
                a:=nhan(b,t);
        writeln(g,a[1,6] mod m)
end;

procedure       doc;
var     i       :       longint;
        t       :       byte;
begin
     readln(f,t);
     for i:=1 to t do
      begin
        readln(f,k,n,m);
        kt;
        xuly;
      end;
end;
begin
        mo;
        doc;
        dong;
end.


