uses    math;
const   finp    =       'TRAIN.IN';
        fout    =       'TRAIN.OUT';
type    bg      =       record
        x,y     :       byte;
        z       :       longint;
        end;
var    g,f     :       text;
       n,m,d,t       :longint;
       kq       :  int64;
       fx       :        array[0..10] of int64;
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
procedure       dfs(i:longint);
var     j,j1,j2: byte;
         ok      :       boolean;
begin
        if i=d+1 then
                begin
                        kq:=max(kq,t);
                        exit;
                end;
                ok:=true;
        for j:=0 to 1 do
                begin
                        if j=1 then
                                begin
                                   for j1:=ds[i].x to ds[i].y-1 do
                                   begin
                                   inc(fx[j1],ds[i].z);
                                   inc(t,ds[i].z);
                                   if fx[j1]>n then
                                       begin
                                       ok:=false;
                                       break;
                                       end;
                                   end;
                                   if ok then dfs(i+1);
                                   for j1:=ds[i].x to j1 do
                                   begin
                                   dec(fx[j1],ds[i].z);
                                   dec(t,ds[i].z);
                                   end;
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
