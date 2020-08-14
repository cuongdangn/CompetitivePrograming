uses    math;
const   fin     =       'SEQGAME.INP';
        fout    =       'SEQGAME.OUT';
        mn      =       3000;
        maxint  =       trunc(1e18);
var     f1,f2   :       text;
        n       :       longint;
        d       :       array[1..3,1..mn] of longint;
        fi,fa   :       array[0..3,0..mn] of int64;
//////////////////////////////
procedure       mofile;
begin
        assign(f1,fin);
        reset(f1);
        assign(f2,fout);
        rewrite(f2);
end;
////////////////////////////////
procedure       dongfile;
begin
        close(f1);
        close(f2);
end;
////////////////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin
        readln(f1,n);
        for i:=1 to 3 do
        begin
                for j:=1 to n do read(f1,d[i,j]);
                readln(f1);
        end;
        fi[1,1]:=d[1,1]; fa[1,1]:=d[1,1];
        for i:=2 to n do
        begin
                fa[1,i]:=max(fa[1,i-1],d[1,i]);
                fi[1,i]:=min(fi[1,i-1],d[1,i]);
        end;
        fi[0,0]:=1; fa[0,0]:=1;
        for i:=1 to 3 do
        begin
                fa[i,i]:=fa[i-1,i-1]*d[i,i];
                fi[i,i]:=fi[i-1,i-1]*d[i,i];
        end;
end;
//////////////////////////////
procedure       xulyfile;
var     i,j     :       longint;
begin
        for i:=2 to 3 do
        begin
                for j:=i+1 to n do
                begin
                        if d[i,j]>=0 then
                        begin
                                fa[i,j]:=max(fa[i,j-1],fa[i-1,j-1]*d[i,j]);
                                fi[i,j]:=min(fi[i,j-1],fi[i-1,j-1]*d[i,j]);
                        end else
                        begin
                                fa[i,j]:=max(fa[i,j-1],fi[i-1,j-1]*d[i,j]);
                                fi[i,j]:=min(fi[i,j-1],fa[i-1,j-1]*d[i,j]);
                        end;
                end;
        end;
        writeln(f2,fa[3,n]);
end;
////////////////////////////////
begin
        mofile;
        docfile;
        xulyfile;
        dongfile;
end.
