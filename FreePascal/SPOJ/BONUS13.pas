uses    math;
const   finp    =       '';
        fout    =       '';
        don     :       array[1..8] of longint=(-2,-1,1,2,2,1,-1,-2);
        cot     :       array[1..8] of longint=(1,2,2,1,-1,-2,-2,-1);
type    bg      =       record
        x,y     :       byte;
        w       :       longint;
        end;
var     g,f     :       text;
        n,m     :       byte;
        e,e1    :       array[1..64] of bg;
        a       :       array[1..8,1..8] of byte;
        kq,tt      :       int64;
        dau,cuoi:       byte;
        dddd    :array[1..100] of longint;
        st      :       array[1..65] of bg;
        dd      :       array[1..8,1..8] of boolean;
        ddd    :       array[1..64] of boolean;
        ddti,ddha,ddxe:    array[1..64,1..64] of boolean;
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
var     i,j,u,v    :       byte;
        w       :  int64;
begin
        readln(f,n);
        for i:=1 to n do
         begin
                readln(f,u,v,w);
                a[u,v]:=i;
                e[i].x:=u;
                e[i].y:=v;
                e[i].w:=w;
                tt:=tt+e[i].w;
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
{procedure       bfs(t,u,v:byte);
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
end;  }
procedure       init;
var     i,j,k    :       byte;
        u,v     :       longint;
begin

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
procedure       xuly;
var     i,j,k,t,k1,k2 :       byte;
        ne,u,v      :       longint;
        luu,luu1     :       int64;
begin
        init;
        ne:=0;
        for i:=1 to m do ddd[i]:=true;
        for i:=1 to m do
         begin
          ddd[i]:=false;
          for j:=1 to m do
                if ddd[j] then
                        begin
                                ddd[j]:=false;
                                for k:=1 to m do
                                 if ddd[k] then
                                 begin
                                         ddd[k]:=false;
                                         luu:=0;
                                         inc(ne);
                                          for k1:=1 to n do
                                                if ddha[i,k1]  or  ddxe[j,k1] or ddti[k,k1] then begin luu:=luu+int64(e[k1].w);dddd[k1]:=ne; end;
                                         for t:=1 to m do
                                            if ddd[t] then
                                              begin
                                              luu1:=luu;
                                                for k2:=1 to 8 do
                                                 begin
                                                  u:=e1[t].x+don[k2];
                                                  v:=e1[t].y+cot[k2];
                                                  if check(u,v) and (a[u,v]>0) and(dddd[a[u,v]]<>ne) then luu1:=luu1+e[a[u,v]].w;
                                                 end;
                                                kq:=max(kq,luu1);
                                               if tt=kq then begin writeln(g,kq);dong;halt; end;
                                              end;
                                         ddd[k]:=true;
                                 end;
                                ddd[j]:=true;
                        end;
          ddd[i]:=true;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
