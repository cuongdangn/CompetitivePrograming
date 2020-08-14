#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>

const int N = 100005;

int n,m;
pair<int, ii> edge[N];
pair<int, ii> query[N];
ii query1[N];

vector<int> ke[N];
int a[N];
ii b[N];
int cha[N];
int dem;
int kq[N];
int it[4*N+5];


int dfs(int x,int ch)
{
    dem++;
    a[dem] = x;
  //  cout << x << " ";
    b[x].first = dem;
    cha[x] = ch;
    int nn = ke[x].size();
    for(int i=0;i<nn;i++)
        if(cha[ke[x][i]]==0){
                dfs(ke[x][i],x);
        }
    b[x].second = dem;
}
int init()
{
    sort(edge+1,edge+n);
    sort(query1+1,query1+m+1);
    dem = 0;
    dfs(1,-1);
   // cout << endl;
}
void maketrue(int k)
{
    it[k*2] = it[k*2] ^ it[k];
    it[k*2+1] = it[k*2+1] ^ it[k];
    it[k] = 0;

}
int update(int k,int l,int r,int i,int j,int x)
{
    if(l>r) return 0;
    if(r<i || l>j) return 0;
    if(i<=l && j>=r){
        it[k] = it[k] ^ x;
        return 0;
    }
    int m = (l+r) / 2;
    maketrue(k);
    update(k*2,l,m,i,j,x);
    update(k*2+1,m+1,r,i,j,x);
}
int get(int k,int l,int r,int i)
{
    if(l>i || r<i || r<l) return 0;
    if(l==r && r==i){
        return it[k];
    }
    int m = (l+r) / 2;
    maketrue(k);
    return get(k*2,l,m,i) ^ get(k*2+1,m+1,r,i);
}
int buil(int k,int l,int r)
{
    if(r<l) return 0;
    if(l==r){
        it[k] = 0;
        return 0;
    }
    int m = (l+r) / 2;
    buil(k*2,l,m);
    buil(k*2+1,m+1,r);
    it[k] = 0;
}
int solve()
{
    buil(1,1,n);
    int j = 1;
    for(int i=1;i<=m;i++){
        int k = query1[i].first;
        int jj = query1[i].second;
        while(j<n &&edge[j].first<=k){
            int u = edge[j].second.first;
            int v = edge[j].second.second;
            if(cha[u] == v){
                int tmp = u;
                u = v;
                v = tmp;
            }
            //cout <<u<<" "<<v<<" "<< edge[j].first <<" "<<j<<endl;
            //cout <<b[v].first << " "<<b[v].second <<"/"<< endl;
            update(1,1,n,b[v].first,b[v].second,edge[j].first);
            j++;
        }
        int u = query[jj].second.first;
        int v = query[jj].second.second;
         //cout << k << " " <<u <<" "<<v <<"*"<<endl;

        int get1 = get(1,1,n,b[u].first);
        int get2 = get(1,1,n,b[v].first);
        //cout << i<<" "<<get1<<" " << get2<< " "<<b[u].first << " "<<b[v].first<< " ";
        kq[jj] = get1 ^ get2;
        //cout << "kq["<<i<<"]"<<kq[jj] <<endl;
    }
    for(int i=1;i<=m;i++)
        printf("%d\n",kq[i]);
}
int main()
{
    //freopen("codec.in","r",stdin);
    int Test;
    scanf("%d",&Test);
    while(Test--){
        scanf("%d",&n);
        for(int i=1;i<=n;i++)
            cha[i] = 0;
        for(int i=1;i<=n;i++)
            ke[i].clear();
        for(int i=1;i<=n-1;i++){
            scanf("%d%d%d",&edge[i].second.first,&edge[i].second.second,&edge[i].first);
            ke[edge[i].second.first].push_back(edge[i].second.second);
            ke[edge[i].second.second].push_back(edge[i].second.first);
        }

        scanf("%d",&m);
        for(int i=1;i<=m;i++){
            scanf("%d%d%d",&query[i].second.first,&query[i].second.second,&query[i].first);
            query1[i] = ii(query[i].first,i);
        }
        init();
        solve();

    }
}
