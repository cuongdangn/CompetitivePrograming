const   finp    =       '';
        fout    =       '';
type    mang    =       array[1..100000,1..15] of char;
var     g,f     :       text;
        b     :       mang;
        i,n :       longint; s:word; s1:string;
        max :       byte;
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
var     i,j:longint;a:string;
begin
        readln(f,n);
        for i:=1 to n do
        begin
                readln(f,a);
                if length(a)>max then max:=length(a);
                for j:=1 to length(a) do b[i,j]:=a[j];
        end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        s1:='';
        for i:=1 to max do
        begin
        s:=ord(b[1,i]);
        for j:=2 to n do
                s:=s xor ord(b[j,i]);
                if s<>0 then
                s1:=s1+chr(s);
        end;
        if s1<>'' then write(g,s1) else write(g,-1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
