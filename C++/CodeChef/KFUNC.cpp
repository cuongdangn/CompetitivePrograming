#include<cstdio>
#include<iostream>
#include<cmath>

using namespace std;

#define foru(i,a,b) for(int i=a;i<=b;i++)

long long l,r,tock;
int a[12],d,dd[12];
int bd,kt,ck,test;
int tongchuso(int b)
{
    int to=b;
    while(to>=10){
        b=to;
        to=0;
        while(b>0){
            to+=b%10;
            b/=10;
        }
    }
    return to;
}
long long tinh(long long x)
{
    long long kq=0;
    if(x<=kt)foru(i,1,x)kq=kq+a[i];else{
    int co=bd-1;
    //cout<<ck;
    int vt=(x-co)%ck;
   // if(vt==0)vt=ck;
    int vt1=vt+co;
    //cout<<vt1<<" ";
    long long lan=(x-co)/ck;
    foru(i,1,bd-1)kq=kq+a[i];
    foru(i,bd,vt1)kq=kq+a[i];
    kq=kq+tock*lan;
    }
    //cout<<kq<<" "<<endl;
    return kq;
}
int xuly()
{
    foru(i,1,10)dd[i]=0;
    int x=a[1];
    bd=0;kt=0;
    a[1]=tongchuso(x);
    d=tongchuso(d);
    dd[a[1]]=1;
    foru(i,2,10){
        a[i]=tongchuso(d+a[i-1]);
        if(dd[a[i]]!=0&&bd==0){
                bd=dd[a[i]];
                kt=i;
        }else dd[a[i]]=i;
    }
    tock=0;
    foru(i,bd,kt-1)tock=tock+a[i];
    ck=kt-bd;
    long long kq=tinh(r)-tinh(l-1);
    printf("%lld\n",kq);
}
int main()
{
    //freopen("codec.in","r",stdin);
    // freopen("codec1.ou","w",stdout);
    scanf("%d",&test);
    foru(i,1,test){
        scanf("%d%d%lld%lld",&a[1],&d,&l,&r);
        xuly();
    }
}

