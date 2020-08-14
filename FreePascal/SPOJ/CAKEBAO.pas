{$mode objfpc}
uses math;
const
                finp            =               'DNC.INP';
                fout            =               'DNC.OUT';
                maxn            =               1510;
type
                Point           =               Record
                        x,y     :               integer;
                end;
var
                fi,fo           :               text;
                N               :               integer;
                P               :               array[1..2*maxn] of point;
                Res             :               Real;
procedure openfile;
begin
        assign(fi,finp);reset(fi);
        assign(fo,fout);rewrite(fo);
end;
procedure Closefile;
begin
        CLose(fi);CLose(fo);
end;
procedure enter;
var
        i               :               integer;
begin
        readln(fi,n);
        for i:=1 to n do
        begin
                readln(fi,p[i].x,p[i].y);
                p[n+i]:=p[i];
        end;
end;
function Cal(Xa,Ya,Xb,Yb,Xc,Yc:Real):Real;
begin
        Cal:=Abs((Xb-Xa)*(Yc-Ya)-(Yb-Ya)*(Xc-Xa))/2;
end;
procedure Process;
var
        i,j,ii,jj,k,maxj:               integer;
        ma1,ma2,s       :               Real;
begin
        Res:=0;
        For i:=1 to N-2 do
        begin
                j:=i+2;ii:=i+1;ma2:=0;
                for k:=i+3 to i+N-1 do
                begin
                        s:=Cal(P[i].x,P[i].y,P[k].x,P[k].y,P[j].x,P[j].y);
                        if s>ma2 then
                        begin
                                ma2:=s;
                                jj:=k;
                        end;
                end;
                ma1:=Cal(P[i].x,P[i].y,P[ii].x,P[ii].y,P[j].x,P[j].y);
                Res:=Max(Res,Ma1+ma2);
                For j:=i+3 to N do
                begin
                        ma1:=Cal(p[i].x,p[i].y,p[ii].x,p[ii].y,p[j].x,p[j].y);
                        while ii<j-1 do
                        begin
                                s:=cal(p[i].x,p[i].y,p[ii+1].x,p[ii+1].y,p[j].x,p[j].y);
                                if s>=ma1 then
                                begin
                                        ma1:=s;
                                        inc(ii);
                                end
                                else
                                        break;
                        end;
                        if jj=j then jj:=j+1;
                        ma2:=Cal(P[i].x,P[i].y,P[jj].x,P[jj].y,P[j].x,P[j].y);
                        while jj<i-1+n do
                        begin
                                s:=cal(p[i].x,p[i].y,p[jj+1].x,p[jj+1].y,p[j].x,p[j].y);
                                if s>=ma2 then
                                begin
                                        ma2:=s;
                                        inc(jj);
                                end
                                else
                                        break;
                        end;
                        res:=max(res,ma1+ma2);
                end;
        end;
        writeln(fo,res:0:1);
end;
begin
        openfile;
        enter;
        process;
        closefile;
end.
