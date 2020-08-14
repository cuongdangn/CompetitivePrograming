#include <bits/stdc++.h>


using namespace std;
typedef  pair<int ,int> ii;
#define maxn 30005
#define maxm 100006

int n,m,num[maxn],low[maxn];
ii st[maxm];
int dem,top;
int dd[maxm];
int kq=1;
ii ca[maxm];
vector<int> ke[maxn];

map<ii,int> mm;
void dfs(int u)
{
    int v,q,p;
    dem++;
    num[u]=dem;
    low[u]=maxm+1;
    for(int i=0;i<ke[u].size();i++)
    if(dd[ke[u][i]]==0){
        dd[ke[u][i]]=1;
        int j=ke[u][i];
        v=ca[j].first+ca[j].second-u;
        if(num[v]!=0)low[u]=min(low[u],num[v]);
        else{
            top++;
            //cout<<top<<endl;
            st[top].first=u;
            st[top].second=v;
            dfs(v);
            low[u]=min(low[u],low[v]);
            if(low[v]>=num[u]){
                   // cout<<u<<" "<<v<<endl;
                    int xx=0;
                do
                {
                    p=st[top].first;
                    q=st[top].second;
                    top--;
                    xx++;
                }while(p!=u||q!=v);
            kq=max(kq,xx+1);
            }
        }
    }
}
int xuly()
{
    top=0;
    dem=0;
    for(int i=1;i<=n;i++)
    if(num[i]==0)
        dfs(i);
}
int main()
{
    //freopen("code.in","r",stdin);
    int m1=0;
    scanf("%d%d",&n,&m);
    for(int i=1;i<=m;i++)
    {
        int u,v;
        scanf("%d%d",&u,&v);
        if(mm[ii(u,v)]==0&&mm[ii(v,u)]==0)
        {
            m1++;
            ca[m1].first=u;
            ca[m1].second=v;
            mm[ii(u,v)]=1;
            ke[u].push_back(m1);
            ke[v].push_back(m1);
        }
    }
    m=m1;
    xuly();
    printf("%d",kq);
}
