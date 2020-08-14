const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m       :       longint;
        a,st,l       :       array[0..100001] of longint;

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
procedure       kt;
begin
        a[0]:=maxlongint;
        a[n+1]:=-a[0];
        m:=1;
        l[n+1]:=1;
        st[1]:=n+1;
end;
function        find(i:longint):longint;
var     da,cu,mid,j :       longint;
begin
        da:=1;
        cu:=m+1;
        repeat
                begin
                        mid:=(da+cu) div 2;
                        j:=st[mid];
                        if a[j]<a[i] then da:=mid
                        else cu:=mid;
                end;
        until   da+1=cu;
        find:=st[da];
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
                        if a[st[k]]>a[i] then st[k]:=i;
                l[i]:=k;
         end;
end;
procedure       xuat;
begin
        writeln(g,m-2);
end;
begin
        mo;
        doc;
        kt;
        QHD;
        xuat;
        dong;
end.