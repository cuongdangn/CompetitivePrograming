#include <bits/stdc++.h>

using namespace std;

#define foru(i,a,b) for(int i=a;i<=b;i++)
#define x first
#define y second
const int oo = 10000000000;
int t,n,m,k;
long long a[102][102];
int s[10000],d[10000],e[10000];
long long f[10000][2];

void Floyd()
{
    foru(k1,1,n)
        foru(i,1,n)
            foru(j,1,n)
            if(a[i][k1]<oo&&a[k1][j]<oo)
            if(a[i][k1]+a[k1][j]<a[i][j]){
                a[i][j]=a[i][k1]+a[k1][j];
            }
}
void input()
{
    scanf("%d%d%d",&n,&m,&k);
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
        if(i!=j)
            a[i][j]=oo;
        else
            a[i][j] = 0;
    for(int i=1;i<=m;i++){
        int u,v;
        long long w;
        scanf("%d%d%lld",&u,&v,&w);
        a[u][v] = w;
        a[v][u] = w;
    }
    Floyd();
    for(int i=1;i<=k;i++)
        scanf("%d%d",&s[i],&d[i]);
    f[1][0] = a[1][s[1]] + a[s[1]][d[1]];
    f[1][1] = a[1][s[1]];
    e[1] = s[1];
    s[0]=1;
    d[0]=1;
    for(int i = 2;i<=k;i++){
       f[i][0] = min(f[i-1][1]+a[e[i-1]][s[i]]+a[s[i]][d[i-1]]+a[d[i-1]][d[i]],f[i-1][0]+a[d[i-1]][s[i]]+a[s[i]][d[i]]);
       f[i][0] = min(f[i][0],f[i-2][0]+a[d[i-2]][s[i-1]]+a[s[i-1]][s[i]]+a[s[i]][d[i-1]]+a[d[i-1]][d[i]]);
       f[i][1] = f[i-1][0]+a[d[i-1]][s[i]];
       e[i]=s[i];
       long long tt = min(f[i-1][1]+a[e[i-1]][s[i]] + a[s[i]][d[i-1]],f[i-2][0]+a[d[i-2]][s[i-1]]+a[s[i-1]][s[i]]+a[s[i]][d[i-1]]);
       if(tt<f[i][1]){
            e[i]=d[i-1];
            f[i][1] = tt;
       }
    }
  //  for(int i=1;i<=k;i++)
    //    cout << f[i]<<" ";
    //cout <<endl;
    if(f[k][0]>=oo) printf("-1\n");
        else
            printf("%lld\n",f[k][0]);
}
int main()
{
    freopen("manic_moving.txt","r",stdin);
    freopen("ans.txt","w",stdout);
    scanf("%d",&t);
    for(int i=1;i<=t;i++){
        printf("Case #%d: ",i);
        input();
//        solve();
    }
}
