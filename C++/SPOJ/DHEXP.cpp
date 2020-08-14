#include <bits/stdc++.h>

using namespace std;

int a[100005],n,k;
long long kq;
int main()
{
    scanf("%d%d",&n,&k);
    for(int i=1;i<=n;i++)scanf("%d",&a[i]);
    k=n-1-k;
    sort(a+2,a+n+1);
    kq=a[1];
    for(int i=2;i<=k+1;i++)kq-=a[i];
    for(int i=k+2;i<=n;i++)kq+=a[i];
    printf("%lld",kq);
}
