#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

struct bg
{
    int x,y;
};
int n,m,a[102][102],kq;
bg luu[40000];
int daobit(int i,int j)
{
    if(i+2>m||j+2>n)return 0;
    for(int x=i;x<=i+2;x++)
        for(int y=j;y<=j+2;y++)
            a[x][y]=1-a[x][y];
}
int xuly()
{
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)
            if(a[i][j]==1)
            {
                daobit(i,j);
                kq++;
                luu[kq].x=i;
                luu[kq].y=j;

            }
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)
            if(a[i][j]==1)kq=-1;
    printf("%d \n",kq);
    for(int i=1;i<=kq;i++)printf("%d %d \n",luu[i].x,luu[i].y);
}
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d %d",&m,&n);
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)
            scanf("%d",&a[i][j]);

    xuly();
}
