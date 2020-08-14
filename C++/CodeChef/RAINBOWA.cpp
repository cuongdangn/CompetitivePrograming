#include <bits/stdc++.h>

using namespace std;

int n;
int a[105];
int dd[20];
void solve()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
        scanf("%d",&a[i]);
    for(int i=1;i<=n;i++)
    if(a[i]<1 || a[i]>7){
        printf("no\n");
        return;
    }
    for(int i=1;i<=7;i++)
        dd[i]= 0 ;
    for(int i=1;i<=n;i++)
        dd[a[i]] = 1;
    for(int i=1;i<=7;i++)
    if(dd[i]==0){
        printf("no\n");
        return;
    }
    for(int i=1;i<=n/2;i++)
    if(a[i]!=a[n-i+1]){
        printf("no\n");
        return;
    }
    int m = n/2+n%2;
    for(int i=1;i<=m;i++)
    if(a[i]-a[i-1]>1 || a[i]-a[i-1]<0){
        printf("no\n");
        return;
    }
    printf("yes\n");
}
int main()
{
    //freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        solve();
    }
}
