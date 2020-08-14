const fi='';
      fo='';
      maxn=10000;
      vc=300000001;

var n:integer;
    max:longint;
    a:array[1..4,1..maxn] of integer;
    L:array[0..15,0..maxn] of longint;
    f,z:text; kt:boolean;

procedure input;
  var i,j:integer;
    begin
      assign(f,fi);
      reset(f);kt:=false;
        readln(f,n);
        for i:=1 to 4 do
          begin
            for j:=1 to n do
            begin
            read(f,a[i,j]);
            if a[i,j]>=0 then kt:=true;
            end;
            readln(f);
          end;
      close(f);
    end;

function sum(i,j:integer):longint;
  var res:longint;
      k:byte;
    begin
      res:=0;
      k:=4;
      while i>0 do
        begin
          if (i and 1)=1 then res:=res+a[k,j];
          i:=i shr 1;
          dec(k);
        end;
      sum:=res;
    end;

function check(i:integer):boolean;
  begin
    if i in [0,1,2,4,5,8,9,10] then exit(TRUE);
    exit(FALSE);
  end;

function great(a,b:longint):longint;
  begin
    if a>b then exit(a);
    exit(b);
  end;

procedure process;
  var i,j,k:integer;
    begin
      fillchar(L,sizeof(L),0);
      for i:=0 to 15 do L[i][1]:=sum(i,1);
      max:=-vc;
      for j:=2 to n do
        for i:=0 to 15 do
          begin
            if not (check(i)) then continue;
            L[i][j]:=-vc;
            for k:=0 to 15 do
              if check(k) and ((i and k)=0) then L[i][j]:=great(L[i][j],sum(i,j)+L[k][j-1]);
            max:=great(max,L[i][j]);
          end;
    end;

procedure       xuly;
var     i,j:longint;
begin
        max:=-vc;
        for i:=1 to 4 do
        for j:=1 to n do if max< a[i,j] then max:=a[i,j];
end;
procedure output;
  begin
    assign(z,fo);
    rewrite(z);
      write(z,max);
    close(z);
  end;

begin
  input;
  if kt then process else xuly;
  output;
end.
