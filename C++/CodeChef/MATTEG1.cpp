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
int dd[10];
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

void duyet(int x,vector<pi> vec)
{
    if(x==n+1){
        int nn = vec.size();
        for(int j=0;j<nn;j++){
        int sum = vec[j].second;
        if(sum>maxx)
            maxx = sum;
        }
        return;
    }
    vector<pi> vec1;
    vec1.clear();
    for(int i=1;i<=n;i++)
    if(dd[i] == 0){
        dd[i] = 1;
        int nn = vec.size();
        if(nn==0)
            return;
        for(int j=nn-1;j>=0;j--){
            pi tmp = vec[j];
            ii tmp1 = vec[j].first;
            int sum = vec[j].second;
            int x = tmp1.first;
            int y = tmp1.second;
            int k = i;
            for(int ij=0;ij<4;ij++){
                int xx = x+dx[k]*cc[ij];
                int yy = y+dy[k]*cd[ij];
                if(check(xx,yy)){
                    vec1.push_back(pi(ii(xx,yy),sum+a[xx][yy]));
                }
            }
        }
        duyet(x+1,vec1);
        dd[i] = 0;
        vec1.clear();
    }

}
void solve(){
    maxx = a[Sx][Sy];
    dem = 0;
    int l = 0;
    int sum = a[Sx][Sy];
    vec[0].clear();
    vec[1].clear();
    vec[0].push_back(pi(ii(Sx,Sy),sum));
    duyet(1,vec[0]);
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

