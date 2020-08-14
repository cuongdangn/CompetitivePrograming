const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :longint;
        q       :       longint;
        s       :       ansistring;
        dd      :       array['A'..'z','A'..'z'] of longint;
        ddd     :       array['A'..'z'] of longint;
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
procedure       doc;
var     i,j     :       longint;

        c1,c2       :       char;
begin
        readln(f,n);
        readln(f,s);

        for i:=2 to n do
          inc(dd[s[i-1]][s[i]]);

end;
procedure       xuly;
var     q,i,j,k     :       longint;
        kq      : int64;
        c       : char;
        s1,s2     :       string;
begin
        readln(f,q);
        for i:=1 to q do
         begin
          readln(f,s1);
          for c:='A' to 'z' do ddd[c]:=0;
          for j:=1 to length(s1) do ddd[s1[j]]:=1;
          s2:='';
          for c:='A' to 'Z' do
           if ddd[c]=0 then s2:=s2+c;
          for c:='a' to 'z' do
           if ddd[c]=0 then s2:=s2+c;

          kq:=0;
          if ddd[s[1]]=1 then kq:=1;
          for j:=1 to length(s2) do
           for k:=1 to length(s1) do
            kq:=kq+dd[s2[j]][s1[k]];
           writeln(g,kq);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



