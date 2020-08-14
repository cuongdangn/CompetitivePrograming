const   finp    =       'L.inp';
        fout    =       'L.OUT';
var     g,f     :       text;
        s,kq    :       string;
        i,n       :       byte;
        ok1       :       boolean;
        dd      : array[1..10] of byte;
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
procedure       duyet(i:byte;ok:boolean;kq:string);
var     j,t,bd       :       byte;
begin
        if i=n+1 then
         begin
          if (ok)and(n<=9) then
           begin
            writeln(g,kq);
            ok1:=true;
           end;
           exit;
         end;
        bd:=ord(s[i])-48;
        if not ok then t:=bd else t:=1;
        if t=0 then t:=1;
        for j:=t to 9 do
         if dd[j]=0 then
          begin
           dd[j]:=1;
           duyet(i+1,ok or(j>bd),kq+chr(j+48));
           if ok1 then exit;
           dd[j]:=0;
          end;
          if i=1 then
           begin
            n:=n+1;
            if n>9 then
             begin
              writeln(g,0);
              ok1:=true;
              exit;
             end;
             n:=n-1;
             dd[1]:=1;
             dd[2]:=1;
            duyet(i+1,true,kq+'12');
            if ok1 then exit;
           end;

end;
procedure       doc;
begin
        readln(f,s);
        n:=length(s);
        kq:='';
        ok1:=false;
        fillchar(dd,sizeof(dd),0);
        duyet(1,false,kq);
end;
procedure       doc1;
begin
        while not eof(f) do doc;
end;
begin
        mo;
        doc1;
        dong;
end.