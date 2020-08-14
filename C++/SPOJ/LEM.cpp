#include<bits/stdc++.h>

using namespace std;

struct bg
{
    int x,y;
}a[1002],b[1002];
int n,m;
double kq;
double kc(int i)
{
    int j=i-1;
    return sqrt((a[i].x-a[j].x)*(a[i].x-a[j].x)+(a[i].y-a[j].y)*(a[i].y-a[j].y));
}
int main()
{
    freopen("code.in","r",stdin);
    kq=10000000000;
    scanf("%d%d",&n,&m);
    for(int i=1;i<=n;i++)scanf("%d%d",&a[i].x,&a[i].y);
    for(int i=1;i<=m;i++)scanf("%d%d",&b[i].x,&b[i].y);
    for(int i=1;i<=n;i++)
        for(int j=1;j<=m;j++){
                kq=min(kq,sqrt((a[i].x-b[j].x)*(a[i].x-b[j].x)+(a[i].y-b[j].y)*(a[i].y-b[j].y)));
                if(i>2)kq=min(kq,abs(b[j].x*(a[i].y-a[i-1].y)+b[j].y*(a[i-1].x-a[i].x)+a[i-1].x*(a[i-1].y-a[i].y)+a[i-1].y*(a[i].x-a[i-1].x))/kc(i));
        }
    printf("%0.3f",kq);
}
