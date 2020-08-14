uses    math;
const   finp    =       'DNC.INp';
        fout    =       'TRAIN.OUT';
type    bg      =       record
        x,y     :       byte;
        z       :       longint;
        end;
var    g,f     :       text;
       n,m,d       :longint;
       kq       :  int64;
       fx       :        array[0..11] of int64;
       ds       :        array[1..26] of bg;
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
        readln(f,n,m,d);
        for i:=1 to d do
                readln(f,ds[i].x,ds[i].y,ds[i].z);
end;
procedure       kt;
var     i:byte;
        t       :       int64;
begin
        t:=0;
        for i:=0 to m do
                if fx[i]>n then
                        begin
                                kq:=max(kq,0);
                                exit;
                        end;
        for i:=0 to m do t:=t+fx[i];
        kq:=max(kq,t);
end;
procedure       dfs(i:longint);
var     j,j1,j2: byte;
        ok      :       boolean;
begin
        if i=d+1 then
                begin
                        kt;
                        exit;
                end;
        ok:=false;
        for j:=0 to 1 do
                begin
                        if j=1 then
                                begin
                                   for j1:=ds[i].x to ds[i].y-1 do
                                   begin
                                   fx[j1]:=fx[j1]+ds[i].z;
                                   if fx[j1]>n then
                                       begin
                                        ok:=true;
                                        break;
                                       end;
                                   end;
                                   if not ok then dfs(i+1);
                                   for j1:=ds[i].x to j1 do fx[j1]:=fx[j1]-ds[i].z;
                                end
                        else dfs(i+1);
                end;
end;
begin
        mo;
        doc;
        dfs(1);
        writeln(g,kq);
        dong;
end.
