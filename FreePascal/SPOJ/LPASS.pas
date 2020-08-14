{$MODE objfpc}{$H+}
const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var      g,f     :       text;
        n,k     :       longint;
        a       :       array[1..101] of string;
        b       :       array[1..101] of longint;
        d       :       array[0..100,0..100,0..8] of string;
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
procedure       sort;
var     i,j:integer;
        tg:string;
        tg1:longint;
begin
        for i:=1 to n-1 do
                for j:=i+1 to n do
                        if a[i]+a[j]<a[j]+a[i] then
                                begin
                                       tg:=a[i];
                                       a[i]:=a[j];
                                       a[j]:=tg;
                                       tg1:=b[i];
                                       b[i]:=b[j];
                                       b[j]:=tg1;
                                end;
end;
function        max(a,b:string):string;
begin

        if length(a)>length(b) then exit(a);
        if length(a)<length(b) then exit(b);
        if a>b then exit(a) else exit(b);

end;
procedure       xuly;
var     i,j,r:longint;
        s,a1,b1       :       string;
begin
        sort;
        for i:=0 to n do
         for j:=0 to k do
                for r:=0 to 8 do d[i,j,r]:='@';

         d[0,0,0]:='';
        for i:=1 to n do
                for j:=0 to k do
                        for r:=0 to 8 do
                                        begin
                                        s:='#';

                                        if j>0 then a1:=d[i-1,j-1,(9+r-b[i])mod 9] else a1:='@';
                                        b1:=d[i-1,j,r];

                                        if (a1='@' )and (b1='@') then s:='@';
                                        if (a1='@' )and (b1<>'@') then s:=b1;
                                        if (a1<>'@' )and (b1='@') then s:=a1+a[i];
                                        if s='#' then s:=max(a1+a[i],b1);
                                        d[i,j,r]:=s;
                                        end;
        if d[n,k,0]='@' then writeln(g,'-1') else writeln(g,d[n,k,0]);
end;
procedure       doc;
var     t:byte;
        i,j:longint;
begin
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,n,k);
                        for j:=1 to n do
                        begin

                        readln(f,b[j]);

                        str(b[j],a[j]);
                        b[j]:=b[j] mod 9;
                        end;
                        xuly;
                end;
end;
begin
        mo;
        doc;
        dong;
end.
