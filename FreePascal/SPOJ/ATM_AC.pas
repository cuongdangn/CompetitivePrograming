const   finp    =       'ATM.INP';
        fout    =       'ATM.OUT';
var     g,f     :       text;
        tien    :       int64;
        sc,sot  :       array[1..9] of int64;
        lt      :       array[0..15] of int64;
        c       :       longint;
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
procedure       xuly;
var     i,j     :       longint;
        k,soto,sca       :       int64;
begin
        if tien mod 1000<>0 then
         begin
          writeln(g,0);
          exit;
         end;
         tien:=tien div 1000;
         if tien>5*lt[c] then
         begin
         k:=tien div (5*lt[c]);
         tien:=tien-k*5*lt[c];
         if tien<5*lt[c] then tien:=tien+5*lt[c];
         soto:=k-1;
         sca:=1;
         end
         else begin sca:=1;soto:=0 end;
         //////////
         while tien>0 do
          begin
           j:=tien mod 10;
           if j<>0 then
           begin
           sca:=sca*sc[j];
           soto:=soto+sot[j];
           end;
           tien:=tien div 10;
          end;
         writeln(g,soto,' ',sca);
end;

procedure       doc;
var     i,j,t     :       longint;
begin
        lt[0]:=1;
        for i:=1 to 15 do
         lt[i]:=lt[i-1]*10;
        sc[1]:=1;sot[1]:=1;
        sc[2]:=1;sot[2]:=1;
        sc[3]:=1;sot[3]:=1;
        sc[4]:=2;sot[4]:=2;
        sc[5]:=1;sot[5]:=1;
        sc[6]:=2;sot[6]:=2;
        sc[7]:=1;sot[7]:=2;
        sc[8]:=1;sot[8]:=2;
        sc[9]:=3;sot[9]:=3;
        //////////
        readln(f,t);
        for i:=1 to t do
         begin
          read(f,tien);
          read(f,c);
          //writeln(i);
          xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.
