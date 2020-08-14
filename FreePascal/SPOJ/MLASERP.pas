const   finp    =       '';
        fout    =       '';
        maxn    =       100;
        dx      :       array[1..4] of shortint=(1,0,-1,0);
        dy      :       array[1..4] of shortint=(0,1,0,-1);
var     g,f     :       text;
        qx,qy   :       array[1..100000] of longint;
        n,m,s,t,p,q,cuoi,fi     :       longint;
        a       :       array[0..101,0..101] of char;
        h       :       array[0..101,0..101] of longint;
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
procedure       push(x,y:longint);
begin
        inc(cuoi);
        qx[cuoi]:=x;
        qy[cuoi]:=y;
end;
procedure       doc;
var     i,j       :       longint;
        kt      : boolean;
begin
        kt:=true;
        readln(f,n,m);
        for i:=1 to m do
         begin
                for j:=1 to n do
                begin
                read(f,a[i,j]);
                if (a[i,j]='C')and(kt=true) then
                begin
                p:=i;
                q:=j;
                kt:=false;
                end
                else  if (a[i,j]='C')and(kt=false) then
                begin
                        s:=i;
                        t:=j;
                end;
                end;
                readln(f);
         end;
          for i:=0 to n+1 do
                begin
                        a[0,i]:='*';
                        a[m+1,i]:='*';
                end;
                 for i:=0 to m+1 do
                begin
                        a[i,0]:='*';
                        a[i,n+1]:='*';
                end;

end;
procedure       xuat;
begin
        writeln(g,h[s,t]-2);
        dong;
        halt;
end;

procedure       go(u,v,k:longint);
var     x,y     :       longint;
begin
        x:=u;
        y:=v;
        while a[x,y]<>'*' do
                begin
                        if (h[x,y]=0) then
                                begin
                                        h[x,y]:=h[u,v]+1;
                                        a[x,y]:='1';
                                        push(x,y);
                                end;
                        if a[x,y]='*' then exit;
                        if (x=s)and(y=t) then xuat;
                        x:=x+dx[k];
                        y:=y+dy[k];
                end;
end;

procedure       xuly;
var i,j,k,x,y,u,v:longint;
begin
     a[p,q]:='1';
     fi:=1;cuoi:=0;
     push(p,q);
     while fi<=cuoi do
           begin
           x:=qx[fi];
           y:=qy[fi];
           inc(fi);
           for k:=1 to 4 do go(x,y,k);
           end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

