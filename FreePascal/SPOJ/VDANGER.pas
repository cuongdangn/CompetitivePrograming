{$MODE OBJFPC}
{$M 4000000}
const     INP        =        '' ;
          OUT        =        '' ;

          maxn       =        100      ;
          maxc       =        100000 ;

var       n , m         :  longint ;
          a          :       array[1..maxn,1..maxn] of longint ;
          trace      :       array[1..maxn,1..maxn] of longint ;
          fi , fo    :       text    ;
          ht :array[1..10000] of longint;
          kq :  int64;
procedure answer ;
var     i :     longint;
begin
        kq:=0;
        for i:=2 to m do kq:=kq+a[ht[i-1],ht[i]];
        write(fo,kq);
end ;

procedure process ;
var
     k , u,  v : longint ;
begin
     for k := 1 to n do { Floyd }
         for u := 1 to n do
             for v :=1 to n do
                 if a[u,v] > a[u,k] + a[k,v] then begin
                    a[u,v] := a[u,k] + a[k,v] ;

                 end ;
end ;

procedure nhapdl ;
var
      i , j : longint ;
begin
     readln( fi ,n,m ) ;
     for i := 1 to m do
        readln(fi,ht[i]);

     for i := 1 to n do
       begin
        for j:=1 to n do read(fi,a[i,j]);
        readln(fi);
       end;
end ;

procedure mofile ;
begin
     assign( fi , INP ) ; reset( fi )   ;
     assign( fo , OUT ) ; rewrite( fo ) ;
end ;

procedure dongfile ;
begin
     close( fi ) ; close( fo ) ;
end ;

BEGIN
     mofile   ;
     nhapdl   ;
     process  ;
     answer   ;
     dongfile ;
END.
