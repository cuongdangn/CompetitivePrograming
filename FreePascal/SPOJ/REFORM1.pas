uses    math;

const   fi='REFORM.INP';
        fo='REFORM.OUT';
        maxN=100014;
        maxM=200014;

type    TAdj=record
                v,link:longint;
                end;

var     inp,oup:text;
        n,m,tplt,count,dem1,dem2:longint;
        res,k:int64;
        head,number,low,con,cha:array[0..maxN] of longint;
        adj:array[0..2*maxM] of TAdj;
        dd:array[0..2*maxM] of longint;
        Free:array[0..maxN] of boolean;

procedure openf;
begin
        assign(inp,fi);reset(inp);
        assign(oup,fo);rewrite(oup);
end;

procedure closef;
begin
        close(inp);
        close(oup);
end;

procedure input;
var     i,u,v:longint;
begin
        readln(inp,n,m);
        for i:=1 to m do
            begin
                readln(inp,u,v);
                adj[i].v:=v;adj[i].link:=head[u];
                head[u]:=i;
                adj[i+m].v:=u;adj[i+m].link:=head[v];
                head[v]:=i+m;
            end;
end;

/////////////////////////////////////////////////////////////////////////////

procedure DFS(u:longint);
var     i,v:longint;
begin
        if tplt=1 then inc(dem1);
        if tplt=2 then inc(dem2);
        Free[u]:=false;
        i:=head[u];
        while i<>0 do
            begin
                v:=adj[i].v;
                i:=adj[i].link;
                if not Free[v] then continue;
                DFS(v);
            end;
end;

procedure TimTPlT;
var     i:longint;
begin
        tplt:=0;
        fillchar(Free,sizeof(Free),true);
        for i:=1 to n do
            if Free[i] then
               begin
                   inc(tplt);
                   DFS(i);
               end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure DFSVisit(u:longint);
var     i,v:longint;
begin
        low[u]:=maxN;
        inc(count);
        number[u]:=count;
        i:=head[u];
        con[u]:=1;
        while i<>0 do
            begin
                if ((i<=m)and(dd[i+m]=1))or((i>m)and(dd[i-m]=1)) then
                   begin
                       i:=adj[i].link;
                       continue;
                   end;
                v:=adj[i].v;
                dd[i]:=1;
                i:=adj[i].link;
                if number[v]=0 then
                   begin
                       cha[v]:=u;
                       DFSVisit(v);
                       con[u]:=con[u]+con[v];
                       low[u]:=min(low[u],low[v]);
                   end
                else low[u]:=min(low[u],number[v]);
            end;
end;

procedure solve;
var     cau,u,v:longint;
        dem:int64;
begin
        if tplt>2 then
           begin
               write(oup,0);
               exit;
           end;
        count:=0;res:=0;k:=(int64(n)*int64(n-1)) div 2;cau:=0;dem:=0;
        for u:=1 to n do
            if number[u]=0 then
               begin
                   cha[u]:=-1;
                   DFSVisit(u);
               end;
        for v:=1 to n do
            if (cha[v]<>-1)and(low[v]>=number[v]) then
               begin
                   inc(cau);
                   dem:=dem+int64(con[v])*int64(n-con[v])-1;
               end;
        if tplt=1 then
           begin
               if cau>0 then res:=int64(m-cau)*int64(k-m)+dem
               else res:=int64(m)*int64(k-m);
               write(oup,res);
               exit;
           end;
        res:=int64(dem1)*int64(dem2)*int64(m-cau);
        write(oup,res);
end;

//////////////////////////////////////////////////////////////////////////////

procedure process;
begin
        input;
        TimTPLT;
        solve;
end;

BEGIN
        openf;
        process;
        closef;
END.
