const fii='DNC.INP';
      fo='DNC.OUT';
      maxn=205;
      dx:array[1..4] of shortint=(-1,-1,1,1);
      dy:array[1..4] of shortint=(-1,1,1,-1);


type ii=longint;

var f:text;
    a,h:array[0..maxn,0..maxn] of ii;
    qx,qy:array[1..maxn*maxn] of ii;
    fi,la,n,m,p,q,s,t:ii;

procedure init;
 var i,j,k,x,y:ii;
begin
      fillchar(a,sizeof(a),0);
      fillchar(h,sizeof(h),0);
      assign(f,fii);
      reset(f);
      readln(f,n,m,p,q,s,t);
      for i:=1 to m do
          begin
          readln(f,x,y);
          a[x,y]:=2;
          end;
      for i:=0 to n+1 do
          begin
          a[0,i]:=3;
          a[n+1,i]:=3;
          a[i,0]:=3;
          a[i,n+1]:=3;
          end;
      close(f);
end;

procedure push(u,v:ii);
begin
     inc(la);
     qx[la]:=u;
     qy[la]:=v;
end;

procedure out;
begin
   assign(f,fo);
   rewrite(f);
   writeln(f,h[s,t]);
   close(f);
   halt;
end;

procedure go(u,v,k:ii);
 var x,y:ii;
begin
   x:=u;y:=v;
   while a[x,y]<>3 do
         begin
         if (h[x,y]=0) and (a[x,y]<>1) and (a[x,y]<>2)then
            begin
            h[x,y]:=h[u,v]+1;
            a[x,y]:=1;
            push(x,y);
            end;
         if a[x,y]=2 then exit;
         if (x=s) and (y=t) then out;
         x:=x+dx[k];
         y:=y+dy[k];
         end;
end;

procedure run;
 var i,j,k,x,y,u,v:ii;
begin
     a[p,q]:=1;
     fi:=1;la:=0;
     push(p,q);
     while fi<=la do
           begin
           x:=qx[fi];
           y:=qy[fi];
           inc(fi);
           for k:=1 to 4 do go(x,y,k);
           end;
     if h[s,t]=0 then
        begin
        assign(f,fo);
        rewrite(f);
        writeln(f,-1);
        close(f);
        halt;
        end;
end;

begin
    init;
    run;
end.
