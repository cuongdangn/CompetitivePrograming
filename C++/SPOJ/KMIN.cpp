#include<iostream>
#include<cmath>
#include<cstdio>
#include<vector>
#include<queue>
#include<algorithm>

using namespace std;

#define for(i,da,cu) for(int i=da;i<=cu;i++)
struct bg
{
    int i,j,gt;
};
class cmp
{
public:
    bool operator()(bg x,bg y)
    {
        return (x.gt>y.gt);
    }
};
priority_queue<bg,vector<bg>,cmp> heap;
int n,m,k;
int a[50010],b[50010];

void xuly()
{
    sort(a+1,a+m+1);
    sort(b+1,b+n+1);
    for(i,1,n)
    {
        bg t;
        t.i=1;
        t.j=i;
        t.gt=a[1]+b[i];
        heap.push(t);
    }
    for(i,1,k)
    {
        bg t=heap.top();
        cout<<t.gt<<endl;
        heap.pop();
        if(t.i!=m)
        {
            t.i=t.i+1;
            t.gt=a[t.i]+b[t.j];
            heap.push(t);
        }
    }
}
int main()
{
  //  freopen("code.inp","r",stdin);
    ios::sync_with_stdio(0);
    cin.tie(0);
    cin>>m>>n>>k;
    for(i,1,m)cin>>a[i];
    for(i,1,n)cin>>b[i];
    xuly();
    return 0;
}
