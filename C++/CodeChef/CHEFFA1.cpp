#include <bits/stdc++.h>

using namespace std;

#define vi vector<int>

const int base = 1000000007;
vector<int> a;
map<vi, int> mm;
map<vi, int> dpm;
int n;
void input()
{
    scanf("%d",&n);
    int u;
    a.clear();
    for(int i=1;i<=n;i++){
        scanf("%d",&u);
        a.push_back(u);
    }

}
void xuat(vi a)
{
    int m = a.size();
    for(int i=0;i<m;i++)
        cout << a[i]<<" ";
        cout <<endl;
}
long long duyet(int tr,vi a)
{
  //  xuat(a);
    int m = a.size();
    long long dem = 0;
    vi b;
    b.clear();
    for(int i=tr;i<m;i++)
        b.push_back(a[i]);
    if(mm[b]!=0)
        return mm[b];

    for(int i=tr;i<m-1;i++)
    if(a[i]>0 && a[i+1]>0){
        a[i]=a[i]-1;
        a[i+1]=a[i+1]-1;
        if(i==m-2)
            a.push_back(1);
        else
            a[i+2]++;
        dem= (dem+duyet(i,a))%base;
        a[i]++;
        a[i+1]++;
        if(i==m-2)
            a.pop_back();
        else
            a[i+2]--;
    }
    mm[b]=dem+1;
    return dem+1;
}
void solve()
{
    mm.clear();
    long long kq = duyet(0,a);
    printf("%lld\n",kq);
}
int main()
{
    freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }
}


