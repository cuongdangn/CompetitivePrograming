const fi='DNC.INP';
      fo='DNC.OUT';
var A,D:array[1..100000] of longint;
    N,K,KQ:longint;
    f:text;
procedure Nhap;
var i,j:longint;
begin
     assign(f,fi);
     reset(f);
     readln(f,K);
     readln(f,N);
     fillchar(D,sizeof(D),0);
     for i:=2 to N do
     begin
          read(f,A[i]);
          j:=i;
          repeat
                j:=A[j];
                inc(D[j]);
          until j=1;
     end;
     close(f);
end;
procedure Xuly;
var i,j:longint;
begin
     A[1]:=1;
     KQ:=0;
     for i:=N downto 1 do
     begin
          if D[i]+1>=K then
          begin
               inc(KQ);
               j:=i;
               repeat;
                      j:=A[j];
                      D[j]:=D[j]-D[i]-1;
               until j=1;
           end;
     end;
end;

procedure Hien;
var i:longint;
begin
     assign(f,fo);
     rewrite(f);
     write(f,KQ);
     close(f);
end;
begin
     Nhap;
     Xuly;
     Hien;
end.
