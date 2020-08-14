#include <bits/stdc++.h>

using namespace std;

typedef pair<long long ,int> ii;
#define maxn 1006
#define maxm 100005
#define maxx 200000000009
struct ca
{
    int v;
    long long w;
}can[maxm];
long long d[maxn];
int n,m,t;
vector<int> ke[maxn];


int doc()
{
    int u;
    scanf("%d%d",&n,&m);
    for(int i=1;i<=n;i++)ke[i].resize(0);
    for(int i=1;i<=m;i++){
        scanf("%d%d%lld",&u,&can[i].v,&can[i].w);
        ke[u].push_back(i);
    }
}
long long tinh(int x)
{
   priority_queue<ii> qu;
    for(int i=1;i<=n;i++)d[i]=maxx;
    qu.push(ii(0,x));
    d[x]=0;
    int u;
    long long w;
    while(qu.size()){
        ii top=qu.top();
        qu.pop();
         u=top.second;
        w=-top.first;
         if(w!=d[u])continue;
         if(d[x]==0)d[x]=maxx;
         if(u==x&&d[x]!=maxx)return w;
        for(int i=0;i<ke[u].size();i++)
        {
            int c=ke[u][i];
            if(d[can[c].v]>w+can[c].w)
            {
                d[can[c].v]=w+can[c].w;
                qu.push(ii(-d[can[c].v],can[c].v));
            }
        }

    }
    return -1;
}
int xuly()
{
    for(int i=1;i<=n;i++)printf("%lld\n",tinh(i));
}
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d",&t);
    while(t--){
        doc();
        xuly();
    }

}
