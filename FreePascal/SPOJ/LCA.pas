{$r-,l-,q-}
{$m 1000000000}
Uses math;
Const fi='';
fo='';
maxn=100001;
type node=^re;
re=record
            v,w:longint;
            next:node;
     end;
var f,g: text;
    n,m,kq1,kq2:longint;
    lt2:array[0..21] of longint;
    ke:array[1..maxn] of node;
    cha,mi,ma:array[0..maxn,0..21] of longint;
    h:array[1..maxn] of longint;
    tham:array[1..maxn] of boolean;
    p   :       array[1..50000] of byte;
procedure mo;
begin
        assign(f,fi);
        reset(F);
        assign(g,fo);
        rewrite(G);
end;
procedure dong;
begin
        close(F);
        close(G);
end;
procedure nap(var ke:node; v,w:longint);
var p:node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure nhap;
var i,u,v,w:longint;
begin
        readln(F,n);
        for i:=1 to n-1 do
        begin
              readln(F,u,v);
              nap(ke[u],v,1);
              nap(ke[v],u,1);
        end;
end;
procedure dfs(u:longint);
var v:longint;
P:node;
begin
        tham[u]:=true;
        p:=ke[u];
        WHile p<>nil do
        begin
                v:=p^.v;
                if not tham[v] then
                begin
                    h[v]:=h[u]+1;
                    cha[v,0]:=u;
                    mi[v,0]:=p^.w;
                    ma[v,0]:=mi[v,0];
                    dfs(V);
                end;
                p:=p^.next;
        end;
end;
procedure duyet(v:longint);
var t:node;
begin
  tham[v]:=true;t:=ke[v];
  while t<>nil do
    begin
      if tham[t^.v]=false then
        begin
          h[t^.v]:=h[v]+1;
          cha[t^.v,0]:=v;
          duyet(t^.v);
end;
      t:=t^.next;
    end;
end;
procedure init;
var     i,j     :       longint;
begin
  m:=trunc(ln(n)/ln(2))+1;
  duyet(1);
  for i:=1 to m do
    for j:=1 to n do
        cha[j,i]:=cha[cha[j,i-1],i-1];
  lt2[0]:=1;
  for i:=1 to m do lt2[i]:=lt2[i-1]*2;
end;
procedure nhay(var v:longint;x:longint);
var i:longint;
begin
  for i:=m downto 0 do
    if x>=lt2[i] then
      begin
        v:=cha[v,i];
        x:=x-lt2[i];
      end;
end;
function lca(u,v:longint): longint;
var     i       :longint;
begin
  if h[u]>h[v] then nhay(u,h[u]-h[v]) else nhay(v,h[v]-h[u]);
  if u=v then exit(u);
  for i:=m downto 0 do
    if cha[u,i]<>cha[v,i] then
      begin
        u:=cha[u,i];
        v:=cha[v,i];
      end;
  exit(cha[u,0]);
end;
procedure       sangngto(n:longint);
var     i,j     :       longint;
begin
        p[0]:=1; p[1]:=1;
        for i:=2 to trunc(sqrt(n))+1 do
                if p[i]=0 then
                begin
                        j:=i+i;
                        while j<=n do
                        begin
                                p[j]:=i;
                                j:=j+i;
                        end;
                end;
end;

procedure solve;
var j,u,v,i,t,kq:longint;
begin
        kq:=0;
        sangngto(50000);
        for i:=1 to n-1 do
                for j:=i+1 to n do
        begin
                t:=lca(i,j);
                kq1:=h[i]-h[t]+h[j]-h[t];
                if p[i]=0 then inc(kq);
        end;
        writeln(g,kq);
end;
begin
        mo;
        nhap;
        init;
        solve;
        dong;
end.
