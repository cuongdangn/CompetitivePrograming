#include<iostream>
#include<cmath>
#include<algorithm>
#include<cstdio>
#include<queue>
#include<vector>

using namespace std;

#define for(i,dau,cuoi) for(int i=dau;i<=cuoi;i++)

priority_queue<long long ,vector<long long> > heap;
int n;

void xuly()
{
    int x;
    cin>>n;
    while(!heap.empty())heap.pop();
    for(i,1,n)
    {
        cin>>x;
        heap.push(-x);
    }
    long long kq=0;
    for(i,1,n-1)
    {
        long long t1=-heap.top();
        heap.pop();
        long long t2=-heap.top();
        heap.pop();
     //   cout<<t1<<" "<<t2<<endl;
        kq=t1+t2+kq;
        heap.push(-t1-t2);
    }
    cout<<kq<<endl;

}
int main()
{
  //  freopen("code.inp","r",stdin);
   ios::sync_with_stdio(0);
   cin.tie(0);
    int t;
    cin>>t;
    for(i,1,t)xuly();
    return 0;
}
