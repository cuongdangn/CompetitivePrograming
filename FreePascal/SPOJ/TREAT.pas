{$M 4000000}
const   finp    =       '';
        fout    =       '';
        maxn=100001;
        maxm=100001;
type    stack      =       record
        item    :       array[1..maxn] of longint;
        top     :       longint;
        end;
        tedge   =       record
        x,y:longint;
        end;

var     g,f     :       text;
        e       :       array[1..maxm] of tedge;
        link,a    :       array[1..maxm] of longint;
        head,number,low,t,dd,s,res    :       array[1..maxn] of longint;
        avail   :       array[1..maxn] of boolean;
        st   :  stack;
        n,count,scc,m,sl     :       longint;
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
var     i,v,u       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                e[i].x:=i;
                readln(f,e[i].y);
                a[i]:=e[i].y;
                end;

        fillchar(head,sizeof(head),0);
        for i:=n downto 1 do
        with e[i] do
                begin
                        link[i]:=head[x];
                        head[x]:=i;
                end;
                m:=n;
end;
procedure       kt;
begin
        fillchar(number,sizeof(number),0);
        fillchar(avail,sizeof(avail),true);
        st.top:=0;
        count:=0;
        scc:=0;
end;
procedure      push(v:longint);
        begin
                with st do
                        begin
                                inc(top);
                                item[top]:=v;
                        end;
        end;
function pop:longint;
begin
        with st do
                begin
                        pop:=item[top];
                        dec(top);
                end;
end;
procedure       mini(var x:longint;y:longint);
begin
        if y<x then x:=y;
end;

procedure       DFS(u:longint);
var     i,v     :       longint;
begin
        inc(count);
        number[u]:=count;
        low[u]:= 100000 ;
        push(u);
        i:=head[u];
        while i<>0 do
                begin
                        v:= e[i].y;
                        if avail[v] then
                          if number[v]<>0 then
                            mini(low[u],number[v])
                          else
                                begin
                                        DFS(v);
                                        mini(low[u],low[v]);
                                end;
                        i:=link[i];
                end;

        if low[u]>= number[u] then
                begin
                        inc(scc);
                        sl:=0;
                        repeat
                                v:=pop;
                                t[v]:=scc;
                                inc(sl);
                                avail[v]:=false;
                        until v=u;
                        s[scc]:=sl;
                end;
end;
procedure dfs1(i: longint);
begin
     if (a[i]=i) then
        res[i]:=1
     else
     begin
          if (s[t[i]]=1) then
          begin
               if (res[a[i]]=0) then
                  dfs1(a[i]);
               res[i]:=1+res[a[i]];
          end
          else res[i]:=s[t[i]];
     end;
end;

procedure       xuly;
var     v,i       :       longint;
begin
        fillchar(dd,sizeof(dd),0);
        for v:=1 to n do
                if avail[v] then dfs(v);
        for i:=1 to n do if (res[i]=0) then dfs1(i);
        for i:=1 to n do
                writeln(g,res[i])


end;
begin
        mo;
        doc;
        kt;
        xuly;
        dong;
end.


