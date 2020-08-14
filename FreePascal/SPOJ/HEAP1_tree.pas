const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        nheap,n       :       longint;
        heap,a       :       array[1..20000] of int64;
        res     :  int64;
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
procedure upheap(v:Longint);
var
    child,parent:longint;
begin
    inc(nheap);
    child:=nheap;
    parent:=Child shr 1;
    while (parent>0) and( heap[parent]>v ) do
        begin
            heap[child]:=heap[parent];
            child:=parent;
            parent:=child shr 1;
        end;
    heap[child]:=v;
end;


function Pop:longint;
var
    r,c,v:longint;
begin
    pop:=heap[1];
    v:=heap[nheap];
    dec(nheap);
    r:=1;
    while r shl 1<=nheap do
        begin
            c:=r shl 1;
            if (c<nheap) and( heap[c+1]< heap[c]) then inc(c);
            if heap[c]>=v then break;
            heap[r]:=heap[c];
            r:=c;
        end;
    heap[r]:=v;
end;


procedure solve;
var
    i,j,u,v:longint;
begin
    res:=0;
    nheap:=0;
    for i:=1 to n do upheap(a[i]);
    while nheap>2 do
        begin
            u:=pop;
            v:=pop;
            res:=res+u+v;
            upheap(u+v);
        end;
    res:=res+heap[1]+heap[2];
    writeln(g,res);
end;

procedure enter;
var
    i,j,Ntest,test:longint;
begin
    readln(f,Ntest);
    for test:=1 to ntest do
        begin
            readln(f,n);
            for i:=1 to n do read(f,a[i]);
            readln(f);
            Solve;
        end;
end;
begin
        mo;
        enter;
        dong;
end.