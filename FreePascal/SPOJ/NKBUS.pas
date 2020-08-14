Const          finp='';
               fout='';
Type            mat=array[1..1000000] of longint;
Var     a,b:mat;
        i:longint;
        res,tong,n,m,k:int64;
        fi,fo:text;

Procedure   Doc;
Var     i,tg,tg1,j,cs:longint;
Begin
                Assign(fi,finp);
                Reset(fi);
                Read(fi,n,m);
                k:=0;
                While not seekeof(fi) do
                        Begin
                                inc(k);
                                Read(fi,a[k]);
                        end;
                tong:=0;
                i:=1;
                tg1:=0;
                cs:=0;
                While i<=k do
                        Begin
                                tong:=tong+a[i];
                                inc(i);
                                tg:=i+a[i]+1;
                                for j:=i+1 to tg-1 do
                                       Begin
                                        inc(cs);
                                        b[cs]:=a[j]-tg1;
                                       end;
                                tg1:=tg1+a[i-1];
                                i:=tg;
                        end;
                k:=cs;
                Close(fi);
end;


Function Check(x:longint):boolean;
        Var    dem:longint;
        Begin
                dem:=0;
                For i:=1 to k do
                        If b[i]<=x then inc(dem);
                If dem>=m then exit(true);
                exit(false);
        end;

Procedure Lam;
        Var   l,mid,r:longint;
        Begin
                l:=0;
                r:=maxlongint;
                res:=0;
                While l<=r do
                        Begin
                                mid:=(l+r) div 2;
                                If Check(mid) then
                                        Begin
                                                res:=mid;
                                                r:=mid-1;
                                        end
                                Else l:=mid+1;
                        end;
        end;

Begin
        Doc;
        Lam;
        Assign(fo,fout);
        Rewrite(fo);
        Write(fo,res+tong);
        Close(fo);
end.

