#include <bits/stdc++.h>

using namespace std;

#define vi vector<int>

vector<int> a;
map<vi, int> mm;
int n;
int kq ;
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
void duyet(vi a)
{
    mm[a] = 1;
    kq++;
    int m = a.size();
    for(int i=0;i<m-1;i++)
    if(a[i]>0 && a[i+1]>0){
        a[i]=a[i]-1;
        a[i+1]=a[i+1]-1;
        if(i==m-2)
            a.push_back(1);
        else
            a[i+2]++;
        if(mm[a]==0){
            duyet(a);
        }
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
    mm.clear();
    duyet(a);
    printf("%d\n",kq);
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

