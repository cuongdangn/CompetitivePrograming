{$MODE OBJFPC}
program NumberGrowing;
const
  InputFile  = 'NUMBER.INP';
  OutputFile = 'NUMBER.OUT';
  maxN = 100;
type
  TArray3D = array[1..maxN, 1..maxN, 0..9] of ShortInt;
var
  m, x, n: Integer;
  y: array[1..maxN] of Integer;
  pos, pair: TArray3D;

procedure Enter;
var
  f: TextFile;
  i: Integer;
  s: string[maxN];
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, m, x);
    ReadLn(f, s);
    n := Length(s);
    for i := 1 to n do
      y[i] := Ord(s[i]) - Ord('0');
  finally
    CloseFile(f);
  end;
end;

procedure Init;
begin
  FillWord(pos, SizeOf(pos), Word(-1));
end;

procedure GetTrace(L, H, x: Integer);
var
  t, v, a, b: Integer;
begin
  if pos[L, H, x] <> -1 then Exit;
  if L = H then
    begin
      if y[L] = x then
        pos[L, H, x] := L
      else
        pos[L, H, x] := 0;
      Exit;
    end;
  v := x mod m;
  while v < 100 do
    begin
      a := v div 10; b := v mod 10;
      for t := L to H - 1 do
        begin
          GetTrace(L, t, a);
          if pos[L, t, a] <> 0 then
            begin
              GetTrace(t + 1, H, b);
              if pos[t + 1, H, b] <> 0 then
                begin
                  pos[L, H, x] := t;
                  pair[L, H, x] := v;
                  Exit;
                end;
            end;
        end;
      v := v + m;
    end;
  pos[L, H, x] := 0;
end;

procedure PrintResult;
var
  fo: TextFile;

  procedure TraceBack(L, H, x: Integer);
  var
    t, a, b: Integer;
  begin
    if L = H then Exit;
    t := pos[L, H, x];
    a := pair[L, H, x] div 10;
    b := pair[L, H, x] mod 10;
    WriteLn(fo, L, ' ', a, b);
    TraceBack(L, t, a);
    TraceBack(t + 1, H, b);
  end;

begin
  AssignFile(fo, OutputFile); Rewrite(fo);
  try
    TraceBack(1, n, x);
  finally
    CloseFile(fo);
  end;
end;

begin
  Enter;
  Init;
  GetTrace(1, n, x);
  PrintResult;
end.
12 5
0124967
