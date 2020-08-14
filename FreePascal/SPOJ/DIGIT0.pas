const   finp    =       '';
        fout    =       '';
var     n       :       longint;
        g,f     :   text;
        a       :   array['a'..'z'] of int64;
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
var     i:char;
begin
        while not eof(f) do
        begin
                read(f,i);
                if i in ['a'..'z'] then
                begin
                inc(n);
                inc(a[i]);
                end;
        end;
end;
function        digit(a,x:longint):longint;
var     dem,i:longint;
begin
        dem:=0;i:=x;
        while a div i > 0 do
        begin
             dem:=dem+a div i;
             i:=i*x;
        end;
digit:=dem;
end;
function        min(a,b:int64):int64;
begin
        min:=(-abs(a-b)+a+b) div 2;
end;
procedure       xuly;
var     x,y,z,t:longint;
        i       :       char;
begin
        x:=digit(n,5);
        t:=digit(n,2);
        y:=0;z:=0;
        for i:='a' to 'z' do
        begin
        if a[i]>0 then
        begin
        z:=z+digit(a[i],2);
        y:=y+digit(a[i],5);
        end;
        if (y>x) or (z>t) then
             begin
             writeln(g,0);
             exit;
             end;
        end;

        writeln(g,min(x-y,t-z));
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

