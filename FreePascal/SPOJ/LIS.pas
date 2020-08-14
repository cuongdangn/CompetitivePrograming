{$MODE DELPHI}
const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a,l,st,t  :       array[0..100000] of longint;
        m,n     :       longint;
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
var     i:longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,a[i]);
end;
procedure       khoitao;
begin
        a[0]:=maxint;
        a[n+1]:=-a[n+1];
        m:=1;
        l[n+1]:=1;
        st[1]:=n+1;
end;
function        find(i:longint):longint;
var     inf,sup,median,j        :       longint;
begin
        inf:=1;sup:=n+1;
        repeat
                median:=(inf+sup) div 2;
                j:=st[median];
                if a[j]<a[i] then inf:=median
                else sup:=median;
        until inf+1=sup;
        find:=st[inf];
end;

procedure       QHD;
var     i,j,k   :       longint;
begin
        for i:=n downto 0 do
         begin
                j:=find(i);
                k:=l[j]+1;
                if k>m then
                        begin
                                m:=k;
                                st[k]:=i;
                        end
                else
                        if a[st[k]]<a[i] then
                         st[k]:=i;
                l[i]:=k;
               t[i]:=j;
         end;
end;
procedure       xuat;
var     i       :longint;
begin
        writeln(g,m-2);
        i:=t[0];
        while i<> n+1 do
         begin
                write(g,a[i],' ');
                i:=t[i];
         end;

end;
begin
        mo;
        doc;
        khoitao;
        QHD;
        xuat;
        dong;
end.
