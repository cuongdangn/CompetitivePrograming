const   finp    =       '';
        fout    =       '';
type    canh    =       record
        x,y     :       longint;
        end;
var     g,f     : text;
        e       : array[1..100001] of canh;
        a,dd,cha,res       : array[1..100005] of longint;
        n,m,q,sl     : longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i       :longint;
begin
        readln(f,n,m,q);
        for i:=1 to m do
         readln(f,e[i].x,e[i].y);
        for i:=1 to q do
        begin
                readln(f,a[i]);
                dd[a[i]]:=i;
        end;
end;
function        find(u:longint):longint;
begin
        if cha[u]=-1 then exit(u);
        cha[u]:=find(cha[u]);
        exit(cha[u]);
end;
procedure       xuly;
var     i,cha1,cha2       :longint;
begin
        for i:=1 to n do cha[i]:=-1;
        for i:=1 to m do
         if dd[i]=0 then
          begin
                cha1:=find(e[i].x);
                cha2:=find(e[i].y);
                if cha1<>cha2 then
                  cha[cha1]:=cha2;
          end;
         for i:=1 to n do if cha[i]=-1 then inc(sl);
         res[q]:=sl;
         for i:=q downto 2 do
          begin
                cha1:=find(e[a[i]].x);
                cha2:=find(e[a[i]].y);
                if cha1<>cha2 then
                 begin
                  dec(sl);
                  cha[cha1]:=cha2;
                 end;
                 res[i-1]:=sl;
          end;
         for i:=1 to q do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
