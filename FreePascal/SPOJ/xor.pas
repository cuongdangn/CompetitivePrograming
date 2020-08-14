cons3t   finp    =       'XOR.INP';
        fout    =       'XOR.OUT';
var     g,f     :       text;
        a1,a2,a3,b1,b2,b3:      longint;
        n       :       longint;
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
function        get(u,t:longint):byte;
begin
        get:=(u shr (t-1)) and 1;
end;
procedure       doc;
begin
        readln(f,a1,b1);
        readln(f,a2,b2);
        readln(f,a3,b3);
end;
procedure       kt;
begin
        n:=32;
end;
procedure        setbit(var u:longint;i:longint;t:byte);
begin
        if t=0 then u:=u and not(1 shl (i-1))
        else u:=u or (1 shl (i-1))
end;
function       find(c1:longint):longint;
var     oka,okb :       boolean;
        i       :       longint;
        best,kq   :       longint;
        xmin,xmax,xi:byte;
begin
        kt;
        oka:=false;
        okb:=false;
        kq:=0;
        for i:=n downto 0 do
                begin
                        if oka=false then xmin:=get(a1,i) else xmin:=0;
                        if okb=false then xmax:=get(b1,i) else xmax:=1;
                        best:=-1;
                        for xi:=xmin to xmax do
                                if xi xor get(c1,i)>=best then
                                        begin
                                             best:=xi xor get(c1,i);
                                             setbit(kq,i,xi);
                                if xi>get(a1,i) then oka:=true;
                                if xi<get(b1,i) then okb:=true;
                                end;
                end;
        exit(c1 xor kq);
end;
function       find1(c1:longint):longint;
var     oka,okb :       boolean;
        i       :       longint;
        best,kq   :       longint;
        xmin,xmax,xi:byte;
begin
        kt;
        oka:=false;
        okb:=false;
        kq:=0;
        for i:=n downto 0 do
                begin
                        if oka=false then xmin:=get(a1,i) else xmin:=0;
                        if okb=false then xmax:=get(b1,i) else xmax:=1;
                        best:=2;
                        for xi:=xmin to xmax do
                                if xi xor get(c1,i)<=best then
                                        begin
                                             best:=xi xor get(c1,i);
                                             setbit(kq,i,xi);
                                if xi>get(a1,i) then oka:=true;
                                if xi<get(b1,i) then okb:=true;
                                        end;
                end;
        exit(c1 xor kq);
end;

procedure       sub2;
var     i,kq,t,t1,kq1       :longint;
begin
        kq:=-1;
        kq1:=maxlongint;
        for i:=a2 to b2 do
                begin
                        t:=find(i xor a3);
                        if t>kq then kq:=t;
                        t:=find1(i xor a3);
                        if t<kq1 then kq1:=t;
                end;
        writeln(g,kq1);
        writeln(g,kq);
end;
procedure       xuly;
begin
        if (a2=b2)and(a3=b3) then
        begin
        writeln(g,find1(a2 xor b2));
        writeln(g,find(a2 xor b2))
        end
        else sub2;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
