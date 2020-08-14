const   finp    =       'QUANTITY.INP';
        fout    =       'QUANTITY.OUT';
var     g,f     :       text;
        a,b     :       int64;
        n,tg1,tg2,tg3,tg4       :       longint;
        tang1,tang2,tang3,tang4:array[0..9] of longint;
        lt1,lt2,lt3,lt4 :       array[0..30] of int64;
        so      :       array[1..19] of longint;
        d       :       array[1..19,0..29,0..18,0..12,0..10,false..true,false..true] of int64;
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
var     i       :       longint;
begin
        readln(f,a,b);
        lt1[0]:=1;
        lt2[0]:=1;
        lt3[0]:=1;
        lt4[0]:=1;
        for i:=1 to 10 do
         begin
          lt1[i]:=lt1[i-1]*2;
          lt2[i]:=lt2[i-1]*3;
          lt3[i]:=lt3[i-1]*5;
          lt4[i]:=lt4[i-1]*7;
         end;
        for i:=11 to 12 do
         begin
          lt1[i]:=lt1[i-1]*2;
          lt2[i]:=lt2[i-1]*3;
          lt3[i]:=lt3[i-1]*5;
         end;
         for i:=13 to 18 do
         begin
          lt1[i]:=lt1[i-1]*2;
          lt2[i]:=lt2[i-1]*3;
         end;
         for i:=19 to 29 do
         begin
          lt1[i]:=lt1[i-1]*2;
         end;
        ///
        tang1[2]:=1;
        tang1[6]:=1;
        tang2[6]:=1;
        tang1[4]:=2;
        tang1[8]:=3;
        tang2[3]:=1;
        tang2[9]:=2;
        tang3[5]:=1;
        tang4[7]:=1;
end;
function        duyet(i,t1,t2,t3,t4:longint;ok,ok1:boolean):qword;
var     dem:qword;
        cu,j,dau      :       longint;
begin
        if (t1>tg1)or(t2>tg2)or(t3>tg3)or(t4>tg4) then exit(0);
        if (t1+3*(n-i+1)<tg1)or(t2+2*(n-i+1)<tg2)or(t3+(n-i+1)<tg3)or(t4+(n-i+1)<tg4) then exit(0);
        if i=n+1 then
         begin
          if (t1=tg1)and(t2=tg2)and(t3=tg3)and(t4=tg4)and(ok1) then exit(1);
          exit(0);
         end;
        if d[i,t1,t2,t3,t4,ok,ok1]<>-1 then exit(d[i,t1,t2,t3,t4,ok,ok1]);
        dem:=0;
        if ok then cu:=9 else cu:=so[i];
        if ok1 then dau:=1 else dau:=0;
        for j:=dau to cu do
          dem:=dem+duyet(i+1,t1+tang1[j],t2+tang2[j],t3+tang3[j],t4+tang4[j],ok or (j<so[i]),ok1 or(j>0));
        d[i,t1,t2,t3,t4,ok,ok1]:=dem;
        exit(dem);
end;
procedure       init(can:qword;t1,t2,t3,t4:longint);
var     i,j,k,t,i1 :       longint;
        ok,ok1  :       boolean;
        cso     :array[1..19] of longint;
begin
         n:=0;
        while can>0 do
         begin
          inc(n);
          cso[n]:=can mod 10;
          can:= can div 10;
         end;
        ////;
        for i:=1 to n do
         so[i]:=cso[n-i+1];
         tg1:=t1;
         tg2:=t2;
         tg3:=t3;
         tg4:=t4;
        //
      for i1:=1 to n do
        for i:=0 to t1 do
         for j:=0 to t2 do
          for k:=0 to t3 do
           for t:=0 to t4 do
            for ok:=false to true do
             for ok1:=false to true do
             d[i1,i,j,k,t,ok,ok1]:=-1;
end;
function        tinh(a:int64):int64;
var     i,j,k,t :       longint;
        tg,tgg,can,dem,a1      :       qword;
begin
        dem:=0;
        a1:=trunc(sqrt(a))+1;
        for i:=0 to 29 do
        begin
         if lt1[i]>a1 then break;
         for j:=0 to 18 do
         begin
          if lt2[j]*lt1[i]>a1 then break;
          for k:=0 to 12 do
          begin
           if (lt3[k]>a1)or(lt2[j]*lt1[i]*lt3[k]>a1) then break;
           for t:=0 to 10 do
            begin
             tg:=lt1[i]*lt2[j];
             tgg:=lt3[k]*lt4[t];
              if a1<tgg then break;
             if a1<tgg*tg then can:=0
              else can:=a div (tg*tgg);
             if can=0 then break;
             init(can,i,j,k,t);
             dem:=dem+duyet(1,0,0,0,0,false,false);
            end;
           end
         end;
         end;
         exit(dem);
end;
procedure       xuly;
var     kq1,kq2 :       qword;
begin
        kq1:=tinh(a-1);
        //writeln(g,kq1);
        kq2:=tinh(b);
        writeln(g,kq2-kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



