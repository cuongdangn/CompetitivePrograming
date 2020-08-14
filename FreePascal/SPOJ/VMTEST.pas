const   fi='';
        fo='';
type str=string;
var s:array[0..90] of str;
        kq:double;
        n:byte;
        kt,kts,ktn:boolean;
        b:str;

procedure Input;
var     f:text;
begin
        assign(f,fi);
        reset(f);s[n]:='';
        while s[n]<>'?' do
                begin
                        inc(n);
                        readln(f,s[n]);
                end;
dec(n);
close(f);
end;

procedure Process(c:str);
var i,j,e:integer;
x:double;
a:str;
begin
        i:=1;
        while c[i]=' ' do inc(i);
        delete(c,1,i-1);
        if c='' then Kt:=true else
                begin
                        c:=c+' ';
                                while length(c)>0 do
                                begin
                                for j:=1 to length(c) do
                                begin
                                        if c[j]=' ' then break;
                                end;
                                a:=copy(c,1,j-1);
                                delete(c,1,j);
while c[1]=' ' do delete(c,1,1);
val(a,x,e);
if e=0 then
begin
ktn:=true;
if kts=true then
begin
kt:=true;
exit;
end
else kq:=kq+x;
end
else if e>1 then
begin
kt:=true;
exit;
end
else if e=1 then
begin
if ktn=true then
begin
kt:=true;
exit;
end;
for i:=1 to length(a) do
begin
if ord(a[i])<65 then
begin
kt:=true;
exit;
end;
end;
kts:=true;
b:=b+a;
end;
end;
end;
end;
procedure Output;
var f:Text;
i:integer;
begin
assign(f,fo);
rewrite(f);
for i:=1 to n do
begin
kq:=0;
b:='';
kts:=false;
ktn:=false;
kt:=false;
Process(s[i]);
if kt=true then writeln(f,'Error!')
else if ktn=true then writeln(f,kq:0:6)
else if kts=true then writeln(f,b);
end;
close(f);
end;

BEGIN
Input;
Output;
END.
