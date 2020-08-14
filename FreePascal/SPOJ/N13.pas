const   finp    =       'N13.INP';
        fout    =       'N13.OUT';
var     g,f     :       text;
        d       :       array[1..20,0..9,false..true] of big;
        a,b     :       int64;
        fx      :      string;
        n       :      longint;
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
function        tinh(i,m:byte;ok:boolean):int64;
var     j       :       byte;
        h       :       longint;
        s       :       int64;
begin
        if d[i,m,ok]<>-1 then exit(d[i,m,ok]);
        if i>n then exit(1);
        if ok then h:=9 else h:=ord(fx[i])-48;
        s:=0;
        for j:=0 to h do
                if not((j=3)and(m=1)) then
                        s:=s+tinh(i+1,j,ok or (j<ord(fx[i])-48));
        d[i,m,ok]:=s;
        exit(s);
end;
procedure       kt(a:qword);
begin
        str(a,fx);
        n:=length(fx);
end;
procedure       doc;
var     i,j     :       int64;
begin
        readln(f,a,b);
        fillchar(d,sizeof(d),255);
        if a=0 then i:=0
        else
        begin
        kt(a-1);
        i:=tinh(1,0,false);
        end;
        fillchar(d,sizeof(d),255);
        if b=0 then j:=1
        else
        begin
        kt(b);
        end;j:=tinh(1,0,false);

        writeln(g,j-i);
end;
procedure       xuly;
var     i       :longint;
begin
        while not seekeof(f) do
        doc;
end;
begin
        mo;
        xuly;
        dong;
end.


