#include<iostream>
#include<cmath>
#include<cstdio>
#include<algorithm>

using namespace std;

int d[10001][501][2];
int n,m,a[10001];

int main()
{
   freopen("code.in","r",stdin);
    scanf("%d %d",&n,&m);
    for(int i=1;i<=n;i++)scanf("%d",&a[i]);
    ///////////////////
    for(int i=1;i<=n;i++)
    {
      d[i][1][1]=d[i-1][0][0]+a[i];
      d[i][1][0]=max(max(d[i-1][1][0],d[i-1][1][1]),max(d[i-1][2][1],d[i-1][2][0]));
      d[i][0][0]=max(d[i-1][0][0],max(d[i-1][1][0],d[i-1][1][1]));
      for(int j=2;j<=m;j++)
      {
          d[i][j][1]=d[i-1][j-1][1]+a[i];
          d[i][j][0]=max(max(d[i-1][j+1][1],d[i-1][j+1][0]),max(d[i-1][j][0],d[i-1][j][1]));
      }
    }
    printf("%d",d[n][0][0]);
}
