const   finp    =       'DNC.INP';
        fout    =       '';
        maxc    =       trunc(1e18);
var     g,f     :       text;
        n,m     :       longint;
        d       :       array[0..201] of int64;
        dd      :       array[0..201] of byte;
        a       :       array[1..201,1..201] of longint;
        t       :       longint;
        c       :       int64;
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
var  i1,i,j,w     :       longint;
begin
        readln(f,n,m,c);
        fillchar(a,sizeof(a),0);
        for i1:=1 to m do
                begin
                        readln(f,i,j,w);
                        a[i,j]:=w;
                        a[j,i]:=w;
                end;
end;
procedure       kt;
var     i       :longint;
begin
        for i:=0 to n do
        begin
        d[i]:=maxc;
        dd[i]:=0;
        end;
        d[n]:=0;
end;
procedure       dj;
var     u,i       :       longint;
        t       : int64;
begin
        kt;
        repeat
                u:=0;
                for i:=1 to n do
                 if (d[i]<d[u])and(dd[i]=0) then u:=i;
                if (u=0) or (u=1) then break;
                dd[u]:=1;
                for i:=1 to n do
                        if (dd[i]=0)and(a[i,u]>0)and(a[i,u]<c)then

                                begin
                                        if a[i,u]+d[u]<c then
                                                begin
                                                        if d[i]>a[i,u]+d[u] then d[i]:=a[i,u]+d[u];
                                                end
                                        else
                                                begin
                                                  if c>2*a[i,u]then
                                                  begin
                                                  t:=((d[u]+a[i,u]-c)div(c-2*a[i,u]));
                                                  if d[u]-t*(c-2*a[i,u])+a[i,u]>c then t:=t+1;
                                                  if d[i]>(2*t+1)*a[i,u]+d[u] then d[i]:=(2*t+1)*a[i,u]+d[u]
                                                  end;
                                                end;

                                end;
        until   false;
        writeln(g,d[1]);
end;
procedure       xuly;
var     i       :       longint;
begin
        readln(f,t);
        for i:=1 to  t do
                begin
                        doc;
                        dj;
                end;
end;
begin
        mo;
        xuly;
        dong;
end.


