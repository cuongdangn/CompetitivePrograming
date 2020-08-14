#include <bits/stdc++.h>

#define ii pair<int, int>
using namespace std;

const int N = 100004;
struct bg {
    int d,t;
    int w;
};
ii b[N];
bg a[N];
priority_queue<ii> qu;
int n,m;
int input()
{
    scanf("%d%d",&n,&m);
    for(int i=1;i<=n;i++){
        scanf("%d%d%lld",&a[i].d,&a[i].t,&a[i].w);
        b[i] = ii(a[i].d,i);
    }
    sort(b+1,b+n+1);

}
int solve()
{
    int j = 1;
    for(int d=1;d<=m;d++){
            //cout << 1;
        while(j<=n && b[j].first==d){
            int i = b[j].second;
            qu.push(ii(a[i].w,i));
            j++;
        }
        if(!qu.empty()){
            ii tmp = qu.top();
            int i = tmp.second;
            a[i].t -=1;
            if(a[i].t==0)
                qu.pop();
        }
    }

    long long kq = 0;
    while(!qu.empty()){
        ii tmp = qu.top();
        qu.pop();
        int i = tmp.second;
        kq = kq+(long long)a[i].t*a[i].w;
    }
    printf("%lld\n",kq);
}
int main()
{
   // freopen("codec.in","r",stdin);
    int T;
    scanf("%d",&T);
    while(T--){
        //scanf("%d%d",&n,&m);
        input();
        solve();
    }
}
