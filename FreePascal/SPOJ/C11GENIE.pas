const
        fi='';
        fo='';
        Nmax=10000000;
        e=1000000007;
var
        f:text;
        n: longint;
        cx:array[1..Nmax] of boolean;
        st:array[1..Nmax] of longint;
        t,d: longint;
        sm:array[1..NMax] of int64;
        Res: int64;

procedure input;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        close(f);
end;

procedure push(i: longint );
begin
        inc(T);
        st[t]:=i;
end;

procedure Sang;
var
        i,j: longint;
begin
        for i:=1 to n do cx[i]:=true;
        for i:= 2 to trunc(sqrt(N)) do
          if cx[i] then
            begin
                  j:=i*i;
                  while j<=N do
                    begin
                         cx[j]:=false;
                         inc(j,i);
                    end;
            end;
        t:=0;
        for i:=2 to N do
          if cx[i] then Push(i);
end;

procedure Tinh;
var
        i,j,k: longint;
        M,x: int64;
begin
        for i:=1 to T do sm[i]:=0;
        for i:=1 to T do
          begin
               if st[i]>M then exit;
               x:= st[i];M:=n;
               While M >=x do
                 begin
                      inc(sm[i], M div x );
                      x:= x*st[i];
                 end;
          end;
        for i:= 1 to T do sm[i]:= Sm[i] div 2;
end;

procedure process;
var
        i,j: longint;
begin
        Res:=1;
        for i:= 1 to t do
                for j:= 1 to sm[i] do Res:= (Res* st[i]) mod e;
        Res:= (Res mod e * (Res mod e)) mod e;
end;


procedure output;
begin
        assign(f,fo);
        rewrite(f);
        writeln(f,Res);
        close(f);
end;

BEGIN
        input;
        Sang;
        Tinh;
        process;
        output;
END.
