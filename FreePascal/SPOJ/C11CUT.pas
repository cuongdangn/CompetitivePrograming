uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,kq     :       longint;
        a,x       :       array[1..4,1..4] of longint;
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
var     i,j     :       longint;
begin
        readln(f,m,n);
        for i:=1 to m do
         for j:=1 to n do read(f,a[i,j]);
end;
procedure       luu;
var     i,j,tr,sum     :       longint;
begin
        sum:=0;
        for i:=1 to m do   //ngang
         begin
          tr:=0;
          for j:=1 to n do
           if x[i,j]=0 then tr:=tr*10+a[i,j] else
            begin
             sum:=sum+tr;
             tr:=0;
            end;
           sum:=sum+tr;
          end;
          ///doc
        for j:=1 to n do
         begin
          tr:=0;
          for i:=1 to m do
           if x[i,j]=1 then tr:=tr*10+a[i,j] else
            begin
             sum:=sum+tr;
             tr:=0;
            end;
           sum:=sum+tr;
          end;
          kq:=max(kq,sum);
end;
procedure       duyet(i,j:longint);
var      ii,jj  :       longint;
begin
        if (j=1)and(i=m+1) then
         begin
          luu;
          exit;
         end;
        if j=n then begin ii:=i+1;jj:=1 end
        else begin ii:=i;jj:=j+1 end;
        x[i,j]:=0;
        duyet(ii,jj);
        x[i,j]:=1;
        duyet(ii,jj);
end;
procedure       xuly;
begin
        duyet(1,1);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.