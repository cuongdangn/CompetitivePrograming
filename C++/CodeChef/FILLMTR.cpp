#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>
int n,q;

map<ii,int> mm;
bool ok;
vector<ii> ke[100005];
bool visit[100005];
int d[100005];
void input()
{
    int u,v,t;
    mm.clear();
    scanf("%d%d",&n,&q);
    for(int i=1;i<=n;i++)
        ke[i].clear();
    for(int i=1;i<=q;i++){
        scanf("%d%d%d",&u,&v,&t);
        ii tmp = ii(v,u);
        if(mm[tmp] != 0 && mm[tmp]!=t+1 ){
            ok = false;
        }
        if(u==v){
            if(t!=0)
                 ok = false;
        }
        else {
            if(mm[tmp]==0){
                mm[tmp]=t+1;
                ke[u].push_back(ii(v,t));
                ke[v].push_back(ii(u,t));
            }
        }
    }
}
int DFS(int u,int t)
{
    d[u] = t;
    visit[u] = true;
    int m = ke[u].size();
    for(int i=0;i<m;i++){
        int v = ke[u][i].first;
        int t1 = ke[u][i].second;
        if(!visit[v]){
            DFS(v,t+t1);
            if(!ok) return 0;
        }
        else {
            int sum = t-d[v]+t1;
            if(sum%2==1){
                ok = false;
                return 0;
            }
        }
    }
}
void solve()
{
    for(int i=1;i<=n;i++){
        visit[i] = false;
        d[i] = 0;
    }
    for(int i=1;i<=n;i++)
    if(!visit[i]){
        DFS(i,0);
        if(!ok){
            printf("no\n");
            return;
        }
    }
    printf("yes\n");
}
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        ok = true;
        input();
        if(!ok){
            printf("no\n");
            continue;
        }
        solve();
    }
}
