const   finp    =       'CIRCUIT.INP';
        fout    =       'CIRCUIT.OUT';
type    di      =       record
        x,y     :longint;
        end;
        tst     =       array[1..50000] of di;
        bg      =       record
        x,y,gt:longint;
        end;
var     g,f     :       text;
        n,m,n1,m1  :       longint;
        a       :       array[0..101,0..101] of byte;
        b       :       array[0..101,0..101] of longint;
        dau,cuoi     :       longint;
        cha     :    array[0..50000] of longint;
        res     :    array[1..50000] of bg;
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
var     i,j       :longint;
begin
        readln(f,n,m);
        for i:=1 to n do
                begin
                        for j:=1 to m do read(f,a[i,j]);
                        readln(f);
                end;
end;
procedure       push(var st:tst;x,y:longint);
begin
        inc(cuoi);
        st[cuoi].x:=x;
        st[cuoi].y:=y;
end;
function        get(u:longint):longint;
begin
        if  cha[u]=-1 then exit(u);
        cha[u]:=get(cha[u]);
        exit(cha[u]);
end;
procedure       BFS(x,y :       longint);
var     st:tst;
        i,j,u,v:longint;
begin
        dau:=1;
        cuoi:=1;
        st[dau].x:=x;
        st[dau].y:=y;
        b[x,y]:=n1;
        while dau<=cuoi do
                begin
                        u:=st[dau].x;
                        v:=st[dau].y;
                        inc(dau);
                        case  a[u,v] of
                         1: if b[u+1,v]=0 then
                                      begin
                                        push(st,u+1,v);
                                        b[u+1,v]:=n1;
                                      end;
                         2: if b[u,v+1]=0 then
                                      begin
                                        push(st,u,v+1);
                                        b[u,v+1]:=n1;
                                      end;
                         3: begin
                                if b[u+1,v]=0 then
                                      begin
                                        push(st,u+1,v);
                                        b[u+1,v]:=n1;
                                      end;
                                if b[u,v+1]=0 then
                                      begin
                                        push(st,u,v+1);
                                        b[u,v+1]:=n1;
                                      end;
                            end;
                         end;
                         case a[u,v-1] of
                         2 : if b[u,v-1]=0 then
                                begin
                                        b[u,v-1]:=n1;
                                        push(st,u,v-1);
                                end;
                         3  :  if b[u,v-1]=0 then
                                begin
                                        b[u,v-1]:=n1;
                                        push(st,u,v-1);
                                end;
                         end;

                         case a[u-1,v] of
                         1  : if b[u-1,v]=0 then
                                begin
                                        b[u-1,v]:=n1;
                                        push(st,u-1,v);
                                end;
                         3: if b[u-1,v]=0 then
                                begin
                                        b[u-1,v]:=n1;
                                        push(st,u-1,v);
                                end;
                         end;

                end;
end;
procedure       ktao;
var     i,j     :       longint;
begin

        for i:=1 to n do
        for j:=1 to m do
        if b[i,j]=0 then
                begin
                        inc(n1);
                        BFS(i,j);
                end;
end;
procedure       xuly;
var     cha2,i,j,cha1,kq     :longint;
begin
        kq:=0;
        for i:=1 to n1 do cha[i]:=-1;
        for j:=1 to m do
         for i:=1 to n-1 do
                begin
                        cha1:=get(b[i,j]);
                        cha2:=get(b[i+1,j]);
                        if cha1<>cha2 then
                                begin
                                        cha[cha2]:=cha1;
                                        kq:=kq+1;
                                        inc(m1);
                                        res[m1].x:=i;
                                        res[m1].y:=j;
                                        res[m1].gt:=1;
                                end;
                end;
         for i:=1 to n do
         for j:=1 to m-1 do
                begin
                        cha1:=get(b[i,j]);
                        cha2:=get(b[i,j+1]);
                        if cha1<>cha2 then
                                begin
                                        cha[cha2]:=cha1;
                                        kq:=kq+2;
                                        inc(m1);
                                        res[m1].x:=i;
                                        res[m1].y:=j;
                                        res[m1].gt:=2;
                                end;
                end;
         writeln(g,m1,' ',kq);
         for i:=1 to m1 do
                writeln(g,res[i].x,' ' ,res[i].y,' ',res[i].gt);

end;
begin
        mo;
        doc;
        ktao;
        xuly;
        dong;
end.
