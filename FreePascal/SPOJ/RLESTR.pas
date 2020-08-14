const   finp    =       'RLESTR.INP';
        fout    =       'RLESTR.OUT';
type    st      =       ansistring;
var     g,f     :       text;
        s       :       st;
        sl      :       array[1..1000] of int64;
        l       :       int64;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
function       cong(a,b:st):st;
var     l1,l2,t1,t2:longint;
        kq      :       st;
        s1,s2:st;
begin
        if a='' then exit(b);
        if b='' then exit(a);
        l1:=length(a);
        s1:='';
        s2:='';
        kq:='';
        l2:=2;
        while (not((a[l1]<='z')and(a[l1]>='a')))and(l1>0) do
                begin
                        s1:=a[l1]+s1;
                        dec(l1);
                        if l1<=0 then break;
                end;
        while (not((b[l2]<='z')and(b[l2]>='a'))) do
                begin
                        s2:=s2+b[l2];
                        inc(l2);
                        if l2>length(b) then break;
                end;
        if a[l1]<>b[1] then exit(a+b)
        else
                begin
                           val(s1,t1);
                           val(s2,t2);
                           t1:=t1+t2;
                           str(t1,s1);
                           s2:=a[l1]+s1;
                           kq:=copy(a,1,l1-1)+s2+copy(b,l2,length(b)-l2+1);
                           exit(kq);
                end;
end;
procedure       cb(a:st);
var     i,j,l1       :longint;
        s2      :       st;
begin
        fillchar(sl,sizeof(sl),0);
        i:=2;
        l:=0;
        l1:=length(a);
        s:=a[1];
        while i<=length(a) do
        begin
         s2:='';
         while not((a[i]<='z')and(a[i]>='a')) do
                begin
                        s2:=s2+a[i];
                        inc(i);
                        if i>l1 then break;
                end;
                val(s2,j);
                sl[length(S)]:=j;
                l:=l+j;
                if i<length(a) then s:=s+a[i];
                inc(i);
         end;
end;
function       xoa(a:st;p,c:int64):st;
var     i,j      :        int64;
        i1      :       longint;
        kq,s1,s2,s3     :        st;
begin
        if c=0 then exit(a);
        cb(a);
         i:=sl[1];
        j:=1;
        kq:='';
        s2:='';
        s3:='';
        while i<=p-1 do
                begin
                        inc(j);
                        i:=i+sl[j];
                end;
        sl[j]:=sl[j]-(i-p)-1;
        for i1:=1 to j do
                begin
                      str(sl[i1],s1);
                      if sl[i1]>0 then s2:=s2+s[i1]+s1;
                end;
        i:=i-p+1;
        while i<=c do
                begin
                        inc(j);
                        i:=i+sl[j];
                end;
        sl[j]:=i-c;
        for i1:=j to length(s) do
                begin
                      str(sl[i1],s1);
                    if sl[i1]>0 then   s3:=s3+s[i1]+s1;
                end;
        exit(cong(s2,s3));
end;
function       copy(a:st;p,c:int64):st;
var     l1      :        int64;
        kq,s1    :        st;
begin
        cb(a);
        l1:=l;
        s1:=xoa(a,1,p-1);
        kq:=xoa(s1,c+1,l1-(c+p)+1);
        exit(kq);
end;

procedure       chen;
var     s1,s2,s3,s4,s5,kq   :       st;
        p,c     :       int64;
begin
        kq:='';
        READLN(F,s1);
        readln(f,s2);
        readln(f,p);
        cb(s1);
       if p>1 then s3:=copy(s1,1,p-1)
       else s3:='';
        s4:=copy(s1,p,l-p+1);
        s1:=cong(s3,s2);
        kq:=cong(s1,s4);
        writeln(g,'@4: ',kq);
end;
procedure       xuly;
var     s1,s2,kq   :       st;
        p,c     :       int64;
begin
        while not seekeof(f) do
                begin
                        readln(f,s);
                        case s of
                        '@1':begin
                                        readln(f,s1);readln(f,s2);
                                        writeln(g,'@1: ',cong(s1,s2));
                             end;
                        '@2':begin
                                        readln(f,s1);
                                        readln(f,c,p);
                                        writeln(g,'@2: ',xoa(s1,c,p))
                             end;
                        '@3':begin
                                        readln(f,s1);
                                        readln(f,c,p);
                                        writeln(g,'@3: ',copy(s1,c,p))
                             end;
                        '@4': chen;
                end;
                end;

end;
begin
        mo;
        xuly;
        dong;
end.
