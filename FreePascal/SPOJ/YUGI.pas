const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..200,1..200] of longint;
        n,k     :       integer;
        ca,cb,sl      :       longint;
        nhom    :       array[1..200] of integer;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i,j     :       integer;
begin
        readln(f,n,k);
        ca:=maxlongint;
        cb:=-ca;
        fillchar(a,sizeof(a),maxlongint);
        for i:=1 to n do
                begin
                        for j:=1 to n do
                        begin
                        read(f,a[i,j]);
                        if a[i,j]<ca then ca:=a[i,j];
                        if a[i,j]>cb then cb:=a[i,j];
                        end;
                        readln(f);
                end;
end;
procedure       DFS(u,sl,s:longint);
var     i       :       longint;
begin
        for i:=1 to n do
        if (a[u,i]<>maxlongint)and(u<>i)and(nhom[i]=0) then
        if a[u,i]<s then
                begin
                        nhom[i]:=sl;
                        DFS(i,sl,s);
                end;
end;
function       check(s:longint):boolean;
var     i,j:integer;
begin
        sl:=0;
        for i:=1 to n do nhom[i]:=0;
         for i:=1 to n do
          if nhom[i]=0 then
                begin
                        inc(sl);
                        nhom[i]:=sl;
                        DFS(i,sl,s);
                end;
         if sl>=k then exit(true)
         else exit(false);
end;
function       chat(i,j:longint):longint;
var     d,c,mid    :        longint;
        kq      :  longint;
begin
       d:=i;
       c:=j;
       kq:=0;
       while d<=c do
       begin
        mid:=(d+c) div 2;
        if check(mid) then
                      begin
                        kq:=mid;
                        d:=mid+1
                      end
        else c:=mid-1;
        end;
        exit(kq);
end;
begin
        mo;
        doc;
        writeln(g,chat(ca,cb));
        dong;
end.
