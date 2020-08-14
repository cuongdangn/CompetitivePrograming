{$mode ObjFpc}
Uses Math;
Const
                finp            =               '';
                fout            =               '';
                maxn            =               10000;
Type
                Node            =               ^Re;
                Re              =               Record
                        v,w,cs  :               integer;
                        next    :               Node;
                end;
var
                fi,fo           :               text;
                N,K,Vp,Vc       :               integer;
                Ke              :               Array[1..maxn] of Node;
                F,Cs,A          :               Array[1..maxn] of integer;
                Free            :               Array[1..maxn] of boolean;
                Ts              :               Array[1..maxn] of int64;
procedure Openfile;
begin
        Assign(fi,finp);reset(fi);
        Assign(fo,fout);rewrite(fo);
end;
procedure Closefile;
begin
        Close(fi);Close(fo);
end;
procedure Add(u,v,w,cs:integer);
var
        P               :               Node;
begin
        New(P);
        P^.v:=v;P^.w:=w;P^.cs:=cs;P^.next:=Ke[u];Ke[u]:=P;
end;
procedure Enter;
var
        i,u,v,w         :               integer;
begin
        readln(fi,N,K,Vp,Vc);
        For i:=1 to N-1 do
        begin
                readln(fi,u,v,w);
                Add(u,v,w,i);Add(v,u,w,i);
                Cs[i]:=i;
        end;
end;
procedure Dfs(u:integer);
var
        P               :               Node;
        v               :               integer;
begin
        Free[u]:=False;
        P:=Ke[u];F[u]:=1;
        While P<>Nil do
        begin
                v:=P^.v;
                if Free[v] then
                begin
                        Dfs(v);
                        F[u]:=F[u]+F[v];
                        Ts[P^.cs]:=int64(F[v])*(int64(N)-F[v])*P^.w;
                end;
                P:=P^.next;
        end;
end;
procedure Swap(var A,B:integer);
var
        t               :               integer;
begin
        t:=A;A:=B;B:=t;
end;
procedure Qsort1(l,r:integer);
var
        i,j             :               integer;
        x               :               int64;
begin
        if l>=r then exit;
        i:=l;j:=r;x:=Ts[Cs[(l+r) div 2]];
        Repeat
                While Ts[Cs[i]]<x do inc(i);
                While Ts[Cs[j]]>x do dec(j);
                if i<=j then
                begin
                        if i<j then
                                Swap(Cs[i],Cs[j]);
                        inc(i);dec(j);
                end;
        Until i>j;
        Qsort1(L,j);Qsort1(i,R);
end;
procedure Qsort2(l,r:integer);
var
        i,j             :               integer;
        x               :               int64;
begin
        if l>=r then exit;
         i:=l;j:=r;x:=Ts[Cs[(l+r) div 2]];
        Repeat
                While Ts[Cs[i]]>x do inc(i);
                While Ts[Cs[j]]<x do dec(j);
                if i<=j then
                begin
                        if i<j then
                                Swap(Cs[i],Cs[j]);
                        inc(i);dec(j);
                end;
        Until i>j;
        Qsort1(L,j);Qsort1(i,R);
end;
procedure Process;
var
        i               :               integer;
begin
        Fillchar(Free,sizeof(Free),true);
        Dfs(1);
        if Vp>Vc then
                Qsort1(1,N-1)
        else
                Qsort2(1,N-1);
        Fillchar(A,sizeof(A),0);
        For i:=1 to K do
                A[Cs[i]]:=1;
        For i:=1 to N-1 do
        if A[i]=1 then
                writeln(fo,i);
end;
begin
        Openfile;
        Enter;
        Process;
        Closefile;
end.
