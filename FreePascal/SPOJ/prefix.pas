const   fi = '';
        fo = '';
        maxn = 4000;
        maxm = 300000;
        du   = 1337377;
type    tree = ^node;
        node = record
                 hetxau: boolean;
                 next : array['a'..'z'] of tree;
               end;

var     gen : array[0..maxn] of string;
        st  : ansistring;
        ok  : array[0..maxm] of longint;
        n, m, i, j, res: longint;
        trie: tree;
        f, g: text;

procedure openfile;
begin
  assign(f, fi); reset(f);
  assign(g, fo); rewrite(g);
end;

procedure closefile;
begin
  close(f); close(g);
end;

procedure doc;
var     i: longint;
begin
        readln(f,st);
        readln(f,n);
        for i:=1 to n do readln(f,gen[i]);
end;
procedure khoitao_tree(var t: tree);
var ch : char;
begin
  t^.hetxau := false;
  for ch := 'a' to 'z' do t^.next[ch] := nil;
end;

procedure tao_cay;
var t : tree;
    ch: char;
begin
  for i := 1 to n do begin
    t := trie;
    for j := length(gen[i]) downto 1 do
    begin
      ch := gen[i][j];
      if t^.next[ch] = nil then
      begin
        new(t^.next[ch]);
        khoitao_tree(t^.next[ch]);
      end;
      t := t^.next[ch];
    end;
    t^.hetxau := true;
  end;
end;

procedure xuli;
var t : tree;
begin
  m := length(st);
  ok[0] := 1;
  for i := 1 to m do
  begin
    t := trie;
    for j := i downto 1 do
    begin
      if t^.next[st[j]] = nil then break;
      t := t^.next[st[j]];
      if (t^.hetxau) and (ok[j - 1]>0) then
      begin
        ok[i] := (ok[i]+ok[j-1])mod du;
      end;
    end;
  end;
end;

procedure ghi;
begin
  writeln(g, ok[m] mod du);
end;

begin
  openfile;
  doc;
  new(trie);
  khoitao_tree(trie);
  tao_cay;
  xuli;
  ghi;
  closefile;
end.
