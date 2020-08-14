uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,cuoi,dau     :       longint;
        tru   :       array[0..1000001] of longint;
        a,b   :       array[1..1000001] of longint;
        it      :       array[1..4000009] of longint;
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
var     i      :       longint;
begin
        read(f,n,m);
        for i:=1 to m do
         read(f,a[i]);
end;
procedure       buil(k,l,h:longint);
var     mid     :       longint;
begin
        if l=h then
                begin
                        if a[l]=0 then it[k]:=l
                        else it[k]:=m+1;
                        exit;
                end;
        mid:=(l+h) div 2;
        buil(k*2,l,mid);
        buil(k*2+1,mid+1,h);
        it[k]:=min(it[k*2],it[k*2+1]);
end;
function        get(k,l,h,i,j   :       longint):longint;
var     mid     :       longint;
begin
        if (i>h)or(j<l) then exit(m+1);
        if (l>=i)and(h<=j) then
                exit(it[k]);
        mid:=(l+h) div 2;
        exit(min(get(k*2,l,mid,i,j),get(k*2+1,mid+1,h,i,j)));
end;
procedure       up(k,l,h,j:longint);
var     mid     :       longint;
begin
        if (l>j)or(h<j) then exit;
        if (l=h) then
                begin
                        it[k]:=m+1;
                        exit;
                end;
        mid:=(l+h) div 2;
        up(k*2,l,mid,j);
        up(k*2+1,mid+1,h,j);
        it[k]:=min(it[k*2],it[k*2+1]);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        fillchar(it,sizeof(it),0);
        fillchar(tru,sizeof(tru),0);
        fillchar(b,sizeof(b),0);
        buil(1,1,m);
        for i:=1 to m do
         begin
                if a[i]<>0 then
                        begin
                                j:=get(1,1,m,tru[a[i]]+1,i);
                                if j=m+1 then begin writeln(g,'NO');exit end;
                                b[j]:=a[i];
                                up(1,1,m,j);
                                tru[a[i]]:=i;
                        end;
         end;
         writeln(g,'YES');
         for i:=1 to m do
          if a[i]=0 then write(g,b[i],' ');
          writeln(g);
end;
procedure       test;
var     t,i     :       longint;
begin
        read(f,t);
        for i:=1 to t do
         begin
                doc;
                xuly;
         end;
end;
begin
        mo;
        test;
        dong;
end.
