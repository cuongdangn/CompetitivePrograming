#include <bits/stdc++.h>

using namespace std;

#define x first
#define y second

const int N = 106;
const int Ncolor = 5;
int c,n,kq;
int dd[Ncolor];
pair<int,int> a[500];

int b[N*Ncolor];
int bit[10000];

void input()
{
    cin>>c>>n;
    for(int i=1;i<=n*c;i++)
        cin>>a[i].x>>a[i].y;
}
void init()
{
    for(int i=1;i<=n*c;i++)
        b[i]=dd[a[i].x]*1000 + a[i].y;

    for(int i=0;i<=5000;i++)
        bit[i]=0;
}
void up(int x,int y)
{
    while(x<=5000){
        bit[x]=max(y,bit[x]);
        x += (x &(-x));
    }
}
int get(int x)
{
    int t = 0;
    while(x>0){
        t=max(bit[x],t);
        x -= x&(-x);
    }
    return t;
}
void card()
{
    init();
    up(b[1],1);
    for(int i=2;i<=n*c;i++){
        int t = get(b[i]);
        up(b[i],t+1);
        kq=max(kq,t+1);
    }
}
void backtr(int i)
{
    if(i==c+1){
        card();
        return;
    }
    for(int j=1;j<=c;j++)
    if(dd[j]==0){
        dd[j]=i;
        backtr(i+1);
        dd[j]=0;
    }
}
void solve()
{
    kq=1;
    backtr(1);
    cout<<n*c-kq;
}
int main(){
   // freopen("code.in","r",stdin);
    input();
    solve();
}

