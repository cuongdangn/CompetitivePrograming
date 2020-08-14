const   finp    =       '';
        fout    =       '';
        coso      =       1000000000;
        sls     =       1700;
        css      =       9;
type    big     =       array[0..sls] of int64;
var     g,f     :       text;
        n,p       :       int64;

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
function        nhan(a:big;b:longint);
var     c       :       big;
        nho     :       int64;
        i,cs       :       longint;
begin
        nho:=0;
        cs:=a[0];
        for i:=1 to cs  do
                begin
                        c[i]:=nho+a[i]*b;
                        if c[i]>coso then
                                begin
                                        nho:=c[i] div coso;
                                        c[i]:=c[i] mod coso;
                                end
                        else nho:=0;
                 end;
                while nho>0 do
                        begin
                                inc(cs);
                                c[cs]:=nho mod coso;
                                nho:=nho div coso;
                        end;
                c[0]:=cs;
        exit(c);
end;
function        lt(a:big;b:longint):big;
var     tg:big;
begin
        if b=1 then exit(a);
        tg:=lt(a,b div 2);
        tg:=nhan(tg,tg);
        if b mod 2=1 then tg:=tg*a;
        exit(tg);
end;
procedure       doc;
begin
        readln(f,n);
        readln(f,p);
end;
