const   finp    =       '';
        fout    =       '';
type    toado   =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a1,b1       :       array[1..100] of toado;
        mt      : array[1..100,1..100] of byte;
        n,m     :       integer;
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
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a1[i].x,a1[i].y);
        readln(f);
        for i:=1 to m do read(f,b1[i].y,b1[i].y);
end;
function        kc(a,b:toado):real;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
procedure       kt;
var     l,l1       :       array[1..100] of real;
        i,j       :       integer;
begin
        for i:=1 to n-1 do
                        l[i]:=kc(a1[i],a1[i+1]);
        for i:=1 to m do
                     for j:=1 to n-1 do l1[i]:=kc(b1[i],a1[j])+kc(b1[i],a1[j+1]);
        for i:=1 to n-1 do
               for j:=1 to m do
                if 2*l[i]>=l[j] then
                               c[i,j]:=1;
end;
procedure       tang_duong(j:longint);
var     i,p     :       longint;
begin
        repeat
                i:=t[j];
                p:=a[i];
                a[i]:=j; b[j]:=i;
                j:=p;
        until j=0;
end;
//////////////////////////////
procedure       tim_duong(x:longint);
var     i,j     :       longint;
        top,bot :       longint;
        stack   :       array[1..1000] of longint;
begin
        fillchar(t,sizeof(t),0);
        fillchar(stack,sizeof(stack),0);
        top:=1; bot:=1; stack[top]:=x;
        repeat
                i:=stack[bot]; inc(bot);
                for j:=1 to m do
                        if (t[j]=0) and (c[i,j]=1) then
                        begin
                                t[j]:=i;
                                if b[j]=0 then
                                begin
                                        tang_duong(j);
                                        exit;
                                end else
                                begin
                                        inc(top);
                                        stack[top]:=b[j];
                                end;
                        end;
        until bot>top;
end;
procedure       xulyfile;
var     i,j     :       longint;
begin
        for i:=1 to n do
                if a[i]=0 then
                        tim_duong(i);
        for i:=1 to n do
                if a[i]<>0 then writeln(f2,i,' ',a[i]);
end;



end;

