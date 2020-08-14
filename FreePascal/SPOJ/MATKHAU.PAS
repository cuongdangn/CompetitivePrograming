uses    math;
const   finp    =       'MATKHAU.INP';
        fout    =       'MATKHAU.OUT';
var     g,f     :       text;
        n       :       longint;
        s       :       char;
        a,b,c   :       array[0..1000000] of longint;
        kq      :       int64;
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
procedure       xuly(s:char;i:longint);
var     ma      :       longint;
begin

                       if (ord(s)>=48)and(ord(s)<=57) then
                        begin
                                a[i]:=i;
                                b[i]:=b[i-1];
                                c[i]:=c[i-1];
                        end
                        else
                        if (ord(s)>=97)and(ord(s)<=122) then
                        begin
                                a[i]:=a[i-1];
                                b[i]:=i;
                                c[i]:=c[i-1];
                        end
                        else
                        begin
                                a[i]:=a[i-1];
                                b[i]:=b[i-1];
                                c[i]:=i;
                        end ;
                        if (a[i]<>0)and(b[i]<>0)and(c[i]<>0) then
                                begin
                                        ma:=min(min(a[i],b[i]),c[i]);
                                        if ((i-ma+1)<=6) then
                                                begin
                                                       if i-5>0 then kq:=kq+i-5;
                                                end
                                                else
                                        kq:=kq+ma;
                                end;
end;
procedure       doc;
var     i,t     :       longint;
begin
        i:=0;
          while not seekeof(f) do
                begin
                        read(f,s);
                        inc(i);
                        xuly(s,i);
                end;
          writeln(g,kq);

end;
begin
        mo;
        doc;
        dong;
end.
