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
int d[maxn][2];
int sl[maxn];
bg ca[maxn];
int n,m,go;
vector<int> ke[maxn];
vector<int> st;
int khoitao()
{
    st.clear();
    for(i,1,maxn-1){
        ke[i].clear();
        sl[i]=0;
        d[i][0]=-1;
        d[i][1]=-1;
    }

}
bool cmp(bg i,bg j)
{
    return i.t>j.t;
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
   //sort(ca+1,ca+m+1,cmp);
    for(i,1,m){
      //  cout<<ca[i].t;
        ke[ca[i].x].push_back(i);
        ke[ca[i].y].push_back(i);
    }
    //cout<<endl;
}
int dfs(int x,int nga,int cc)
{
    int dem=x;
    //if(go==12)cout<<x<<" ";
    if(ke[x].size()==0)return x;
    for(i,0,ke[x].size()-1){
        int j=ke[x][i];
        int y=ca[j].x+ca[j].y-x;
        int h=0;
        if(x==ca[j].y)h=1;
        if(ca[j].t>=nga&&j!=cc){
                    if(d[j][h]!=-1)dem=max(dem,d[j][h]);
                    else{
                       // if(j==22)cout<<go<<" "<<h<<" "<<x<<endl;;
                    d[j][h]=max(x,y);
                    //if(go==1)cout<<x<<" ";
                    d[j][h]=max(d[j][h],dfs(y,ca[j].t,j));
                }
                dem=max(dem,d[j][h]);
            }
        }

    return dem;
}
int xuly()
{
    long long kq=0;
    for(i,0,st.size()-1){
             go=st[i];
        int tt=dfs(st[i],0,0);
        kq=kq+(long long)tt*sl[st[i]];
        //cout<<st[i]<<" "<<tt<<" "<<sl[st[i]]<<endl;
    }

    printf("%lld\n",kq);
}

int main()
{
    //freopen("codec.in","r",stdin);
    int t;
    scanf("%d",&t);
    for(i,1,t){
        khoitao();
        doc();
        xuly();

    }
}

