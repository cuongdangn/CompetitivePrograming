{$MODE OBJFPC}
uses math;
const
  fi = '';
  fo = '';
  MaxN = Round(1E4);
  MaxM = Round(5E4);
var
  ip, op : Text;
  n, m, count, Bridges, Arri : Integer;
  a, Link : array[-MaxM..MaxM] of Integer;
  Head, Low, Number, cc, Trace : array[1..MaxN] of Integer;
  Vis, Start : array[-MaxM..MaxM] of Boolean;


procedure Input;
var
  i, x, y : Integer;
begin
  Fillchar(Head,sizeof(Head),0);
  Readln(ip,n,m);
  for i := 1 to m do
    begin
      Readln(ip,x,y);
      a[i] := y;
      Link[i] := Head[x];
      Head[x] := i;

      a[-i] := x;
      Link[-i] := Head[y];
      Head[y] := -i;
    end;
end;

procedure Visit(u : Integer);
var
  k, v : Integer;
begin
  inc(count);
  Number[u] := count;
  Low[u] := High(Integer);
  k := Head[u];
  while (k <> 0) do
    begin
      if Vis[k] then
        begin
          Vis[-k] := false;
          v := a[k];
          if Trace[v] = 0 then
            begin
              Trace[v] := u;
              Visit(v);
              Low[u] := min(Low[u],Low[v]);
            end
          else Low[u] := min(Low[u],Number[v]);
        end;
      k := Link[k];
    end;
end;

procedure Solve;
var
  i : Integer;
begin
  Fillchar(Vis,sizeof(Vis),true);
  for i := 1 to n do
    if Trace[i] = 0 then
      begin
        Trace[i] := -1;
        Visit(i);
      end;
end;

procedure PrintResult;
var
  v, u : Integer;
begin
  Bridges := 0;
  Arri := 0;
  for v := 1 to n do
    begin
      u := Trace[v];
      if (u <> -1) and (Low[v] >= Number[v]) then inc(Bridges);
    end;
  Fillchar(cc,sizeof(cc),0);
  for v := 1 to n do
    begin
      u := Trace[v];
      if (u <> -1) then inc(cc[u]);
    end;
  Fillchar(Start,sizeof(Start),false);
  for v := 1 to n do
    begin
      u := Trace[v];
      if (u <> -1) then
        if (Trace[u] = -1) and (cc[u] >= 2)
          or (Trace[u] <> -1) and (Low[v] >= Number[u]) then
            Start[u] := true;
    end;
  for v := 1 to n do
    if Start[v] then inc(Arri);
  Writeln(op,Arri,' ',Bridges);
end;

begin
  Assign(ip,fi); Reset(ip);
  Assign(op,fo); Rewrite(op);
  Input;
  Solve;
  PrintResult;
  Close(ip);
  Close(op);
end.

