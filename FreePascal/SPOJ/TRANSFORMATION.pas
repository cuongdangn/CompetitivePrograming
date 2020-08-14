const   finp    =       'TRANSFORMATION.INP';
        fout    =       'TRANSFORMATION.OUT';
var    g,f     :       text;
        s       :       array[0..100001] of char;
        n,k     :       longint;
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
var     i       :longint;
begin
        readln(f,n,k);
        for i:=1 to n do read(f,s[i]);
        s[n+1]:='9';
end;
procedure       xuly;
var
        ok      :       byte;
        i       :       longint;
begin
        ok:=0;
        for i:=1 to n do
               if k>0 then
                begin
                          if s[i]='4' then
                          begin
                                if i mod 2=1 then
                                               if ((s[i+1]='4') and (s[i+2]='7')) or ((s[i+1]='7')and(s[i+2]='7')) then
                                               begin
                                               ok:=1;
                                               break;
                                               end;
                              if  s[i+1]='7' then
                                begin
                                        dec(k);
                                        if i mod 2=0 then s[i]:='7'
                                        else s[i+1]:='4';
                                end;
                          end;
                end
                else exit;
    if (k>0)and(ok=1) then
        begin
              if (s[i+1]='4') and (s[i+2]='7') then
                if k mod 2=1 then
                begin
                s[i+1]:='7';
                exit;
                end;
              if (s[i+1]='7')and(s[i+2]='7') then
               if k mod 2=1 then
               begin
                s[i+1]:='4';
                exit;
               end;
        end;
end;
procedure       xuat;
var     i:longint;
begin
        for i:=1 to n do write(g,s[i]);
end;
begin
        mo;
        doc;
        xuly;
        xuat;
        dong;
end.
















