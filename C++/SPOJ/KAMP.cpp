#include<iostream>
#include<cstdio>
#include<cstring>
#include<string>
#include<vector>
#include<algorithm>

using namespace std;

#define foru(i,a,b) for(int i=a;i<=b;i++)
#define kee first
#define time second
#define maxn 500005

typedef pair<int,int> no;
typedef long long ll;
int n,k;
int dd[maxn],near[maxn];
ll S;
ll maxx[maxn],minn[maxn];
vector<no> ke[maxn];

int doc()
{
    scanf("%d%d",&n,&k);
    foru(i,1,n-1){
        int a,b,c;
        scanf("%d%d%d",&a,&b,&c);
        ke[a].push_back(no(b,c));
        ke[b].push_back(no(a,c));
    }

    foru(i,1,k){
        int a;
        scanf("%d",&a);
        dd[a]=1;
    }
}
int dfs(int x,int tr)
{
    int d=ke[x].size();
    int tg=0;
    foru(i,0,d-1){
        if(ke[x][i].kee==tr)continue;
        if(dfs(ke[x][i].kee,x)==1){
            dd[ke[x][i].kee]=tg=1;
            S+=ke[x][i].time;
        }
    }
    if(dd[x]==1||tg==1)return 1;
    return 0;
}
int dfs1(int x,int tr)
{
    int luu=x;
    foru(i,0,ke[x].size()-1){
            int ne=ke[x][i].kee;
            int t=ke[x][i].time;
            if(ne==tr||dd[ne]!=1)continue;
            int tg=dfs1(ne,x);
            if(t+maxx[ne]>maxx[x]){
                maxx[x]=t+maxx[ne];
                luu=tg;
            }
        }
    return luu;
}
int dfs3(int x,int tr,ll s)
{
    int luu=x;
    foru(i,0,ke[x].size()-1){
            int ne=ke[x][i].kee;
            int t=ke[x][i].time;
            if(ne==tr||dd[ne]!=1)continue;
            maxx[ne]=max(maxx[ne],s+t);
            dfs3(ne,x,s+t);
        }

    return luu;
}
int dfs2(int x,int tr,ll s,int gan)
{
    int d=ke[x].size();
    foru(i,0,d-1){
        int ne=ke[x][i].kee;
        int t=ke[x][i].time;
        if(ne==tr)continue;
        if(dd[ne]==1){
            minn[ne]=0;
            near[ne]=ne;
            dfs2(ne,x,0,ne);
        }
        else{
            minn[ne]=s+t;
            near[ne]=gan;
            dfs2(ne,x,s+t,gan);
        }
    }
}

int xuly()
{
    int goc;
    foru(i,1,n)
    if(dd[i]==1){
        goc=i;
        dfs(i,-1);
        break;
    }
    int u=dfs1(goc,-1);
    foru(i,1,n)maxx[i]=0;
    int v=dfs1(u,-1);
    foru(i,1,n)maxx[i]=0;
    dfs3(u,-1,0);
    dfs3(v,-1,0);
    //foru(i,1,n)cout<<maxx[i]<<" ";
    //cout<<endl;
    near[goc]=goc;

    dfs2(goc,-1,0,goc);
    foru(i,1,n)printf("%lld\n",minn[i]-maxx[near[i]]+2*S);
}
int main()
{
   //freopen("code.in","r",stdin);
    doc();
    xuly();
}



