#include<iostream>
#include<cmath>
#include<queue>
#include<cstdio>

using namespace std;

int d[501][100001];
int n,s;
int c[501],m[501];

void doc()
{
    scanf("%d %d",&s,&n);
    for(int i=1;i<=n;i++)
        scanf("%d %d",&c[i],&m[i]);
}
int tinh(int i,int ss)
{

    if(i==n+1)
        if (s==ss)return 1;else return 0;
    if(d[i][ss]!=-1)return d[i][ss];
    int dem=0;
    for(int j=0;j<=m[i];j++)
        if(ss+c[i]*j>s)break;
    else
    {
        dem=dem+tinh(i+1,ss+c[i]*j);
         //cout<<i<<endl;
    }
        d[i][ss]=dem;
        //cout<<i<<" "<<dem<<endl;
        return dem;

}
int main()
{
    //freopen("code.in","r",stdin);
    doc();
    for(int i=1;i<=n;i++)
        for(int j=0;j<=s;j++)d[i][j]=-1;
    int tg=tinh(1,0);
    printf("%d",tg);
    return 0;
}

