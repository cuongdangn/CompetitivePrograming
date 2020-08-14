uses math;
const   finp    =       'NUM6.INP';
        fout    =       'NUM6.OUT';
var     g,f     :       text;
        n       :       longint;
        a       : array[1..12] of longint;
        dd      : array[1..12] of byte;
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
procedure       tinh1;
var   i,i1,i2,i3,i4,i5,i6:longint;
        kq:int64;
begin
      kq:=-maxlongint*1000000000;
      for i1:=1 to n do
       begin
        dd[i1]:=1;
       for i2:=1 to n do
         begin
         if dd[i2]=0 then
                begin
                 dd[i2]:=1;

                 for i3:=1 to n do
                        if dd[i3]=0 then
                                begin
                                 dd[i3]:=1;

                                 for i4:=1 to n do
                                  if dd[i4]=0 then
                                        begin
                                                dd[i4]:=1;

                                                for i5:=1 to n do
                                                 if dd[i5]=0 then
                                                  begin
                                                        dd[i5]:=1;

                                                        for i6:=1 to n do
                                                        if dd[i6]=0 then
                                                                begin
                                                                 kq:=max(kq,a[i1]*a[i2]*a[i3]+a[i4]*a[i5]*a[i6]);
                                                                end;
                                                        dd[i5]:=0;
                                                  end;
                                                 dd[i4]:=0;
                                        end;
                                  dd[i3]:=0;
                                 end;
                dd[i2]:=0;
                end;
         end;
         dd[i1]:=0;
       end;
       writeln(g,kq);
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,tg    :       int64;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j ;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;

procedure       doc;
var     i,p,cs:longint;
begin
        readln(f,n);
        if n<12 then
        for i:=1 to n do read(f,a[i])
        else
                begin
                    for i:=1 to 12 do read(f,a[i]);
                    QS(1,12);
                    for i:=13 to n do
                        begin
                                read(f,p);
                                if p<a[6] then
                                       begin
                                       cs:=6;
                                       while (p<a[cs])and(cs>0) do
                                       begin
                                                a[cs]:=a[cs-1];
                                                dec(cs);
                                       end;
                                       a[cs+1]:=p;
                                       end
                                else
                                if p>a[7] then
                                begin
                                       cs:=7;
                                       while (p>a[cs])and(cs<13) do
                                       begin
                                                a[cs]:=a[cs+1];
                                                inc(cs);
                                       end;
                                       a[cs-1]:=p;
                                end;
              end;
              n:=12;
        end;
end;
begin
        mo;
        doc;
        tinh1;
        dong;
end.
