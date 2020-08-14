#include <iostream>
#include <cstdio>
#include <cmath>

using namespace std;

#define base 100003
long long x[base],ng[base],n1,m1;
int K[4],N[4];
/*int checnt()
{
    for(int i=2;i<base;i++)
        if(base%i==0)
        {
            cout<<1;
            return 0;
        }
        cout<<0;
}*/
int timdu(int a) // tim nghiem nguyen a*x+base*y=1
{
    int n,m,r,q;
    int xn,yn,xm,ym,xr,yr;
    n=a; xn=1; yn=0;
    m=base; xm=0; ym=1;
    while (n!=0)
    {
        q=m/n;

        r=m%n;
        xr=xm-q*xn;
        yr=ym-q*yn;

        m=n;
        xm=xn;
        ym=yn;

        n=r;
        xn=xr;
        yn=yr;
    }
    return (xm+base)%base;
}
int khoitaox()
{
    x[0]=1;
    x[1]=1;
    for(int i=2;i<base;i++)x[i]=(x[i-1]*i)%base;
}
int khoitaonguoc()
{
    ng[0]=1;
    ng[1]=1;
    for(int i=2;i<base;i++)
        ng[i]=(ng[i-1]*timdu(i))%base;
}
int init()
{
    khoitaox();
    khoitaonguoc();
}
int C(int k,int n)
{
    if(k==n)return 1;
    if(k>n)return 0;
    int kq;
    //cout<<x[n]<<" "<<ng[k]<<" "<<ng[n-k]<<endl;
    kq=((x[n]*ng[k])%base*ng[n-k])%base;
    return kq;
}
int xuly(long long k,long long n)
{
    if(n<k)return 0;
    if(n==k)return 1;
    for(int i=0;i<=3;i++)
    {
        K[i]=0;
        N[i]=0;
    }
    int i=0;

    while(k!=0) // khoi tao k
    {
        K[i]=k%base;
        k=k/base;
        i+=1;
    }
    i=0;
    while(n!=0) // khoi tao n
    {
        N[i]=n%base;
        n=n/base;
        i+=1;
    }
    //for(int i=0;i<=3;i++)cout<<K[i]<<" "<<N[i]<<endl;
    long long kq=1;
    for(int i=0;i<=3;i++)
        kq=(kq*C(K[i],N[i]))%base;
    return kq;

}
int main()
{
    int t;
    //freopen("code.in","r",stdin);
    init();
    scanf("%d",&t);
    for(int i=1;i<=t;i++)
    {
        scanf("%lld %lld",&m1,&n1);
        printf("%d \n",xuly(n1,m1-n1+1));
    }
    //checnt();
    return 0;
}
