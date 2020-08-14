var     kq,kq1      :       double;
        n       :       int64;
        c       :       string;
begin
        readln(c);
        while c<>'[END]' do
                begin
                        readln(n);
                        kq:=(5*(5*n-5)*(5*n-5)+1)*n;
                        kq1:=5*n*(5*n-1)*(5*n-2)*(5*n-3)*(5*n-4)/120;
                        kq:=kq/kq1;
                        writeln(kq:0:10);
                        readln;
                        readln(c);
                end;
end.
