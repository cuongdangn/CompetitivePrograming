uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a,tong       :       array[0..2000] of longint;
        d,cat       :       array[0..2001,0..2001] of longint;

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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
        readln(f,a[i]);
end;
procedure       xuly;
var     i,l,k,j     :       longint;
begin
        for i:=1 to n do for j:=1 to n do d[i,j]:=-1;
        for i:=1 to n do tong[i]:=tong[i-1]+a[i];
        for i:=1 to n do
        begin
        d[i,i]:=0;
        cat[i,i+1]:=i;
        d[i,i+1]:=min(a[i],a[i+1]);
        end;
        for l:=2 to n-1 do
         for i:=1 to n-l do
                begin
                j:=i+l;
                for k:=cat[i+1,j] downto cat[i,j-1] do
                if d[i,k]+tong[k]-tong[i-1]>d[k+1,j]+tong[j]-tong[k] then
                begin
                 if d[i,j]< d[k+1,j]+tong[j]-tong[k] then
                 begin
                        d[i,j]:= d[k+1,j]+tong[j]-tong[k];
                        cat[i,j]:=k;
                 end;
                end
                 else
                 if  d[i,k]+tong[k]-tong[i-1]<d[k+1,j]+tong[j]-tong[k] then
                    begin
                    if d[i,j]< d[i,k]+tong[k]-tong[i-1] then
                        begin
                                d[i,j]:= d[i,k]+tong[k]-tong[i-1];
                                cat[i,j]:=k;
                        end
                    end
                 else
                        begin
                                if d[i,k]<d[k+1,j] then
                                        begin
                                              d[i,j]:= d[i,k]+tong[k]-tong[i-1];
                                              cat[i,j]:=k;
                                        end
                                else
                                        begin
                                                d[i,j]:= d[k+1,j]+tong[j]-tong[k];
                                                cat[i,j]:=k;
                                        end
                        end;
                end;
         writeln(g,d[1,n]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
