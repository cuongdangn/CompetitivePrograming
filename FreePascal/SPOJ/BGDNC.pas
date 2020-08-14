const   fin     =       'BG.INP';
        fout    =       'BG.OUT';
type    toado   =       record
        X,Y     :       INTEGER;
        END;
var     f1,f2   :       text;
        n,m     :       longint;
        a,b,t   :       array[1..100] of longint;
        c       :       array[1..100,1..100] of longint;
        a1,b1     :       array[1..100] of toado;
//////////////////////////////
procedure       mofile;
begin
        assign(f1,fin);
        reset(f1);
        assign(f2,fout);
        rewrite(f2);
end;
////////////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin
        readln(f1,n,m);
        for i:=1 to n do read(f1,a1[i].x,a1[i].y); readln(f1);
        for i:=1 to m do read(f1,b1[i].x,b1[i].y); readln(f1);
end;
//////////////////////////////
function        kc(a,b:toado):real;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
////////////////////////////////
procedure       khoitao;
var     i,j     :       longint;
        l1   :       array[1..100] of real;
        l2   :       array[1..100,1..100] of real;
begin
        for i:=1 to n-1 do l1[i]:=kc(a1[i],a1[i+1]);
        for i:=1 to m do
                for j:=1 to n-1 do l2[i,j]:=kc(b1[i],a1[j])+kc(b1[i],a1[j+1]);
        for i:=1 to n-1 do
                for j:=1 to m do
                        if l1[i]*2>=l2[j,i] then
                                      begin

                                        c[i,j]:=1;
                                        end;

                n:=n-1;
end;
///////////////////////////////
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
        stack   :       array[1..100] of longint;
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
var     i,j,kq     :       longint;
begin
        for i:=1 to n do
                if a[i]=0 then
                        tim_duong(i);

        kq:=n+1;
        for i:=1 to n do
        if a[i]<>0 then inc(kq);
        writeln(f2,kq);
        for i:=1 to n+1 do
        begin
                write(f2,a1[i].x,' ',a1[i].y,' ');
                if a[i]<>0 then
                begin
                       j:=a[i];
                       write(f2,b1[j].x,' ',b1[j].y,' ');
                end;
        end;
end;
////////////////////////////////
procedure       dongfile;
begin
        close(f1);
        close(f2);
end;
////////////////////////////////////
begin
        mofile;
        docfile;
        khoitao;
        xulyfile;
        dongfile;
end.
