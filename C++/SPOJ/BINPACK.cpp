#include <iostream>
#include <cstdio>
#include <algorithm>

#define maxn 10005
using namespace std;

int l,n,a[maxn],b[maxn];
int kq;

void doc()
{
   scanf("%d %d",&l,&n);
   for(int i=1;i<=n;i++)
        scanf("%d",&a[i]);
}
bool cmp(int i,int j)
{
    return i>j;
}
int tham()
{
    kq=1;
    for(int i=1;i<=n;i++)
    {
        bool ok=false;
        for(int j=1;j<=kq;j++)
            if(l-b[j]>=a[i])
            {
                b[j]=b[j]+a[i];
                ok=true;
                break;
            }
        if(!ok)
        {
            kq++;
            b[kq]=a[i];
        }
    }
    printf("%d",kq);
}
int main()
{
    doc();
    sort(a+1,a+n+1,cmp);
    tham();
}
