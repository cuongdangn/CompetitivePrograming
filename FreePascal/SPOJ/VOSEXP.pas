{ta can tinh cac tong a^i vs i<=10^12;ta chuan bi truoc luy thua a cua 2^20 so dau, voi nhan xet gia su bieu dien
 cac luy thua duoi dang day bit thi day bit co 40 so 0 or 1 ta chuan bi truoc nua day voi mot so co day>20 thi se bang
 xxx0000000...00+yyy...yy voi so luong so 0 la 20 }


const   finp    =       'DNC.INP';
        fout    =       '';
var     g,f     :       text;
        m       :       longint;
        x,d,a,b,c,base,tt,kq:          qword;
        t       :       qword;
        lt,lt2  :       array[0..1048576] of qword;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
begin
        readln(f,m,x,a,b,c,d,base);
        x:=x mod base;
end;

procedure       init;
var     i,j     :       longint;
begin
        tt:=1 shl 20;
        lt[0]:=1;
        for i:=1 to tt do lt[i]:=lt[i-1]*x mod base;
        ///////////////
        lt2[0]:=1;
        for i:=1 to tt do
         begin
          lt2[i]:=lt[i];
          for j:=1 to 20 do
           lt2[i]:=lt2[i]*lt2[i] mod base;
          end;
end;
procedure       xuly;
var     i     :       longint;
        lt11,lt21  :     qword;
begin
        t:=a;
        for i:=1 to m do
         begin
          lt11:=t div tt;
          lt21:=lt11 shl 20;
          lt21:=t-lt21;
          kq:=(kq+lt[lt21]*lt2[lt11]) mod base;
          t:=(t*b+c) mod d;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.

