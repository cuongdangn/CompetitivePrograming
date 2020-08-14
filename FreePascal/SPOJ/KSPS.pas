{$h+}
const   finp    =       'ksps.inp';
        fout    =       'ksps.out';
        maxn    =       1000000;
var     s,x     :       string;
        p,q,cs  :       longint;
        ok      :       boolean;
        vt      :       array[1..maxn*10] of longint;
        g,f     :       text;
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

procedure       phantich(p,q:longint);
var     tg:string;
begin
    s:='';
    while p<>0 do
        begin
            if vt[p]<>0 then
                begin
                    cs:=vt[p];
                    exit;
                end;
            str(p div q,tg);
            s:=s+tg;
            vt[p]:=length(s);
            p:=p mod q*10;
        end;
    ok:=true;
end;
procedure       xuly;
var     solan,i:longint;
        tg:string;
begin
    ok:=false;
    fillchar(vt,sizeof(vt),0);
    phantich(p,q);
    if ok then
        while length(s)<=maxn do s:=s+'0';
    if not ok then
        begin
            solan:=maxn div length(s)+1;
            tg:=copy(s,cs,length(s)-cs+1);
            for i:=1 to solan do s:=s+tg;
        end;
    writeln(g,pos(x,s));
end;

procedure       doc;
begin
            readln(f,p,q);
            readln(f,x);
end;

begin
        mo;
        doc;
        xuly;
        dong;
end.
