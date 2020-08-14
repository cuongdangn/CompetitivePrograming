const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f:text;
        d       :       array[0..121,0..121] of ansistring;
        s       :       string;
procedure       mo      ;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
function        add(a,b: ansistring):ansistring;
var     sum,carry,i,x,y :       longint;
        c       :       ansistring;
begin
        carry:=0;c:='';
        while length(a) < length(b) do a:= '0' +a;
        while length(b) < length(a) do b:= '0' +b;
        for i:=length(a) downto 1 do
                begin
                        x:= ord(a[i]) -ord('0');
                        y:= ord(b[i])- ord('0');
                        sum:=  x+y+carry;
                        carry:= sum div 10;
                        c:= chr(sum mod 10 +48) +c;
                end;
        if carry > 0 then c:='1' +c;
        add:=c;
end;
function        hieu(a,b:ansistring):ansistring;
var     c:ansistring;
        s,borow,i:        integer;
begin
        borow:=0;
        c:='';
        while length(a)<length(b) do a:='0'+a;
        while length(b)<length(a) do b:='0'+b;
        for i:=length(a) downto 1 do
                begin
                        s:=ord(a[i])-ord(b[i])-borow;
                        if s<0 then
                        begin
                                s:=s+10;
                                borow:=1;
                        end
                        else borow:=0;
                        c:=chr(s+48)+c;
                end;
                while (length(c)>1) and (c[1]='0') do delete(c,1,1);
                hieu:=c;
end;
procedure       QHD;
var     i,j:longint;
        s       :       string;
begin
        readln(f,s);
        for i:=1 to length(s) do d[i,i]:='1';
        for i:=length(s) downto 1 do
         for j:=i+1 to length(s) do
         if s[i]=s[j] then d[i,j]:=add(add(d[i+1,j],d[i,j-1]),'1')
         else d[i,j]:=HIEU(add(d[i+1,j],d[i,j-1]),d[i+1,j-1]);
         write(g,d[1,length(s)]);
end;
begin
        mo;
        QHD;
        dong;
end.
