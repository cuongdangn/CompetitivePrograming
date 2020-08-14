#include <bits/stdc++.h>

using namespace std;

const int N = 100005;
#define ii pair<int, int>

ii ca[N];
int n,m;
map<int,int> mm;
int a[N];
int khac[N];
priority_queue<int> heap;
void input()
{
    scanf("%d%d",&n,&m);

    for(int i=1;i<=m;i++){
        scanf("%d%d",&ca[i].first,&ca[i].second);
    }
}
bool check()
{
    long long m1=0;
    mm.clear();
    khac[n+1]=0;
    for(int i=n;i>=1;i--){
        if(mm[a[i]]==0){
            mm[a[i]] = i;
            khac[i] = khac[i+1]+1;
        }
        else
            khac[i]=khac[i+1];
    }
    for(int i=1;i<=n;i++)
        m1 = m1+khac[i];
    return m1==m;

}
void solve()
{
    sort(ca+1,ca+m+1);
    int i = 1;
    for(int i=1;i<=n;i++)
        a[i] = 0;
    while(i<=m){

        int j = i;
        while(!heap.empty())
            heap.pop();
        while(j<=m && ca[j].first == ca[i].first){
            if(ca[j].first>=ca[j].second){
                printf("-1\n");
                return;
            }
            j++;
        }
        j--;
        for(int k=i;k<=j;k++){
            int v = ca[k].second;
            //cout << v<<endl;
            if(a[v]!=0){
                heap.push(-a[v]);
               // cout << v<<endl;
            }
        }
       // cout << i<<" "<<j<<endl;
        int l = max(1,a[ca[i].first]);

      //  cout << 1;
        for(int k=i;k<=j;k++){
            int v = ca[k].second;
            if(a[v]==0){
             // cout <<i<<" "<<v<<endl;
              while(!heap.empty()){
                int top = heap.top();
                if(-top == l){
                    l++;
                    heap.pop();
                }
                else {
                    a[v] = l;
                    l++;
                    break;
                }
              }
              if(a[v]==0){
                a[v] = l;
                l++;
              }
            }
        }
        i=j+1;
    }
   // for(int i=1;i<=n;i++)
   // if(a[i]==0){
   //   a[i]=1;
   // }
   //  for(int i=1;i<=n;i++)
   //     printf("%d ",a[i]);
    //a[5]=2;
    if(!check()){
        printf("-1\n");
        return;
    }

    for(int i=1;i<=n;i++)
        printf("%d ",a[i]);
    printf("\n");
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
