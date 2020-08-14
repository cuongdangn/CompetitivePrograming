program CLOCK;
const input='';
      output='';
var fi,fo:text;
    A,B:array[1..3,1..3] of longint;
    X:array[1..9] of longint;
    re:longint;
procedure Enter;
var i,j,m:longint;c:char;
    begin
        assign(fi,input);reset(fi);
        assign(fo,output);rewrite(fo);
            For i:=1 to 3 do
                begin
                    For j:=1 to 3 do
                    begin
                    read(fi,c);
                    val(c,a[i,j],m);
                    end;
                    readln(fi);
                end
    end;
procedure Dat1;
    begin
        A[1,1]:=(A[1,1]+1) mod 4;
        A[1,2]:=(A[1,2]+1) mod 4;
        A[2,1]:=(A[2,1]+1) mod 4;
        A[2,2]:=(A[2,2]+1) mod 4;
    end;
procedure Dat2;
    begin
        A[1,1]:=(A[1,1]+1) mod 4;
        A[1,2]:=(A[1,2]+1) mod 4;
        A[1,3]:=(A[1,3]+1) mod 4;
    end;
procedure Dat3;
    begin
        A[1,2]:=(A[1,2]+1) mod 4;
        A[1,3]:=(A[1,3]+1) mod 4;
        A[2,2]:=(A[2,2]+1) mod 4;
        A[2,3]:=(A[2,3]+1) mod 4;
    end;
procedure Dat4;
    begin
        A[1,1]:=(A[1,1]+1) mod 4;
        A[2,1]:=(A[2,1]+1) mod 4;
        A[3,1]:=(A[3,1]+1) mod 4;
    end;
procedure Dat5;
    begin
        A[1,2]:=(A[1,2]+1) mod 4;
        A[2,1]:=(A[2,1]+1) mod 4;
        A[2,2]:=(A[2,2]+1) mod 4;
        A[2,3]:=(A[2,3]+1) mod 4;
        A[3,2]:=(A[3,2]+1) mod 4;
    end;
procedure Dat6;
    begin
        A[1,3]:=(A[1,3]+1) mod 4;
        A[2,3]:=(A[2,3]+1) mod 4;
        A[3,3]:=(A[3,3]+1) mod 4;
    end;
procedure Dat7;
    begin
        A[2,1]:=(A[2,1]+1) mod 4;
        A[2,2]:=(A[2,2]+1) mod 4;
        A[3,1]:=(A[3,1]+1) mod 4;
        A[3,2]:=(A[3,2]+1) mod 4;
    end;
procedure Dat8;
    begin
        A[3,1]:=(A[3,1]+1) mod 4;
        A[3,2]:=(A[3,2]+1) mod 4;
        A[3,3]:=(A[3,3]+1) mod 4;
    end;
procedure Dat9;
    begin
        A[2,2]:=(A[2,2]+1) mod 4;
        A[2,3]:=(A[2,3]+1) mod 4;
        A[3,2]:=(A[3,2]+1) mod 4;
        A[3,3]:=(A[3,3]+1) mod 4;
    end;
function thoaman:boolean;
    var i,j:longint;
    begin
        For i:=1 to 3 do
            For j:=1 to 3 do
                If A[i,j]<>0 then exit(false);
        thoaman:=true;
    end;
procedure Xuly;
    var Sum:longint;
        i,j:longint;
    begin
        Sum:=0;
        For i:=1 to 9 do Sum:=Sum+X[i];
        If Sum>=Re then exit;
               For i:=1 to 9 do
                    Case i of
                        1:For j:=1 to X[i] do Dat1;
                        2:For j:=1 to X[i] do Dat2;
                        3:For j:=1 to X[i] do Dat3;
                        4:For j:=1 to X[i] do Dat4;
                        5:For j:=1 to X[i] do Dat5;
                        6:For j:=1 to X[i] do Dat6;
                        7:For j:=1 to X[i] do Dat7;
                        8:For j:=1 to X[i] do Dat8;
                        9:For j:=1 to X[i] do Dat9;
                        end;
                If thoaman then re:=Sum;
                A:=B;
    end;
procedure Duyet(i:longint);
    var j:longint;
    begin
         For j:=0 to 3 do
            begin
                X[i]:=j;
                If i=9 then Xuly
                else Duyet(i+1);
            end;
    end;
procedure Init;
    begin
        B:=A;
        Fillchar(X,9,0);
        Re:=maxint;
    end;
procedure Inkq;
    begin
        Write(fo,Re);
    end;
procedure CloseFile;
    begin
        close(fi); close(Fo);
    end;
begin
    Enter;
    Init;
    Duyet(1);
    Inkq;
    CloseFile;
end.
