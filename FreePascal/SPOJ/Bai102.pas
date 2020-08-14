uses    math;
const   finp    =       'Bai102.INP';
        fout    =       'Bai102.OUT';
var     g,f     :       text;
        s,kq1       :       ansistring;
        kq,n      :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
function        ss(a,b:ansistring):ansistring;
begin
        if length(a)>length(b) then exit(a);
        if length(a)<length(b) then exit(b);
        if a>b then exit(a)
        else exit(b);
end;
procedure       xuly;
var     i,j       :       longint;
        s1:       ansistring;
begin
        read(f,s);
        n:=length(s);
        i:=1;
        kq:=1;
        while  (i<=n) do
         begin
                j:=i;
                while (i<n)and(abs(ord(s[i])-ord(s[i+1]))=1) do inc(i);
                kq:=max(kq,i-j+1);
                inc(i);
         end;
         writeln(g,kq);
///////////////////////////////////////////////////////////////////////////////////
        s1:='';
        kq1:='';
        i:=1;
        while (i<=n)and(s[i]<>'0') do inc(i);

        while i<=n do
         begin
              while (i<=n)and(s[i]= '0') do inc(i);
              while (i<=n)and(s[i]<>'0') do
              begin
              s1:=s1+s[i];
              inc(i);
              end;
              if (i<=n)and(s[i]='0') then
               begin
                        kq1:=ss(kq1,s1);
                        s1:='';
               end;
               inc(i);
         end;
         writeln(g,kq1);
end;
begin
        mo;
        xuly;
        close(f);
        close(g);
end.
