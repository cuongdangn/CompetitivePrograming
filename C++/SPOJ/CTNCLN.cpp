#include <iostream>
#include <cmath>
#include <cstdio>

using namespace std;

#define maxn 40005

int n,m,cann;
int vt[204],dp[maxn],a[maxn],dd[maxn];
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d %d",&n,&m);
    for(int i=1;i<=n;i++) scanf("%d",&a[i]);
    /////////
    for(cann=1;cann*cann<=n;cann++);
    cann--;
    for(int i=1;i<=m;i++)dd[i]=-1;
  /*  dp[1]=1;
    dd[a[1]]=1;
    vt[1]=1;*/
    vt[0]=1;
    for(int i=1;i<=n;i++)
    {
        int k=dd[a[i]];
        int j;
        for(j=0;(j<=cann)&&(vt[j]-1!=k) ;j++);
        for(j--;j>=0;j--)vt[j+1]=vt[j];//cout<<j<<" ";}
        //cout<<"\n";
        vt[0]=i+1;
        dp[i]=i;

        for(j=1;j<=cann;j++)
            dp[i]=min(dp[i],dp[vt[j]-1]+j*j);
        dd[a[i]]=i;
    }
    printf("%d",dp[n]);

    return 0;
}

