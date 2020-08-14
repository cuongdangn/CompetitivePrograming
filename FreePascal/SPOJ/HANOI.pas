const   finp    =       'HANOI.INP';
        fout    =       'HANOI.OUT';
type    big     =       string;
var     g,f     :       text;
        s       :       array[1..3] of string;
        n       :       longint;
        p       :       big;
        lt      :       array[0..101] of big;
        res     :       array[0..100] of longint;

procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
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

procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i:longint;
begin
        readln(f,n);
        readln(f,p);
        lt[0]:='1';
        for i:=1 to n do lt[i]:=add(lt[i-1],lt[i-1]);
        for i:=1 to n do lt[i]:=sub(lt[i],'1');
        lt[0]:='0';
        for i:=n downto 1 do s[1]:=s[1]+chr(i);
end;
procedure       xuat;
var     i,j     :       byte;
begin
        for i:=1 to 3 do
                for j:=1 to length(s[i]) do
                        res[ord(s[i][j])]:=i;
        for i:=1 to n do write(g,char(res[i]+ord('A')-1));
        dong;
        halt;
end;
function        max(a,b:big):big;
begin
        while length(a)<length(b) do a:='0'+a;
        while length(b)<length(a) do b:='0'+b;
        if a>b then exit(a)
        else exit(b);
end;
procedure       try(n,c1,c2,c3:byte);
VAR     X       :       BIG;
begin
        if n=1 then
                begin
                        s[c3]:=s[c3]+copy(s[c1],length(s[c1]),1);
                        if p='0' then xuat
                        else exit;
                end;
        x:=lt[n-1];
        if max(x,p)=p then
                begin
                        p:=sub(p,x);
                        s[c2]:=s[c2]+copy(s[c1],length(s[c1])-n+2,n-1);
                        delete(s[c1],length(s[c1])-n+2,n-1);
                end
        else try(n-1,c1,c3,c2);
        if p='0' then xuat;

        if max(p,'1')=p then
                begin
                        p:=sub(p,'1');
                       s[c3]:=s[c3]+copy(s[c1],length(s[c1]),1);
                       delete(s[c1],length(s[c1]),1);
                end
        else
                try(1,c1,c2,c3);
        if p='0' then xuat;
        if max(x,p)=p then
                begin
                        p:=sub(p,x);
                        s[c3]:=s[c3]+copy(s[c2],length(s[c2])-n+2,n-1);
                        delete(s[c2],length(s[c2])-n+2,n-1);
                end
                else try(n-1,c2,c1,c3);
        if p='0' then xuat;
end;
begin
        mo;
        doc;
        try(n,1,2,3);
end.



