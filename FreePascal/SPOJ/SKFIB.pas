const
    inp='';
    out='';
    maxn=2500+1;
    maxm=1000000;
var
    a:array[1..maxn] of longint;
    vt:array[-maxm..maxm] of longint;
    f:array[1..maxn,1..maxn] of longint;
    i,j,n,res,t1,t2,t:longint;
    fi,fo:text;

begin
    assign(fi,inp); assign(fo,out);
    reset(fi);      rewrite(fo);
    read(fi,t);
    repeat
        read(fi,n);
        res:=0;
        fillchar(vt,sizeof(vt),0);
        for i:=1 to n do read(fi,a[i]);
        for i:=1 to n do
            begin
                for j:=i+1 to n do
                    begin
                        t1:=a[j]-a[i];
                        if (t1<-maxm) or (t1>maxm) then t2:=0 else t2:=vt[t1];
                        if t2=0 then f[i,j]:=2
                        else f[i,j]:=f[t2,i]+1;
                        if f[i,j]>res then res:=f[i,j];
                    end;
                vt[a[i]]:=i;
            end;
        writeln(fo,res);
        dec(t);
    until t<=0;
    close(fi);
    close(fo);
end.
