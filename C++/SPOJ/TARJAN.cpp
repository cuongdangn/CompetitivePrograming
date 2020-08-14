#include<iostream>
#include<cmath>
#include<algorithm>
#include<cstdio>
#include<vector>

using namespace std;

const int maxn=10010;
int m,n,kq,top;
int st[maxn],low[maxn],num[maxn],dem;
vector<int> ke[maxn];
bool loai[maxn];

void doc()
{
    cin>>n>>m;
    for(int i=1;i<=m;i++)
    {
        int u,v;
        cin>>u>>v;
        ke[u].push_back(v);
    }
}
void dfs(int u)
{
    dem+=1;
    num[u]=dem;
    low[u]=maxn;
    top+=1;
    st[top]=u;
    for(int i=0;i<ke[u].size();i++)
       if(!loai[ke[u][i]])
        if(num[ke[u][i]]!=0)low[u]=min(low[u],num[ke[u][i]]);
        else
        {
            dfs(ke[u][i]);
            low[u]=min(low[u],low[ke[u][i]]);
        }
    if(low[u]>=num[u])
    {
        int v=st[top];
        kq+=1;
        while(v!=u)
        {
            loai[v]=true;
            top-=1;
            v=st[top];
        }
        top-=1;
        loai[u]=true;
    }
}
int main()
{//freopen("code.inp","r",stdin);
    ios::sync_with_stdio(0);
    cin.tie(0);
    doc();
    for(int i=1;i<=n;i++)loai[i]=false;
    for(int i=1;i<=n;i++)
        if(not loai[i])
         dfs(i);
    cout<<kq;
    return 0;
}
