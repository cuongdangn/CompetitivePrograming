Const   fi	=	'XAU.INP';
        fo	=	'XAU.OUT';
Type 	arr = array[0..1009] of longint;
Var 	st:array[0..1009] of string;
    	a,pe:array[0..1009] of arr;
    	d,vt:arr;
    	s:array[1..2,0..1009] of longint;
        n,k,x,y,l:longint;
Procedure       Mo;
Begin
        Assign(input,fi);
        Reset(input);
        Assign(output,fo);
        Rewrite(output);
End;

Procedure       Dong;
Begin
        Close(input);
        Close(output);
End;

Procedure       Enter;
Var     i,j     :       longint;
        ch      :       char;
Begin
        Readln(n,l,k);
        For i:=1 to n do
        Begin
                st[i]:='';
                For j:=1 to l do
                Begin
                        Read(ch);
                        st[i]:=st[i]+ch;
                End;
                Readln;
        End;
End;

Function        kc(i,j:longint):longint;
Var     ii,max:longint;
        s1,s2:string;
Begin
        max:=0;
        s1:='';
        s2:='';
        For ii:=l-1 downto 1 do
        Begin
                If copy(st[j],1,ii) = copy(st[i],l-ii+1,ii) then
                Begin
                        kc:=l-ii;
                        exit;
                End;
        End;
        kc:=l;
End;

Procedure       Init;
Var     i,j     :longint;
Begin
        For i:=1 to n do
        For j:=1 to n do A[i,j]:=kc(i,j);
        Fillchar(s,sizeof(s),0);
        Fillchar(pe,sizeof(pe),0);
End;

Procedure SLove;
Var i,j,b:longint;
Begin
        x:=1;
        y:=2;
        For i:=1 to n do s[x,i]:=l;
        For b:=2 to k do
        Begin
                For j:=1 to n do
                Begin
                        s[y,j]:=maxlongint;
                        For i:=1 to n do
                        If s[x,i] + A[i,j] < s[y,j] then
                        Begin
                                S[y,j]:=s[x,i] +a[i,j];
                                pe[b,j]:=i;
                        End;
                End;
                x:=3-x;
                y:=3-y;
        End;
ENd;

Procedure Result;
Var i,cs,j,min:longint;
Begin
        min:=maxlongint;
        cs:=0;
        For i:=1 to n do
        If s[x,i]< min then
        Begin
                 min:=s[x,i];
                 cs:=i;
        End;
        Writeln(min);
        For i:=k downto 1 do
        Begin
                d[i]:=cs;
                cs:=pe[i,cs];
        End;
        vt[1]:=1;
        Write(st[d[1]]);
        For i:=2 to k do
        Begin
                vt[i]:=vt[i-1]+a[d[i-1],d[i]];
                Write(copy(st[d[i]],l-a[d[i-1],d[i]]+1,l));
        End;
        Writeln;
        Writeln(d[i],' ',vt[i]);
End;

BEGIN
        Mo;
        Enter;
        Init;
        Slove;
        Result;
        Dong;
END.


