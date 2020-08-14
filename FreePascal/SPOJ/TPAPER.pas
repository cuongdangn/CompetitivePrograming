{$MODE objfpc}{$H+}
const   finp    =       'TPAPER.INP';
        fout    =       'TPAPER.OUT';
type    arr     =       array[1..1001] of string;
var     f,g     :       text;
        a       :       array[1..1001] of string;
        n,dem1,dem2,dem3,dem4       :       integer;
        kq:string;
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
var     i:longint;
        s:string;
begin
        readln(f,n);
        kq:='';
        for i:=1 to n do
                begin
                        readln(f,s);
                        cb(s);
                end;
end;
procedure       QS(l,h:longint;var a:arr);
var     i,j:longint;
        x,tg:string;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]+x>x+a[i] do inc(i);
                while a[j]+x<x+a[j] do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
if i<h then QS(i,h,a);
if j>l then QS(l,j,a);
end;
function        max(a,b:string):string;
begin

        if length(a)>length(b) then exit(a);
        if length(a)<length(b) then exit(b);
        if a>b then exit(a) else exit(b);
end;

begin
        mo;
        doc;
        xuly;
        dong;
end.
