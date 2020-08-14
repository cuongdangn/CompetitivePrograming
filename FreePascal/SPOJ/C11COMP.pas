const   finp    =       '';
        fout    =       '';
        maxn    =       100010;
type    node    =       ^re;
        re      =       record
        u:longint;
        next    :       node;
        end;
        bg      =       record
        da,cu   :       longint;
        cs      :       longint;
        end;
var     g,f     :       text;
        n,m,k   :       longint;
        giong,khac,loai    :       array[1..maxn] of longint;
        a       :       array[1..maxn] of longint;
        ke      :       array[1..maxn] of node;
        bit,bd,next,sl :       array[1..maxn] of longint;
        top     :       longint;
        b       :       array[1..maxn] of bg;
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

procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,j,x     :       longint;
begin
        read(f,n,m,k);
        for i:=1 to n-1 do
          begin
                read(f,x);
                nap(ke[x],i+1);
          end;
        for i:=1 to n do read(f,loai[i]);
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        inc(top);
        a[top]:=u;
        b[u].da:=top;
        p:=ke[u];
        while p<>nil do
         begin
                dfs(p^.u);
                p:=p^.next;
         end;
        b[u].cu:=top;
        b[u].cs:=u;
end;
procedure       up(i,x:longint);
begin
        while i<=n do
         begin
          bit[i]:=bit[i]+x;
          i:=i+i and (-i);
         end;
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=tg+bit[i];
                i:=i-i and(-i);
         end;
         exit(tg);
end;
procedure       init;
var     i,j:    longint;
begin
        top:=0;
        dfs(1);
        for i:=1 to n do
         a[i]:=loai[a[i]];
        for i:=n downto 1 do
         begin
                if sl[a[i]]=0 then next[i]:=n+1
                else next[i]:=sl[a[i]];
                sl[a[i]]:=i;
         end;

end;
procedure       timkhac;
var     i,j     :       longint;
begin
        fillchar(bd,sizeof(bd),0);
        fillchar(bit,sizeof(bit),0);
        j:=1;
         for i:=1 to n do
         begin
                inc(sl[a[i]]);
                if bd[a[i]]>0 then
                        up(bd[a[i]],-1);
                        bd[a[i]]:=i;
                        up(i,1);
                 while (j<=n)and(b[j].cu=i) do
                  begin
                        khac[b[j].cs]:=get(b[j].cu)-get(b[j].da-1);
                        inc(j);
                  end;
         end;
end;

procedure       QS(l,h:longint);
var     i,j,x:    longint;
        tg      : bg;
begin
        i:=l;
        j:=h;
        x:=b[random(h-l+1)+l].cu;
        repeat
                while b[i].cu<x do inc(i);
                while b[j].cu>x do dec(j);
                if i<=j then
                 begin
                        tg:=b[i];
                        b[i]:=b[j];
                        b[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        randomize;
        QS(1,n);
        j:=1;
        fillchar(sl,sizeof(sl),0);
        for i:=1 to n do
         begin
                inc(sl[a[i]]);

                if sl[a[i]]>k+1 then
                 begin
                        up(bd[a[i]],-1);
                        bd[a[i]]:=next[bd[a[i]]];
                        up(bd[a[i]],1);
                 end;
                 if bd[a[i]]=0 then  begin bd[a[i]]:=i; end;
                 if sl[a[i]]=k+1 then up(bd[a[i]],1);
                 while (j<=n)and(b[j].cu=i) do
                  begin
                        giong[b[j].cs]:=get(b[j].cu)-get(b[j].da-1);
                        inc(j);
                  end;
         end;
         timkhac;
         readln(f,m);
         for i:=1 to m do
          begin
                readln(f,j);
                writeln(g,khac[j]-giong[j]);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
