const   finp    =       'password.inp';
        fout    =       'password.out';
type    big     =       ansistring;
        mt      =       array[0..9,0..9] of big;
var     g,f     :       text;
        n       :       int64;
        a,b:mt;
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
begin
        readln(f,n);
end;
function        add(a,b:big):big;
var     sum,nho,x,y,i:integer;
        c:big;
begin
        nho:=0;
        c:='';
        while length(a)<length(b) do a:='0'+a;
        while length(b)<length(a) do b:='0'+b;
        for i:=length(a) downto 1 do
                begin
                        x:=ord(a[i])-48;
                        y:=ord(b[i])-48;
                        sum:=x+y+nho;
                        nho:=sum div 10;
                        c:=char(sum mod 10+48)+c;
                end;
        if nho>0 then c:='1'+c;
        exit(c);
end;

function        nhan(a:big;k:int64):big;
var     c,s:big;
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
function        nhansl(a,b:big):big;
var     sum,tmp :       big;
        m,i,j   :       integer;
begin
        m:=-1;
        sum:='';
        for i:=length(a) downto 1 do
                begin
                        m:=m+1;
                        tmp:=nhan(b,ord(a[i])-48);
                        for j:=1 to m do tmp:=tmp+'0';
                        sum:=add(tmp,sum);
                end;
                exit(sum);
end;
function        du(a:big):big;
var     l,i:longint;
        c       :big;
begin
        c:='';
        if length(a)<50 then exit(a) else
         begin
         l:=length(a);
        for i:=l-49 to l do c:=c+a[i];
        exit(c);
end;
end;
function        nhanmt(a,b:mt):mt;
var     i,j,k:integer;
        kq      :       big;
        c       :       mt;
begin
        for i:=0 to 9 do
         for j:=0 to 9 do
                begin
                        kq:='';
                        for k:=0 to 9 do kq:=du(add(kq,nhansl(a[i,k],b[k,j])));
                        c[i,j]:=kq;
                end;
                exit(c);
end;
function       mu(a:mt;b:int64):mt;
var     tg      :       mt;
begin
        if b=1 then exit(a);
        tg:=mu(a,b div 2);
        tg:=nhanmt(tg,tg);
        if odd(b) then tg:=nhanmt(tg,a);
        exit(tg);
end;

procedure       khoitao;
var     i:integer;
begin
        for i:=0 to 9 do a[1,i]:='1' ;
        a[1,0]:='0';
        a[1,8]:='0';
        a[1,5]:='1';
        b[4,0]:='1';
        b[6,0]:='1';
        b[6,1]:='1';
        b[8,1]:='1';
        b[7,2]:='1';
        b[9,2]:='1';
        b[4,3]:='1';
        b[8,3]:='1';
        b[0,4]:='1';
        b[9,4]:='1';
        b[3,4]:='1';
        b[0,6]:='1';
        b[7,6]:='1';
        b[1,6]:='1';
        b[6,7]:='1';
        b[2,7]:='1';
        b[1,8]:='1';
        b[3,8]:='1';
        b[2,9]:='1';
        b[4,9]:='1';
end;
procedure       xuly ;
var     c:mt;
        i:integer;
        kq:big;
begin
        khoitao;
        kq:='';
        c:=mu(b,n-1);
        c:=nhanmt(a,c);
        for i:=0 to 9 do kq:=du(add(kq,c[1,i]));
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

