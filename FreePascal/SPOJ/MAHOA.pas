const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        kq,s1,s       :       string;
        k:longint;
        dd      :array[0..105] of byte;
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
procedure       QS(l,h:longint);
var     i,j     :       longint;
        tg,x    :       char;
begin
        i:=l;
        j:=h;
        x:=s[(l+h)div 2];
        repeat
                while s[i]<x do inc(i);
                while s[j]>x do dec(j);
                if i<=j then
                  begin
                       tg:=s[i];
                       s[i]:=s[j];
                       s[j]:=tg;
                       inc(i);
                       dec(j);
                  end;
        until     i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,n       :longint;
        c       : char;
begin
        n:=length(s);
        fillchar(dd,sizeof(dd),0);
        kq:='';
        kq:=s[k];
        c:=s[k];
        dd[k]:=1;
        while length(kq)<n do
        begin
             for i:=1 to n do
             if (s1[i]=c)and(dd[i]=0) then
                begin
                        kq:=kq+s[i];
                        c:=s[i];
                        dd[i]:=1;
                end;
        end;
        writeln(g,kq);
end;
procedure       doc;
begin
        while not seekeof(f) do
                begin
                        readln(f,s);
                        readln(f,k);
                        s1:=s;
                        QS(1,length(s));
                        xuly;
                end;
        dong;
end;
begin
        mo;
        doc;
end.

