const   finp    =       '';
        fout    =       '';
        dg      :       array[1..4] of integer =(0,0,1,-1);
        ct      :       array[1..4] of integer =(1,-1,0,0);
type
        re      =       record
        x,y     :       integer;
        end;
        arr     =       array[0..51*51] of re;
var     g,f     :       text;
        a,d       :       array[0..51,0..51] of char;
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
procedure       push(x1,y1:longint;var st:arr;var dau,cuoi:longint);
begin
        inc(cuoi);
        st[cuoi].x:=x1;
        st[cuoi].y:=y1;
end;
procedure       kt(var st:arr;var dau,cuoi :longint);
var     i,j     :longint;
begin
        for i:=1 to n do
        for j:=1 to m do
        if a[i,j]='X' then
                begin
                push(i,j,st,dau,cuoi);
                exit;
                end;
end;
procedure       BFS1;
var     st      :       arr;
        dau,cuoi:       longint;
        u,v,i,x1,y1       :       longint;

begin
        dau:=-1;
        cuoi:=0;
        kt(st,dau,cuoi);
        while dau<=cuoi do
                begin
                      u:=st[dau].x;
                      v:=st[dau].y;
                      for i:=1 to 4 do
                        begin
                                x1:=u+dg[i];
                                y1:=v+co[i];
                                if ((x1<=n)and(x1>0))and((y1<=m)and(y1>0)) then
                                        if (a[x1,y1]='X')and(dd[x1,y1]<>'a') then
                                        begin
                                                push(x1,y1,st,dau,cuoi);




                                        end;
                        end;

                end;

