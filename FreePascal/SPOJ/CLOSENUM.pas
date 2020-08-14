const fi='';//'MCLONUM.INP';
      fo='';//'MCLONUM.OUT';
var a,b,kq1,kq2:array[1..60] of char;
    kt:array[1..60] of boolean;
    i,n,vt:byte;
    ch:char;
procedure mo;
var j,i:byte;
    tg:char;
    st:string;
begin
    assign(input,fi);reset(input);
    assign(output,fo);rewrite(output);
    readln(st);
    n:=length(st);
    for i:=1 to n do a[i]:=st[i];
    for i:=1 to n do read(b[i]);
    //n:=length(a);
    //writeln(n);
    //qs(1,n);
    for i:=n downto 2 do
        for j:=1 to i-1 do
            if b[j]>b[j+1] then
                begin
                    tg:=b[j];
                    b[j]:=b[j+1];
                    b[j+1]:=tg;
                end;
    //for i:=1 to n do writeln(b[i],' ',a[i]);
end;
procedure dong;
var i:byte;
begin
    if kq1[1]='0' then writeln('0') else for i:=1 to n do write(kq1[i]);
    writeln;
    if kq2[1]='0' then writeln('0') else for i:=1 to n do write(kq2[i]);
    close(input);
    close(output);
end;
function tim1(i:byte):char;
var j:byte;
    x,nho:char;
begin
    nho:='z';vt:=0;
    //x:=a[i];
    for j:=1 to n do
        if kt[j]=true then
            if b[j]>=a[i] then
                if nho>b[j] then
                    begin
                        nho:=b[j];
                        vt:=j;
                    end;
    kt[vt]:=false;
    //writeln(vt);
    if vt=0 then tim1:='z'
    else tim1:=nho;
end;
function tim2(i:byte):char;
var j:byte;
    nho:char;
begin
    nho:='z';vt:=0;
    for j:=1 to n do
        if kt[j]=true then
            if b[j]>a[i] then
                if nho>b[j] then
                    begin
                        nho:=b[j];
                        vt:=j;
                    end;
    kt[vt]:=false;
    //writeln(vt);
    if vt=0 then tim2:='z'
    else tim2:=nho;
end;
function tim3(i,j:byte):char;
var t,dem:byte;
begin
    dem:=0;
    for t:=1 to n do
        if kt[t]=true then
            begin
                inc(dem);
                if dem=j then
                begin
                    vt:=t;
                    break;
                end;
            end;
    tim3:=b[vt];
    kt[vt]:=false;
    //writeln(vt);
end;
procedure xulilon(i,j:byte;th,dk:boolean);
var x,nho:char;
    jt:byte;
begin
    if i=n+1 then exit;
    if i=0 then
        begin
            kq1[1]:='0';
            exit;
        end;
    if dk=true then
        begin
            if th=true then
                x:=tim1(i)
            else x:=tim2(i);
            //writeln(x);
            if (x='z') then
                if th=true then
                    begin
                        kt[vt]:=true;
                        //kq1[i]:='z';
                        xulilon(i-1,0,false,true);
                    end
            else begin kq1[1]:='0';exit;end;
            kq1[i]:=x;
            if x>=a[i] then xulilon(i+1,1,true,false) else xulilon(i+1,0,true,true);
        end
    else
        begin
            x:=tim3(i,j);
            kq1[i]:=x;
            //writeln(j,' ',x);
            xulilon(i+1,1,true,false);
        end;
end;
function tim4(i:byte):char;
var j:byte;
    nho:char;
begin
    nho:=#0;
    vt:=0;
    for j:=n downto 1 do
        if kt[j]=true then
            if b[j]<=a[i] then
                if nho<b[j] then
                    begin
                        nho:=b[j];
                        vt:=j;
                    end;
    if vt=0 then exit('z');
    kt[vt]:=false;
    exit(nho);
end;
function tim5(i:byte):char;
var j:byte;
    nho:char;
begin
    nho:=#0;
    vt:=0;
    for j:=n downto 1 do
        if kt[j]=true then
            if b[j]<a[i] then
                if nho<b[j] then
                    begin
                        nho:=b[j];
                        vt:=j;
                    end;
    if vt=0 then exit('z');
    kt[vt]:=false;
    exit(nho);
end;
function tim6(i,j:byte):char;
var dem,t:byte;
begin
    dem:=0;
    for t:=n downto 1 do
        if kt[t]=true then
            begin
                inc(dem);
                if dem=j then
                    begin
                        kt[t]:=false;
                        exit(b[t]);
                    end;
            end;
end;
procedure xulinho(i,j:byte;th,dk:boolean);
var x:char;
begin
    if i=n+1 then exit;
    if i=0 then
        begin
            kq2[1]:='0';
            exit;
        end;
    if dk=true then
        begin
            if th=true then
                x:=tim4(i)
            else x:=tim5(i);
            //writeln(x);
            if x='z' then
                if th=true then
                    begin
                        kt[vt]:=true;
                        xulinho(i-1,0,false,true);
                    end
                else begin kq2[1]:='0';exit;end;
            kq2[i]:=x;
            if x<=a[i] then xulinho(i+1,1,true,false) else xulinho(i+1,0,true,true);
        end
    else
        begin
            x:=tim6(i,j);
            kq2[i]:=x;
            xulinho(i+1,1,true,false);
        end;
end;
BEGIN
    mo;
    fillchar(kt,sizeof(kt),true);
    xulilon(1,0,true,true);
    fillchar(kt,sizeof(kt),true);
    xulinho(1,0,true,true);
    dong;
END.
