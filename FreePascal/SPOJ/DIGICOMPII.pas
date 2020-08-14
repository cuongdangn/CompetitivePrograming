const   finp    =       '';
        fout    =       '';
        maxn    =       500000;
var     g,f     :       text;
        e       :       array[0..maxn,0..2] of longint;
        n       :       int64;
        sobi    :       array[0..maxn] of qword;
        m,dem   :       longint;
        a       :       array[0..maxn] of longint;
        dd      :       array[0..maxn] of boolean;
        str     :       array[0..1] of char;
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
var     i,j     :       longint;
        c       :       char;
begin
        str[0]:='L';
        str[1]:='R';
        readln(f,n,m);
        for i:=1 to m do
        begin
          readln(f,c,e[i][0],e[i][1]);
          if c='L' then e[i][2]:=0
          else e[i][2]:=1;
        end;
end;
procedure       DFS(u:longint);
var     i       :       longint;
begin
        dd[u]:=false;
        i:=e[u][2];
        if dd[e[u][i]] then
         begin
          dfs(e[u][i]);
          a[dem]:=e[u][i];
          dec(dem);
         end;
        if dd[e[u][1-i]] then
         begin
          dfs(e[u][1-i]);
          a[dem]:=e[u][1-i];
          dec(dem);
         end;
end;
procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        dem:=m+1;
        fillchar(dd,sizeof(dd),true);
        dfs(1);
        a[1]:=1;
        sobi[a[1]]:=n;
        for i:=1 to m do
         begin
           j:=e[a[i]][2];
           t:=(sobi[a[i]]+1) div 2;
           sobi[e[a[i]][j]]:=t+sobi[e[a[i]][j]];
           sobi[e[a[i]][1-j]]:=sobi[a[i]]-t+sobi[e[a[i]][1-j]];
         end;
         ///
         for i:=1 to m do
          begin
           if sobi[i] mod 2=0 then write(g,str[e[i][2]])
            else write(g,str[1-e[i][2]]);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
