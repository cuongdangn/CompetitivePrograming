const   finp    =       'str5.inp';
        fout    =       'str5.out';
type    st      =       ansistring;
var     g,f     :       text;
        n,best1,best       :       longint;
        s,s1       :       array[1..6] of st;
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
        readln(f,n);
        for i:=1 to n do
         readln(f,s[i]);
end;
function        dao(s:st):st;
var     i       :       longint;
        stg:    st;
begin
        stg:='';
        for i:=length(s) downto 1 do
          stg:=stg+s[i];
        exit(stg);
end;
procedure       init;
var     i       :       longint;
begin
        for i:=2 to n do
          s1[i]:=dao(s[i]);
        for i:=1 to n do
         s[i]:=s[i]+s[i];
        for i:=2 to n do
         s1[i]:=s1[i]+s1[i];
end;
procedure        xuly;
var     i,j,k      :      longint;
        stg      :      st;
        ok      :       boolean;
begin
        best:=0;
         for i:=1 to length(s[1]) div 2 do
          begin
           for j:=best+1 to length(s[1]) div 2 do
            begin
                stg:=copy(s[1],i,j);
                ok:=true;
                for k:=2 to n do
                 if (pos(stg,s[k])=0) and (pos(stg,s1[k])=0) then begin ok:=false;break end;
                 if ok then best1:=j else break;
            end;
            best:=best1;
          end;
          writeln(g,best);
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
