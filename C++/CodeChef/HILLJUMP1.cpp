#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>

const int N = 100005;

ii quly[N];
int id[N];
int n,q,m,m1;
long long a[N];
long long up[N];

void input()
{
    scanf("%d%d",&n,&q);
    for(int i=1;i<=n;i++){
        scanf("%lld",&a[i]);
    }

}
/*void init1(int x,int y)
{
    Left[y] = y+1;
    dp[y+1]=0;
    for(int i=y;i>=x;i--){
        int j = i+1;
        while(j<=y && a[i]>=a[j])
            j = Left[j];
        Left[i] = j;
        dp[i]=dp[j]+1;
        dpp[i] = j;
    }
    //////////////////
}
void init2(int x,int y)
{
    minn[y] = b[y].second;
    for(int i=y-1;i>=x;i--){
        minn[i] = min(minn[i+1],b[i].second);
    }
}
*/
void init()
{
    m = trunc(sqrt(n));
    m1 = 0;
    for(int i=1;i<=n;i++)
    if(id[i]==0){
        m1++;
        int n1 = min(n,i+m-1);
        quly[m1].first = i;
        quly[m1].second= n1;
        for(int j=i;j<=n1;j++)
            id[j] = m1;
    }
    ///////////////////////
    /*for(int i=1;i<=m1;i++)
        sort(b+quly[i].first,b+quly[i].second+1);
    //////////////////////
    for(int i=1;i<=m1;i++){
        init1(quly[i].first,quly[i].second);
        init2(quly[i].first,quly[i].second);
    }
    */

}

/*int tim(int i,int x)
{
    int dau = quly[i].first;
    int cuoi = quly[i].second;
    int luu = 0;
    int giua;
    while(dau<=cuoi){
        giua = (dau+cuoi)/2;
        if(b[giua].first<=x){
            dau = giua+1;
        }
        else{
            luu = giua;
            cuoi = giua-1;
        }
    }
    return minn[luu];
}
*/
int xuly1(int u,int v)
{

    int curr = u;
    for(int i=u;i<=n;i++)
        if(i-curr<=100){
        if(a[curr]+up[id[curr]]<a[i]+up[id[i]]){
            v--;
            if(v==0){
                printf("%d\n",i);
                return 0;
            }
            curr = i;
        }
    }
    else break;
    printf("%d\n",curr);
}
void update(int i,int j,long long x)
{
    if(id[i]==id[j]){
        for(int k=i;k<=j;k++)
            a[k]+=x;
    }
    else
    {
        if(quly[id[i]].first==i){
            up[id[i]]+=x;
        }
        else
        for(int k = i;k<=quly[id[i]].second;k++)
            a[k]+=x;
        for(int k=id[i]+1;k<id[j];k++)
            up[k]+=x;
        if(j==quly[id[j]].second)
            up[id[j]]+=x;
        else
        {
            for(int k=quly[id[j]].first;k<=j;k++)
                a[k]+=x;
        }
    }
}
void solve()
{
    init();
    int l,u,v;
    long long x;
    for(int k=1;k<=q;k++){
        scanf("%d",&l);
        if(l==1){
            scanf("%d%d",&u,&v);
            xuly1(u,v);
        }
        else {
            //continue;
            scanf("%d%d%lld",&u,&v,&x);
            //continue;
            update(u,v,x);
        }
    }
}
int main()
{
    freopen("code.in","r",stdin);
    freopen("code.out","w",stdout);
    input();
    solve();
}
