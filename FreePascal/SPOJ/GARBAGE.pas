const   finp    =       'GARBAGE.INP';
        fout    =       'GARBAGE.OUT';
        cs      =       100000000;
type    big  =       array[0..100] of longint;

var     g,f     :       text;
        b       :       array['A'..'Z'] of byte;
        a       :       array[1..6] of string;
        d       :       array[1..100,1..6] of int64;
        n       :longint;
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
var     i:      longint;
begin

        for i:=1 to 6 do readln(f,a[i]);
        b['N']:=1;
        b['S']:=2;
        b['W']:=3;
        b['E']:=4;
        b['U']:=5;
        b['D']:=6;
end;
function       DQ(i,j:longint):int64;
var     k:longint;
        res     :      int64;
begin
         if d[i,j]<>-1 then exit(d[i,j]);
        if i=1 then exit(length(a[j]));
        res:=0;
        for k:=1 to length(a[j]) do
                res:=res+DQ(i-1,b[a[j][k]])+1;
        d[i,j]:=res;
        exit(res);
end;
procedure       xuly;
var     i       :       longint;
        c       :       char;

begin
        fillchar(d,sizeof(d),255);
        readln(f,c,i);
        writeln(g,DQ(i-1,b[c])+1);
end;

begin
        mo;
        doc;
        xuly;
        dong;
end.
