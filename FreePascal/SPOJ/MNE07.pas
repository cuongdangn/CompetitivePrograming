const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        s,t     :       ansistring;
        kt      :       boolean;
        n       :       longint;
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
var     i       :       longint;
begin
        readln(f,t);
        readln(f,s);
        n:=length(s);
end;
procedure       KMP(x,a:ansistring);
var     next:array[1..10000] of longint;
        j,jj,i    :       longint;
begin
        j:=1;
        jj:=0;
        next[1]:=0;
        while (j<n) do
                begin
                        while (jj>0) and(x[j]<>x[jj]) do jj:=next[jj];
                        inc(j);
                        inc(jj);
                        if x[j]=x[jj] then next[j]:=next[jj] else next[j]:=jj;
                end;
        i:=1;
        j:=1;
        repeat
                while (j>0)and ( x[j]<>a[i]) do j:=next[j];
                inc(i);
                inc(j);
                if j>n then
                 begin
                    kt:=true;
                    exit;
                 end;
        until    i>2*n;
end;
procedure       xuly;
var     i,j:      longint;x,x1:ansistring;
begin
        s:=s+s; kt:=false;
        for i:=0 to n-1 do
        begin
             x:=copy(s,n-i+1,n); x1:='';
             for j:=1 to n do
             if (x[j]='0') and (t[j]='0') then x1:=x1+'0' else x1:=x1+'';
             KMP(x1,s);
             if kt=true then
                begin
                write(g,'Yes');
                exit;
                end;
        end;
        write(g,'No');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
        dong;