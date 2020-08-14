{$mode objFpc}
Uses Math;
COnst
                finp            =               '';
                fout            =               '';
                maxn            =               202;
                maxc            =               maxlongint;
var
                fi,fo           :               text;
                C               :               Array[1..maxn,1..maxn] of integer;
                Fx,Fy,MatchX,MatchY,Trace       :       Array[1..maxn] of integer;
                N,Start,Finish  :               integer;
Procedure Openfile;
begin
        Assign(fi,finp);Reset(fi);
        Assign(fo,fout);Rewrite(FO);
end;
Procedure Closefile;
begin
        Close(fi);Close(fo);
end;
procedure Enter;
var
        i,j             :               integer;
begin
        Readln(fi,N);
        For i:=1 to N do
        For j:=1 to N do
                read(fi,c[i,j]);

end;
procedure Init;
var
        i,j             :               integer;
begin
        Fillchar(MatchX,n*sizeof(MatchX[1]),0);
        Fillchar(MatchY,n*sizeof(MatchY[1]),0);
        For i:=1 to N do
        begin
                Fx[i]:=MaxC;
                For j:=1 to N do
                        if C[i,j]<Fx[i] then Fx[i]:=C[i,j];
        end;
        For j:=1 to N do
        begin
                Fy[j]:=MaxC;
                For i:=1 to N do
                if C[i,j]-Fx[i]<Fy[j] then Fy[j]:=C[i,j]-Fx[i];
        end;
end;
Function GetC(i,j:integer):integer;
begin
        Result:=C[i,j]-Fx[i]-Fy[j];
end;
procedure Find;
var
        Q               :               Array[1..maxn] of integer;
        i,j,f,l         :               integer;
begin
        Fillchar(Trace[1],n*sizeof(Trace[1]),0);
        Q[1]:=Start;
        F:=1;l:=1;
        While f<=l do
        begin
                i:=Q[f];inc(f);
                For j:=1 to N do
                if (Trace[j]=0) and (GetC(i,j)=0) then
                begin
                        Trace[j]:=i;
                        if MatchY[j]=0 then
                        begin
                                Finish:=j;
                                exit;
                        end;
                        inc(l);Q[l]:=MatchY[j];
                end;
        end;
end;
Procedure SubX_AddY;
var
        i,j,t,Delta             :               integer;
        VX,VY                   :               Set of Byte;
begin
        VX:=[Start];
        VY:=[];
        For j:=1 to N do
        if Trace[j]<>0 then
        begin
                Include(VX,MatchY[j]);
                Include(VY,j);
        end;
        Delta:=MaxC;
        For i:=1 to N do
        if i in VX then
        For j:=1 to N do
        if not (j in VY) and (GetC(i,j)<Delta) then
                Delta:=GetC(i,j);
        For t:=1 to N do
        begin
                if t in VX then Fx[t]:=Fx[t]+Delta;
                if t in VY then Fy[t]:=Fy[t]-Delta;
        end;
end;
procedure Enlarge;
var
        x,next          :               integer;
begin
        Repeat
                x:=Trace[finish];
                next:=MatchX[x];
                MatchX[x]:=Finish;
                MatchY[Finish]:=X;
                Finish:=Next;
        Until Finish=0;
end;
procedure Process;
var
        x,y,W           :               integer;
begin
        For x:=1 to N do
        begin
                start:=x;finish:=0;
                Repeat
                        Find;
                        if finish=0 then SubX_AddY;
                Until Finish<>0;
                Enlarge;
        end;
        W:=-maxlongint;
        For x:=1 to N do
        begin
                y:=MatchX[x];
                if C[x,y]<MaxC then w:=max(w,c[x,y]);
        end;
        writeln(fo,w);
end;
begin
        Openfile;
        Enter;
        Init;
        Process;
        Closefile;
end.