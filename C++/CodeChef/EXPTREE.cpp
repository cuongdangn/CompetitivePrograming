#include <bits/stdc++.h>

using namespace std;

const long long mod1 = 1000000007;
const long long mod2 = 1000000009;

long long n;

long long GCD(long long a,long long b)
{
    if(a==0)
        return b;
    while(a>0){
        long long tmp = a;
        a = b%a;
        b = tmp;
    }
    return b;
}
long long power(long long a,long long b,long long mod)
{
    if(b==0) return 1;
    if(b==1) return a% mod;
    long long tg = power(a,b/2,mod);
    tg = (tg*tg) % mod;
    if(b%2==1)
        tg = (tg*a)%mod;
    return tg;
}
int main()
{
   // freopen("codec.in","r",stdin);
    int Test;
    scanf("%d",&Test);
    while(Test--){
        scanf("%lld",&n);
        if(n==1){
            printf("0 0\n");
            continue;
        }
        if(n==2){
            printf("1 1\n");
            continue;
        }
        long long x = n;
        long long y = n-1;
        long long z = 2*n-3;
        if(x%2 == 0) x = x/2;
            else
                y = y/2;
        long long xx = GCD(z,x);
        x = x/xx;
        z = z/xx;
        xx = GCD(z,y);
        y = y / xx;
        z = z / xx;
        long long tu = ((x % mod1)*(y%mod1))%mod1;
        long long mau = power(z%mod1,mod1-2,mod1);
        printf("%lld ",(tu*mau) % mod1);
        tu = ((x % mod2)*(y%mod2))%mod2;
        mau = power(z%mod2,mod2-2,mod2);
        printf("%lld\n",(tu*mau) % mod2);
    }
}
