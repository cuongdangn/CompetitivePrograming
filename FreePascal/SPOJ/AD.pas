{$MODE OBJFPC}
program AD;
const
  InputFile  = 'AD.INP';
  OutputFile = 'AD.OUT';
var
  s, t: AnsiString;
  f: TextFile;
  i, res: LongInt;
  c: Char;
  Count: array['a'..'z'] of LongInt;
begin
  AssignFile(f, InputFile); Reset(f);

    FillChar(Count, SizeOf(Count), 0);
    ReadLn(f, s);
    for i := 1 to Length(s) do
      Inc(Count[s[i]]);
    ReadLn(f, s);
    for i := 1 to Length(s) do
      Dec(Count[s[i]]);
    res := 0;
    for c := 'a' to 'z' do
      Inc(res, Abs(Count[c]));

    CloseFile(f);

  AssignFile(f, OutputFile); Rewrite(f);

    WriteLn(f, res);

    CloseFile(f);

end.
