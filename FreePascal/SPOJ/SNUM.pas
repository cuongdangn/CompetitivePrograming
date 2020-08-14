const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        fx      :       array[1..21,0..21*9] of int64;
        res,n,k,p:      int64;
        x       :       array[1..100] of longint;

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
        readln(F,n,k,p);
        fillchar(fx,sizeof(fx),255);
end;
function        tinh(i,s:longint):int64;
var     j:longint;
        sum:int64;
begin
        if fx[i,s]<>-1 then exit(fx[i,s]);
        if i>n then
        begin
                fx[i,s]:=ord(s=k);
                exit(fx[i,s]);
        end;
        sum:=0;
        for j:=0 to 9 do
        sum:=sum+tinh(i+1,s+j);
        fx[i,s]:=sum;
        exit(fx[i,s]);
end;
procedure       xuat;
var     i:longint;
begin
        for i:=1 to n do if x[i]<>0 then break;
        for i:=i to n do write(g,x[i]);
end;
procedure try(i,s:longint);
var     j:longint;
begin
        if i>n then
        begin
                if (p=1) and (s=k) then
                begin
                        xuat;
                        dong;
                        halt;
                end;
        end;
        for j:=0 to 9 do
        begin
                if p>fx[i+1,s+j]then p:=p-fx[i+1,s+j]
                else
                begin
                        x[i]:=j;
                        try(i+1,s+j);
                        break;
                end;
        end;
end;
procedure xuly;
begin
        writeln(g,tinh(1,0));
        try(1,0);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
