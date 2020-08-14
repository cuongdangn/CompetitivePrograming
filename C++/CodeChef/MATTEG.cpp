#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>
#define pi pair<ii , int>

const int MAXX = 1000;
int cc[4] = {1,-1,1,-1};
int cd[4] = {1,-1,-1,1};
int r,c,n,Sx,Sy;
int dx[10],dy[10];
int a[1003][1003];
int dd[10],mau[10];
int maxx,dem;
vector<pi> vec[2];
void input()
{
    scanf("%d%d%d",&r,&c,&n);
    scanf("%d%d",&Sx,&Sy);
    for(int i=1;i<=n;i++)
        scanf("%d",&dx[i]);
     for(int i=1;i<=n;i++)
        scanf("%d",&dy[i]);
    for(int i=0;i<r;i++)
    for(int j=0;j<c;j++)
        scanf("%d",&a[i][j]);

}
bool check(int x,int y)
{
    return (x>=0 && y>=0 && x<r && y<c);
}
int BFS()
{
    int l = 0;
    int sum = a[Sx][Sy];
    vec[0].clear();
    vec[1].clear();
    vec[0].push_back(pi(ii(Sx,Sy),sum));
    for(int i=1;i<=n;i++){
        int nn = vec[l].size();
        if(nn==0)
            break;
        for(int j=nn-1;j>=0;j--){
            pi tmp = vec[l][j];
            ii tmp1 = vec[l][j].first;
            int sum = vec[l][j].second;
            int x = tmp1.first;
            int y = tmp1.second;
            int k = mau[i];
            for(int ij=0;ij<4;ij++){
                int xx = x+dx[k]*cc[ij];
                int yy = y+dy[k]*cd[ij];
                if(check(xx,yy)){
                    vec[1-l].push_back(pi(ii(xx,yy),sum+a[xx][yy]));
                }
            }
        }
        vec[l].clear();
        l = 1-l;
    }
    int nn = vec[l].size();
    for(int j=0;j<nn;j++){
        int sum = vec[l][j].second;
        if(sum>maxx)
            maxx = sum;
    }
}
void duyet(int x)
{
    if(x==n+1){
        BFS();
        dem ++;
        return;
    }
    for(int i=1;i<=n;i++)
    if(dd[i] == 0){
        mau[x] = i;
        dd[i] = 1;
        duyet(x+1);
        dd[i] = 0;
        if(dem == MAXX)
            return;
    }
}
void solve(){
    maxx = a[Sx][Sy];
    dem = 0;
    duyet(1);
    printf("%d\n",maxx);
}
int main()
{
    //freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }

}
