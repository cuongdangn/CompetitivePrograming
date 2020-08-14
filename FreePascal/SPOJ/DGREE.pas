const fi='DNC.INP';
      fo='';
      bound:array [2..9] of longint=(29,18,14,12,11,10,9,9);

var   f,z:text;
      s,bit:array [0..30] of longint;
      c:array [0..30,0..30,0..1] of longint;
      a,b,k,base,dem:longint;

{+++++++++++++++++++++++++++++++}

procedure khoitao;
var i:longint;
begin
     dem:=bound[base];
     s[0]:=1;
     for i:=1 to dem do
         s[i]:=s[i-1]*base;
end;

{+++++++++++++++++++++++++++++++}

function tinh(cur,need,nho:longint):longint;
var ans:longint;
begin
     if (need>cur+1) then
        exit(0);
     if (cur=0) then
        begin
             if (need=0) or ((need=1) and (nho=1)) then
                exit(1);
             exit(bit[cur]);
        end;
     if (c[cur][need][nho]<>-1) then
        exit(c[cur][need][nho]);
     if (nho=0) then
        if (bit[cur]=0) then
           ans:=tinh(cur-1,need,0)
        else
            begin
                 ans:=tinh(cur-1,need,1);
                if (need>=1) then
                   ans:=ans+tinh(cur-1,need-1,0);
            end
     else
         begin
              ans:=tinh(cur-1,need,1);
              if (need>=1) then
                 ans:=ans+tinh(cur-1,need-1,1);
         end;
     c[cur][need][nho]:=ans;
     exit(ans);
end;

{+++++++++++++++++++++++++++++++}

function lam(x:longint):longint;
var i,u,v,w:longint;
begin
     fillchar(bit,sizeof(bit),0);
     for i:=dem downto 0 do
         if (x>=s[i]) then
            begin
               dem:=i;
               break;
            end;
            for i:=dem downto 0 do
         if (x>=s[i]) then
            begin
                 bit[i]:=1;
                 dec(x,s[i]);
            end;
     for u:=0 to 30 do
       for v:=0 to 30 do
         for w:=0 to 1 do
           c[u][v][w]:=-1;
     exit(tinh(dem,k,0));
end;

{+++++++++++++++++++++++++++++++}

begin
     assign(f,fi);
     reset(f);
     assign(z,fo);
     rewrite(z);

       readln(f,a,b,k,base);
       khoitao;
       write(z,lam(b)-lam(a-1));

     close(z);
     close(f);
end.
