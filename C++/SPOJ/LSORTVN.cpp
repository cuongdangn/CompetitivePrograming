#include<iostream>
#include<cmath>
#include<algorithm>
#include<cstdio>


using namespace std;

int tr[1001][1001],sa[1001][1001],d[1001][1001];
int n, pos[1001];
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
        int t;
        scanf("%d",&t);
        pos[t]=i;
    }
    for(int i=1;i<=n-1;i++)
        for(int j=i+1;j<=n;j++)
    {
         tr[i][j]=tr[i][j-1];
         if(pos[i]>pos[j])tr[i][j]+=1;
    }
    for(int j=n;j>1;j--)
        for(int i=j-1;i>0;i--)
    {
          sa[i][j]=sa[i+1][j];
          if(pos[i]<pos[j])sa[i][j]+=1;
    }
    //////////////////////////////
    /////////////////////////////
    for(int l=1;l<=n;l++)
        for(int i=1;i<=n-l+1;i++)
        {
            int j=i+l-1;
            d[i][j]=min(d[i+1][j]+(pos[i]-tr[i][j])*l,d[i][j-1]+(pos[j]-sa[i][j])*l);
        }
    printf("%d",d[1][n]);
    return 0;
}
