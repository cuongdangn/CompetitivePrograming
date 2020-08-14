const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        tr:  array[0..500000] of longint;
        t       :array[0..500000] of integer;
        n,m,res     :       longint;
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
procedure       tt(x,l,r        :       longint);
var     mi       :       longint;
begin
        if t[x]=1 then
                begin
                        mi:=(l+r) div 2;
                        t[x*2]:=1;
                        t[x*2+1]:=1;
                        tr[x*2]:=(mi-l)-tr[x*2]+1;
                        tr[x*2+1]:=(r-mi)-tr[x*2+1];
                        t[x]:=0;
                end;
end;

procedure       update(x,l,r,i,j:longint);
var     mi       :longint;
begin
        if (l>j)or(r<i) then exit;
        if (r<=j)and(l>=i) then
                begin
                        tr[x]:=(l-r+1)-tr[x];
                        t[x]:=1;
                        exit;
                end;
        tt(x,l,r);
        mi:=(l+r)div 2;
        update(x*2,l,mi,i,j);
        update(x*2+1,mi+1,r,i,j);
        tr[x]:= tr[x*2]+tr[x*2+1];
end;
procedure        max(x,l,r,i,j:longint);
var      mi       :       longint;
begin
        tt(x,l,r);
        if (l>j)or(r<i) then exit;
        if (i<=l)and(j>=r) then
                begin
                     tt(x,l,r);
                     res:=res+tr[x];
                     exit;
                end;
        tt(x,l,r);
        mi:=(l+r) div 2;
        max(x*2,l,mi,i,j);
        max(x*2+1,mi+1,r,i,j);
end;
procedure       xuly;
var     i,x,y,z,v:longint;
begin
        read(f,n,m);
        for i := 1 to m do
         begin
              read(f,z, x, y);
              if (z = 0) then
                      update(1, 1, n, x, y)
              else
                  begin
                  res:=0;
                   max(1,1,n,x,y);
                  writeln(g,res);
                  end;
         end;
end;
begin
        mo;
        xuly;
        dong;
end.
