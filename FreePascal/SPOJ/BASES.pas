const   finp    =       'BASES.INP';
        fout    =       'BASES.OUT';
type    bit     =       record
        a:array[0..1000000] of longint;
        sl:longint;
        end;
var     g,f     :    text;
        c,d,n   :    int64;
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
begin
        readln(f,n,d,c);
end;
procedure       csc(var t:int64;s:bit);
var     i       :longint;
        t1      :      int64;
begin
        t:=0;
        t1:=1;
        for i:=1 to s.sl do
                begin
                       t:=t+t1*s.a[i];
                       t1:=t1*c;
                end;
end;
function       csd(var s:bit;t:int64;var i:longint):boolean;
var     t1:int64;
        ok      :       boolean;
begin
        ok:=false;
        s.sl:=0;
        while t>0 do
                begin
                        inc(s.sl);
                        s.a[s.sl]:=t mod d;
                        if t mod d>=c then
                               begin
                                ok:=true;
                                i:=s.sl;
                               end;
                        t:=t div d;
                end;
        exit(ok);
end;
procedure               tinh;
var     l,h,m,t1  :        int64;
        i,j     : longint;
        s       :       bit;
        ok      :  boolean;
begin
        l:=1;
        h:=trunc(1e18);
        while l<=h do
                begin
                        m:=(l+h) div 2;
                        ok:=csd(s,m,i);
                        if ok then
                        for j:=1 to i do s.a[j]:=c-1;
                        csc(t1,s);
                        if ((m-t1)=n)and ok then
                                begin
                                        writeln(g,m);
                                        dong;
                                        halt;
                                end
                        else
                         if (m-t1)>=n then h:=m-1
                         else l:=m+1;
                end;
end;
begin
        mo;
        doc;
        tinh;
        dong;
end.


