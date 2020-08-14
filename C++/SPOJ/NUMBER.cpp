#include <iostream>
#include <cstdio>
#include <vector>

using namespace std;

vector<int> a[10005];
int n,m,t,dd[10005];
int doc()
{
    scanf("%d %d %d",&n,&m,&t);
    for(int i=1;i<=m;i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        a[v].push_back(u);
    }
}
void dfs(int u)
{
    dd[u]=1;
    for(int i=0;i<a[u].size();i++)
        if(dd[a[u][i]]==0)dfs(a[u][i]);
}
int main()
{
    //freopen("code.in","r",stdin);
    doc();
    dfs(t);
   // for(int i=1;i<=n;i++) cout<<a[i].size()<<" ";
    for(int i=1;i<=n;i++)
        if(dd[i]==0)
        {
            dfs(i);
            dd[i]=0;
        }
    int kq=0;
    for(int i=1;i<=n;i++)
        if(dd[i]==0)kq++;
    printf("%d",kq);
    return 0;
}
