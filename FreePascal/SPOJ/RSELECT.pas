uses    math;
const   finp    =       '';
        fout    =       '';
        don:array[1..4] of longint =(0,-1,1,0);
        cot:array[1..4] of longint =(1,0,0,-1);
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        kq      :       longint;
        n       :       longint;
        a       :       array[1..1001,1..1001] of longint;
        dd      :       array[1..1001,1..1001,1..4] of boolean;
        dd1     :       array[1..1001,1..1001] of longint;
        st      :       array[1..1000010] of bg;

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
        readln(f,n);
        for i:=1 to n do
         for j:=1 to n do
          read(f,a[i,j]);
end;
function        check(a,b:longint):boolean;
begin
        exit((a>0)and(b>0)and(a<=n)and(b<=n));
end;
procedure       bfs(x,y,t,ht    :       longint);
var     k,u,v,dau,cuoi        :       longint;
        tg      :       bg;

begin
        dau:=1;
        cuoi:=1;
        st[1].x:=x;
        st[1].y:=y;
        dd1[x,y]:=ht;
        while dau<=cuoi do
         begin
            tg:=st[dau];
            inc(dau);
            for k:=1 to 4 do
             begin
              u:=tg.x+don[k];
              v:=tg.y+cot[k];
              if check(u,v) and (abs(a[u,v]-a[tg.x,tg.y])=t) then
              if dd[tg.x,tg.y,k]  and dd[u,v,5-k] then
               begin
                dd[tg.x,tg.y,k]:=false;
                dd[u,v,5-k]:=false;
                if dd1[u,v]<>ht then
                 begin
                  dd1[u,v]:=ht;
                  inc(cuoi);
                  st[cuoi].x:=u;
                  st[cuoi].y:=v;
                 end;
               end;
             end;
         end;
         kq:=max(kq,cuoi);
end;
procedure       xuly;
var     i,j,k,u,v,ht     :       longint;
begin
        ht:=0;
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         for j:=1 to n do
           for k:=1 to 4 do
            begin
             u:=i+don[k];
             v:=j+cot[k];
             if check(u,v) then
             if dd[i,j,k] and dd[u,v,5-k] then
              begin
                inc(ht);
                bfs(i,j,abs(a[i,j]-a[u,v]),ht);
              end;
            end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.