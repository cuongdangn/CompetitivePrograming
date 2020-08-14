uses    math;
const   finp    =       'CTAB.INP';
        fout    =       'CTAB.OUT';
        maxn    =       1000001;
        dog     :       array[1..8] of integer=(-2,-1,1,2,2,1,-1,-2);
        cot     :       array[1..8] of integer=(1,2,2,1,-1,-2,-2,-1);
var     g,f     :       text;
        a,dd       :       array[1..1000001] of byte;
        st      :       array[0..4*maxn] of longint;
        d       :       array[1..1000001] of longint;
        dau,cuoi   :       longint;
        m,n     :       longint;
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
var     i,j,dem     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do
                begin
                      for j:=1 to m do read(f,a[(i-1)*m+j]);
                      readln(f);
                end;
end;
function        chy(x:longint):longint;
begin
      chy:=x mod m;
      if chy=0 then chy:=m;
end;
function        chx(y:longint):longint;
begin
        chx:=y div (m)+1;
        if y mod m=0 then chx:=chx-1;
end;
procedure       push(u:longint);
begin
        inc(cuoi);
        st[cuoi]:=u;
end;
procedure       BFS;
var     v,u,x,y,v1     :       longint;
begin
        dau:=0;
        cuoi:=-1;
        for u:=1 to n*m do
        if a[u]>1 then
                begin
                        push(u);
                        d[u]:=0;
                        dd[u]:=1;
                end;

        while dau<=cuoi do
                begin
                        u:=st[dau];
                        inc(dau);
                        x:=chx(u);
                        y:=chy(u);
                        for v:=1 to 8 do
                                begin
                                     if (x+dog[v]>0)and(x+dog[v]<=n) then
                                        if (y+cot[v]>0)and(y+cot[v]<=m) then
                                                begin
                                                    v1:=(x+dog[v]-1)*m+(y+cot[v]);
                                                    if dd[v1]=0 then
                                                    begin
                                                    push(v1);
                                                    dd[v1]:=1;
                                                    d[v1]:=d[u]+1;
                                                    end;
                                                end;
                                end;
                end;
end;
procedure       xuly;
var     kq,res,i      :       longint;
        oka,okb :     boolean;
begin
        BFS;
        oka:=false;
        okb:=false;
        res:=0;
        kq:=maxlongint;
        for i:=1 to n*m do
         if a[i]=3 then inc(res);

         for i:=1 to n*m do
         if a[i]=1 then
         begin
         if d[i]=0 then
         begin
         oka:=true;
         break;
         end
         else
         res:=res+d[i]+1;
         end;

         if not oka then kq:=res;

         res:=0;
         for i:=1 to n*m do
          if a[i]=2 then inc(res);

          for i:=1 to n*m do
           if a[i]=0 then
           begin
           if d[i]=0 then
           begin
                okb:=true;
                res:=maxlongint;
                break;
           end
           else
           res:=res+d[i]+1;
           end;
           if oka and okb then writeln(g,-1)
           else
           begin
           kq:=min(kq,res);
           writeln(g,kq);
           end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


