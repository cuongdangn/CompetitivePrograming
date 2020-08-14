const   fi = 'soluong.inp';
        fo = 'soluong.out';
        maxn = 10000;

type    tree = ^node;
        node = record
                 hetxau: boolean;
                 next : array['A'..'Z'] of tree;
                 ten    :       longint;
               end;

var     gen : array[0..maxn] of string;
        st  : ansistring;
        ok  : array[0..maxn] of int64;
        dd  : array[0..maxn] of integer;
        n, m, i, j: longint;
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
var s: string;
    i: longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,gen[i]);
        readln(f,st);
end;

procedure khoitao_tree(var t: tree);
var ch : char;
begin
  t^.hetxau := false;
  for ch := 'A' to 'Z' do t^.next[ch] := nil;
end;

procedure tao_cay;
var t : tree;
    ch: char;
begin
  for i := 1 to n do
  begin
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
    if t^.hetxau = true then dd[i]:=t^.ten else
        begin
                t^.hetxau:=true;
                t^.ten:=i;
        end;
  end;
end;

procedure xuli;
var t : tree;
begin
  m := length(st);
  for i:=1 to n do ok[i] := 0;
  for i := 1 to m do
  begin
    t := trie;
    for j := i downto 1 do
    begin
      if t^.next[st[j]] = nil then break;
      t := t^.next[st[j]];
      if t^.hetxau then
      begin
        ok[t^.ten]:=ok[t^.ten]+1;
      end;
    end;
  end;
end;

procedure ghi;
begin
  for i:=1 to n do writeln(g,ok[i]+ok[dd[i]]);
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
