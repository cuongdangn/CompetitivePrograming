uses    math;
const   finp    =       'CODE.INP';
        fout    =       'CODE.OUT';
type    bg=     record
        x       :       longint;
        kt       :       string;
        end;
var     g,f     :       text;
        s,s1       :       string;
        n,dem       :       longint;
        D,tr,tr1       :       array[0..251] of integer;
        kq      :      array[1..251] of bg;
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
var    i,a,b1        :       longint;
       b        : ansistring;
begin
        readln(f,n);
        s:='';
        for i:=1 to n do
                begin
                        read(f,a,b);
                        while b[1]=' ' do delete(b,1,1);
                        if a=0 then s:=s+b
                        else
                           begin
                                val(b,b1);
                                s:=s+copy(s,length(s)-a+1,b1);
                           end;
                end;
        writeln(g,s);
end;
procedure       xuly;
var     i,j,t       :       longint;
begin
        n:=length(s);
        d[1]:=1;
        for i:=2 to n do
                begin
                        d[i]:=d[i-1]+1;
                        tr[i]:=i-1;
                        s1:='';
                        for j:=i  downto 1 do
                                begin
                                     s1:=s[j]+s1;
                                     t:=pos(s1,s);
                                     if t<=i-2*length(s1)+1 then
                                     if d[i]>d[j-1]+1 then
                                        begin
                                                d[i]:=d[j-1]+1;
                                                tr[i]:=j-1;
                                                tr1[i]:=t;
                                        end;
                                end;
                end;
        writeln(g,d[n]);
        while n>0 do
                begin
                        inc(dem);
                        if tr1[n]=0 then
                                begin
                                       kq[dem].kt:=s[n];
                                       kq[dem].x:=0;
                                       n:=tr[n];
                                end
                        else
                                begin
                                        str(n-tr[n],kq[dem].kt);
                                        kq[dem].x:=tr[n]-tr1[n]+1;
                                        n:=tr[n];
                                end;
                end;

        for i:=dem downto 1 do writeln(g,kq[i].x,' ',kq[i].kt);


end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
