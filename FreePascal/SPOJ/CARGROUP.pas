{$R-}
const   finp    =       'CARGROUP.INP';
        fout    =       'CARGROUP.OUT';
var     g,f     :       text;
        w,v,ww     :       array[0..1001] of longint;
        time    :       array[0..1001] of double;
        res,tr     :       array[0..1001] of longint;
        n,p,l       :       longint;

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
var     i       :       longint;
begin
        readln(f,n,p,l);
        for i:=1 to n do
               begin
                readln(f,w[i],v[i]);
                ww[i]:=w[i]+ww[i-1];
               end;
end;
procedure       xuly;
var     i,j,vmin       :       longint;
begin
        time[1]:=l/v[1];
        for i:=2 to n do
                begin
                        time[i]:=time[i-1]+l/v[i];
                        tr[i]:=i;
                        vmin:=v[i];
                        for j:=i-1 downto 1 do
                        if  ((ww[i]-ww[j-1])<=p) then
                         begin
                                if vmin>v[j] then vmin:=v[j];
                                if time[j-1]+l/vmin < time[i] then
                                        begin
                                                time[i]:=time[j-1]+l/vmin;
                                                tr[i]:=j;
                                        end
                         end
                        else break;
                end;
        writeln(g,time[n]:0:2);
        i:=0;
        while n>0 do
                begin
                        inc(i);
                        res[i]:=n;
                        n:=tr[n]-1;
                end;
        for j:=i downto 1 do write(g,res[j],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.