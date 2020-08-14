#include <bits/stdc++.h>

using namespace std;

#define vi vector<int>

vector<int> a;
map<vi, int> mm;
map<vi, int> dpm;
int n;
int kq ;
int maxx;
void input()
{
    scanf("%d",&n);
    int u;
    a.clear();
    for(int i=1;i<=n;i++){
        scanf("%d",&u);
        a.push_back(u);
    }
    kq = 0;

}
void xuat(vi a)
{
    int m = a.size();

    for(int i=0;i<m;i++)
        cout << a[i]<<" ";
        cout <<endl;
}
void duyet(int tr,vi a)
{
    kq++;
   // xuat(a);
    int m = a.size();
     maxx = max(maxx,m);
   // vi b;
  //  b.clear();
  //  for(int i=m-1;i>=tr;i--)
//        b.push_back(a[i]);
    for(int i=tr;i<m-1;i++)
    if(a[i]>0 && a[i+1]>0){
        a[i]=a[i]-1;
        a[i+1]=a[i+1]-1;
        if(i==m-2)
            a.push_back(1);
        else
            a[i+2]++;
        duyet(i,a);
        a[i]++;
        a[i+1]++;
        if(i==m-2)
            a.pop_back();
        else
            a[i+2]--;
    }
}
void solve()
{
    //mm.clear();
    maxx = 0;
    duyet(0,a);
    printf("%d\n",kq);
   //cout << maxx<<endl;
}
int main()
{
    freopen("code.in","r",stdin);
    freopen("code.ou","w",stdout);
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }
}

