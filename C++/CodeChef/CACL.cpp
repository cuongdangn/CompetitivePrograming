#include <bits/stdc++.h>

using namespace std;

long long n,b;
long long d[9] = {-2,-1,0,1,2};
long long ma;
int main()
{
    int TestCase;
   //freopen("codec.in","r",stdin);
    //freopen("codec.out","w",stdout);
    scanf("%d",&TestCase);
    while(TestCase--){
        ma = 0;
        scanf("%lld%lld",&n,&b);
        long long y = (n/(2*b));
        for(int i=0;i<5;i++){
            long long yy = y + d[i];
            long long xx = n-b*yy;
            if(yy<0 || xx<0) continue;
            ma = max(ma,xx*yy);
        }
        printf("%lld\n",ma);
    }
}


