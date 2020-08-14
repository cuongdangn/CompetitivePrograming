const   finp    =       'LABYRINT.IN';
        fout    =       'LABYRINT.OUT';
        d       :       array[1..4] of integer=(0,0,1,-1);
        c       :       array[1..4] of integer=(1,-1,0,0);
var     n,m,k,x,y,z,t   :       longint;
        dd      :       array[1..60*20+1] of byte;
        a       :       array[1..100,1..100] of longint;
        ch      :       array[1..200] of char;
        s       :       string;
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
var     i,j      :longint;
begin
        readln(f,m,n);
        for i:=1 to m do
          begin
          for j:=1 to n do   read(f,a[i,j]);
          readln(f);
          end;
        readln(f,x,y,z,t);
        readln(f,k);
        readln(f,s);
end;
function        kt(x,y:longint):boolean;
begin
        if (x<=m)and(x>0)and(y>0)and(y<=n)and(a[x,y]=0) then exit(true);
        exit(false);
end;
procedure       DQ(i,x1,y1,x2,y2:longint);
var       j,ti:longint;
begin
        if i>k then
                begin
                        if (x1=x)and(x2=z)and(y1=y)and(y2=t) then
                         begin
                                for j:=1 to k do write(g,ch[j]);
                                dong;
                                halt;
                         end;
                         exit;
                end;
            case s[i] of
             'E':ti:=1;
             'W':ti:=2;
             'S':ti:=3;
             'N':ti:=4;
             end;
            for j:=0 to 1 do
             begin
             if j=0 then
              begin
              if kt(x1+d[ti],y1+c[ti]) then
               begin
                        ch[i]:='R';
                        DQ(i+1,x1+d[ti],y1+c[ti],x2,y2);
               end
              end
              else
               if kt(x2+d[ti],y2+c[ti]) then
                begin
                        ch[i]:='J';
                        DQ(i+1,x1,y1,x2+d[ti],y2+d[ti]);
                end;
              end;
end;

begin
        mo;
        doc;
        DQ(1,1,1,m,n);
        dong;
end.
