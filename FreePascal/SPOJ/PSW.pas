uses    math;
const   finp    =       'PSW.INP';
        fout    =       'PSW.out';
var     g,f     :       text;
        s       :      ansistring;
        a,b,x,y,m      :        longint;
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
begin
        readln(f,a,b,x,y,m);
end;
function       nen(s:ansistring):ansistring;
var     c,x:ansistring;
        i: longint;
        dem:longint;
begin
        i:=2;
        c:=s[1];
        dem:=1;
        while i<=length(s) do
                begin
                        if s[i]=s[i-1] then
                        inc(dem)
                        else
                                begin
                                        if dem>1 then
                                        begin
                                                str(dem,x);
                                                c:=c+x;
                                        end;
                                                dem:=1;
                                                c:=c+s[i];
                                end;
                        inc(i);
                end;

        exit(c);
end;
procedure       xuat;
var     c:ansistring;
        i:longint;
begin
        s:=s+'a';
        c:=nen(s);
        for i:=1 to length(c)-1 do write(g,c[i]);
        dong;
        halt;
end;
procedure       xuly1;
var     tg:longint;
begin
        s:='';
        while (a<>0)and(b<>0) do
                begin
                        if (a=x)and(b=y) then xuat;
                        if a<b then
                                begin
                                s:=s+'W';
                                tg:=a;
                                a:=b;
                                b:=tg;
                                end
                        else
                                begin
                                        s:=s+'S';
                                        a:=a-b;
                                end;
                end;
end;
procedure       xuly2;
var     tg:longint;
begin
      while (x<>0)and(y<>0) do
                begin
                        if (a=x)and(b=y) then xuat;
                        if x<y then
                                begin
                                s:=s+'W';
                                tg:=x;
                                x:=y;
                                y:=tg;
                                end
                        else
                                begin
                                        s:=s+'P';
                                        x:=x-y;
                                end;
                end;
end;
begin
        mo;
        doc;
        if max(a,b)>max(x,y) then xuly1 else
        xuly2;
        xuat;
        dong;
end.
