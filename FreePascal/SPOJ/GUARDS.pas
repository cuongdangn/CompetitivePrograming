const   finp    =       'GUARDS.INP';
        fout    =       'GUARDS.OUT';
var     f,g   :       text;
        n,m,n1,m1     :       longint;
        a,b,t   :       array[1..100] of longint;
        c       :       array[1..50,1..50] of longint;
        a1       :      array[1..50,1..50] of        byte;
        x,y       :       array[1..500] of byte;
//////////////////////////////
procedure       mofile;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
////////////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin
        readln(f,n1,m1);
        for i:=1 to n1 do
                begin
                        for j:=1 to m1 do
                        read(f,a1[i,j]);
                        readln(f);
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
procedure       kt;
var     i,j     :       longint;
begin
        for i:=1 to n1 do



end;
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
        kq:=0;
        for i:=1 to n do
        if a[i]<>0 then inc(kq);
        writeln(g,kq);
        for i:=1 to n do
        if a[i]<>0 then
                        writeln(g,i,' ',a[i]);

end;
////////////////////////////////
procedure       dongfile;
begin
        close(f);
        close(g);
end;
////////////////////////////////////
begin
        mofile;
        docfile;
        {kt;}
        xulyfile;
        dongfile;
end.
