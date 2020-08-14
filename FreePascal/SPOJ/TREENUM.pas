const   finp    =       '';
        fout    =       '';
        coso    =       1000000000000;
        maxs    =       15;
        sl      =       12;
type    big     =       array[1..maxs] of int64;
var     g,f     :       text;
        n       :       qword;
        lt      :       array[0..64] of big;
        kq      :big;
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
function        add(a,b:big):big;
var     c       :       big;
        nho     :       longint;
        i       :       integer;
begin
        nho:=0;
        for i:=1 to maxs do
                begin
                        c[i]:=a[i]+b[i]+nho;
                        if c[i]>=coso then
                                begin
                                        nho:=c[i] div coso;
                                        c[i]:=c[i] mod coso;
                                end
                        else nho:=0;
                end;
        exit(c);
end;
function        nhan(a:big;b:longint):big;
var     nho      :       int64;
        c       :       big;
        i       :       longint;
        t       :       qword;
begin
        nho:=0;
        for i:=1 to maxs do
                begin
                        t:=a[i]*b+nho;
                        if t>=coso then
                                begin
                                        nho:=t div coso;
                                        c[i]:=t mod coso;
                                end
                        else
                                begin
                                        nho:=0;
                                        c[i]:=t;
                                end;
                end;
        exit(c);
end;
procedure       kt;
var     i       :       longint;
begin
        lt[0][1]:=1;
        for i:=1 to 64 do lt[i]:=nhan(lt[i-1],3);
end;
function        get(a:qword;k:longint):byte;
begin
        get:=(a shr(k-1))and 1;
end;
procedure        doc;
var     t,i,j,k :      longint;
        s       :      string;
begin
        readln(f,t);
        kt;
        for i:=1 to t do
             begin
                readln(f,n);
                fillchar(kq,sizeof(kq),0);
                for j:=1 to 64 do
                if get(n,j)=1 then kq:=add(kq,lt[j-1]);
                k:=1;
                while (kq[k]>0)and(k<maxs) do inc(k);
                write(g,kq[k-1]);
                for j:=k-2 downto 1 do
                       begin
                        Str(kq[j],s);
                        while length(s)<sl do s:='0'+s;
                        write(g,s);
                        end;

                writeln(g);
             end;

end;
begin
        mo;
        doc;
        dong;
end.



