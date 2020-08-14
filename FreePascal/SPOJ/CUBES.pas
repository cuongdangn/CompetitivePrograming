uses    math;
const   finp    =       'CUBES.INP';
        fout    =       'CUBES.OUT';
        maxx    =       trunc(1e9);
var     g,f     :       text;
        n       :       longint;
        kq1,kq2 :       int64;

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
var     i,j,k   :       longint;
begin
        readln(f,n);
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        kq1:=0;
        kq2:=maxx;
        for i:=1 to 1000 do
         if i<=n then
         begin
         for j:=i to 31622 do
           if j*i<=n then
            begin
             if (n mod (j*i)=0) then
              begin
               t:=n div (j*i);
               //if t<j then break;
               kq1:=max(kq1,int64(i+1)*int64(j+2)*int64(t+2)-n);
               kq1:=max(kq1,int64(i+2)*int64(j+1)*int64(t+2)-n);
               kq1:=max(kq1,int64(i+2)*int64(j+2)*int64(t+1)-n);
               kq2:=min(kq2,int64(i+1)*int64(j+2)*int64(t+2)-n);
               kq2:=min(kq2,int64(i+2)*int64(j+1)*int64(t+2)-n);
               kq2:=min(kq2,int64(i+2)*int64(j+2)*int64(t+1)-n);
              end;
            end
           else break;
        end
        else break;
        writeln(g,kq2,' ',kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.