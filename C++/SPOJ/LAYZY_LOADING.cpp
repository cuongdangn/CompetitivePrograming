#include <bits/stdc++.h>

using namespace std;

int a[105];
int n;
int t;
void solve()
{
    int i =1;
    int j =n;
    int kq=0;
    while(j>=1&&a[j]>=50){
        kq++;
        j--;
    }
    while(i<=j){
        int sl = 50/a[j];
        if(50%a[j]!=0) sl++;
        if(i+sl-2<j){
         //   cout << i << " "<<j<<endl;
            kq++;
            i=i+sl-1;
            j--;

        }
        else break;
    }
    cout <<kq<<endl;
}
int main()
{
    freopen("lazy_loading.txt","r",stdin);
    freopen("ans.txt","w",stdout);
    cin >> t;
    for(int i=1;i<=t;i++){
        cout << "Case #" <<i<<": ";
        cin >> n;
        for(int i=1;i<=n;i++)
            cin >> a[i];
        sort(a+1,a+n+1);
        solve();
    }
}
