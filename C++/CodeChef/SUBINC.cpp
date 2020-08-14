#include<cstdio>
#include<iostream>

using namespace std;

int n,a[100021];
long long tinh(int n)
{
    return (long long)(n+1)*n/2;
}
int main()
{
   // freopen("codec.in","r",stdin);
    int t;
    scanf("%d",&t);
    for(int tt=1;tt<=t;tt++){
            long long kq=0;
            scanf("%d",&n);
            for(int i=1;i<=n;i++)
                scanf("%d",&a[i]);
            int i=1;
            while(i<=n){
                int j=i+1;
                while(a[j]>=a[j-1]&&j<=n)j++;
                j=j-1;
               // cout<<tt<<" "<<i<<" "<<j<<endl;
                kq+=tinh(j-i+1);
                i=j+1;
            }
            printf("%lld\n",kq);
    }

    return 0;
}
