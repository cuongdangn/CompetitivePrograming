uses    math;
const   finp    =       'USAB.INP';
        fout    =       'USAB.OUT';
        c       =       10000;
var     g,f     :       text;
        p,k     :       array[0..101] of longint;
        m       :       byte;
        d       :       array[0..101,0..10001] of longint;
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
var     i       :integer;
begin
        readln(f,m);
        for i:=1 to m do
                readln(f,p[i],k[i]);
end;
function        souoc(i,b:longint):longint;
var     t,sl:int64;
        x       :       longint;
begin
        if b=0 then exit(0);
        if (b<=c)and(d[i,b]>-1) then exit(d[i,b]);
        if i=m then
        if (p[i]=0) then exit(0) else exit(trunc(log10(b)/log10(p[i])))
        else
                begin
                        t:=1;
                        sl:=0;
                        for x:=0 to k[i] do
                                begin
                                        sl:=sl+souoc(i+1,b div t);

                                       if p[i]>0 then t:=t*p[i];

                                        if t>b then break;

                                end;
                        if b<=c then d[i,b]:=sl;
                        exit(sl);
                end;
end;
procedure       xuly;
var     i       :byte;
        a,b,t1,t2:int64;
begin
fillchar(d,sizeof(d),255);
        for i:=1 to 3 do
          begin
               readln(f,a,b);
               t1:=souoc(0,b);
               t2:=souoc(0,a-1);
               writeln(g,t1-t2);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
