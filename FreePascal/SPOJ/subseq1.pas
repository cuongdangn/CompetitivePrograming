program VBGRASS;
const
        fi='';
        fo='';
        h:array[1..4] of integer=(-1,0,1,0);
        c:array[1..4] of integer=(0,1,0,-1);
var
        f:text;
        a:array[0..101,0..101] of integer;
        i,j,k,n,m,kq:longint;
        t:char;
procedure nhap;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        fillchar(a,sizeof(a),0);
        for i:= 1 to n do
                begin
                j:=0;
                while not eoln(f) do
                        begin
                        inc(j);
                        read(f,t);
                        if t='#' then a[i,j]:=1;
                        end;
                readln(f);
                end;
                close(f);
end;
procedure loang(x,y:integer);
begin
                for k:= 1 to 4 do
                        if a[x+h[k],y+c[k]]=1 then
                        begin
                        a[x+h[k],y+c[k]]:=0;
                        loang(x+h[k],y+c[k]);
                        end;
end;
procedure xuly;
begin
        for i:= 1 to n do
                for j:= 1 to m do
                        if a[i,j]=1 then
                                begin
                                inc(kq);
                                a[i,j]:=0;
                                loang(i,j);
                                end;
end;
procedure xuat;
begin
        assign(f,fo);
        rewrite(f);
        write(f,kq);
        close(f);
end;
begin {main}
nhap;
xuly;
xuat;
end.
