const   finp    =       '';
        fout    =       '';
        maxn    =       1010;
        maxx    =       trunc(1e17);
type    node    =       ^re;
        re      =       record
        u     :       longint;
        w     :       extended;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of  node;
        n,m     :       longint;
        trace   :       array[1..maxn] of longint;

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
procedure       nap(var ke:node;u,w:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var    i,u,v,w     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v,w);
                nap(ke[u],v,w);
         end;
end;
function        check(u,v:longint):boolean;
begin
        while (u<>v)and(u<>1) do
                u:=trace[u];
        exit(u=v);
end;
function        ktra(x:extended):boolean;
var     u,i       :       longint;
       dau,cuoi   :       longint;
       qu       : array[0..maxn] of longint;
       inq      : array[1..maxn] of boolean;
       d        : array[1..maxn] of extended;
       p        : node;
begin
        for i:=1 to n do begin inq[i]:=false;d[i]:=maxx;trace[i]:=0 end;
        qu[0]:=1;
        dau:=0;
        cuoi:=0;
        d[1]:=0;
        inq[1]:=true;
        while (cuoi+1)mod n<>dau do
           begin
                u:=qu[dau];
                dau:=(dau+1) mod n;
                inq[u]:=false;
                p:=ke[u];
                while p<>nil do
                 begin
                        if d[p^.u]>d[u]+p^.w-x then
                         begin
                                d[p^.u]:=d[u]+p^.w-x;
                                if check(u,p^.u) then exit(true);
                                trace[p^.u]:=u;
                                if not inq[p^.u] then
                                 begin
                                        cuoi:=(cuoi+1)mod n;
                                        qu[cuoi]:=p^.u;
                                        inq[p^.u]:=true;
                                 end;
                         end;
                         p:=p^.next;
                 end;
           end;
           exit(false);
end;
procedure       xuly;
var     giua,dau,cuoi,luu        :       extended;
begin
        if not ktra(1000000010) then begin writeln(g,'NO TOUR');exit end;
        dau:=0;
        cuoi:=1000000000;
        luu:=0;
        while cuoi-dau>=0.001 do
         begin
                giua:=(dau+cuoi)/2;
                if ktra(giua) then
                 begin
                        luu:=giua;
                        cuoi:=giua;
                 end
                 else dau:=giua;
         end;
         writeln(g,luu:0:2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.