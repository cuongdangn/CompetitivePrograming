const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,kq       :       longint;
        a       :       array[1..1000,1..1000] of char;
        b      :       array[1..1000,1..1000] of longint;
        c       :char;
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
        readln(f,n);
        for i:=1 to n do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;

procedure       sub3(c:char);
var     i,j     :       longint;
        st      :       array[1..1001] of longint;
        top,sl1    :       longint;
        h,lo       :       array[1..1001] of longint;
begin
        for i:=1 to n do
         for j:=1 to n do
          if a[i,j]>=c then b[i,j]:=1
          else b[i,j]:=n+1;
         ///////////////////
         for i:=1 to n do
          begin h[i]:=b[1,i]; if a[1,i]=c then lo[i]:=1 else lo[i]:=0 end;
         //////////////////
         for i:=2 to n do
          begin
                top:=0;
                sl1:=0;
                for j:=1 to n do
                 begin
                   if b[i,j]=1 then
                    begin
                        h[j]:=h[j]+1;
                        while (top>0)and(h[j]<=h[st[top]]) do begin if lo[st[top]]=1 then dec(sl1); dec(top);end;
                        if a[i,j]=c then begin kq:=kq+top;lo[j]:=1 end
                        else begin kq:=kq+sl1;lo[j]:=0; end;
                        h[j]:=1;
                        top:=0;
                        sl1:=0;
                    end
                    else
                   begin
                        if h[j]<=n then
                         begin
                                 h[j]:=h[j]+1;
                                 while (top>0)and(h[j]<=h[st[top]]) do begin if lo[st[top]]=1 then dec(sl1); dec(top);end;
                                 inc(top);
                                 st[top]:=j;
                                 sl1:=sl1+lo[j];
                         end;
                   end;
               end;
          end;
end;
begin
        mo;
        doc;
        kq:=0;
        for c:='b' to 'z' do
         sub3(c);
        writeln(g,kq);
        dong;
end.
