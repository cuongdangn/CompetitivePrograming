CONST   finp    =       '';
        fout    =       '';
VAR     fi,fo : text;
        S : ansistring;
        St1,St2 : string;
        n,m,n1,n2,ii,T : longint;
        pos1,pos2 : longint;
        dd : array['.'..'z',0..100005] of longint;
procedure Mo;
begin
        assign(fi,finp);    reset(fi);
        assign(fo,fout);    rewrite(fo);
end;

procedure       Dong;
begin
        close(fi);      close(fo);
end;

procedure       Init;
var     i : longint;
        ch : char;
begin
        fillchar(dd,sizeof(dd),0);
        for i := 2 to n+1 do
        begin
                for ch := '.' to 'z' do dd[ch,i] := dd[ch,i-1];
                ch := S[i-1];
                dd[ch,i] := i-1;
        end;
end;
procedure       xuly;
var i,j : longint;
begin
        readln(fi,St2);
        St1 := Copy(St2,1,pos(' ',St2)-1);
        Delete(St2,1,pos(' ',St2));
        n1 := length(St1);
        n2 := length(St2);
        pos1 := dd[St1[n1],n+1];
        j := pos1;
        if pos1 = 0 then exit;
        for i := n1-1 downto 1 do
        begin
                j := dd[St1[i],j];
                if j = 0 then
                begin
                        pos1 := 0;  exit;
                end;
        end;
        pos2 := dd[St2[n2],n+1];
        j := pos2;
        if pos2 = 0 then exit;
        for i := n2-1 downto 1 do
        begin
                j := dd[St2[i],j];
                if j = 0 then
                begin
                        pos2 := 0;  exit;
                end;
        end;
end;
procedure       xuat;
begin
        if (pos1 = 0) or (pos2 = 0) then begin writeln(fo,-4);exit;end;
        if pos1 < pos2 then writeln(fo,-1)
        else if pos1 > pos2 then writeln(fo,-2)
         else writeln(fo,-3);
end;
BEGIN
        Mo;
        readln(fi,S);n := length(S);Init;
        readln(fi,T);
        for ii := 1 to T do
        begin
                xuly;
                xuat;
        end;
        Dong;
END.
