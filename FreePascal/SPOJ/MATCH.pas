const   fin     =       'DNC.INP';
        fout    =       '';
var     f1,f2   :       text;
        n,m     :       longint;
        a,b,t   :       array[1..100] of longint;
        c       :       array[1..100,1..100] of longint;
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
        while not seekeof(f1) do
        begin
                readln(f1,i,j);
                c[i,j]:=1;
                //c[j,i]:=1;
        end;
end;
//////////////////////////////
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
                j:=0;
        for i:=1 to n do
                if a[i]<>0 then inc(j);
        writeln(f2,j);
        for i:=1 to n do
                if a[i]<>0 then writeln(f2,i,' ',a[i]);
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
        xulyfile;
        dongfile;
end.
