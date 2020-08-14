const   finp    =       '';
        fout    =       '';
        sl      =       20;
var     g,f     :       text;
        a       :       array[0..1001,1..sl] of int64;
        base    :       array[1..sl] of longint;
        n,q     :       longint;
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
var     i,k,j,bd     :       longint;
        s       :       ansistring;
begin
        randomize;
        for i:=1 to sl do
                base[i]:=random(10000000)+1000007;

        readln(f,n,q);
        for i:=0 to n-1 do
         begin
                readln(f,s);
                if s[1]='-' then bd:=2
                else bd:=1;

                for j:=1 to sl do
                begin
                   for k:=bd to length(s) do
                       a[i][j]:=(a[i][j]*10+ord(s[k])-48)mod base[j];
                   if bd=2 then a[i][j]:=-a[i][j];
                end;
         end;
end;
function        tinh(i,j:longint;c:char;v:longint):longint;
begin
        if c='+' then exit((a[i][v]+a[j][v])mod base[v])
          else
           if c='*' then  exit((a[i][v]*a[j][v])mod base[v])
            else   exit((a[i][v]-a[j][v]+base[v])mod base[v])
end;
procedure       xuly;
var     i,j,x,y,x1,y1     :       longint;
        s,s1   :        string[2];
        ok      :       boolean;
begin
        for i:=1 to q do
         begin
                read(f,x,y);
                read(f,s);
                read(f,x1,y1);
                readln(f,s1);
                ok:=true;
               for j:=1 to sl do
               if tinh(x,y,s[2],j)<>tinh(x1,y1,s1[2],j) then
               begin
                        ok:=false;
                        break;
               end;
               if ok then writeln(g,'YES')
                else writeln(g,'NO');
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.