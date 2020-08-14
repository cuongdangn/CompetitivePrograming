PROGRAM
        Farm_Protection;
CONST
        tfi='';
        tfo='';
        dh:array[1..8]of longint=(0,-1,0,1,-1,-1,1,1);
        dc:array[1..8]of longint=(1,0,-1,0,1,-1,-1,1);
        max=500;
VAR
        fi,fo:text;
        LT,dd,a:array[0..max,0..max]of longint;
        Q:Array[0..max*max]of longint;
        n,m,res,qf,ql:longint;

Function  DoiSo(i,j:longint):longint;
  Begin
    doiso:=(i-1)*n+j;
  End;

Procedure DoiDinh(u:longint; var i,j:longint);
  Begin
    i:=(u-1) div n+1;
    j:=(u-1) mod n+1;
  End;

Procedure InitQ;
  Begin
    qf:=1; ql:=1;
  End;
Procedure Put(u:longint);
  Begin
    q[ql]:=u;
    inc(ql);
  End;
Function  Get:longint;
  Begin
    get:=q[qf];
    inc(qf);
  End;
Function  Qempty:boolean;
  Begin
    qempty:=qf=ql;
  End;

Procedure Input;
  Var i,j:longint;
  Begin
    assign(fi,tfi); reset(fi);
    read(fi,m,n);
    for i:=1 to m do for j:=1 to n do read(fi,a[i,j]);
    close(fi);
  End;

Procedure Init;
  Var i,j,ii,jj,k:longint;
  Begin
    //dd[i,j]=0 <---> i,j nam tren dinh doi
    //dd[i,j]=1 <---> i,j khong nam tren dinh doi
    Fillchar(dd,sizeof(dd),0);
    for i:=1 to m do
    for j:=1 to n do
      begin
        for k:=1 to 8 do
          begin
            ii:=i+dh[k]; jj:=j+dc[k];
            if (ii>=1) and (ii<=m) and (jj>=1) and (jj<=n) then
            if a[ii,jj]>a[i,j] then dd[i,j]:=1;
            if a[ii,jj]<a[i,j] then dd[ii,jj]:=1;
          end;
      end;
  End;

Procedure BFS(xp:longint);
  Var ii,jj,i,j,k,u,v:longint;
      ok:boolean;
  Begin
    ok:=true;
    InitQ; put(xp);
    while not qempty do
      begin
        u:=get; doidinh(u,i,j);
        for k:=1 to 8 do
          begin
            ii:=i+dh[k]; jj:=j+dc[k];
            if (ii>=1) and (ii<=m) and (jj>=1) and (jj<=n) and
               (LT[ii,jj]=0) and (a[ii,jj]=a[i,j]) then
              begin
                LT[ii,jj]:=res;
                put(doiso(ii,jj));
                if dd[ii,jj]=1 then ok:=false;
              end;
          end;
      end;
    if not ok then dec(res);
  End;

Procedure Calculate;
  Var i,j:longint;
  Begin
    Fillchar(LT,sizeof(LT),0);
    res:=0;
    for i:=1 to m do
      for j:=1 to n do
        if (dd[i,j]=0) and (LT[i,j]=0) then
          begin
            inc(res);
            LT[i,j]:=res;
            BFS(doiso(i,j));
          end;
  End;

Procedure Process;
  Begin
    Init;
    Calculate;
  End;

Procedure Output;
  Var i,j:longint;
  Begin
    assign(fo,tfo); rewrite(fo);
    writeln(fo,res);
    close(fo);
  End;

BEGIN
        Input;
        Process;
        Output;
END.
