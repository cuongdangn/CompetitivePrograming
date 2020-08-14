#include<iostream>
#include<cmath>
#include<cstdio>
#include<string>
#include<cstdlib>

using namespace std;

const int coso=10000000;
const int sl  = 7;
struct bignum
{
    int cs[51];
    int slcs;
};
bignum kq;
int t,n;

bignum nhan(bignum a,int x)
{
    bignum tg;
     for(int j=1;j<=50;j++)tg.cs[j]=0;
    int n=a.slcs;

    int nho=0;
    for(int i=1;i<=n;i++)
    {
        int sum=nho+a.cs[i]*x;
        tg.cs[i]=sum%coso;
        nho=sum/coso;
    }
    while(nho>0)
    {
        n+=1;
        tg.cs[n]=nho%coso;
        nho=nho/coso;
    }
    tg.slcs=n;

    return tg;
}
void xuat()
{
    int m=kq.slcs;
    printf("%d",kq.cs[m]);
    for(int i=m-1;i>=1;i--)
    {
        int tt=kq.cs[i];
        int m1=0;
        if(tt==0)m1=1;else{
        while(tt>0){m1=m1+1;tt=tt/10;}}
        while(m1<sl)
        {
            cout<<0;
            m1=m1+1;
        }
        cout<<kq.cs[i];
    }
    cout<<endl;
}
int main()
{
   // freopen("codec.in","r",stdin);
    //freopen("codec.out","w",stdout);
    scanf("%d",&t);
    for(int i=1;i<=t;i++)
    {
        scanf("%d",&n);
        kq.slcs=1;
        for(int j=1;j<=50;j++)kq.cs[j]=0;

        kq.cs[1]=1;

        for(int j=1;j<=n;j++)
            kq=nhan(kq,j);
           // cout<<kq.slcs<<endl;
        xuat();
    }
}
