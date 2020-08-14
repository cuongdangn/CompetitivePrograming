program qbschool;

type cung=record
     v,w,link:int64;
     end;

const fin='';
      fon='';

var adj:array[0..100000] of cung;
    head,d,trace:array[0..100000] of int64;
    avail:array[0..100000] of boolean;
    n,m,dem,yc,kq:int64;

procedure enter;
var i:longint;
    u,v:int64;
begin
  fillchar(head,sizeof(head),0);
  read(n,m);
  for i:=1 to m do
      begin
        inc(dem);
        read(yc,u,adj[dem].v,adj[dem].w);
        adj[dem].link:=head[u];
        head[u]:=dem;
        if yc=1 then continue;
        v:=adj[dem].v;
        inc(dem);
        adj[dem].v:=u;
        adj[dem].w:=adj[dem-1].w;
        adj[dem].link:=head[v];
        head[v]:=dem;
      end;
end;

procedure relax(u,v,w:int64);
begin
if d[v]=d[u]+w then trace[v]:=trace[v]+trace[u]
else
if d[v]>d[u]+w then
begin
  d[v]:=d[u]+w;
  trace[v]:=trace[u];
end;

end;

procedure dijkstra;
var u,v,i:longint;
begin
  repeat
    u:=0;
    for v:=1 to n do
        if (avail[v]=true) and (d[v]<d[u]) then
           u:=v;
    if (u=0) or (u=n) then break;
    avail[u]:=false;
    i:=head[u];
    while i<>0 do
        begin
          relax(u,adj[i].v,adj[i].w);
          i:=adj[i].link;
        end;
  until false;
end;


procedure truyvet;
begin
  if d[n]=10000000 then
     begin
     writeln(0,' ',0);
     halt;
     end
  else
     begin
       write(d[n],' ',trace[n]);

     end;

end;

procedure solve;
var i:longint;
begin
  for i:=0 to n do d[i]:=10000000;
  d[1]:=0;
  trace[1]:=1;
  fillchar(avail,sizeof(avail),true);
  dijkstra;
  truyvet;
end;

BEGIN
  assign(input,fin);
  reset(input);
  assign(output,fon);
  rewrite(output);
  enter;
  solve;
  close(input);
  close(output);
END.
