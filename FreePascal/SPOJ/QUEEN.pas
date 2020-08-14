const   finp    =       '';
        fout    =       '';
        don     :       array[1..4] of integer=(0,1,1,1);
        cot     :       array[1..4] of integer=(1,0,1,-1);
var     g,f     :       text;
        a       :       array[1..1000,1..1000] of char;
        res,dd     :       array[1..1000,1..1000] of longint;
        n,m     :       longint;
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
begin
        readln(f,n,m);
        for i:=1 to n do
         begin
          for j:=1 to m do read(f,a[i,j]);
          readln(f);
         end;
end;
function        check(u,v:longint):boolean;
begin
        exit((u>0)and(u<=n)and(v>0)and(v<=m));
end;
procedure       BFS(i,j,k:longint);
var     u,v,t     :       longint;
begin
        u:=i;
        v:=j;
        t:=0;
        while check(i+don[k],j+cot[k])and(a[i+don[k],j+cot[k]]<>'#') do
         begin
                t:=t+1;
                dd[i+don[k],j+cot[k]]:=1;
                i:=i+don[k];
                j:=j+cot[k];
         end;
         while check(u,v)and(a[u,v]<>'#') do
         begin
                res[u,v]:=res[u,v]+t;
                u:=u+don[k];
                v:=v+cot[k];
         end;
end;
procedure       xuly;
var     k,i,j       :       longint;
begin
        for k:=1 to 4 do
         begin
          for i:=1 to n do
           for j:=1 to m do dd[i,j]:=0;
           for i:=1 to n do
            for j:=1 to m do
             if (dd[i,j]=0)and(a[i,j]='.') then
             BFS(i,j,k)
             else if a[i,j]='#' then res[i,j]:=-1;
          end;
          for i:=1 to n do
           begin
           for j:=1 to m do write(g,res[i,j]+1,' ');
           writeln(g);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

