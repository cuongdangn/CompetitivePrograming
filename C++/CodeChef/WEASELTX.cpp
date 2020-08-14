#include <bits/stdc++.h>

using namespace std;

int n,q;
vector<long long> kq;
long long lev[200005];
vector<int> ke[200005];
long long nhan[200005];
bool visit[200005];
vector<long long > b;
long long a[200005];
map<vector<long long>, int> mm;
int le;

void input()
{
    scanf("%d%d",&n,&q);
    int u,v;
    for(int i=1;i<=n-1;i++){
        scanf("%d%d",&u,&v);
        ke[u+1].push_back(v+1);
        ke[v+1].push_back(u+1);
    }
    for(int i=1;i<=n;i++)
        scanf("%lld",&nhan[i]);
}
void DFS(int u,int t)
{
 //  cout << u <<" "<<t<<endl;
    visit[u] = true;
    a[t]=a[t] ^ nhan[u];
    le = max(le,t);
    int m = ke[u].size();
    for(int i=0;i<m;i++){
        int v = ke[u][i];
        if(!visit[v]){
            DFS(v,t+1);
        }
    }
}
void solve()
{
    for(int i=1;i<=n;i++)
        visit[i] = false;

    DFS(1,1);
   // cout << 1;

    int lt = 1;
    while(lt<le)
        lt=lt*2;
 //   cout <<le << lt<<endl;
    int ck = lt;
    kq.push_back(a[1]);
    for(int i=1;i<=le;i++)
        b.push_back(a[i]);
    mm[b] = 1;
//   cout <<le << lt<<endl;
    for(int i=1;i<lt;i++){
        for(int j=le-2;j>=0;j--)
            b[j] = b[j+1] ^ b[j];
        kq.push_back(b[0]);
        if (mm[b]==0){
            mm[b]==1;
        }
        else
        {
            ck = i+1;
            break;
        }

    }

    long long del;
    for(int i=1;i<=q;i++){
        scanf("%lld",&del);
        printf("%lld\n",kq[del%ck]);
    }
}
int main()
{
   // freopen("code.in","r",stdin);
    input();
    solve();

}
