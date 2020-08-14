#include <bits/stdc++.h>

using namespace std;

#define vi vector<int>
#define ii pair<int, int>

int a[3000];
int n;

ii st[100000];
int dau,cuoi;
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
void xuat(vi a)
{
    int m = a.size();

    for(int i=0;i<m;i++)
        cout << a[i]<<" ";
        cout <<endl;
}

void solve()
{
    //mm.clear();
    dau = 0;
    cuoi = 0;
    st[dau].first = a[1];
    st[dau].second = a[2];
    d[a[1]][a[2]][0] = 1;
    dd[a[1]][a[2]][0] = 1;
    int l = 0;
    int i = 2;
    while(dau<=cuoi){
        int dau1 = dau;
        int cuoi1 = cuoi;
        for(int i=dau1;i<=cuoi1;i++){
            int u = st[i].first;
            int v = st[i].second;
            if(dd[v][0][1-l] !=i){
                d[v][0][1-l] = d[u][v][l];
                dd[v][0][1-l] = i;
            }
            else{
                d[v][0][1-l] += d[u][v][l];
            }

            while(u>0 && v>0){
                int u1 = v-1;
                int u2 = a[i+1]+1;
            }

        }

    }


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

