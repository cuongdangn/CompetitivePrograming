const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        w       :       array[0..302,0..302] of longint;
        free    :       array[0..302] of integer;
        max     :       array[0..302] of boolean;
        n    :       longint;
        min  :       int64;
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
var     i,u,v       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        readln(f,u);
                        w[0,i]:=u;
                        w[i,0]:=u;
                end;
        for u:=1 to n do
                begin
                        for v:=1 to n do read(f,w[u,v]);
                        readln(f);
                end;
        for i:=0 to n do free[i]:=0;
        fillchar(max,sizeof(max),true);
end;
function        findmin:integer;
var     i,li,tam:longint;
begin
        tam:=100001;
        for i:=0 to n do
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
        max[0]:=false;
        for sc:=1 to n do
                begin
                        v:=findmin;
                        max[v]:=false;
                        for i:=0 to n do if max[i] and ( w[free[i],i]>w[v,i]) then
                                free[i]:=v;
                end;
end;
procedure       xuat;
var     i       :       longint;
begin
        for i:=1 to n do min:=w[free[i],i]+min;
        write(g,min);
end;
begin
        mo;
        doc;
        prim;
        xuat;
        dong;
end.
