const   finp    =       'SUCULA.INp';
        fout    =       'SUCULA.OUT';
type    big     =       string;
var    g,f     :       text;
        n       :longint;
       d        :      array[0..1000] of big;
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
var     sum,nho,i:longint;
        c:big;
begin
        nho:=0;
        c:='';
        while length(a)<length(b) do a:='0'+a;
        while length(b)<length(a) do b:='0'+b;
        for i:=length(a) downto 1 do
                begin
                        sum:=ord(a[i])-96+ord(b[i])+nho;
                        nho:=sum div 10;
                        c:=char(sum mod 10+48)+c;
                end;
        if nho>0 then c:='1'+c;
        exit(c);
end;

procedure       QHD;
var     i,j:longint;
begin
        d[0]:='1';
        for i:=1 to n do
                begin
                   for j:=i to n do
                        d[j]:=add(d[j-i],d[j]);
                end;
        writeln(g,d[n]);
end;
begin
        mo;
        readln(f,n);
        QHD;
        dong;
end.
