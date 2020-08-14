{$MODE OBJFPC}
{$INLINE ON}
program CardGame;
const
  InputFile  = 'CARDS.INP';
  OutputFile = 'CARDS.OUT';
  max = 100000;
  maxK = 32;
type
  TShuffle = record
    CutPos, Len, InsertPos: Integer;
  end;
var
  n, k, x: Integer;
  s: array[1..max] of TShuffle;
  Pos: array[1..maxK] of Integer;
  InCut: array[1..maxK] of Boolean;

procedure Enter;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, n, k, x);
    for i := 1 to x do
      with s[i] do
        ReadLn(f, CutPos, Len, InsertPos);
  finally
    CloseFile(f);
  end;
end;

procedure Init;
var
  i, shift: Integer;
  m, ip, cp: Integer;
begin
  for i := 1 to k do
    Pos[i] := i;
  for i := 1 to x do
    begin
      m := s[i].Len;
      if s[i].CutPos <= s[i].InsertPos then
        begin
          shift := n - m - s[i].InsertPos;
          cp := n - shift - m;
          ip := s[i].CutPos;
        end
      else
        begin
          shift := n - (s[i].CutPos + m - 1);
          ip := (n - m) - shift + 1;
          cp := s[i].InsertPos;
        end;
      s[i].InsertPos := ip;
      s[i].CutPos := cp;
    end;
end;

procedure Undo(const s: TShuffle); inline;
var
  i: Integer;
begin
  //Cut
  for i := 1 to k do
    begin
      InCut[i] := (s.CutPos <= Pos[i]) and
                  (Pos[i] <= s.CutPos + s.Len - 1);
      if InCut[i] then
        Pos[i] := Pos[i] - s.CutPos
      else
        if Pos[i] >= s.CutPos then
          Dec(Pos[i], s.Len);
    end;
  //Paste
  for i := 1 to k do
    if InCut[i] then
      Pos[i] := Pos[i] + s.InsertPos
    else
      if Pos[i] >= s.InsertPos then
        Inc(Pos[i], s.Len);
end;

procedure Solve;
var
  i: Integer;
begin
  for i := x downto 1 do
    Undo(s[i]);
end;

procedure PrintResult;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    for i := 1 to k do Write(f, Pos[i], ' ');
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Init;
  Solve;
  PrintResult;
end.
9 2 3
1 5 2
5 4 6
8 2 1
9 2 3
1 5 2
5 4 6
8 2 1
123456789
