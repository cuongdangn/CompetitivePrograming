#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>

using namespace std;

long long n, m,ketqua, z, l, r, b, rm, ab;
long long min(long long a,long long b)
{
    if(a>b)return b;
    return a;
}
int main() {
    int Test;
    n=trunc(1e16);
    n=n*4;
    cout<<n;
    scanf("%d", &Test);
    while (Test--) {
        scanf("%lld%lld%lld%lld%lld%lld", &n, &m, &z, &l, &r, &b);
        ketqua=0;
        if (b<=n || m==1) {
            ketqua=min(n*m,z+l+r+b);
            printf("%lld\n", ketqua);
            continue;
        }
        if (z+l+r+n>=n*m) {
            ketqua=n*m;
            printf("%lld\n", ketqua);
            continue;
        }
        n-=l/m;
        n-=r/m;
        ketqua+=(l/m+r/m)*m;
        l=l%m; r=r%m;
        rm=n*m-l-r;
        ketqua=ketqua+l+r;
        if(n==1)
        ab=min((rm+1)/2+((m+1)/2)*n,b);
        ketqua+=ab+min(z,n*m+rm-ab);
        printf("%lld\n", ketqua);
    }
    return 0;
}

