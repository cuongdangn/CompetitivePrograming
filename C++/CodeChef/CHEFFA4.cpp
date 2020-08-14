#include <bits/stdc++.h>

using namespace std;

#define vi vector<int>
#define ii pair<int, int>

int a[3000];
int n;

const long long base = 1000000007;
ii st[100000];
int dd[155][155][3];
long long d[155][155][3];
int dau,cuoi;
int kq ;
void input()
{
    scanf("%d",&n);
    int u;

    for(int i=1;i<=n;i++)
        scanf("%d",&a[i]);


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
    if(n==1){
        printf("1\n");
        return;
    }
    dau = 0;
    cuoi = 0;
    st[dau].first = a[1];
    st[dau].second = a[2];
    for(int j1=0;j1<=150;j1++)
            for(int j2=0;j2<=150;j2++){
                d[j1][j2][0] = 0;
                d[j1][j2][1] = 0;
                dd[j1][j2][0] = 0;
                dd[j1][j2][1] = 0;
            }
    d[a[1]][a[2]][0] = 1;
    dd[a[1]][a[2]][0] = 1;
    int l = 0;
    kq = 0;
    int n1 = n;
    for(int i=2;i<=n1;i++){
        if(i>=n){
            a[i+1] = 0;
        }

        bool ok = false;
        for(int j1=0;j1<=150;j1++)
            for(int j2=0;j2<=150;j2++)
            if(d[j1][j2][l]>0 && dd[j1][j2][l] == i-1){
               // cout <<j1<<" "<<j2<<" "<<i<<" "<<d[j1][j2][l]<<endl;
                if(j1!=0 || j2!=0 || i<n) ok = true;
                if(dd[j2][a[i+1]][1-l]!=i){
                    d[j2][a[i+1]][1-l] = d[j1][j2][l];
                    dd[j2][a[i+1]][1-l] =i;
                }
                else
                    d[j2][a[i+1]][1-l] =(d[j2][a[i+1]][1-l]+ d[j1][j2][l])%base;
                int u1 = j1 -1;
                int u2 = j2 - 1;
                int v = a[i+1]+1;
                while(u1>=0 && u2>=0){
                if(dd[u2][v][1-l]!=i){
                    dd[u2][v][1-l] =i;
                    d[u2][v][1-l] = d[j1][j2][l];
                }
                else
                    d[u2][v][1-l]=(d[u2][v][1-l]+d[j1][j2][l])%base;
                    u2--;
                    u1--;
                    v++;
                }
            }
        if(!ok) break;
        l = 1-l;
        n1++;
    }
    printf("%lld\n",d[0][0][1-l]);

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


