const   finp    =       'codef.inp';
        fout    =       '';
var     g,f     :       text;
        n,m     :       longint;
        a       :       array[1..300,1..300] of char;
        d       :       array[1..300,1..300] of boolean;
        dd      :       array[1..300] of boolean;
        c,vt    :       array[1..300] of longint;
procedure       mo;
begin
        assign(f,finp);reset(f);assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do begin read(f,c[i]);vt[c[i]]:=i end;
        readln(f);
        for i:=1 to n do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       dfs(goc,u:longint);
var     i       :       longint;
begin
        dd[u]:=false;d[goc,u]:=true;
        for i:=1 to n do
         if (a[i,u]='1')and(dd[i]) then dfs(goc,i);
end;
procedure       swap(var a,b:longint);
var     tg      :       longint;
begin
        tg:=a;a:=b;b:=tg;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        fillchar(d,sizeof(d),false);
        for i:=1 to n do
         begin
                for j:=1 to n do dd[j]:=true;
                dfs(i,i);
         end;
         fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         begin
          for j:=1 to n do
           if dd[j] then
            if d[vt[j],i] then
             begin
                  vt[c[i]]:=vt[j];

                swap(c[i],c[vt[j]]);
                   vt[j]:=i;
                dd[j]:=false;
                break;
             end end;
          for i:=1 to n do write(g,c[i],' ');
end;
begin
        mo;doc;
        xuly;dong;
end.
