const
        inp='';
        out='';
var
        fi,fo:text;
        t:array[0..9,0..9] of longint;
        h,c:array[0..9] of integer;
        free:array[0..9] of boolean;
        res:longint;
procedure input;
var
        tmp:char;
        j,i:integer;
begin
        assign(fi,inp);
        reset(fi);
        j:=-10;
        repeat
                read(fi,tmp);
                i:=ord(tmp)-48;
                if j>=0 then begin inc(t[i,j]); inc(t[j,i]); end;
                j:=i;
        until eoln(fi);
        res:=maxlongint;
        close(fi);
end;
procedure check;
var
        i,j:integer;
        tmp:longint;
begin
        tmp:=0;
        for i:=0 to 9 do
                for j:=i+1 to 9 do
                        tmp:=tmp+(abs(h[j]-h[i])+abs(c[j]-c[i]))*t[i,j];
        if tmp<res then res:=tmp;
end;
procedure QL(i:integer);
var
        j,hx,cx:integer;
begin
        hx:=(i div 3)+1;
        cx:=i mod 3;
        if cx=0 then
                begin
                        hx:=hx-1;
                        cx:=3;
                end;
        for j:=0 to 9 do
           if not free[j] then
                begin
                        h[j]:=hx;
                        c[j]:=cx;
                        if i=10 then begin check; exit; end;
                        free[j]:=true;
                        QL(i+1);
                        free[j]:=false;
                end;
end;

begin
        input;
        QL(1);
        write(res);
end.
