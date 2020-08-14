#include <bits/stdc++.h>

using namespace std;

int base = 1000000007;
long long a[100005],qu[100005];
int n,m;
int l[10005],r[100005],t[100005];
int main()
{
    freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        scanf("%d%d",&n,&m);
        for(int i=1;i<=m;i++)
            scanf("%d%d%d",&t[i],&l[i],&r[i]);
        for(int i=1;i<=m+1;i++)
                qu[i]= 0 ;
        for(int i=0;i<=n+1;i++)
                a[i]= 0 ;
        for(int i=m;i>=1;i--){
            if(t[i] == 1){
                a[l[i]]=a[l[i]]+qu[i]+1;
                a[r[i]+1]=a[r[i]+1]-qu[i]-1;
            }
            else {
                for(int j=l[i];j<=r[i];j++)
                    qu[j]=(qu[j]+qu[i]+1) ;
            }
        }
        for(int i=1;i<=n;i++){
            a[i] = a[i]+a[i-1];
            printf("%lld ",a[i]);
        }
        printf("\n");
    }
}

