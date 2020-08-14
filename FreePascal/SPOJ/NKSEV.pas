const   finp    =       'DNC.INP';
        fout    =       '';
        du      =       1337377;
type    tree    =       ^node;
        node    =       record
        hx       :       boolean;
        next      :       array['a'..'z'] of tree;
        end;
        st      =       string;
var     g,f     :       text;
        s       :       st;
        ok      :       array[0..300000] of longint;
        n,m       :       longint;
        xau     :       array[1..4000] of string;
        trie    :       tree;
procedure       mo;
begin
        assign(g,fout);
        rewrite(g);
        assign(f,finp);
        reset(f);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,s);
        i:=length(s);
        while s[i]=' ' do
              begin
                delete(s,i,1);
                dec(i);
              end;
        while s[1]=' ' do
                        delete(s,1,1);

        readln(f,n);
        for i:=1 to n do
                readln(f,xau[i]);
end;
procedure       kt(var t:tree);
var        ch   :       char;
begin
        t^.hx:=false;
        for ch:='a' to 'z' do t^.next[ch]:=nil;
end;
procedure       taocay;
var     ch      :       char;
        t       :       tree;
        i,j       :       longint;
begin
        for i:=1 to n do
                begin
                 t:=trie;
                 for j:=length(xau[i]) to 1 do
                  begin
                        ch:=xau[i][j];
                        if t^.next[ch]=nil then
                         begin
                           new(t^.next[ch]);
                           kt(t^.next[ch]);
                         end;
                         t:=t^.next[ch];
                  end;
                  t^.hx:=true;
                 end;
end;
procedure xuly;
var t   :       tree;
    i,j :       longint;
begin
  taocay;
  m := length(s);
  ok[0] := 1;
  for i := 1 to m do
  begin
    t := trie;
    for j := i downto 1 do
    begin
      if t^.next[s[j]] = nil then break;
      t := t^.next[s[j]];
      if ((t^.hx) and (ok[j - 1]>0)) then
        ok[i] := ok[i]+ok[j-1];
    end;
  end;
end;
begin
        mo;
        doc;
        new(trie);
        kt(trie);
        xuly;
      writeln(g,ok[m]);
        dong;
end.
