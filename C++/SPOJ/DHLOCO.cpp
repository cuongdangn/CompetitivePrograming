#include <iostream>
#include <cstdio>
#include <cmath>

#define maxn 1000001
using namespace std;

struct matran
{
    int h[3][3];
};
int m;
long long n;
int f[maxn];
matran a,b,c;

void doc()
{
    scanf("%lld %d",&n,&m);
}
int sub1()
{
    for(int i=4;i<=n;i++)
        f[i]=(f[i-1]+f[i-2]+f[i-3])%m;
    printf("%d",f[n]);
}
matran nhan(matran a,matran b)
{
    matran c;
    for(int i=0;i<=2;i++)
        for(int j=0;j<=2;j++)
            {
                c.h[i][j]=0;
                for(int k=0;k<=2;k++)c.h[i][j]=(c.h[i][j]+a.h[i][k]*b.h[k][j])%m;
            }
    return c;
}
matran pow(matran a,long long b)
{
    matran tg;
    if(b==1)return a;
    tg=pow(a,b/2);
    tg=nhan(tg,tg);
    if(b%2==1)tg=nhan(tg,a);
    return tg;
}
void khoitao()
{
    for(int i=0;i<=2;i++)
        for(int j=0;j<=2;j++)
        {
            a.h[i][j]=0;
            b.h[i][j]=0;
            c.h[i][j]=0;
        }
    a.h[0][0]=1;
    a.h[0][1]=2;
    a.h[0][2]=4;
    b.h[1][0]=1;
    b.h[2][1]=1;
    for(int i=0;i<=2;i++)b.h[i][2]=1;
    c=pow(b,n-3);
    a=nhan(a,c);
    printf("%d",a.h[0][2]);
}
void sub2()
{
   khoitao();
}
int main()
{
   // freopen("code.in","r",stdin);
    doc();
    f[1]=1;
    f[2]=2;
    f[3]=4;
    if(n<=maxn)sub1();else
        sub2();
    return 0;
}
