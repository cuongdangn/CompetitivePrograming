const   finp    =       'SSDJ.INP';
        fout    =       '';
var     g,f     :       text;
        n,kq       :       longint;
        a       :       array[1..1000,1..1000] of char;
        d       :       array[1..51,1..51,1..51,1..51] of char;
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
function        max(a,b:char):char;
begin
        if a>b then exit(a) else exit(b);
end;
procedure       init(x,y        :       longint);
var     i,j     :       longint;
begin
        d[x,y,x,y]:=a[x,y];
        for i:=x+1 to n do
          d[x,y,i,y]:=max(d[x,y,i-1,y],a[i,y]);
        for j:=y+1 to n do
          d[x,y,x,j]:=max(d[x,y,x,j-1],a[x,j]);
        for i:=x+1 to n do
         for j:=y+1 to n do
           d[x,y,i,j]:=max(max(d[x,y,i-1,j],d[x,y,i,j-1]),a[i,j]);
end;
procedure       xuly_sub1;
var     i,j,k,t     :       longint;
begin
        for i:=1 to n do
         for j:=1 to n do
           init(i,j);
         for i:=1 to n do
          for j:=1 to n do
           for k:=i to n do
            for t:=j to n do
             if (k-i+1>=2)and(t-j+1>=2) then
             if (a[i,j]>d[i+1,j,k,t-1])and(a[k,t]>d[i,j+1,k-1,t])and(a[i,j]>d[i,j+1,k-1,t])and(a[k,t]>d[i+1,j,k,t-1]) then

               inc(kq);
           writeln(g,kq);
end;
procedure       sub2;
var     i,j     :       longint;
        st      :       array[1..1001] of longint;
        top,kq     :       longint;
        h       :       array[1..1001] of longint;
begin
        kq:=0;
        for i:=1 to n do
          if a[1,i]='b' then h[i]:=1
          else h[i]:=0;
        for i:=2 to n do
         begin
          top:=0;
          for j:=1 to n do
           if a[i,j]='b' then
           begin
              if h[j]<>0 then
              begin
              h[j]:=h[j]+1;
              while (top>0)and(h[j]<=st[top]) do dec(top);
              end;
              h[j]:=1;
              kq:=kq+top;
              top:=0;
            end
           else
            begin
              if h[j]<>0 then
              begin
              h[j]:=h[j]+1;
              while (top>0)and(h[j]<=st[top]) do dec(top);
              inc(top);
              st[top]:=h[j];
              end;
            end;
          end;
          writeln(g,kq);
end;
procedure       sub3(c:char);
var     i,j     :       longint;
        st      :       array[1..1001] of longint;
        top    :       longint;
        h       :       array[1..1001] of longint;
begin
        for i:=1 to n do
          if a[1,i]>=c then h[i]:=1
          else h[i]:=0;
        for i:=2 to n do
         begin
          top:=0;
          for j:=1 to n do
           if a[i,j]=c then
           begin
              if h[j]<>0 then
              begin
              h[j]:=h[j]+1;
              while (top>0)and(h[j]<=st[top]) do dec(top);
              end;
              h[j]:=1;
              kq:=kq+top;
              top:=0;
            end
           else
            begin
              if h[j]<>0 then
              begin
              h[j]:=h[j]+1;
              while (top>0)and(h[j]<=st[top]) do dec(top);
              inc(top);
              st[top]:=h[j];
              end;
            end;
          end;
end;



begin
        mo;
        doc;
        kq:=0;
        if n <=50 then xuly_sub1 else
        begin
        for c:='b' to 'z' do sub3(c);
        writeln(g,kq);
        end;
        dong;
end.
