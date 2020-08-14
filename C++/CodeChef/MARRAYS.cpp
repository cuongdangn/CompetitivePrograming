#include <bits/stdc++.h>

using namespace std;

const int MAXN = 1000005;
const long long maxxKQ = -1e17;
#define ii pair<long long, long long>

vector<ii> a[MAXN];
long long b[MAXN];
int n,m;
long long maxx1[2][MAXN],maxx2[2][MAXN];
long long d[2][MAXN];


long long findMAX(int t,int i,long long x,int j)
{
    int dau = 0;
    int cuoi = a[i].size()-1;
    int giua;
    int luu = -1;
    while(dau<=cuoi){
        giua = (dau+cuoi)/2;
        if(a[i][giua].first>=x){
            luu = giua;
            cuoi = giua-1;
        }
        else
            dau = giua+1;
    }
  //cout << x <<  " "<<luu<<" "<<a[i][luu].first<<"*"<<endl;
    if(luu==-1){ // moi diem deu nho hon x
        return maxx1[t][a[i].size()-1]+(long long)(i-1)*x;
    }
    else
    if(luu==0) //moi diem deu lon hon x
        return maxx2[t][0]-(long long)(i-1)*x;
    else
        return max(maxx2[t][luu]-(long long)(i-1)*x,maxx1[t][luu-1]+(long long)(i-1)*x);
}
void solve()
{
    if(n==1){
        cout << 0 << endl;
        return;
    }
    int t = 0;
    //init
    m=a[n].size();
    for(int i=0;i<m;i++){
        maxx1[t][i] =(long long)(1-n)*a[n][0].first;
        maxx2[t][i] =(long long)(n-1)*a[n][m-1].first;
    }
    for(int i=n-1;i>=1;i--){
        m = a[i].size();

        for(int j=0;j<m;j++){
            long long tt = findMAX(t,i+1,a[i][j].second,j);
            d[t][j] = tt;
          //  cout << tt <<" "<<i<< endl;
        }

            maxx1[1-t][0] = (long long)(1-i)*a[i][0].first+d[t][0];
            maxx2[1-t][m-1] = (long long)(i-1)*(a[i][m-1].first) + d[t][m-1];
        for(int j=1;j<m;j++)
            maxx1[1-t][j] = max(maxx1[1-t][j-1],(long long)(1-i)*a[i][j].first+d[t][j]);
        for(int j=m-2;j>=0;j--)
            maxx2[1-t][j] = max(maxx2[1-t][j+1],(long long)(i-1)*a[i][j].first+d[t][j]);
        t = 1-t;
    }
    long long kq = maxxKQ;
  //  cout << kq <<" ";
    m = a[1].size();
    for(int i=0;i<m;i++)
        kq = max(kq,d[1-t][i]);
    cout << kq << endl;
}
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    cin >> test;
    while(test--){
        cin >> n;
        for(int i=1;i<=n;i++){
            a[i].clear();
            cin >> m;
            for(int j=1;j<=m;j++)
                cin >> b[j];
                a[i].push_back(ii(b[1],b[m]));

            for(int j=2;j<=m;j++)
                a[i].push_back(ii(b[j],b[j-1]));
            sort(a[i].begin(),a[i].end());
           // for(int j=0;j<m;j++){
              //  cout << a[i][j].first <<" "<<a[i][j].second << endl;
                //  cout << j << endl;
        //   }
          //  cout << endl;

        }
        solve();
    }

}
