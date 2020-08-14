const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        s       :       array[0..100000] of longint;
        n       :       integer;
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
procedure       QS(l,h:integer);
var     i,j       :       integer;
        tg,x      :       longint;
begin
        randomize;
        i:=l;
        j:=h;
        x:=s[random(h-l+1)+l];
        repeat
                while x>s[i] do inc(i);
                while x<s[j] do dec(j);
                if i<=j then
                        begin
                                tg:=s[i];
                                s[i]:=s[j];
                                s[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var     i,j       :longint;
begin
        readln(f,n);
        for i:=1 to n do
               begin
                read(f,j);
                s[i]:=s[i-1]+int64(j);
               end;
        QS(1,n-1);
        for i:=1 to n do
         if (s[i]-s[i-1])<0 then
                begin
                        writeln(g,-1);
                        exit;
                end;
         for i:=1 to n do write(g,s[i]-s[i-1],' ');
end;
begin
        mo;
        doc;
        dong;
end.
