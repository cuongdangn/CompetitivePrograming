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
               kq1:=max(kq1,2*(i+1)*(t+j+2)+t*j);
               kq1:=max(kq1,2*(j+1)*(t+i+2)+t*i);
               kq1:=max(kq1,2*(t+1)*(i+j+2)+i*j);
               kq2:=min(kq2,2*(i+1)*(t+j+2)+t*j);
               kq2:=min(kq2,2*(j+1)*(t+i+2)+t*i);
               kq2:=min(kq2,2*(t+1)*(i+j+2)+i*j);
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
