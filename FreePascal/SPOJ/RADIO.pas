uses    math;
const   finp    =       'RADIO.INP';
        fout    =       'RADIO.OUT';
type    st      =       string;
var     g,f     :       text;
        n       :       longint;
        s       :       st;
        kq      :       longint;
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
begin
        readln(f,n);
        read(f,s);
end;
procedure       xulytrau;
var     i,j     :       longint;
        s1,t    :       st;
begin
        kq:=n;
        for i:=1 to n-1 do
         begin
         s1:='';
         for j:=i to n do
          begin
           if j-i+1>=kq then break;
           s1:=s1+s[j];
           t:=s1;
           while length(t)<n do t:=t+s1;
           if pos(s,t)>0 then
            kq:=min(kq,j-i+1);
           end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xulytrau;
        dong;
end.