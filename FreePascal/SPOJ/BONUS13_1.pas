uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        don     :       array[1..8] of longint=(-2,-1,1,2,2,1,-1,-2);
        cot     :       array[1..8] of longint=(1,2,2,1,-1,-2,-2,-1);
type    bg      =       record
        x,y     :       byte;
        w       :       int64;
        end;
var     g,f     :       text;
        n,m     :       byte;
        e,e1    :       array[1..64] of bg;
        a       :       array[1..8,1..8] of byte;
        kq      :       int64;
        dau,cuoi:       byte;
        st      :       array[1..100] of bg;
        dd      :       array[1..8,1..8] of boolean;
        ddd     :       array[1..64] of boolean;
        ddti,ddha,ddxe,ddma:    array[1..64,1..64] of boolean;
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
var     i,j,u,v,w     :       byte;
begin
        readln(f,n);
        for i:=1 to n do
         begin
                readln(f,u,v,w);
                a[u,v]:=i;
                e[i].x:=u;
                e[i].y:=v;
                e[i].w:=w;
         end;
        for i:=1 to 8 do
         for j:=1 to 8 do
          if a[i,j]=0 then
           begin
                inc(m);
                e1[m].x:=i;
                e1[m].y:=j;
           end;
end;
function        check(a,b       :       longint):boolean;
begin
        exit((a>0)and(b>0)and(a<=8)and(b<=8));
end;
procedure       bfs(t,u,v:byte);
var     i,j,k     :       longint;
        tg      : bg;
begin
        dau:=1;
        cuoi:=1;
        for i:=1 to 8 do
         for j:=1 to 8 do
          dd[i,j]:=true;
        st[1].x:=u;
        st[1].y:=v;
        dd[u,v]:=false;
        while dau<=cuoi do
         begin
                tg:=st[dau];
                inc(dau);
                for k:=1 to 8 do
                 begin
                        i:=don[k]+tg.x;
                        j:=cot[k]+tg.y;
                        if check(i,j) and dd[i,j] then
                         begin
                                dd[i,j]:=false;
                                if a[i,j]<>0 then ddma[t,a[i,j]]:=true;
                                inc(cuoi);
                                st[cuoi].x:=i;
                                st[cuoi].y:=j;
                         end;
                 end;
         end;
end;
procedure       init;
var     i,j     :       byte;
begin
        for i:=1 to m do
          bfs(i,e1[i].x,e1[i].y);
        /////////////////////
        for i:=1 to m do
         begin
                for j:=1 to 8 do
                  begin
                    if a[e1[i].x,j]<>0 then ddxe[i,a[e1[i].x,j]]:=true;
                    if a[j,e1[i].y]<>0 then ddxe[i,a[j,e1[i].y]]:=true;
                  end;
         end;
        //////////////////////
        for i:=1 to m do
         begin
                for j:=1 to n do
                    if ((e[j].x+e[j].y)=(e1[i].x+e1[i].y))or((e[j].x-e[j].y)=(e1[i].x-e1[i].y)) then
                      ddti[i,j]:=true;
         end;
         /////////////////////
         for i:=1 to m do
          for j:=1 to n do
            ddha[i,j]:=ddti[i,j] or ddxe[i,j];
          ////////////////
end;
procedure       duyet(u:longint);
var     i       :       longint;
begin
        if u=5 then
         begin
                kq:=max(kq,t);
                exit;
         end;
        for i:=1 to m do
         if ddd[i] then
          begin
                ddd[i]:=false;
                for j:=

procedure       xuly;
var     i,j,k,t,k1 :       byte;
        luu     :       int64;
begin
        init;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
