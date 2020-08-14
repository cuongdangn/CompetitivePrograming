#include <bits/stdc++.h>

using namespace std;

int n,d;
long long a[100005];
long long sum;
long long kq;
void solve()
{
    scanf("%d%d",&n,&d);
    sum = 0;
    for(int i=1;i<=n;i++){
        scanf("%lld",&a[i]);
        sum+=a[i];
    }
    if(sum%n != 0){
        printf("-1\n");
        return;
    }
    long long x = sum/n;
    //cout << x << endl;
    kq = 0;
    for(int i=1;i<=n-d;i++)
        if(a[i]!=x){
            kq+=abs(x-a[i]);
            if(x>a[i])
                a[i+d] -= x-a[i];
            else
                a[i+d] += a[i]-x;
                a[i]=x;
        }
    for(int i=1;i<=n;i++)
    if(a[i]!=x){
        printf("-1\n");
        return;
    }
    printf("%lld\n",kq);
}
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        solve();
    }
}

