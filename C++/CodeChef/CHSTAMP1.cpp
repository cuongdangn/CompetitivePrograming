#include<iostream>
#include<cstdio>
#include<map>
#include<vector>
#include<algorithm>

using namespace std;

#define maxn 50008
#define cs first
#define u second
#define for(i,a,b) for(int i=a;i<=b;i++)
//typedef pair<int,int> ii;

struct bg
{
    int t,x,y;
};
int d[maxn];
int sl[maxn];
bg ca[maxn];
int n,m;
vector<int> ke[maxn];
vector<int> st;
int khoitao()
{
    st.clear();
    for(i,1,maxn-1){
        ke[i].clear();
        sl[i]=0;
        d[i]=-1;

    }

}
int doc()
{
    scanf("%d%d",&n,&m);
    for(i,1,n){
        int x;
        scanf("%d",&x);
        sl[x]++;
        if(sl[x]==1)st.push_back(x);
    }
    for(i,1,m)scanf("%d%d%d",&ca[i].t,&ca[i].x,&ca[i].y);
    for(i,1,m){
        ke[ca[i].x].push_back(i);
        ke[ca[i].y].push_back(i);
    }
}
int dfs(int x,int nga)
{
    int dem=x;
    if(ke[x].size()==0)return x;
    for(i,0,ke[x].size()-1){
        int j=ke[x][i];
        int y=ca[j].x+ca[j].y-x;
        if(d[j]!=-1)dem=max(dem,d[j]);
        else{

            if(ca[j].t>=nga){
                    d[j]=max(x,y);
                    d[j]=max(d[j],dfs(y,ca[j].t));
                   // if(x==3)cout<<dem<<endl;
            }
            dem=max(dem,d[j]);
        }
    }

    return dem;
}
int xuly()
{
    long long kq=0;
    for(i,0,st.size()-1){
        int tt=dfs(st[i],0);
        kq=kq+(long long)tt*sl[st[i]];
        //cout<<st[i]<<" "<<tt<<" "<<sl[st[i]]<<endl;
    }

    printf("%lld\n",kq);
}

int main()
{
    freopen("codec.in","r",stdin);
    int t;
    scanf("%d",&t);
    for(i,1,t){
        khoitao();
        doc();
        xuly();

    }
}


