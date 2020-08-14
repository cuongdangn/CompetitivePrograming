{$MODE OBJFPC}
const   finp    =       '';
        fout    =       '';
        d       :       array[1..4] of integer  = (1,0,-1,0);
        c       :       array[1..4] of integer  = (0,-1,0,1);
type    cs      =       record
        x,y:integer;
        end;
var     g,f     :       text;
        r,c1,xpx,xpy,dx,dy     :       longint;
        day,dd       :     array[0..1500,0..1500] of integer;
        qu      : array[0..1500*1500+1] of cs;
        da,cu     : longint;
        b       : array[0..1501,0..1501] of char;

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
var     i,j     :       integer;
begin
        readln(f,r,c1);
        for i:=1 to r do
                begin
                        for j:=1 to c1 do
                        begin
                        read(f,b[i,j]);
                        if b[i,j]='L' then
                                if (xpx=0)and(xpy=0) then
                                        begin
                                                xpx:=i;
                                                xpy:=j;
                                        end
                                else
                                        begin
                                                dx:=i;
                                                dy:=j;
                                        end;
                        end;

                        readln(f);

                end;
end;
procedure       push(u,v:integer);
begin
        inc(cu);
        qu[cu].x:=u;
        qu[cu].y:=v;
end;
procedure       cb1;
var     i,j       :integer;
begin
        da:=0;
        cu:=-1;
        for i:=1 to r do
        for j:=1 to c1 do
        if (b[i,j]='.')or(b[i,j]='L') then
                begin
                        day[i,j]:=0;
                        push(i,j);
                        dd[i,j]:=1;
                end;
end;
function        kt(u,v:integer):boolean;
begin
        if ((u>0)and(u<=r)) and ((v>0)and(v<=c1)) then exit(true);
        exit(false);
end;
procedure       BFS1;
var     u,v     :       integer;
        i       :       integer;
        u1,v1   :       integer;
begin
        cb1;
        while da<=cu do
                begin
                        u:=qu[da].x;
                        v:=qu[da].y;
                        inc(da);
                        for i:=1 to 4 do
                                begin
                                        u1:=u+d[i];
                                        v1:=v+c[i];
                                        if (kt(u1,v1)) and (dd[u1,v1]=0)and(b[u1,v1]='X') then
                                                begin
                                                    push(u1,v1);
                                                    dd[u1,v1]:=1;
                                                    day[u1,v1]:=day[u,v]+1;
                                                end;
                                end;
                end;
end;
procedure       BFS;
var     u,v     :       integer;
        i       :       integer;
        u1,v1,ngay,cuoi,dau   :       integer;
begin
        ngay:=0;
        da:=0;
        dau:=0;
        cu:=-1;
        fillchar(dd,sizeof(dd),0);
        push(xpx,xpy);
        dd[xpx,xpy]:=1;
        repeat
        while da<= cu do
                begin
                        u:=qu[da].x;
                        v:=qu[da].y;
                        inc(da);
                          for i:=1 to 4 do
                                begin
                                        u1:=u+d[i];
                                        v1:=v+c[i];
                                        if (kt(u1,v1)) and (dd[u1,v1]=0)and(day[u1,v1]<=ngay+1) then
                                                begin
                                                    push(u1,v1);
                                                    dd[u1,v1]:=1;
                                                    if day[u1,v1]=ngay+1 then
                                                        if dau=0 then dau:=cu;
                                                     if (u1=dx) and( v1=dy) then
                                                     begin
                                                     writeln(g,ngay+1);
                                                     exit;
                                                     end;
                                                end;
                                end;
                 end;
                  da:=dau;
                  dau:=0;
                  inc(ngay);
        until    false;
end;

begin
        mo;
        doc;
        BFS1;
        BFS;
        dong;
end.
