#include <iostream>
#include <cstdio>
#include <cmath>

using namespace std;

#define base 1000000007;
int n,m,k,kq;
int c[10002][10002];
int g[10002];
long long f[10002][10002],s[10002];

int main()
{
    scanf("%d %d %d",&n,&m,&k);
    c[0][0]=1;
    for(int i=1;i<=n;i++)
    {
        int t;
        t=min(i-1,m-1);
        c[0][i]=1;
        c[i][i]=1;
        for(int j=1;j<=t;j++)c[j][i]=(c[j-1][i-1]+c[j][i-1])%base;
    }
    for(int i=1;i<=n;i++)
    {
        int t;
        t=min(i,m-1);
        for(int j=0;j<=t;j++)g[i]=(g[i]+c[j][i])%base;
    }
    //for(int i=1;i<=n;i++)cout<<g[i]<<" ";
    ////////////
    for(int i=1;i<=n;i++)
    {
        f[i][0]=g[i-1];
        cout<<i<<" "<<0<<" "<<g[i-1]<<endl;
        s[i]=f[i][0];
        kq=(kq+f[i][0])%base;
        for(int j=1;j<=i-1;j++)
        {
            f[i][j]=s[min(j,i-k)]*g[i-j-1]%base;
            cout<<i<<" "<<j<<" "<<f[i][j]<<endl;
            kq=(kq+f[i][j])%base;
            s[i]=(s[i]+f[i][j])%base;
        }
    }
        printf("%d",kq);

}

