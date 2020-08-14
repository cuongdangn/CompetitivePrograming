const
   tfi='school.inp';
   tfo='school.out';
   maxn=5001;

type
   PtrNode=^Node;
   Node = record id: integer; Ts: integer; next: PtrNode; end;
   arr1=array[1..maxn] of PtrNode;
   arr2=array[1..maxn] of integer;
   arr3=array[1..maxn] of longint;
   arr4=array[1..maxn] of byte;
   arr5=array[1..maxn] of int64;

var
   fi, fo: text;
   N,M: integer;
   a: arr1;
   q: arr2;
   qn: integer;
   kc: arr3;
   color: arr4;
   sl: arr5;
   cs: arr2;

procedure initq;
begin
   qn:=0;
end;

procedure put(u: integer);
begin
   inc(qn);
   q[qn]:=u;
end;

function get: integer;
var u,i: integer;
begin
   u:=1;
   for i:=2 to qn do
      if kc[q[i]]<kc[q[u]] then u:=i;
   get:=q[u];
   q[u]:=q[qn];
   dec(qn);
end;

function qempty: boolean;
begin
   qempty:=(qn=0);
end;

procedure ThemCanh(u,v,L: integer);
var t: PtrNode;
begin
   new(t);
   t^.id:=v; t^.Ts:=L;
   t^.next:=a[u];
   a[u]:=t;

end;

procedure dijstra;
var u,v: integer;
    t: PtrNode;
begin
   initq;
   fillchar(color,sizeof(color),0);
   put(1); color[1]:=1; kc[1]:=0;
   repeat
      u:=get; color[u]:=2;
      t:=a[u];
      while t<>nil do
         begin
            v:=t^.id;
            if (color[v]=1) and (kc[v]>kc[u]+t^.Ts) then
               kc[v]:=kc[u]+t^.Ts;
            if color[v]=0 then
               begin
                  put(v);
                  kc[v]:=kc[u]+t^.Ts;
                  color[v]:=1;
               end;
            t:=t^.next;
         end;
   until qempty;
end;

procedure sort(k,l: integer);
var r: longint;
    i,j, tg: integer;
begin
   r:=kc[cs[(k+l) div 2]];
   i:=k; j:=l;
   repeat
      while kc[cs[i]]<r do inc(i);
      while kc[cs[j]]>r do dec(j);
      if i<=j then
         begin
            tg:=cs[i]; cs[i]:=cs[j]; cs[j]:=tg;
            inc(i);
            dec(j);
         end;
   until i>j;
   if k<j then sort(k,j);
   if i<l then sort(i,l);
end;

procedure Tim;
var i,u,v: integer;
    t: PtrNode;
begin
   dijstra;
   fillchar(sl,sizeof(sl),0);
   sl[1]:=1;
   for i:=1 to n do cs[i]:=i;
   sort(1,N);
   i:=1;
   while (i<=n) and (cs[i]<>n) do
      begin
         u:=cs[i];
         if sl[u]>0 then
            begin
               t:=a[u];
               while t<>nil do
                  begin
                     v:=t^.id;
                     if kc[v]=kc[u]+t^.Ts then
                        sl[v]:=sl[v]+sl[u];
                     t:=t^.next;
                  end;
            end;
         inc(i);
      end;
end;

procedure doc;
var i,k,u,v,L: integer;
begin
   read(fi,n,m);
   for i:=1 to n do a[i]:=nil;
   for i:=1 to m do
      begin
         read(fi,k,u,v,L);
         ThemCanh(u,v,L);
         if k=2 then ThemCanh(v,u,L);
      end;
end;

procedure main;
begin
   assign(fi,tfi); reset(fi);
   assign(fo,tfo); rewrite(fo);
   doc;
   tim;
   writeln(fo,kc[n],#32,sl[n]);
   close(fi); close(fo);
end;

BEGIN
   main;
END.
