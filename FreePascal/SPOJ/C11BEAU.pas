uses    math;
var    ca,cb,ma,mb,kq      :       int64;
procedure   xuly;
begin
        readln(ca,cb,ma,mb);
        kq:=0;
        if (ca=0)or(ma=0) then kq:=min(mb,cb)
        else if (cb=0)or(mb=0) then kq:=min(ma,ca)
        else
                begin
                     if ca<cb then
                                kq:=ca+ca+1+min(cb-ca-1,(mb-1)*(ca+1))
                     else   if ca>cb then kq:=cb+cb+1+min(ca-cb-1,(ma-1)*(cb+1))
                     else kq:=ca+cb;
                end;
        writeln(kq);
end;
procedure       doc;
var     i,t     :       longint;
begin
        readln(t);
        for i:=1 to t do xuly;
end;
begin
        doc;
end.
