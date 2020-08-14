const   finp    =       '';
        fout    =       '';
        vc=300000;
var a:array[1..102,1..102] of boolean;
        cp,tg:array[1..102,1..102] of integer;
        d1,d2,d3:array[1..102] of longint;
        kq:array[1..10000] of longint;
        n,k,r:integer;
        fi,fo:text;

procedure nhap;
var i,j,ii:integer;
begin
        readln(fi,k);
        readln(fi,n);
        readln(fi,r);
        fillchar(a,sizeof(a),false);
        fillchar(tg,sizeof(tg),0);
        fillchar(cp,sizeof(cp),0);
        for ii:=1 to r do
        begin
                readln(fi,i,j,tg[i,j],cp[i,j]);
                a[i,j]:=true;
        end;
        for i:=1 to n do d2[n]:=maxint;
end;

procedure dijktra1;
var i,j,dmin,min:longint;
        dd:array[1..102] of boolean;
begin
        fillchar(dd,sizeof(dd),false);
        dd[n]:=true;
        d1[n]:=0;
        for i:=1 to n-1 do
                if a[i,n]=false then d1[i]:=vc
                else d1[i]:=cp[i,n];
        repeat
                min:=vc;
                dmin:=0;
                for i:=1 to n do
                        if (not dd[i]) and (d1[i]<min) then
                        begin
                                dmin:=i;
                                min:=d1[i];
                        end;
                if dmin=0 then break;
                dd[dmin]:=true;
                for i:=1 to n do
                        if not dd[i] then
                                if (a[i,dmin]) and (d1[dmin]+cp[i,dmin]<d1[i]) then
                                        d1[i]:=d1[dmin]+cp[i,dmin];
        until false;
end;




procedure dijktra2;
var i,j,dmin,min:longint;
        dd:array[1..102] of boolean;
begin
        fillchar(dd,sizeof(dd),false);
        fillchar(d3,sizeof(d3),0);
        d3[1]:=0;
        dd[1]:=true;
        d2[1]:=0;
        for i:=2 to n do
        begin
                if a[1,i]=false then d2[i]:=vc
                else d2[i]:=tg[1,i];
                d3[i]:=cp[1,i];
        end;
        repeat
                min:=vc;
                dmin:=0;
                for i:=1 to n do
                        if (not dd[i]) and (d2[i]<min) then
                        begin
                                dmin:=i;
                                min:=d2[i];
                        end;
                if dmin=0 then break;
                dd[dmin]:=true;
                for i:=1 to n do
                        if (not dd[i])and (a[dmin,i]) then
                                if  (d3[dmin]+cp[dmin,i]+d1[i]<=k) and (d2[dmin]+tg[dmin,i]<d2[i]) then
                                begin
                                        d2[i]:=d2[dmin]+tg[dmin,i];
                                        d3[i]:=d3[dmin]+cp[dmin,i];
                                end;
        until false;
end;


procedure xuli;
var t,tt:integer;
begin
        assign(fi,finp);
        reset(fi);
        assign(fo,fout);
        rewrite(fo);
        readln(fi,t);
        for tt:=1 to t do
        begin
                nhap;
                dijktra1;
                if d1[1]>k then kq[tt]:=-1
                else
                begin
                        dijktra2;
                        if d2[n]=maxint then kq[tt]:=-1 else kq[tt]:=d2[n];

                end;
        end;
        for tt:=1 to t do writeln(fo,kq[tt]);
        close(fi);
        close(fo);
end;



BEGIN
        xuli;
END.

