#include<iostream>
#include<cstdio>
#include<algorithm>

using namespace std;

#define maxn 1000005
int n,k;
int a[maxn],d[maxn],q[maxn];
int dau,cuoi;

int push(int x)
{
    while(cuoi>=dau&&((d[q[cuoi]]>d[x])||(d[q[cuoi]]==d[x]&&a[x]>=a[q[cuoi]])))cuoi--;
    cuoi++;
    q[cuoi]=x;
}
int xuly()
{
    dau=1;
    cuoi=0;
    for(int i=1;i<=n;i++)d[i]=0;
    push(1);
    for(int i=2;i<=n;i++){
        while(q[dau]<i-k&&dau<=cuoi)dau++;
        int j=q[dau];
        d[i]=d[j];
       // cout<<i<<" "<<j<<endl;
        if(a[i]>=a[j])d[i]+=1;
        push(i);
    }
    printf("%d\n",d[n]);
}
int main()
{
    //freopen("code.in","r",stdin);
    //freopen("code.ou","w",stdout);
    scanf("%d",&n);
    for(int i=1;i<=n;i++)scanf("%d",&a[i]);
    int t;
    scanf("%d",&t);
    for(int i=1;i<=t;i++){
        scanf("%d",&k);
        xuly();
    }
}
