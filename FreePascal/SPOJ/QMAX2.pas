uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       50000;
var     g,f     :       text;
        d,t       :       array[1..maxn*4] of longint;
        res,n,m       :       longint;
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

procedure       capnhat(x:longint);
begin
        t[x*2]:=t[x*2]+d[x];
        t[x*2+1]:=t[x*2+1]+d[x];
        d[x*2]:=d[x*2]+d[x];
        d[x*2+1]:=d[x*2+1]+d[x];
        d[x]:=0;
end;
procedure       update(x,i,j,l,r,k:longint);
var     m       :longint;
begin
        if (j<l) or (i>r) then exit;
        if (l>=i)and(r<=j) then
         begin
             d[x]:=d[x]+k;
             t[x]:=t[x]+k;
             exit;
         end;
         m:=(l+r) div 2;
         capnhat(x);
         update(x*2,i,j,l,m,k);
         update(x*2+1,i,j,m+1,r,k);
         t[x]:=max(t[x*2],t[x*2+1]);
end;

procedure       get(x,i,j,l,r:longint);
var     m       :       longint;
begin
        if (j<l)or(i>r) then exit;
        if (l>=i)and(r<=j) then
         begin
                res:=max(res,t[x]);
                exit;
         end;
         m:=(l+r) div 2;
         capnhat(x);
         get(x*2,i,j,l,m);
         get(x*2+1,i,j,m+1,r);
         t[x]:=max(t[x*2],t[x*2+1]);
end;

procedure       xuly;
var     i,u,v,z,x       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                 read(f,z);
                 if z=0 then
                  begin
                        readln(f,u,v,x);
                        update(1,u,v,1,n,x);
                  end
                  else
                   begin
                        readln(f,u,v);
                        res:=0;
                        get(1,u,v,1,n);
                        writeln(g,res);
                   end;
         end;
end;
begin
        mo;
        xuly;
        dong;
end.