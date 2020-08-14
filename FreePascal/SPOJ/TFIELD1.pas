const   fi      =       'TFIELD.inp';
        fo      =       'TFIELD.out';
        maxN    =       1050;
var     f,g:text;
        n,k,dem:longint;
        sum:real;
        res:real;
        mau,dd,luu:array[0..maxN] of longint;
        a,s,b:array[0..maxN] of real;
        x,y:array[0..maxN] of real;
        sl:array[0..maxN] of longint;
        slb:array[0..maxN,0..maxN] of longint;
procedure       mo;
begin
        assign(f,fi);
        reset(f);
        assign(g,fo);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j:longint;
begin
        read(f,n,k);
        readln(f);
        for i:=1 to n do
            begin
                read(f,sl[i],mau[i]);
                if dd[mau[i]]=0 then
                    begin
                        dd[mau[i]]:=1;
                        inc(dem);
                        luu[dem]:=mau[i];
                    end;
                sum:=0;
                for j:=1 to sl[i] do
                    begin
                        read(f,x[j],y[j]);
                        if j>1 then sum:=sum+(x[j]-x[j-1])*(y[j]+y[j-1]);
                        if j=sl[i] then
                            sum:=sum+(x[1]-x[sl[i]])*(y[1]+y[sl[i]]);
                    end;
                a[i]:=abs(sum)/2;
                readln(f);
            end;
end;
procedure       swap(var a,b:real);
var     tg:real;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       swap2(var a,b:longint);
var     tg:longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QUicksort(L,H:Longint);
var     i,j,cs1:longint;
        x:real;
begin
        i:=L;
        j:=H;
        cs1:=random(H-L+1)+L;
        x:=a[cs1];
        repeat
            while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap2(mau[i],mau[j]);
                    inc(i);
                    dec(j);
                end;
        until   i>j;
        if L<j then QUicksort(L,j);
        if i<H then Quicksort(i,H);
end;

procedure       sub1;
var     i,j,t:longint;
        col,slm,vt:longint;
begin
        res:=0;
        for i:=1 to dem do
            begin
                col:=luu[i];
                for j:=1 to n do
                    begin
                        slm:=0;
                        for t:=j downto 1 do
                            begin
                                vt:=t;
                                if mau[t]<>col then
                                begin
                                    if slm+1>k then
                                        begin
                                            vt:=t+1;
                                            break;
                                        end;
                                    inc(slm);
                                end;
                            end;
                        if s[j]-s[vt-1]>res then
                            res:=s[j]-s[vt-1];
                    end;
            end;
        writeln(g,res:0:1);
end;
function        chat(dau,cuoi,i,j:longint):longint;
var     mid,res:longint;
begin
        res:=i;
        while dau<=cuoi do
            begin
                mid:=(dau+cuoi) shr 1;
                if (i-mid+1)-(slb[i,j]-slb[mid-1,j])<=k then
                    begin
                        res:=mid;
                        cuoi:=mid-1;
                    end
                    else
                    begin
                        dau:=mid+1;
                    end;
            end;
        exit(res);
end;
procedure       sub2;
var     i,j,vt:longint;
begin
        for j:=1 to dem do
            begin
                for i:=1 to n do
                    if mau[i]=luu[j] then
                        slb[i,j]:=slb[i-1,j]+1
                        else
                        slb[i,j]:=slb[i-1,j];
            end;
        //////////////////////////////
        res:=0;
        for j:=1 to dem do
            begin
                for i:=1 to n do
                    begin
                        vt:=chat(1,i,i,j);
                        if s[i]-s[vt-1]>res then
                            res:=s[i]-s[vt-1];
                    end;
            end;
        writeln(g,res:0:1);
end;
procedure       xuly;
var     i,j:longint;
begin
        randomize;
        Quicksort(1,n);
        b[1]:=a[1];
        for i:=2 to n do
            begin
                b[i]:=a[i];
                a[i]:=a[i]-b[i-1];
            end;
        for i:=1 to n do
            s[i]:=s[i-1]+a[i];
        if dem*n*n<=5*trunc(1e7) then
            begin
                sub1;
            end
            else
            sub2;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.