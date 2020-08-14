{$MODE OBJFPC}
program Project;
const
  InputFile  = 'PROJECT.INP';
  OutputFile = 'PROJECT.OUT';
  maxMN = Round(1E4);
  maxLC = Round(1E5);
  epsilon = 1 / (2 * maxLC * maxMN);
type
  TEdge = record
    x, y, l, c: Integer;
    selected: Boolean;
  end;
  PEdge = ^TEdge;
var
  se: array[1..maxMN] of TEdge;
  e: array[1..maxMN] of PEdge;
  lab: array[1..maxMN] of Integer;
  m, n: Integer;
  fi, fo: TextFile;

procedure Enter;
var
  i: Integer;
begin
  ReadLn(fi, n, m);
  for i := 1 to m do
    with se[i] do
      begin
        ReadLn(fi, x, y, l, c);
        if (l > maxLC) or (c > maxLC) then
          WriteLn('Error ', i);
        e[i] := @se[i];
      end;
end;

procedure Init;
begin
  FillDWord(lab[1], n, 0);
end;

function FindSet(u: Integer): Integer;
begin
  if lab[u] <= 0 then Result := u
  else
    begin
      Result := FindSet(lab[u]);
      lab[u] := Result;
    end;
end;

procedure Union(r, s: Integer);
begin
  if lab[r] < lab[s] then lab[s] := r
  else
    begin
      if lab[r] = lab[s] then Dec(lab[s]);
      lab[r] := s;
    end;
end;

function Kruskal(middle: Extended; var aver: Extended): Boolean;
var
  count: Integer;
  weight: Extended;
  totalL, totalC: Integer;

  procedure ProcessEdge(e: PEdge);
  var
    r, s: Integer;
  begin
    with e^ do
      begin
        r := FindSet(x); s := FindSet(y);
        if r = s then Exit;
        selected := True;
        Union(r, s);
        Inc(count);
        Inc(totalL, L);
        Inc(totalC, C);
      end;
  end;

  function Less(e1, e2: PEdge): Boolean;
  begin
    Result := e1^.c - middle * e1^.l < e2^.c - middle * e2^.l;
  end;

  procedure Sort(L, H: Integer);
  var
    i, j: Integer;
    pivot: PEdge;
  begin
    if L > H then Exit;
    i := L + Random(H - L + 1);
    pivot := e[i]; e[i] := e[L];
    i := L; j := H;
    repeat
      while Less(pivot, e[j]) and (i < j) do Dec(j);
      if i < j then
        begin
          e[i] := e[j]; Inc(i);
        end
      else Break;
      while Less(e[i], pivot) and (i < j) do Inc(i);
      if i < j then
        begin
          e[j] := e[i]; Dec(j);
        end
      else Break;
    until i = j;
    e[i] := pivot;
    Sort(L, i - 1);
    if count < n - 1 then
      ProcessEdge(e[i]);
    if count < n - 1 then
      Sort(i + 1, H);
  end;

begin
  Init;
  count := 0;
  totalL := 0;
  totalC := 0;
  Sort(1, m);
  aver := totalC / totalL;
  Result := aver <= middle;
end;

procedure Solve;
var
  low, middle, high, aver: Extended;
  i: Integer;
begin
  low := 0; high := maxLC;
  repeat
    middle := (low + high) / 2;
    if Kruskal(middle, aver) then
      high := aver // := middle is still ok
    else
      begin
        low := middle;
        if high > aver then high := aver;
      end;
  until low + epsilon >= high;
  for i := 1 to m do se[i].selected := False;
  Kruskal(high, aver);
  for i := 1 to m do
    if se[i].selected then Write(fo, i, ' ');
end;

begin
  AssignFile(fi, InputFile); Reset(fi);
  AssignFile(fo, OutputFile); Rewrite(fo);
  try
    Enter;
    Solve;
  finally
    CloseFile(fi); CloseFile(fo);
  end;
end.
