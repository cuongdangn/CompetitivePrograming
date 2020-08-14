#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int t,kq1,kq2,n,x;
int a[10001];

int main()
{
    scanf("%d",&t);
    for(int k=1;k<=t;k++)
    {
        scanf("%d",&n);
        kq2=0;
        for(int i=1;i<=10000;i++)a[i]=0;
        for(int i=1;i<=n;i++){scanf("%d",&x);a[x]+=1;}
        for(int i=1;i<=10000;i++)
            if(a[i]>kq2)
        {
            kq2=a[i];
            kq1=i;
        }
        printf("%d %d\n",kq1,kq2);
    }
}
