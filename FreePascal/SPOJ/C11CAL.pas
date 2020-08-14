const   finp    =       '';
        fout    =       '';
        du      =        1000000007;
type    mg      =       array[0..52,0..52] of int64;
var     g,f     :       text;
        a,b,c,d   :       mg;
        h       :   byte;
        n       :   int64;
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
        i,j,k:byte;
        x:int64;
begin
        for i:=1 to h+2 do
                for j:=1 to h+2 do
                 begin
                        x:=0; k:=0;
                        while k<h+2 do
                        begin
                        inc(k);
                        x:=(x + ((a[i,k] mod du)*(b[k,j] mod du))mod du) mod du ;
                        end;
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
                d[i,k]:=d[i,k-1]+d[i-1,k-1];

end;
procedure       xuly;
var     i:byte;
        t       :mg;
begin
         d[1,1]:=1;
         d[1,2]:=1;
         d[2,2]:=1;
         for i:=3 to 51 do kt(i);
        while not eof(f) do
           begin
                readln(f,n,h);
                b:=d;
                if n=1 then writeln(g,1) else
                 begin
                         for i:=1 to h+2 do a[1,i]:=1;
                        for i:=1 to h+1 do b[i,h+2]:=b[i,h+1];
                        b[h+2,h+2]:=1;
                        t:=mu(b,n-1);
                        c:=nhan(a,t);

                        writeln(g,c[1,h+2]);
                end;
          end;
end;
begin
        mo;
        xuly;
        dong;
end.
