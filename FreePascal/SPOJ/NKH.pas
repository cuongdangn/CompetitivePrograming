var
        s,s1,s2,kq :       string;
        n,m,l:byte;
procedure       doc;
begin
        readln(s1);
        readln(s2);
        readln(s);
        n:=length(s1);
        m:=length(s2);
        l:=length(s);
end;
procedure       try(vt,i,j:byte);
begin
        if (vt>l)or(i>n)or(j>m) then exit;
        if s[vt]=s1[i+1] then
        begin
        kq:=kq+'1';
        if (i+1=n)and(j=m) then
                begin
                        writeln(kq);
                        halt;
                end;
        try(vt+1,i+1,j);
        delete(kq,length(kq),1);
        end;
        if s[vt]=s2[j+1] then
         begin
         kq:=kq+'2';
         if (i=n)and(j+1=m) then
                begin
                        writeln(kq);
                        halt;
                end;
         try(vt+1,i,j+1);
         delete(kq,length(kq),1);
         end;
end;
begin
        doc;
        try(1,0,0);
end.