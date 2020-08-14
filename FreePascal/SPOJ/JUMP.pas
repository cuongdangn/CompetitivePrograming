const   finp    =   'JUMP.OUT';
        fout    =   'JUMP.OUT';
        maxn    =   100000;
type    ca      =   record
        x,y     :   longint;
        end;
var     g,f     :   text;
        st      :   array[0..4*maxn] of ca;
        n,k,dau,cuoi,sb     :   longint;
        a       :   array[0..1,1..3*maxn] of char;
        d       :   array[0..1,1..300000] of longint;
        dd      :   array[0..1,1..300000] of byte;
        kt      :   boolean;
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
        readln(f,n,k);
        for i:=0 to 1 do
                begin
                        for j:=1 to n do read(f,a[i,j]);
                        readln(f);
                end;
        kt:=false;

end;
procedure       push(u,v:longint);
begin
        inc(cuoi);
        st[cuoi].x:=u;
        st[cuoi].y:=v;
end;
procedure       di1(u,v:longint);
var     t:longint;
begin
        t:=v+1;
        if a[u,t]<>'X' then
                if dd[u,t]=0 then
                        begin
                                dd[u,t]:=1;
                                d[u,t]:=d[u,v]+1;
                                if t>n then
                                        begin
                                                kt:=true;
                                                sb:=d[u,t];
                                                if sb<n then writeln(g,'YES')
                                                else write(g,'NO');
                                                dong;
                                                halt;
                                        end;
                                push(u,t);
                        end;
end;

procedure       di2(u,v:longint);
var     t:longint;
begin
        t:=v-1;
        if t>0 then
        if a[u,t]<>'X' then
                if dd[u,t]=0 then
                        begin
                                dd[u,t]:=1;
                                d[u,t]:=d[u,v]+1;
                                if t>n then
                                        begin
                                                kt:=true;
                                                sb:=d[u,t];
                                                 if sb<n then writeln(g,'YES')
                                                else write(g,'NO');
                                                 dong;
                                                halt;
                                        end;
                                push(u,t);
                        end;
end;
procedure       di3(u1,v:longint);
var     t,u:longint;
begin
        t:=v+k;
        u:=1-u1;
        if a[u,t]<>'X' then
                if dd[u,t]=0 then
                        begin
                                dd[u,t]:=1;
                                d[u,t]:=d[u,v]+1;
                                if t>n then
                                        begin
                                                kt:=true;
                                                sb:=d[u1,t];
                                                if sb<n then writeln(g,'YES')
                                                else write(g,'NO');
                                                dong;
                                                halt;
                                        end;
                                push(u,t);
                        end;
end;

procedure       BFS;
var     u,v     :       longint;
begin
      dau:=0;
      cuoi:=-1;
      push(0,1);
      while dau<= cuoi do
      begin
             u:=st[dau].x;
             v:=st[dau].y;
             inc(dau);
             di1(u,v);
             di2(u,v);
             di3(u,v);
      end;
      write(g,'NO');
      dong;
end;
begin
        mo;
        doc;
        BFS;
end.
