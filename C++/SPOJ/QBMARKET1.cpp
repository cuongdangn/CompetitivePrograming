#include <bits/stdc++.h>

using namespace std;
double d[501][100001];
int n,s;
int c[501],m[501];

void doc()
{
    scanf("%d %d",&s,&n);
    for(int i=1;i<=n;i++)
        scanf("%d %d",&c[i],&m[i]);
}
int main()
{
    //freopen("code.in","r",stdin);
    doc();
    d[0][0]=1;
    for(int i=1;i<=n;i++)
        for(int j=0;j<=s;j++)
            for(int sl=0;sl<=m[i];sl++)
                if(sl*c[i]>j)break;
        else{
            d[i][j]+=d[i-1][j-sl*c[i]];
        }


    //for(int i=1;i<=n;i++)tg+=d[i][s];
   /* for(int i=1;i<=n;i++)
    {
        for(int j=0;j<=s;j++)cout<<d[i][j]<<" ";
        cout<<endl;
    }*/
    printf("%0.0f",d[n][s]);
    return 0;
}


