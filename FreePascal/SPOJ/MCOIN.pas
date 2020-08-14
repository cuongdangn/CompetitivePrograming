var     gt      :       array[0..1000005] of byte;
        i,k,l,m,n:longint;
begin
        gt[0]:=1;
        readln(k,l,m);
        for i:= 1 to 1000005 do
                begin
                        gt[i]:=1;
                        if (i-1 >=0)and(gt[i-1]=1)then gt[i]:=0;
                        if(i-k>=0)and(gt[i-k]=1) then gt[i]:=0;
                        if (i-l>=0)and(gt[i-l]=1) then gt[i]:=0;
                end;
        for i:=1 to m do
                begin
                        read(n);
                        if gt[n]=1 then write('B')
                        else write('A');
                end;
end.
