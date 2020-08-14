#include <bits/stdc++.h>

using namespace std;

const double ep = 1e-6;
const double pi = 3.14159265359;
int p,x,y;

int bp(int x)
{
    return x*x;
}
void solve()
{
    double goc = p*2*pi / 100;
    double goc1 = acos((y-50)/sqrt(bp(x-50)+bp(y-50)));
    cout << goc1 << " "<<goc <<endl;
    double kc = sqrt(bp(x-50)+bp(y-50));
    if(kc-50 > ep){
        cout << "white" <<endl;
        return;
    }
    if(goc1-goc<ep){
        cout << "black" <<endl;
    }
    else {
        cout << "white" <<endl;
    }
}
int main()
{
    int t;
    freopen("progress_pie2.txt","r",stdin);
    freopen("ans.txt","w",stdout);
   // cout <<M_PI<<endl;
    cin >> t;
    for(int i=1;i<=t;i++){
        cin >> p >> x >> y;
        cout << "Case #" <<i<<": ";
        solve();
    }
}
