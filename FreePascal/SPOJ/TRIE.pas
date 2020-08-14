const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        a,b,c   :       longint;
        chso    :       array['a'..'z'] of node;
        end;
var     g,f     :       text;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       nap(var p:node);
begin
        new(p);
        p^.a:=0;
        p^.b:=1;
        p^.c:=2;
        for c:='a' to 'z' do p^.chso[c]:=nil
end;
procedure       doc;
var     i,j     :       longint'
begin
        readln(f,n);// doc xau co n ky tu
        nap(goc);
        p:=goc;
        for i:=1 to n do
         begin
          read(f,c);
          if p^.cs[c]=nil then nap(p^.cs[c]);
          p:=p^.cs[c];
         end;
