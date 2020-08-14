const   finp    =       'combo.inp';
        fout    =       'combo.out';
        MAX     =       3;
type    vector  =       array[0..MAX]   of longint;
var     x,y,z   :       vector;
        d       :       array[1..100]   of longint;
        n,k,kq  :       longint;
        g,f     :       text;
procedure       GhiNghiem(x:vector);
var     i :longint;
        ok:boolean;
begin
 ok:=true;
 for i:=1 to 3 do
 if (abs(x[i] -y[i] )>2)and (abs(x[i] -y[i] )<n-2) then ok:=false;
 if ok then
        begin
                inc(kq);
                exit;
        end
 else
        begin
                for i:=1 to 3 do
                if (abs(x[i] -z[i] )>2)and (abs(x[i]-z[i])<n-2) then exit;
                inc(kq);
        end;
end;
procedure       ChinhHopKhongLap(i:longint);
var     j       :       longint;
begin
 for j := 1 to n do
   begin
        x[i] := j;
        d[j] := 1;
        if i=3 then GhiNghiem(x)
        else ChinhHopKhongLap(i+1);
        d[j] := 0;
 end;
end;
BEGIN
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
        readln(f,n);
        readln(f,y[1],y[2],y[3]);
        readln(f,z[1],z[2],z[3]);
        chinhhopkhonglap(1);
        writeln(g,kq);
        close(f);
        close(g);
end.
