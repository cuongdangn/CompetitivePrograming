const   fin     =       'teamup.inp';
        fout    =       'teamup.out';
var     f1,f2   :       text;
        n,l     :       longint;
        c       :       array[0..101,0..101] of longint;
        a       :       array[0..1,0..101] of longint;
        d,dd    :       array[0..101] of longint;
procedure       mofile;
begin
        assign(f1,fin);
        reset(f1);
        assign(f2,fout);
        rewrite(f2);
end;
/////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin
        readln(f1,n);
        for i:=1 to n do
        begin
                read(F1,j);
                repeat
                        c[i,j]:=1;
                        read(f1,j);
                until j=0;
                readln(f1);
        end;
        for i:=1 to n do
                for j:=1 to n do
                        if i<>j then
                        begin
                                c[i,j]:=1-c[i,j];
                        end;
        for i:=1 to n do
                for j:=1 to n do
                        if c[i,j]=1 then c[j,i]:=1;
end;
/////////////////////////
procedure       BFS(x:longint);
var     i,j     :       longint;
        u,v     :       longint;
        k       :       longint;
        stack   :       array[0..101] of longint;
        top,bot :       longint;
begin
        fillchar(dd,sizeof(dd),255);
        d[x]:=1; dd[x]:=1;
        inc(l); top:=1; bot:=1; stack[top]:=x;
        repeat
                u:=stack[bot]; inc(bot);
                for v:=1 to n do
                        if (d[v]=0) and (dd[v]=0) then
                        begin
                                d[v]:=0;
                        end;
        until bot>top;
end;
//////////////////////////
procedure       xulyfile;
var     i,j     :       longint;
begin
        for i:=1 to n do
                if d[i]=0 then
                        BFS(i);
end;
//////////////////////////
procedure       dongfile;
begin
        close(f1);
        close(f2);
end;
///////////////////////////
begin
        mofile;
        docfile;
        xulyfile;
        dongfile;
end.
