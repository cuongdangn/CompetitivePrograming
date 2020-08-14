const fi='';
      fo='';
      maxn=16;
var clear:array[0..maxn*9*9] of longint;
    n,m:int64;
    d:array[0..maxn+1,0..maxn*9*9,false..true] of int64;
    st,res:string;
    dem:int64;

procedure mofile;
begin

    assign(input,fi);
    reset(input);
    assign(output,fo);
    rewrite(output);
end;

procedure dongfile;
begin

    close(input);
    close(output);
end;

function dfs(i:longint):longint;
var s:string;
    sum,j:longint;
begin
    if clear[i]<>-1 then exit(clear[i]);
    str(i,s);
    clear[i]:=0;
    sum:=0;
    for j:=1 to length(s) do
        sum:=sum+sqr(ord(s[j])-48);
    if sum=1 then clear[i]:=1
        else clear[i]:=dfs(sum);
    exit(clear[i]);
end;
procedure khoitao;
var i,j,k,p1,p2:longint;
    sp:string;
begin
    fillchar(clear,sizeof(clear),255);
    for i:=1 to maxn*9*9 do
        if clear[i]=-1 then clear[i]:=dfs(i);
end;
procedure       doc;
begin
    readln(n,m);
    str(n+1,st);
    while length(st)<maxn do st:='0'+st;
    fillchar(d,sizeof(d),255);
    dem:=0;
    res:='';
end;
function cauhinh(i,s:longint; ok:boolean):int64;
var sum:int64;
    j:longint;
begin
    if d[i,s,ok]<>-1 then exit(d[i,s,ok]);
    d[i,s,ok]:=0;
    if i=maxn+1 then
        begin
            if clear[s]=1 then d[i,s,ok]:=1;
            exit(d[i,s,ok]);
        end;
    sum:=0;
    for j:=(1-ord(ok))*(ord(st[i])-48) to 9 do
        sum:=sum+cauhinh(i+1,s+j*j,ok or (j>ord(st[i])-48));
    d[i,s,ok]:=sum;
    exit(sum);
end;
procedure dien(i,s:longint; ok:boolean);
var j:longint;
begin
    for j:=(1-ord(ok))*(ord(st[i])-48) to 9 do
        if dem+d[i+1,s+sqr(j),ok or (j>ord(st[i])-48)]<m then dem:=dem+d[i+1,s+sqr(j),ok or (j>ord(st[i])-48)]
            else
            begin
                res:=res+chr(j+48);
                if i<maxn then dien(i+1,s+sqr(j),ok or (j>ord(st[i])-48));
                break;
            end;
end;
procedure xuly;
var t:longint;
begin
    readln(t);
    while t>0 do
        begin
            doc;
            cauhinh(1,0,false);
            dien(1,0,false);
            while (length(res)>0) and (res[1]='0') do delete(res,1,1);
            writeln(res);
            dec(t);
        end;
end;
begin
    mofile;
    khoitao;
    xuly;
    dongfile;
end.







