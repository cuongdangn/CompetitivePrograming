const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        w       :       array[1..1000,1..1000] of longint;
        free    :       array[0..1001] of integer;
        max     :       array[1..1000] of boolean;
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
var     i,u,v,c       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
                begin
                        readln(f,u,v,c);
                        w[u,v]:=c;
                        w[v,u]:=c;
                end;
        for u:=1 to n do
             for v:=1 to n do
              if w[u,v]=0 then w[u,v]:=maxint;
        for i:=1 to n do free[i]:=1;
        fillchar(max,sizeof(max),true);
end;
function        findmin:integer;
var     i,li,tam:longint;
begin
        tam:=maxint;
        for i:=1 to n do
         if (max[i]=true) and (w[free[i],i]< tam) then
                begin
                        tam:=w[free[i],i];
                        li:=i;
                end;
         exit(li);
end;
procedure       prim;
var     v,i,sc:longint;
begin
        max[1]:=false;
        for sc:=2 to n do
                begin
                        v:=findmin;
                        max[v]:=false;
                        for i:=1 to n do if max[i] and ( w[free[i],i]>w[v,i]) then
                                free[i]:=v;
                end;
end;
procedure       xuat;
var     i,min       :       longint;
begin
        min:=-10;
        for i:=2 to n do
        if min<w[free[i],i] then min:=w[free[i],i];
        write(g,min);
end;
begin
        mo;
        doc;
        prim;
        xuat;
        dong;
end.