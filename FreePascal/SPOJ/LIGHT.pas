const   finp    =       'LIGHT.INP';
        fout    =       'LIGHT.OUT';
        ma      :       array[0..1] of char = ('T','B');
type    big     =       string;
var     g,f     :       text;
        n,k     :       longint;
        d       :       array[0..100,0..100] of big;
        res     :       array[1..100] of byte;
        ok      :       boolean;
        p       :       big;
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
         while (c[i]='0')and(length(c)>1) do delete(c,1,1);
        exit(c);
end;

function        sub(a,b:big):big;
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
                        sum:=(x-(y+nho));
                        if sum<0 then
                        begin
                        sum:=sum+10;
                        nho:=1;
                        end
                        else nho:=0;
                        c:=char(sum mod 10+48)+c;
                end;
        while (c[1]='0')and(length(c)>1) do delete(c,1,1);
                exit(c);
end;

function        tinh(i,j:longint):big;
var     i1       :       byte;
        s       :       big;
begin
        if d[i,j]<>'-1' then exit(d[i,j]);
        if j>k then exit('0');
        if i>n then
         begin
                if j=k then  exit('1')
                else exit('0');
         end;
         s:='0';
         for i1:=0 to 1 do
                s:=add(s,tinh(i+1,j+ord(i1=1)));
         d[i,j]:=s;
         exit(s);
end;
procedure       xuat;
var     i       :longint;
begin
        for i:=n downto 1 do write(g,ma[res[i]]);
        writeln(g);
end;
function        max(a,b:big):big;
begin
        while length(a)<length(b) do a:='0'+a;
        while length(b)<length(a) do b:='0'+b;
        if a>b then exit(a) else
        if b>a then exit(b) else exit('-1');
end;
function        modb(a,b:big):big;
var     hold    :       big;
        kb      :       array[0..10] of big;
        i,k     :       longint;
begin
        kb[0]:='0';
        for i:=1 to 10 do
         kb[i]:=add(kb[i-1],b);
         hold:='';
        for i:=1 to length(a) do
                begin
                        hold:=hold+a[i];
                        k:=1;
                        while (max(hold,kb[k])=hold) do inc(k);
                        hold:=sub(hold,kb[k-1]);
                end;
        modb:=hold;
end;
procedure       duyet(i,j:longint);
var     i1       :       byte;
begin
        if ok then exit;
        if i>n then
                begin
                        if p='1' then
                         begin
                                xuat;
                                ok:=true;
                                exit;
                         end;
                end;
        for i1:=0 to 1 do
                if tinh(i+1,j+ord(i1=1))<>'-1' then
                if max(p,tinh(i+1,j+ord(i1=1)))=p then p:=sub(p,tinh(i+1,j+ord(i1=1)))
                else
                        begin
                                res[i]:=i1;
                                duyet(i+1,j+ord(i1=1));
                                break;
                        end;
end;
procedure       xuly;
var     t:big;
        i,j     :       longint;
begin
        ok:=false;
        for i:=0 to 100 do
         for j:=0 to 100 do d[i,j]:='-1';
         t:=tinh(1,0);
        p:=modb(p,t);
        duyet(1,0);
end;
procedure       doc;
var     t,i    :      longint;
begin
        readln(f,t);
        for i:=1 to t do
                begin
                        read(f,n,k);
                        readln(f,p);
                        while p[1]=' ' do  delete(p,1,1);
                        xuly;
                end;
end;
begin
        mo;
        doc;
        dong;
end.
