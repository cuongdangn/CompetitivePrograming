#include <iostream>
#include <cstdio>
#include <cmath>

using namespace std;

int n;
long long a[101][101],tong[101],cheop;

int xuat()
{
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++) printf("%lld ",a[i][j]);
        printf("\n");
    }
}
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
    {
            scanf("%lld",&a[i][j]);
            tong[i]=tong[i]+a[i][j];
            if(i+j==n+1)cheop=cheop+a[i][j];
    }
    if(n%2==0)
    {
        long long t;
        t=0;
        for(int i=2;i<=n;i++)
            t=t+tong[1]-tong[i];
        a[1][1]=(cheop-t)/n;
        ////////////////////////
        t=tong[1]+a[1][1];
        for(int i=2;i<=n;i++)
            a[i][i]=t-tong[i];
        xuat();
    }
    else
    {
        long long t;
        t=0;
        for(int i=2;i<=n;i++)
        if(i!=(n/2+1))
            t=t+tong[1]-tong[i];
          //  cout<<t<<endl;
        a[1][1]=(cheop-t)/(n-1);
        ////////////////////////
        t=tong[1]+a[1][1];
        for(int i=2;i<=n;i++)
            a[i][i]=t-tong[i];
        xuat();
    }
}
