#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int n,a[1000010];
int t;

int main()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
        scanf("%d",&t);
        a[t]+=1;
    }
    for(int i=0;i<=1000000;i++)
    {
        while(a[i]>0)
        {
            printf("%d\n",i);
            a[i]=a[i]-1;
        }
    }
    return 0;
}
