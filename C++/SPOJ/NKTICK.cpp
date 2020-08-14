#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

const int maxx=2*trunc(1e9);
int dp[60010][2],n;
int a[60010],b[60010];

int main()
{
    cin>>n;
    for(int i=1;i<=n;i++)cin>>a[i];
    for(int i=1;i<=n-1;i++)cin>>b[i];
    dp[1][0]=maxx;
    dp[1][1]=a[1];
    for(int i=2;i<=n;i++)
    {
        dp[i][1]=min(dp[i-1][0],dp[i-1][1])+a[i];
        dp[i][0]=dp[i-1][1]+b[i-1]-a[i-1];
    }
    cout<<min(dp[n][0],dp[n][1]);
    return 0;
}
