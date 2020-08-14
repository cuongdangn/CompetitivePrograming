#include<bits/stdc++.h>

using namespace std;

#define maxx 100000000000
long long c[1002][1002];
int n,m;
long long d[1002][1002][2];
int doc()
{
    scanf("%d%d",&m,&n);
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)scanf("%lld",&c[i][j]);
}
int xuly()
{

    for(int i=1;i<=m;i++){
            d[i][0][1]=maxx;
        for(int j=1;j<=n;j++){
            d[0][j][0]=maxx;
            d[i][j][0]=min(d[i-1][j][0],d[i-1][j][1]+c[i][j]);
            d[i][j][1]=min(d[i][j-1][1],d[i][j-1][0]+c[i][j]);
    }
    }
    printf("%lld\n",min(d[m][n][1],d[m][n][0]));
}
int main()
{
    //freopen("code.in","r",stdin);
    int t;
    scanf("%d",&t);
    while(t--){
        doc();
        xuly();
    }
}
