const   finp    =       'LABYRINT.INP';
        fout    =       'LABYRINT.OUT';
var     bd      :       array['A'..'Z'] of longint;
        n,m,k,di,ti     :       longint;
        dd      :       array[1..60*20+1] of byte;
        a       :array[1..200] of longint;
        d       :       array[1..200,-500..500,-500..500] of boolean;
        ch      :       array[1..200] of char;
        g,f     :       text;
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
procedure      doc;
var     i,j,t,x,y,z      :longint;
begin
        readln(f,m,n);
        for i:=1 to m do
          begin
          for j:=1 to n do
              begin
                read(f,t);
                if t=1 then dd[(i-1)*n+j]:=1;
              end;
          readln(f);
          end;
          for
        readln(f,x,y,z,t);
        di:=(x-1)*n+y;
        ti:=(z-1)*n+t;
end;
procedure       DQ(i,x1,x2:longint);
var       j:longint;
begin
        if i>k then
                begin
                        if (x1=di)and(x2=ti) then
                         begin
                                for j:=1 to k do write(g,ch[j]);
                                dong;
                                halt;
                         end;
                         exit;
                end;
        if x1=di then
         begin
          if dd[(x2+a[i])]=1 then exit
          else
               begin
                ch[i]:='J';
                DQ(i+1,x1,x2+a[i]);
               end
         end
         else
          if x2=ti then
           begin
           if dd[(x2+a[i])]=1 then exit
          else
               begin
                ch[i]:='R';
                DQ(i+1,x1+a[i],x2);
               end
         end
        else
          begin
            for j:=0 to 1 do
             begin
              if j=0 then
               begin
                ch[i]:='R';
                DQ(i+1,x1+a[i],x2);
               end
              else
                begin
                 ch[i]:='J';
                 DQ(i+1,x1,x2+a[i]);
                end;
             end;
          end;
end;
procedure       init;
var     i       :longint;
        c:char;
begin
        readln(f,k);
        for i:=1 to k do
         begin
                read(f,c);
                case c of
                 'S': a[i]:=n;
                 'E':a[i]:=1;
                 'W':a[i]:=-1;
                 'N':a[i]:=-n;
                end;
         end;
end;
begin
        mo;
        doc;
        init;
        DQ(1,1,n*m);
        dong;
end.

