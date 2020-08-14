uses    math;
const   fi      =       'ball.inp';
        fo      =       'ball.out';
var     f,g     :       text;
        fx      :       array[0..11,0..1024,0..1024] of int64;
        f1,f2,f3: array[0..10,0..10] of int64;
        ff      : array[0..10,0..10,0..10] of int64;
        a,b,c,w:      int64;n:byte;
        best    :       int64;
procedure       enter;
        var i,j,k:longint;
        Begin
                assign(f,fi);
                assign(g,fo);
                reset(f);
                rewrite(g);
                readln(f,n,a,b,c,w);
                for i:=1 to n do
                  for j:=1 to n do
                    read(f,f1[i,j]);
                for i:=1 to n do
                  for j:=1 to n do
                    read(f,f2[i,j]);
                for i:=1 to n do
                  for j:=1 to n do
                    read(f,f3[i,j]);
                for i:=1 to n do
                  for j:=1 to n do
                    for k:=1 to n do
                      read(f,ff[i,j,k]);
        end;

function        max(a,b:int64):int64;
        Begin
                If (a>b) then exit(a) else exit(b);
        end;
function       duyet(i:byte;t2,t3:longint):int64;
        var     j,k:byte;     gt,t:int64;
        Begin
                If (fx[i,t2,t3]<>-1) then exit(fx[i,t2,t3]);
                If (i>n) then
                      Begin

                        exit(0);
                      end;
                t:=0;
                for j:=1 to n do
                  If (t2 and (1 shl (j-1))=0) then
                   for k:=1 to n do
                     if (t3 and (1 shl(k-1))=0) then
                       Begin
                        gt:=a*f1[i,j]+b*f2[i,k]+c*f3[j,k]+w*ff[i,j,k];

                        t:=max(t,duyet(i+1,t2 or (1 shl(j-1)),t3 or (1 shl(k-1)))+gt);
                       end;
                fx[i,t2,t3]:=t;
                exit(t);

        end;
procedure       xuly;

        Begin
                best:=0;
                fillchar(fx,sizeof(fx),255);
                writeln(g,duyet(1,0,0));
                close(g);
        end;
Begin
        enter;
        xuly;
end.
