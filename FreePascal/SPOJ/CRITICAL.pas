{$MODE OBJFPC}
uses math;
const
  fi = 'DNC.INP';
  fo = '';
  MaxN = Round(2E4);
  MaxM = Round(2E5);
var
  ip, op : Text;
  n, m, count: Integer;
  a, Link : array[-MaxM..MaxM] of Integer;
  Head, Low, Number, Trace,dd : array[1..MaxN] of Integer;
  Vis, Start : array[-MaxM..MaxM] of Boolean;
  sl,cc    :       array[1..maxn] of double;
  n1:int64;

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
  t     :       double;
begin
  inc(count);
  t:=0;
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
               cc[u]:=cc[u]+cc[v];
                Low[u] := min(Low[u],Low[v]);
                if (Trace[u] = -1) and (cc[u] >= 2)
          or (Trace[u] <> -1) and (Low[v] >= Number[u]) then
              begin
                sl[u]:=sl[u]+cc[v]*(n1-cc[u]+t-1);

              end
              else t:=t+cc[u];
            end
          else Low[u] := min(Low[u],Number[v]);
        end;
      k := Link[k];
    end;
    cc[u]:=cc[u]+1;
end;
procedure Visit1(u : Integer);
var
  k, v : Integer;
begin
  k := Head[u];
  inc(n1);
  dd[u]:=1;
  while (k <> 0) do
    begin
          v := a[k];
          if dd[v] = 0 then
            begin
              Visit1(v);
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
        n1:=0;
        visit1(i);
        Trace[i] := -1;
        Visit(i);
      end;
end;

procedure       xuat;
var     i:longint;
        kq,ton      :   double;
begin
        ton:=0;
        for i:=1 to n do ton:=ton+sl[i];
        kq:=ton/n;
        write(op,kq:0:2);
end;
begin
  Assign(ip,fi); Reset(ip);
  Assign(op,fo); Rewrite(op);
  Input;
  Solve;
  xuat;
  Close(ip);
  Close(op);
end.

