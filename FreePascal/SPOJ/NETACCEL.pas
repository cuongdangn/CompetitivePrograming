const INP='';
      OUT='';
      maxn=1000;
      pow2:array[0..10] of integer=(1,2,4,8,16,32,64,128,256,512,1024);

var n,k:integer;
    m:longint;
    a:array[1..maxn,1..maxn] of longint;
    F:array[1..maxn,0..10] of double;
    free:array[1..maxn] of boolean;
    fi,fo:text;

procedure input;
  var i:longint;
      u,v:integer;
    begin
      assign(fi,INP);
      reset(fi);
        readln(fi,n,m,k);
        for i:=1 to m do
          begin
            readln(fi,u,v,a[u][v]);
            a[v][u]:=a[u][v];
          end;
      close(fi);
    end;

procedure process;
  var u,v,j,t:integer;
      Fmin:real;
    begin
      for j:=0 to k do
        begin
          fillchar(free,sizeof(free),true);
          for u:=1 to n do F[u][j]:=maxlongint;
          F[1][j]:=0;
          while true do
            begin
              u:=0;
              Fmin:=maxlongint;
              for v:=1 to n do
                if free[v] and (F[v][j]<Fmin) then
                  begin
                    u:=v;
                    Fmin:=F[v][j];
                  end;
              if u=0 then break;
              free[u]:=false;
              for v:=1 to n do
                for t:=0 to j do
                  if (a[u][v]<>0) and (F[v][j]>F[u][j-t]+(a[u][v]/pow2[t])) then
                    F[v][j]:=F[u][j-t]+(a[u][v]/pow2[t]);
            end;
        end;
    end;

procedure output;
  begin
    assign(fo,OUT);
    rewrite(fo);
      write(fo,F[n][k]:0:2);
    close(fo);
  end;

begin
  input;
  process;
  output;
end.
