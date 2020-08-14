const   finp    =       '';
        fout    =       '';
        dog     :       array[1..4] of integer=(0,1,-1,0);
        cot     :       array[1..4] of integer=(1,0,0,-1);
type    td      =       record
        x,y     :       longint;
        end;
var     g,f     :        text;
        a,a1,d,d1 :        array[1..100,1..100] of longint;
        tr      :        array[1..100,1..100] of char;
        n,m,u1,v1     :        longint;
        st      :        array[0..10002] of td;
        dau,cuoi        :       longint;
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
var     i,j,t       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do
                begin
                for j:=1 to m do
                     begin
                        read(f,t);
                        if t=0 then
                        begin
                                u1:=i;
                                v1:=j;
                        end;
                        a[i,j]:=t mod 256;
                        a1[i,j]:=t div 256;
                     end;
                readln(f);
                end;
end;
procedure       push(u,v:longint);
begin
        inc(cuoi);
        st[cuoi].x:=u;
        st[cuoi].y:=v;
end;
procedure       BFS;
var     u,v,i,u2,v2   :       longint;
begin
        dau:=1;
        cuoi:=0;
        push(u1,v1);
        while dau<=cuoi do
                begin
                     u:=st[dau].x;
                     v:=st[dau].y;
                     for i:=1 to 4 do
                      if (u+dog[i]<=n)and(u+dog[i]>0) then
                       if (v+cot[i]<=m)and(v+cot[i]>0) then
                        begin
                                u2:=u+dog[i];
                                v2:=v+cot[i];
                                if d[u2,v2]=0 then
                                        begin
                                                d[u2,v2]:=max(a[u,v],a[u2,v2]);
                                                d1[u2,v2]:=d1[u,v]+a1[u2,v2];
                                        end
                                else
                                        begin
                                                d[u2,v2]:=min(a[u,v],



