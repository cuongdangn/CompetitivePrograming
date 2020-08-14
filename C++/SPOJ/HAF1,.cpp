#include <bits/stdc++.h>

using namespace std;

int n,m,a[1001][1001],d[1001][1001];
int main()
{
    scanf("%d%d",&n,&m);
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)scanf("%d",&a[i][j]);
    //////////////////////////////////////////////
    for(int i=1;i<=n;i++)d[1][i]=a[1][i];
    for(int i=2;i<=m;i++)
    {
        d[i][1]=d[i-1][1]+a[i][1];
        for(int j=2;j<=n;j++)d[i][j]=min(d[i-1][j],d[i][j-1])+a[i][j];
        d[i][n]=min(d[i][n],d[i-1][n]+a[i][n]);
        for(int j=n-1;j>=1;j--)d[i][j]=min(d[i][j],d[i][j+1]+a[i][j]);
    }
    int kq=1000000002;
    for(int i=1;i<=n;i++)
        kq=min(kq,d[m][i]);
    printf("%d",kq);
}
